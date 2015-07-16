# -*- coding: utf-8 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response

from django.contrib.auth.models import User
from activity.models import Activity, Registrant
from committee.models import Committee, Teacher

from base.processor import *

from activity.views import showRunningActivities, showExaminingActivity, showExaminedActivity, showHalfAssessActivity

from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.core.paginator import Paginator, InvalidPage, EmptyPage

from django.template import RequestContext

import json
import re

def checkTeacher(request):
    if request.user.first_name == 'student':
        return HttpResponseRedirect('/student/')
    if request.user.first_name == 'principal':
        return HttpResponseRedirect('/principal/')

@login_required
def showTeacherPage(request, templateName):
    checkTeacher(request)
    return render_to_response(templateName, {
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def showAssessView(request, templateName):
    checkTeacher(request)
    
    activities = showExaminingActivity(request)

    activities, numList, querystring = dealPaginator(request, activities)
    return render_to_response(templateName, {
        'user' : request.user,
        'activities' : activities,
        'querystring' : querystring,
        'numList' : numList,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def withdrawActivity(request, templateName):
    checkTeacher(request)

    activities = showExaminedActivity(request)
    
    activities, numList, querystring = dealPaginator(request, activities)
    return render_to_response(templateName, {
        'user' : request.user,
        'activities' : activities,
        'querystring' : querystring,
        'numList' : numList,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def halfAssessActivity(request, templateName):
    checkTeacher(request)

    activities = showHalfAssessActivity(request)
    
    activities, numList, querystring = dealPaginator(request, activities)
    return render_to_response(templateName, {
        'user' : request.user,
        'activities' : activities,
        'querystring' : querystring,
        'numList' : numList,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def showCheckoutView(request, templateName):
    checkTeacher(request)

    activities = showRunningActivities(request)

    activities, numList, querystring = dealPaginator(request, activities)
    return render_to_response(templateName, {
        'activities' : activities,
        'querystring' : querystring,
        'numList' : numList,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def showActivities(request, templateName):
    checkTeacher(request)

    campus = ''
    teachers = []
    if request.user.first_name == 'teacher':
        teacher = Teacher.objects.get(tno = request.user.username)
        waitings = Activity.objects.filter(status = 'first',
            teacher = teacher)
        campus = teacher.committee.campus
    elif request.user.first_name == 'committee':
        campus = request.user.last_name
        committee = Committee.objects.get(campus = campus)
        teachers = Teacher.objects.filter(committee = committee)
        waitings = Activity.objects.filter(status = 'second',
            campus = request.user.last_name)
    runnings = Activity.objects.filter(campus = campus,
        isCompleted = False, status = 'success').order_by('-id')
    return render_to_response(templateName, {
        'waitings' : waitings,
        'runnings' : runnings,
        'teachers' : teachers,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def changePassword(request):
    message = '更改密码失败'
    success = False
    if request.method == 'POST':
        oldPassword = request.POST.get('oldPassword', None)
        newPassword = request.POST.get('newPassword', None)
        if oldPassword and newPassword:
            user = request.user
            if user.check_password(oldPassword):
                user.set_password(newPassword)
                user.save()
                success = True
                message = '更改密码成功'
            else:
                message = '密码错误'
        else:
            message = '密码不能为空'
    return HttpResponse(json.dumps({
        'success' : success,
        'message' : message,
        }))

@login_required
def changeTeacherInformation(request):
    checkTeacher(request)
    success = False
    if request.method == "POST":
        teacher = Teacher.objects.get(user = request.user)
        email = request.POST.get('email', None)
        phone = request.POST.get('phone', None)
        name = request.POST.get('name', None)
        gender = request.POST.get('gender', None)
        work = request.POST.get('work', None)
        wageNumber = request.POST.get('wageNumber', None)
        if email:
            teacher.email = email
        if phone:
            teacher.phone = phone
        if name:
            teacher.name = name
        if gender:
            teacher.gender = gender
        if work:
            teacher.work = work
        if wageNumber:
            teacher.wageNumber = wageNumber
        teacher.save()
        success = True
    return HttpResponse(json.dumps({
        'success' : success,
        }))

def getListByPage(activities):
    nowNum = activities.number
    numList = []
    diff = -5
    while nowNum + diff <= activities.paginator.num_pages:
        if nowNum + diff > 0:
            numList.append(nowNum + diff)
        diff = diff + 1
        if len(numList) == 10:
            break
    return numList

def dealPaginator(request, activities):
    start = request.GET.get('start', None)
    end = request.GET.get('end', None)
    try:
        page = int(request.GET.get('page', '1'))
    except ValueError:
        page = 1
    activityPage = Paginator(activities, 6)
    try:
        activities = activityPage.page(page)
    except (EmptyPage, InvalidPage):
        activities = activityPage.page(activityPage.num_pages)

    numList = getListByPage(activities)

    querystring = '?'
    if start:
        querystring += 'start=' + start + '&'
    if end:
        querystring += 'end=' + end + '&'

    fullPath = request.get_full_path()
    try:        
        params = fullPath.split("?")[1].replace("/", "")
        replace_reg = re.compile(r'&page=(\d+)')
        params = replace_reg.sub('', params)
    except:
        params = ""
    querystring += params + "&"
    print "************************"
    print querystring
    return activities, numList, querystring