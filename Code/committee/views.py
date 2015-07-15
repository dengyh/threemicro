# -*- coding: utf-8 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response

from django.contrib.auth.models import User
from committee.models import Committee, Societies, Teacher
from committee.forms import TeacherForm
from activity.models import Submission, Activity, Number

from base.processor import *

from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt

from django.template import RequestContext

from teacher.views import dealPaginator, getListByPage

import json
import xlwt
import pytz
import datetime

def checkCommittee(request):
    if request.user.first_name == 'teacher':
        return HttpResponseRedirect('/teacher/')
    if request.user.first_name == 'student':
        return HttpResponseRedirect('/student/')
    if request.user.first_name == 'principal':
        return HttpResponseRedirect('/principal/')

@login_required
def createTeacher(request, templateName):
    checkCommittee(request)
    committee = Committee.objects.get(user = request.user)
    if request.method == 'POST':
        form = TeacherForm(request.POST)
        if form.is_valid():
            clean = form.cleaned_data
            user = User.objects.create(
                username = clean['tno'],
                first_name = 'teacher',
                last_name = clean['tno'],
                )
            user.set_password(clean['password'])
            user.save()
            # societiesID = int(request.POST.get('societies', None))
            # societies = Societies.objects.get(id = societiesID)
            teacher = Teacher.objects.create(
                user = user,
                committee = committee,
                # societies = societies,
                tno = clean['tno'],
                name = clean['name'],
                )
        else:
            print form.errors
    teachers = Teacher.objects.filter(isActive = True,
        committee = committee).order_by('tno')
    # societies = Societies.objects.filter(committee = committee).order_by('id')
    return render_to_response(templateName, {
        'teachers' : teachers,
        # 'societies' : societies,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def createSocieties(request, templateName):
    checkCommittee(request)
    if request.method == 'POST':
        name = request.POST.get('name', None)
        if name:
            Societies.objects.create(
                name = name,
                committee = committee,
                )
    societies = Societies.objects.filter(committee = committee).order_by('id')
    return render_to_response(templateName, {
        'societies' : societies,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def deleteTeacher(request, tno):
    checkCommittee(request)
    if tno is not None:
        teacher = Teacher.objects.get(tno = tno)
        teacher.isActive = False
        teacher.save()
        user = teacher.user
        user.is_active = False
        user.save()
    return HttpResponseRedirect('/committee/create/teacher/')

@login_required
def reSetPassword(request, tno):
    checkCommittee(request)
    if tno is not None:
        teacher = Teacher.objects.get(tno = tno)
        teacher.save()
        user = teacher.user
        user.set_password(888888)
        user.save()
    return HttpResponseRedirect('/committee/create/teacher/')

def changeCommitteeInformation(request):
    checkCommittee(request)
    success = False
    if request.method == "POST":
        committee = Committee.objects.get(user = request.user)
        email = request.POST.get('email', None)
        phone = request.POST.get('phone', None)
        name = request.POST.get('name', None)
        wageNumber = request.POST.get('wageNumber', None)
        if email:
            committee.email = email
        if phone:
            committee.phone = phone
        if name:
            committee.name = name
        if wageNumber:
            committee.wageNumber = wageNumber
        committee.save()
        success = True
    return HttpResponse(json.dumps({
        'success' : success,
        }))

def checkCreateTeacher(request):
    checkCommittee(request)
    success = False
    message = ''
    if request.method == 'POST':
        username = request.POST.get('username', None)
        if username:
            user = User.objects.filter(username = username)
            if user:
                message = '该学工号已被使用'
            else:
                success = True
        else:
            success = True
    return HttpResponse(json.dumps({
        'success' : success,
        'message' : message,
        }))

def exportAsExcel(request, type):
    if request.user.first_name != "committee":
        return HttpResponse("对不起，你的权限不足")
    campus = Committee.objects.get(user = request.user).campus
    checkCommittee(request)
    wb = xlwt.Workbook(encoding = 'utf-8')
    sheet = wb.add_sheet(type)
    start = request.GET.get('start', None)
    end = request.GET.get('end', None)
    if (not end) or (not start):
        return HttpResponseRedirect('/committee/checkout/')
    utc = pytz.UTC
    start = utc.localize(datetime.datetime.strptime(start,'%Y-%m-%d'))
    end = utc.localize(datetime.datetime.strptime(end,'%Y-%m-%d'))
    end = end + datetime.timedelta(days=1)
    if type == 'activity':
        for i in range(0, 6):
            sheet.col(i).width = 0x0d00 + 2000
        sheet.write(0, 0, '申请人')
        sheet.write(0, 1, '电话')
        sheet.write(0, 2, '主办方')
        sheet.write(0, 3, '活动名称')
        sheet.write(0, 4, '开展时间')
        sheet.write(0, 5, '开展地点')
        row = 1
        activities = Activity.objects.filter(status = 'success', campus = campus,
            signDateTime__gte = start,
            signDateTime__lte = end)
        for item in activities:
            sheet.write(row, 0, item.student.name)
            sheet.write(row, 1, item.student.phone)
            sheet.write(row, 2, item.societies.name)
            sheet.write(row, 3, item.title)
            sheet.write(row, 4, '从' + item.startDateTime.strftime('%Y-%m-%d:%I-%M-%S') +
                '至' + item.endDateTime.strftime('%Y-%m-%d:%I-%M-%S'))
            sheet.write(row, 5, item.location)
            row += 1
    elif type == 'classroom':
        pass
    elif type == 'chair':
        for i in range(0, 8):
            sheet.col(i).width = 0x0d00 + 2000
        sheet.write(0, 0, '申请人')
        sheet.write(0, 1, '电话')
        sheet.write(0, 2, '主办方')
        sheet.write(0, 3, '活动名称')
        sheet.write(0, 4, '桌子数量')
        sheet.write(0, 5, '沙滩椅数量')
        sheet.write(0, 6, '其他物资')
        sheet.write(0, 7, '借用时间')
        row = 1
        submissions = []
        activities = Activity.objects.filter(status = 'success', campus = campus,
            signDateTime__gte = start,
            signDateTime__lte = end)
        for item in activities:
            submissions.extend(Submission.objects.filter(type = type, activity = item))
        for item in submissions:
            sheet.write(row, 0, item.activity.student.name)
            sheet.write(row, 1, item.activity.student.phone)
            sheet.write(row, 2, item.activity.societies.name)
            sheet.write(row, 3, item.activity.title)
            sheet.write(row, 4, item.number)
            sheet.write(row, 5, item.chairNumber)
            sheet.write(row, 6, item.otherNumber)
            sheet.write(row, 7, '从' + item.startTime.strftime('%Y-%m-%d:%I-%M-%S') +
                '至' + item.endTime.strftime('%Y-%m-%d:%I-%M-%S'))
            row += 1
    elif type == 'poster':
        for i in range(0, 7):
            sheet.col(i).width = 0x0d00 + 2000
        sheet.write(0, 0, '申请人')
        sheet.write(0, 1, '电话')
        sheet.write(0, 2, '主办方')
        sheet.write(0, 3, '活动名称')
        sheet.write(0, 4, '宣传品大标题')
        sheet.write(0, 5, '悬挂地点')
        sheet.write(0, 6, '悬挂时间')
        row = 1
        submissions = []
        activities = Activity.objects.filter(status = 'success', campus = campus,
            signDateTime__gte = start,
            signDateTime__lte = end)
        for item in activities:
            submissions.extend(Submission.objects.filter(type = type, activity = item))
        for item in submissions:
            sheet.write(row, 0, item.activity.student.name)
            sheet.write(row, 1, item.activity.student.phone)
            sheet.write(row, 2, item.activity.societies.name)
            sheet.write(row, 3, item.activity.title)
            sheet.write(row, 4, item.description)
            sheet.write(row, 5, item.location)
            sheet.write(row, 6, '从' + item.startTime.strftime('%Y-%m-%d:%I-%M-%S') +
                '至' + item.endTime.strftime('%Y-%m-%d:%I-%M-%S'))
            row += 1
    elif type == 'location':
        for i in range(0, 6):
            sheet.col(i).width = 0x0d00 + 2000
        sheet.write(0, 0, '申请人')
        sheet.write(0, 1, '电话')
        sheet.write(0, 2, '主办方')
        sheet.write(0, 3, '活动名称')
        sheet.write(0, 4, '申请场地')
        sheet.write(0, 5, '借用时间')
        row = 1
        submissions = []
        activities = Activity.objects.filter(status = 'success', campus = campus,
            signDateTime__gte = start,
            signDateTime__lte = end)
        for item in activities:
            submissions.extend(Submission.objects.filter(type = type, activity = item))
        for item in submissions:
            sheet.write(row, 0, item.activity.student.name)
            sheet.write(row, 1, item.activity.student.phone)
            sheet.write(row, 2, item.activity.societies.name)
            sheet.write(row, 3, item.activity.title)
            sheet.write(row, 4, item.location)
            sheet.write(row, 5, '从' + item.startTime.strftime('%Y-%m-%d:%I-%M-%S') +
                '至' + item.endTime.strftime('%Y-%m-%d:%I-%M-%S'))
            row += 1
    elif type == 'actionCenter':
        for i in range(0, 6):
            sheet.col(i).width = 0x0d00 + 2000
        sheet.write(0, 0, '申请人')
        sheet.write(0, 1, '电话')
        sheet.write(0, 2, '主办方')
        sheet.write(0, 3, '活动名称')
        sheet.write(0, 4, '申请场地')
        sheet.write(0, 5, '借用时间')
        row = 1
        submissions = []
        activities = Activity.objects.filter(status = 'success', campus = campus,
            signDateTime__gte = start,
            signDateTime__lte = end)
        for item in activities:
            submissions.extend(Submission.objects.filter(type = type, activity = item))
        for item in submissions:
            sheet.write(row, 0, item.activity.student.name)
            sheet.write(row, 1, item.activity.student.phone)
            sheet.write(row, 2, item.activity.societies.name)
            sheet.write(row, 3, item.activity.title)
            sheet.write(row, 4, item.location)
            sheet.write(row, 5, '从' + item.startTime.strftime('%Y-%m-%d:%I-%M-%S') +
                '至' + item.endTime.strftime('%Y-%m-%d:%I-%M-%S'))
            row += 1
    elif type == 'functionRoom':
        for i in range(0, 6):
            sheet.col(i).width = 0x0d00 + 2000
        sheet.write(0, 0, '申请人')
        sheet.write(0, 1, '电话')
        sheet.write(0, 2, '主办方')
        sheet.write(0, 3, '活动名称')
        sheet.write(0, 4, '申请场地')
        sheet.write(0, 5, '借用时间')
        row = 1
        submissions = []
        activities = Activity.objects.filter(status = 'success', campus = campus,
            signDateTime__gte = start,
            signDateTime__lte = end)
        for item in activities:
            submissions.extend(Submission.objects.filter(type = type, activity = item))
        for item in submissions:
            sheet.write(row, 0, item.activity.student.name)
            sheet.write(row, 1, item.activity.student.phone)
            sheet.write(row, 2, item.activity.societies.name)
            sheet.write(row, 3, item.activity.title)
            sheet.write(row, 4, item.location)
            sheet.write(row, 5, '从' + item.startTime.strftime('%Y-%m-%d:%I-%M-%S') +
                '至' + item.endTime.strftime('%Y-%m-%d:%I-%M-%S'))
            row += 1
    elif type == 'car':
        pass
    filename = type + '.xls'
    response = HttpResponse(mimetype="application/vnd.ms-excel")
    response['Content-Disposition'] = ('attachment; filename=' + filename)
    wb.save(response)
    return response

def resource(request):
    if(request.user.first_name != "committee"):
        return HttpResponseRedirect("/")
    committee = Committee.objects.get(user = request.user)
    today = datetime.datetime.now()
    
    submissionChair = Submission.objects.filter(type = "chair", activity__status = "success", activity__campus = committee.campus).order_by("hasReturned", "-endTime")[:5]
    submissionClassroom = Submission.objects.filter(type = "classroom", activity__status = "success", activity__campus = committee.campus).order_by("-endTime")[:5]
    submissionPoster= Submission.objects.filter(type = "poster", activity__status = "success", activity__campus = committee.campus).order_by("-endTime")[:5]
    submissionLocation = Submission.objects.filter(type = "location", activity__status = "success", activity__campus = committee.campus).order_by("-endTime")[:5]
    submissionActionCenter = Submission.objects.filter(type = "actionCenter", activity__status = "success", activity__campus = committee.campus).order_by("-endTime")[:5]
    submissionFunctionRoom = Submission.objects.filter(type = "functionRoom", activity__status = "success", activity__campus = committee.campus).order_by("-endTime")[:5]
    number = Number.objects.get(campus = committee.campus)


    return render_to_response("resourceManage.html", {
        "chairs": submissionChair,
        "classrooms":submissionClassroom,
        "posters": submissionPoster,
        "locations": submissionLocation,
        "actionCenters": submissionActionCenter,
        "functionRooms": submissionFunctionRoom,
        "number": number,
        }, context_instance = RequestContext(request, processors = [getInformation]))


def moreApply(request):
    type = request.GET.get("type", "chair")
    if type == "chair":
        typeTitle = u"桌椅资源申请"
    elif type == "classroom":
        typeTitle = u"课室申请"
    elif type == "poster":
        typeTitle = u"宣传申请"
    elif type == "location":
        typeTitle = u"校区场地申请"
    elif type == "actionCenter":
        typeTitle = u"学生活动中心申请"
    elif type == "functionRoom":
        typeTitle = u"校团委功能室申请"

    submissions = Submission.objects.filter(type = type, activity__status = "success", activity__campus = request.user.last_name).order_by("hasReturned", "-endTime")
    
    submissions, numList, querystring = dealPaginator(request, submissions)
    print querystring
    return render_to_response("moreApply.html", {
        "applyType": type,
        "type": request.user.first_name,
        "typeTitle": typeTitle,
        "submissions": submissions,
        "querystring": querystring,
        "numList": numList,
        }, context_instance = RequestContext(request, processors = [getInformation]))

def resourceDetail(request):
    submissionID = request.GET.get("submissionID", None)
    if submissionID is None:
        return HttpResponse("操作失败")
    submission =  Submission.objects.get(id = submissionID)
    activity = submission.activity
    return render_to_response("resourceDetail.html", {
        "submission": submission,
        "activity": activity,
        "hasReturned": submission.hasReturned,
        }, context_instance = RequestContext(request, processors = [getInformation]))

def makeReturned(request):
    if(request.user.first_name != "committee"):
        return HttpResponseRedirect("/")
    submissionID = request.POST.get("submissionID", None)
    if submissionID is None:
        return HttpResponse(json.dumps({
            'success' : False,
            'message' : '归还失败',
            }))
    Submission.objects.filter(id = submissionID).update(hasReturned = True)
    print submissionID
    return HttpResponse(json.dumps({
        'success' : True,
        'message' : '归还成功',
        }))