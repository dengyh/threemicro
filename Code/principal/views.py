# -*- coding: utf-8 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response

from django.contrib.auth.models import User
from principal.models import Principal
from feedback.models import Feedback

from base.processor import *

from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt

from django.template import RequestContext

import json
import smtplib
from email.MIMEText import MIMEText

def checkPrincipal(request):
    if request.user.first_name == 'student':
        return HttpResponseRedirect('/student/')
    if request.user.first_name == 'teacher':
        return HttpResponseRedirect('/teacher/')
    if request.user.first_name == 'committee':
        return HttpResponseRedirect('/committee/')

@login_required
def showPrincipalPage(request, templateName):
    checkPrincipal(request)
    return render_to_response(templateName, {
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def showFeedback(request, type, templateName):
    checkPrincipal(request)
    if request.user.last_name == 'all':
        if type == 'rights':
            feedbacks = Feedback.objects.filter(isFinish = False).order_by('-id')
        elif type == 'finish':
            feedbacks = Feedback.objects.filter(isFinish = True).order_by('-id')
    else:
        if type == 'rights':
            feedbacks = Feedback.objects.filter(campus = request.user.last_name,
                isFinish = False).order_by('-id')
        elif type == 'finish':
            feedbacks = Feedback.objects.filter(campus = request.user.last_name,
                isFinish = True).order_by('-id')
    return render_to_response(templateName, {
        'feedbacks' : feedbacks,
        'type' : type,
        }, context_instance = RequestContext(request, processors = [getInformation]))


@login_required
def changePrincipalInformation(request):
    checkPrincipal(request)
    success = False
    if request.method == "POST":
        principal = Principal.objects.get(user = request.user)
        email = request.POST.get('email', None)
        phone = request.POST.get('phone', None)
        name = request.POST.get('name', None)
        wageNumber = request.POST.get('wageNumber', None)
        if email:
            principal.email = email
        if phone:
            principal.phone = phone
        if name:
            principal.name = name
        if wageNumber:
            principal.wageNumber = wageNumber
        principal.save()
        success = True
    return HttpResponse(json.dumps({
        'success' : success,
        }))

def replyFeedback(request):
    success = False
    message = ''
    if request.method == 'POST':
        feedbackID = request.POST.get('feedbackID', None)
        content = request.POST.get('content', None)
        if content:
            emails = []
            feedback = Feedback.objects.get(id = feedbackID)
            feedback.reply = content
            emails.append(feedback.email)
            feedbackEmail(emails, feedback.get_campus_display() + '权益在线管理员',
                content, '权益在线回复')
            feedback.isFinish = True
            feedback.save()
            success = True
            message = '回复成功，已发至对方邮箱'
        else:
            message = '内容不能为空'
    return HttpResponse(json.dumps({
        'success' : success,
        }))


def feedbackEmail(students, sponsor, content, title):
    mail_host = 'smtp.163.com'
    mail_user = 'threemicro'
    mail_pass = 'zbmy32958886'
    mail_postfix = '163.com'
    me = sponsor + '<' + mail_user + '@' + mail_postfix + '>'
    msg = MIMEText(content, _subtype = 'html', _charset = 'UTF-8')
    msg['Subject'] = title
    msg['From'] = me
    msg['To'] = ';'.join(students)
    try:
        server = smtplib.SMTP()
        server.connect(mail_host)
        server.login(mail_user, mail_pass)
        server.sendmail(me, students, msg.as_string())
        server.close()
        return True
    except Exception, e:
        return False