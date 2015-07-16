# -*- coding: cp936 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response

from django.contrib.auth.models import User
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt

from django.template import RequestContext

from student.models import *
from committee.models import *
from sysunetid import *

def index(request):
    return HttpResponse('hello world!')

def loginView(request):
    if request.method == 'POST':
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')
        originUrl = request.POST.get('originUrl', '')
        existFlag = 1
        
        template = 'login.html'
        USER_AGENT = request.META['HTTP_USER_AGENT']
        phoneList = ['MicroMessenger', 'iPhone', 'Android']
        for phone in phoneList:
            if phone in USER_AGENT:
                template = 'microLogin.html'

        try:
            user = User.objects.get(username = username)
        except User.DoesNotExist:
            existFlag = 0 # must be student who hasn't registered
        if existFlag == 1:
            user = auth.authenticate(username = username, password = password)
            # succeed to login
            if user is not None:
                auth.login(request, user)
                response = HttpResponseRedirect(decideUrl(username, originUrl, template))
                return response
            # fail to login. The student has changed the password?
            else:
                name = sysuNetid(username, password)
                if name != '' and name != 'outdate':
                    user = User.objects.get(username = username)
                    user.set_password(password)
                    user.save()
                    # change his password in database, and then login
                    user = auth.authenticate(username = username, password = password)
                    auth.login(request,user)
                    response = HttpResponseRedirect(decideUrl(username, originUrl, template))
                    return response
                else:
                    wrongMsg = u'用户名或密码错误' # wrong password
                    if name == 'outdate':
                        wrongMsg = u'账户已过期' # outdate
                    return render_to_response(template, {
                        'originUrl' : originUrl,
                        'wrongMsg' : wrongMsg
                        }, context_instance = RequestContext(request))
        else:
            # the user is not in database, register
            name = sysuNetid(username, password)
            if name != '' and name != 'outdate':
                user = User.objects.create(username = username, first_name = "student")
                user.set_password(password)
                user.save()
                email = username + '@mail2.sysu.edu.cn'
                student = Student.objects.create(netid = username, name = name, email = email, totalTime = 0, user_id = user.id)
                student.save()
                print name
                # register a student, and then login
                user = auth.authenticate(username = username, password = password)
                auth.login(request, user)
                response = HttpResponseRedirect(decideUrl(username, originUrl, template))
                return response
            # the user not in database & can't pass sysuNetid's auth
            else:
                wrongMsg = u'用户名或密码错误'
                if name == 'outdate':
                    wrongMsg = u'账户已过期'
                return render_to_response(template, {
                    'originUrl' : originUrl,
                    'wrongMsg' : wrongMsg
                    }, context_instance = RequestContext(request))

    # request.method = 'GET'
    else:
        originUrl = ''
        template = 'login.html'
        USER_AGENT = request.META['HTTP_USER_AGENT']
        print USER_AGENT
        phoneList = ['MicroMessenger', 'iPhone', 'Android']
        for phone in phoneList:
            if phone in USER_AGENT:
                template = 'microLogin.html'
        try:
            originUrl = request.GET['next']
        except:
            originUrl = 'personHomePage'
        if request.user.is_authenticated():
            print 'originUrl is : ' + originUrl
            return HttpResponseRedirect(decideUrl(request.user.username, originUrl, template))
        else:
            wrongMsg = u'用户名或密码错误'
            return render_to_response(template, {
                'originUrl' : originUrl
                }, context_instance = RequestContext(request))

def logoutView(request):
    auth.logout(request)
    phoneFlag = 0
    USER_AGENT = request.META['HTTP_USER_AGENT']
    phoneList = ['MicroMessenger', 'iPhone', 'Android']
    for phone in phoneList:
        if phone in USER_AGENT:
            phoneFlag = 1
    if phoneFlag == 1:
        return HttpResponseRedirect('/activity/microApply/')
    else:
        return HttpResponseRedirect('/')

def decideUrl(username, originUrl, template):
    if originUrl != 'personHomePage':
        return originUrl
    else:
        user = User.objects.get(username = username)
        if template == 'login.html':
            newUrl = '/' + user.first_name + '/'
        else:
            newUrl = '/activity/microApply/'
        return newUrl
