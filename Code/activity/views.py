# -*- coding: utf-8 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response

from django.contrib.auth.models import User
from student.models import Student
from activity.models import Activity, Registrant, Submission, Attachment, Number, Location, LimitNumber
from committee.models import Teacher, Societies, TableSet

from base.processor import *

from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.core.paginator import Paginator, InvalidPage, EmptyPage

from django.template import RequestContext
from django.utils import timezone
from django.core import serializers

import json
import datetime
import pytz

import sys  
reload(sys)  
sys.setdefaultencoding('utf8')  

# ------------------------ student start -----------------------

@login_required
def showActivityIndex(request, templateName):
    # if request.user.first_name != 'student':
    #     return HttpResponseRedirect('/teacher/404/')
    return render_to_response(templateName)

# @login_required
# def showActivities(request, templateName):
#     complete = showCompleteActivities(request)
#     registing = showRegistingActivities(request)
#     applied = showAppliedActivities(request)
#     east, north, zhuhai, south = showRecentActivities(request)
#     return render_to_response(templateName, {
#         'complete' : complete,
#         'registing' : registing,
#         'applied' : applied,
#         'east' : east,
#         'north' : north,
#         'zhuhai' : zhuhai,
#         'south' : south,
#         'student' : Student.objects.get(user = request.user),
#         }, context_instance = RequestContext(request))

@login_required
def getCompleteActivities(request, templateName):
    if request.user.first_name != 'student':
        return HttpResponseRedirect('/teacher/404/')
    activities, student = showCompleteActivities(request)
    return render_to_response(templateName, {
        'activities' : activities,
        'student' : student,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def getRegistingActivities(request, templateName):
    if request.user.first_name != 'student':
        return HttpResponseRedirect('/teacher/404/')
    activities = showRegistingActivities(request)
    return render_to_response(templateName, {
        'activities' : activities,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def getAppliedActivities(request, templateName):
    if request.user.first_name != 'student':
        return HttpResponseRedirect('/teacher/404/')
    activities = showAppliedActivities(request)
    return render_to_response(templateName, {
        'activities' : activities,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def getAppliedActivitiesPC(request, templateName):
    if request.user.first_name != 'student':
        return HttpResponseRedirect('/teacher/404/')
    activities = showAppliedActivitiesPC(request)
    return render_to_response(templateName, {
        'activities' : activities,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def getCampus(request, templateName):
    return render_to_response(templateName, {
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def getOneCampusActivity(request, campus, templateName):
    chinese = {'south' : '南校区', 'north' : '北校区', 'east' : '东校区', 'zhuhai' : '珠海校区'}
    activities = getCampusActivities(request, campus)
    return render_to_response(templateName, {
        'activities' : activities,
        'campus' : chinese[campus],
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def getOneCampusCompleteActivity(request, campus, templateName):
    chinese = {'south' : '南校区', 'north' : '北校区', 'east' : '东校区', 'zhuhai' : '珠海校区'}
    activities = getCampusCompleteActivities(request, campus)
    return render_to_response(templateName, {
        'activities' : activities,
        'campus' : chinese[campus],
        }, context_instance = RequestContext(request, processors = [getInformation]))

# show the activities that the student had completed
@login_required
def showCompleteActivities(request):
    student = Student.objects.get(user = request.user)
    student.totalTime = student.totalTime / 3600.0
    if student.registTimes == 0:
        student.honour = 0
    else:
        student.honour = student.completeTimes * 1.0 / student.registTimes * 100
    registrants = Registrant.objects.filter(netid = student.netid,
        isCompleted = True).order_by('-registTime')
    activities = []
    for item in registrants:
        item.time = item.time / 3600.0
        item.activity.registrant = item
        activities.append(item.activity)
    return activities, student

# show the activities that the student is signing
@login_required
def showRegistingActivities(request):
    student = Student.objects.get(user = request.user)
    registrants = Registrant.objects.filter(netid = student.netid).order_by('-registTime')
    activities = []
    for item in registrants:
        if item.activity.isCompleted is False:
            item.activity.registrant = item
            activities.append(item.activity)
    return activities

# show the activities that the student had applied
@login_required
def showAppliedActivities(request):
    student = Student.objects.get(user = request.user)
    activities = Activity.objects.filter(student = student,
        type = 'publicWelfare', status = 'success').order_by('-signDateTime')
    for item in activities:
        item.registrants = Registrant.objects.filter(activity = item)
    return activities

@login_required
def showAppliedActivitiesPC(request):
    student = Student.objects.get(user = request.user)
    activities = Activity.objects.filter(student = student).order_by('-signDateTime')
    for item in activities:
        item.registrants = Registrant.objects.filter(activity = item)
    return activities

# show the active activities that in Sun Yat-sen University
@login_required
def showRecentActivities(request):
    east = getCampusActivities(request, 'east')
    north = getCampusActivities(request, 'north')
    zhuhai = getCampusActivities(request, 'zhuhai')
    south = getCampusActivities(request, 'south')
    return (east, north, zhuhai, south)

@login_required
def getCampusActivities(request, campus):
    activities = Activity.objects.filter(status = 'success',
        isCompleted = False, campus = campus,
        type = 'publicWelfare').order_by('-signDateTime')
    return activities

@login_required
def getCampusCompleteActivities(request, campus):
    activities = Activity.objects.filter(status = 'success',
        isCompleted = True, campus = campus,
        type = 'publicWelfare').order_by('-signDateTime')
    return activities

# show the activities that the student is waiting for check
@login_required
def showWaitingActivity(request, templateName):
    if request.user.first_name != 'student':
        return HttpResponseRedirect('/teacher/404/')
    student = Student.objects.get(user = request.user)
    activities = Activity.objects.filter(student = student,
        isCompleted = False).order_by('-signDateTime')
    return render_to_response(templateName, {
        'activities' : activities,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def showRegistingRegistrant(request, activityId, templateName):
    if request.user.first_name != 'student':
        return HttpResponseRedirect('/teacher/404/')
    activity = Activity.objects.get(id = activityId)
    registrants = Registrant.objects.filter(activity = activity).order_by('registTime')
    for item in registrants:
        item.student = Student.objects.get(netid = item.netid)
    return render_to_response(templateName, {
        'registrants' : registrants,
        'activity' : activity,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def showActivityRegistrant(request, activityId, templateName):
    if request.user.first_name != 'student':
        return HttpResponseRedirect('/teacher/404/')
    activity = Activity.objects.get(id = activityId)
    registrants = Registrant.objects.filter(activity = activity,
        isPass = True).order_by('registTime')
    for item in registrants:
        item.student = Student.objects.get(netid = item.netid)
    return render_to_response(templateName, {
        'registrants' : registrants,
        'activity' : activity,
        }, context_instance = RequestContext(request, processors = [getInformation]))

# sign the activity
@login_required
def signActivity(request):
    success = False
    message = ''
    activityID = request.POST.get('activityID', None)
    if activityID and request.user.first_name == 'student':
        activity = Activity.objects.get(id = activityID)
        if activity.isReady is False:
            student = Student.objects.get(user = request.user)
            tz = pytz.timezone('Asia/Shanghai')
            if student.lastLastTime is None:
                naive = datetime.datetime(2000, 1, 1)
            else:
                naive = student.lastLastTime.replace(tzinfo = None)
            if (datetime.datetime.now() - naive).days >= 7:
                registrant = Registrant.objects.create(
                    netid = student.netid,
                    activity = activity,
                    )
                student.lastLastTime = student.lastTime
                student.lastTime = timezone.now()
                message = '您已报名成功'
                student.save()
                success = True
            else:
                message = '一星期内只能报名两次'
        else:
            message = '活动参加人员已经确认完毕,报名失败'
    else:
        message = '非学生不能报名'
    return HttpResponse(json.dumps({
        'success' : success,
        'message' : message,
        }))

# comfirm the arriving of the student
@login_required
def signInActivity(request):
    success = False
    registrantID = request.POST.get('registrantID', None)
    if registrantID:
        signIn(registrantID)
        success = True
    return HttpResponse(json.dumps({
        'success' : success,
        }))

# comfirm the completing of the student
@login_required
def signOutActivity(request):
    success = False
    registrantID = request.POST.get('registrantID', None)
    if registrantID:
        signOut(registrantID)
        success = True
    return HttpResponse(json.dumps({
        'success' : success,
        }))

# a super function for lazy people
@login_required
def oneKeyToSignIn(request):
    success = False
    message = ''
    activityID = request.POST.get('activityID', None)
    if activityID:
        activity = Activity.objects.get(id = activityID)
        registrants = Registrant.objects.filter(activity = activity,
            isPass = True)
        for item in registrants:
            if item.isStarted is False:
                signIn(item.id)
        success = True
    return HttpResponse(json.dumps({
        'success' : success,
        'message' : message,
        }))

# a super function for lazy people
@login_required
def oneKeyToSignOut(request):
    success = False
    message = ''
    activityID = request.POST.get('activityID', None)
    if activityID:
        activity = Activity.objects.get(id = activityID)
        registrants = Registrant.objects.filter(activity = activity,
            isPass = True, isStarted = True)
        for item in registrants:
            if item.isCompleted is False:
                signOut(item.id)
        success = True
    return HttpResponse(json.dumps({
        'success' : success,
        'message' : message,
        }))

def signIn(registrantID):
    registrant = Registrant.objects.get(id = registrantID)
    if registrant.isStarted:
        return
    registrant.startTime = timezone.localtime(timezone.now())
    registrant.isStarted = True
    registrant.save()

def signOut(registrantID):
    registrant = Registrant.objects.get(id = registrantID)
    if registrant.isCompleted:
        return
    registrant.endTime = timezone.localtime(timezone.now())
    registrant.isCompleted = True
    student = Student.objects.get(netid = registrant.netid)
    student.completeTimes = student.completeTimes + 1
    timeInterval = (registrant.endTime - registrant.startTime).seconds
    maxTime = registrant.activity.maxTime
    if timeInterval > maxTime:
        student.totalTime += maxTime
        registrant.time = maxTime
    else:
        student.totalTime += timeInterval
        registrant.time = timeInterval
    registrant.save()
    student.save()

# comfirm the activity that is completed and it will never showed in the recent activities
@login_required
def comfirmActivityEnd(request):
    success = False
    message = ''
    activityID = request.POST.get('activityID', None)
    if activityID:
        activity = Activity.objects.get(id = activityID)
        if activity.isCompleted is False:
            activity.isCompleted = True
            activity.save()
            success = True
        else:
            message = '已确认过结束'
    return HttpResponse(json.dumps({
        'success' : success,
        'message' : message,
        }))

# cancel the siging of an activity
@login_required
def cancelSignActivity(request):
    success = False
    message = ''
    activityID = request.POST.get('activityID', None)
    if activityID:
        registrant = Registrant.objects.filter(activity_id = activityID,
            netid = request.user.username)
        if len(registrant) > 0:
            registrant = registrant[0]
            if registrant.isPass is not True:
                activity = registrant.activity
                student = Student.objects.get(netid = registrant.netid)
                student.lastTime = student.lastLastTime
                student.lastLastTime = datetime.datetime(2000, 1, 1)
                student.save()
                registrant.delete()
                success = True
                message = '取消成功'
            else:
                message = '已经通过正式报名，不能取消'
        else:
            message = '你未曾报名'
    return HttpResponse(json.dumps({
        'success' : success,
        'message' : message,
        }))

# --------------------- student end ---------------------

# --------------------- teacher start -------------------

# show the micro applying UI of the teacher
@login_required
def showMicroApplying(request, templateName):
    if request.user.first_name == 'student' or request.user.first_name == 'principal':
        return HttpResponseRedirect('/student/404/')
    running = showRunningActivities(request)
    examining = showExaminingActivity(request)
    examined = showExaminedActivity(request)
    halfPass = showHalfAssessActivity(request)
    return render_to_response(templateName, {
        'running' : running,
        'examining' : examining,
        'examined' : examined,
        'halfPass' : halfPass,
        }, context_instance = RequestContext(request, processors = [getInformation]))

# show the running activities in Sun Yat-sen University
@login_required
def showRunningActivities(request):
    campus = ''
    if request.user.first_name == 'teacher':
        teacher = Teacher.objects.get(user = request.user)
        campus = teacher.committee.campus
    elif request.user.first_name == 'committee':
        campus = request.user.last_name
    # activities = Activity.objects.filter(campus = campus,
    #     status = 'success').order_by('-id')
    activities = Activity.objects.filter(campus = campus, status = 'success')
    activities = filterAndOrder(request, activities)
    return activities

# show the activities that waiting for examine
@login_required
def showExaminingActivity(request):
    activities = []
    if request.user.first_name == 'teacher':
        teacher = Teacher.objects.get(user = request.user)
        activities = Activity.objects.filter(status = 'first',
            teacher = teacher).order_by('-id')
    elif request.user.first_name == 'committee':
        activities = Activity.objects.filter(status = 'second',
            campus = request.user.last_name).order_by('-id')
    return activities

@login_required
def showExaminedActivity(request):
    activities = []
    if request.user.first_name == 'teacher':
        teacher = Teacher.objects.get(user = request.user)
        activities = Activity.objects.filter(isReady = False,
            teacher = teacher).exclude(
            status = 'ready').exclude(firstRemark__isnull = True).order_by('-id')
    elif request.user.first_name == 'committee':
        activities = Activity.objects.filter(isReady = False,
            campus = request.user.last_name).exclude(
            status = 'ready').exclude(secondRemark__isnull = True).order_by('-id')
    return activities

@login_required
def showHalfAssessActivity(request):
    activities = []
    if request.user.first_name == 'teacher':
        teacher = Teacher.objects.get(user = request.user)
        activities = Activity.objects.filter(teacher = teacher,
            status = 'ready', secondRemark = None).order_by('-id')
    elif request.user.first_name == 'committee':
        activities = Activity.objects.filter(campus = request.user.last_name,
            status = 'ready').exclude(secondRemark = None).order_by('-id')
    return activities

def filterAndOrder(request, activities):    
    dateTimeFrom = "1994-01-01 11:11:11"
    dateTimeTo = "8999-12-31 11:11:11" 

    orderBy = request.GET.get("orderBy", "-id")
    titleKey = request.GET.get("title", "")
    locationKey = request.GET.get("location", "")
    sponsorKey = request.GET.get("sponsor", "")
    startDateTimeFrom = request.GET.get("startDateTimeFrom", dateTimeFrom)
    startDateTimeTo = request.GET.get("startDateTimeTo", dateTimeTo)
    endDateTimeFrom = request.GET.get("endDateTimeFrom", dateTimeFrom)
    endDateTimeTo = request.GET.get("endDateTimeTo", dateTimeTo)

    startDateTimeFrom = datetime.datetime.strptime(startDateTimeFrom, "%Y-%m-%d %H:%M:%S")
    startDateTimeTo = datetime.datetime.strptime(startDateTimeTo, "%Y-%m-%d %H:%M:%S")
    endDateTimeFrom = datetime.datetime.strptime(endDateTimeFrom, "%Y-%m-%d %H:%M:%S")
    endDateTimeTo = datetime.datetime.strptime(endDateTimeTo, "%Y-%m-%d %H:%M:%S")

    # print request.GET
    activities = activities.filter(
        title__icontains = titleKey, 
        location__icontains = locationKey, 
        sponsor__icontains = sponsorKey, 
        startDateTime__gte = startDateTimeFrom, 
        startDateTime__lte = startDateTimeTo, 
        endDateTime__gte = endDateTimeFrom, 
        endDateTime__lte = endDateTimeTo).order_by(orderBy)

    return activities

# decide the fate of the activity
@login_required
def examineActivity(request):
    success = False
    message = ''
    activityID = request.POST.get('activityID', None)
    remark = request.POST.get('remark', None)
    status = request.POST.get('status', None)
    if activityID is None or request.user.first_name == 'student' or request.user.first_name == 'principal' or status is None or remark is None:
        message = '评论区为空'
        return HttpResponse(json.dumps({
            'success' : success,
            'message' : message,
            }))
    activity = Activity.objects.get(id = activityID)
    if activity.status == 'first':
        if request.user.id != activity.teacher.user.id:
            message = '非对应业务指导老师'
            return HttpResponse(json.dumps({
                'success' : success,
                'message' : message,
                }))
        activity.firstRemark = remark
        activity.status = 'second'
    elif activity.status == 'second':
        if request.user.last_name != activity.campus:
            message = '非对应团委'
            return HttpResponse(json.dumps({
                'success' : success,
                'message' : message,
                }))
        activity.secondRemark = remark
        activity.status = 'success'
    elif activity.status == 'ready':
        if request.user.first_name == 'teacher':
            if request.user.id != activity.teacher.user.id:
                message = '非对应业务指导老师'
                return HttpResponse(json.dumps({
                    'success' : success,
                    'message' : message,
                    }))
            activity.firstRemark = remark
            activity.status = 'second'
        elif request.user.first_name == 'committee':
            if request.user.last_name != activity.campus:
                message = '非对应团委'
                return HttpResponse(json.dumps({
                    'success' : success,
                    'message' : message,
                    }))
            activity.secondRemark = remark
            activity.status = 'success'
    if status == 'halfPass':
        activity.status = 'ready'
        if request.user.first_name == 'teacher':
            activity.firstRemark = remark
        else:
            activity.secondRemark = remark
    if status == 'faild':
        activity.status = 'faild'
        if request.user.first_name == 'teacher':
            activity.firstRemark = remark
        else:
            activity.secondRemark = remark
        
        mark = request.POST.getlist("mark[]", None)

        if "title" in mark:
            activity.titleMark = False
        if "location" in mark:
            activity.locationMark = False
        if "campus" in mark:
            activity.campusMark = False
        if "type" in mark:
            activity.typeMark = False
        if "sponsor" in mark:
            activity.sponsorMark = False
        if "content" in mark:
            activity.contentMark = False
        if "societies" in mark:
            activity.societiesMark = False
        if "teacher" in mark:
            activity.teacherMark = False
        if "deadline" in mark:
            activity.deadlineMark = False
        if "startDateTime" in mark:
            activity.startDateTimeMark = False
        if "endDateTime" in mark:
            activity.endDateTimeMark = False
        if "maxTime" in mark:
            activity.maxTimeMark = False
        if "totalNumber" in mark:
            activity.totalNumberMark = False
        if "academicTypeMark" in mark:
            activity.academicTypeMark = False
        if "detailMark" in mark:
            activity.detailMark = False

        count = 0
        if mark != []:
            count = 1
        index = 0
        while request.POST.getlist("mark[%s][%s][]" % (count, index), None) != []:
            submissionMark = request.POST.getlist("mark[%s][%s][]" % (count, index), None)
            submission = Submission.objects.get(id = submissionMark[0])
            submission.submissionMark = False
            if "sonStartDateTime" in submissionMark:
                submission.startTimeMark = False
            if "sonEndDateTime" in submissionMark:
                submission.endTimeMark = False
            if "sonLocation" in submissionMark:
                submission.locationMark = False
            if "sonDesk" in submissionMark:
                submission.numberMark = False
            if "sonBeachDesk" in submissionMark:
                submission.chairNumberMark = False
            if "sonOther" in submissionMark:
                submission.otherNumberMark = False
            if "sonTent" in submissionMark:
                submission.tentNumberMark = False
            submission.save()
            index = index + 1
        index = 0
        while request.POST.getlist("mark[%s][%s][]" % (count + 1, index), None) != []:
            attachmentMark = request.POST.getlist("mark[%s][%s][]" % (count + 1, index), None)
            attachment = Attachment.objects.get(id = attachmentMark[0])
            attachment.attachmentMark = False
            attachment.save()
            index = index + 1

    success = True
    message = '审批成功'
    activity.save()
    return HttpResponse(json.dumps({
        'success' :success,
        'message' : message,
        }))

# ------------------------ tearcher end -------------------

# ------------------------ union start ----------------------

# show the detail of activity
@login_required
def showActivityDetail(request, activityID, templateName):

    isApplier = False
    isSign = False
    hasButton = False
    isCompleted = False
    isAssesser = False
    isHalf = False
    
    activity = Activity.objects.get(id = activityID)
    activity.maxTime = activity.maxTime / 3600.0
    if activity.status == 'first' and request.user.first_name == 'teacher':
        hasButton = True
    if activity.status == 'second' and request.user.first_name == 'committee':
        hasButton = True
    if activity.status == 'ready':
        isHalf = True
    if activity.isCompleted:
        isCompleted = True
    registrants = Registrant.objects.filter(activity = activity, netid = request.user.username)
    submission = Submission.objects.filter(activity = activity)
    attachment = Attachment.objects.filter(activity = activity)
    if activity.teacher.user == request.user:
        isAssesser = True
    if activity.campus == request.user.last_name:
        isAssesser = True
    if activity.student.user == request.user:
        isApplier = True
    if len(registrants) > 0:
        isSign = True
    
    title = ""
    location = ""
    campus = ""
    type = ""
    sponsor = ""
    content = ""
    societies_ = ""
    teacher = ""
    deadline = ""
    startDateTime = ""
    endDateTime = ""
    maxTime = ""
    totalNumber = ""

    className = "tag"
    
    if activity.titleMark == False:
        title = className
    if activity.locationMark == False:
        location = className
    if activity.campusMark == False:
        campus = className
    if activity.typeMark == False:
        type = className
    if activity.sponsorMark == False:
        sponsor = className
    if activity.contentMark == False:
        content = className
    if activity.societiesMark == False:
        societies_ = className
    if activity.teacherMark == False:
        teacher = className
    if activity.deadlineMark == False:
        deadline = className
    if activity.startDateTimeMark == False:
        startDateTime = className
    if activity.endDateTimeMark == False:
        endDateTime = className
    if activity.maxTimeMark == False:
        maxTime = className
    if activity.totalNumberMark == False:
        totalNumber = className

    # get the total resources of the four campus
    zhuhaiNumber = Number.objects.get(campus = "zhuhai")
    northNumber = Number.objects.get(campus = "north")
    eastNumber = Number.objects.get(campus = "east")
    southNumber = Number.objects.get(campus = "south")
    zhuhaiTotalNumber = zhuhaiNumber
    northTotalNumber = northNumber
    eastTotalNumber = eastNumber
    southTotalNumber = southNumber
    zhuhaiNumber = {"desk": zhuhaiNumber.desk, "beachDesk": zhuhaiNumber.beachDesk, "tent": zhuhaiNumber.tent}
    northNumber = {"desk": northNumber.desk, "beachDesk": northNumber.beachDesk, "tent": northNumber.tent}
    eastNumber = {"desk": eastNumber.desk, "beachDesk": eastNumber.beachDesk, "tent": eastNumber.tent}
    southNumber = {"desk": southNumber.desk, "beachDesk": southNumber.beachDesk, "tent": southNumber.tent}
    # caculate the remaining resources
    chairSubmission = Submission.objects.filter(type = "chair", hasReturned = False, activity__status = "success").filter(endTime__gt = datetime.datetime.now())
    count = chairSubmission.count()
    while count != 0:
        count -= 1
        if chairSubmission[count].activity.campus == "zhuhai":
            zhuhaiNumber["desk"] -= chairSubmission[count].number
            zhuhaiNumber["beachDesk"] -= chairSubmission[count].chairNumber
            zhuhaiNumber["tent"] -= chairSubmission[count].tentNumber
        elif chairSubmission[count].activity.campus == "north":            
            northNumber["desk"] -= chairSubmission[count].number
            northNumber["beachDesk"] -= chairSubmission[count].chairNumber
            northNumber["tent"] -= chairSubmission[count].tentNumber
        elif chairSubmission[count].activity.campus == "east":            
            eastNumber["desk"] -= chairSubmission[count].number
            eastNumber["beachDesk"] -= chairSubmission[count].chairNumber
            eastNumber["tent"] -= chairSubmission[count].tentNumber
        elif chairSubmission[count].activity.campus == "south":            
            southNumber["desk"] -= chairSubmission[count].number
            southNumber["beachDesk"] -= chairSubmission[count].chairNumber
            southNumber["tent"] -= chairSubmission[count].tentNumber

    committee = Committee.objects.get(campus = activity.campus)
    societiesList = Societies.objects.filter(committee = committee)
    teachersList = Teacher.objects.filter(isActive = True,
            societies = activity.societies)
    tables = TableSet.objects.filter(committee = committee)

    # print RequestContext(request, processors = [getInformation])
    return render_to_response(templateName, {
        'isApplier' : isApplier,
        'isSign' : isSign,
        'hasButton' : hasButton,
        'identity' : request.user.first_name,
        'activity' : activity,
        'submission' : submission,
        'attachment' : attachment,
        'isCompleted' : isCompleted,
        'isAssesser' : isAssesser,
        'isHalf' : isHalf,
        'title' : title,
        'location' : location,
        'campus' : campus,
        'type' : type,
        'sponsor' : sponsor,
        'content' : content,
        'societies_' : societies_,
        'teacher' : teacher,
        'deadline' : deadline,
        'startDateTime' : startDateTime,
        'endDateTime' : endDateTime,
        'maxTime' : maxTime,
        'totalNumber' : totalNumber,
        'activity' : activity,
        'societiesList' : societiesList,
        'teachersList' : teachersList,
        'zhuhaiNumber' : zhuhaiNumber,
        'northNumber' : northNumber,
        'eastNumber' : eastNumber,
        'southNumber' : southNumber,
        'zhuhaiTotalNumber' : zhuhaiTotalNumber,
        'northTotalNumber' : northTotalNumber,
        'eastTotalNumber' : eastTotalNumber,
        'southTotalNumber' : southTotalNumber,
        'tables' : tables,
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def assignViewer(request):
    if request.user.first_name == 'teacher' or request.user.first_name == 'committee':
        return HttpResponseRedirect('/activity/examine/')
    elif request.user.first_name == 'student':
        return HttpResponseRedirect('/activity/waiting/')
    else:
        raise Http404()

def getAvailableLocation(request):
    startTime = request.GET.get("startTime", None)
    endTime = request.GET.get("endTime", None)
    campus = request.GET.get("campus", "zhuhai")
    type = request.GET.get("type", "classroom")
    try:
        startTime = datetime.datetime.strptime(startTime, "%Y-%m-%d %H:%M:%S")
        endTime = datetime.datetime.strptime(endTime, "%Y-%m-%d %H:%M:%S")
        if startTime > endTime:
            return HttpResponse("开始时间不能晚于结束时间")
    except:
        print "EEEEEEEEEEEEEEEerror time format "
        return HttpResponse("时间格式不正确")
    locations = AvailableLocation(startTime, endTime, campus, type)
   
    return HttpResponse(json.dumps(locations))

def AvailableLocation(startTime, endTime, campus, type):
    print startTime
    print endTime
    delta = datetime.timedelta(hours = 8) 
    
    locations = Location.objects.filter(campus = campus, type = type, visible = True)
    locationList = []
    endTime = endTime - delta
    startTime = startTime - delta
    for location in locations:
        flag = True
        if location.multiple == True:
            locationList.append({"name": location.name, "locationid": location.locationid, "id": location.id})
            continue
        for submission in location.submission.all():
            subStartTime = submission.startTime.replace(tzinfo=None)
            subEndTime = submission.endTime.replace(tzinfo=None)
            if (startTime == subStartTime or endTime == subStartTime) and submission.activity.status == "success":
                flag = False
                print "1111111111111111111"
                continue
            elif (startTime >= subStartTime and startTime < subEndTime) and submission.activity.status == "success":
                flag = False
                print "2222222222222222222"
                continue
            elif (endTime > subStartTime and endTime <= subEndTime) and submission.activity.status == "success":
                flag = False
                print "3333333333333333333"
                continue
            elif (subStartTime >= startTime and subStartTime <= endTime) and submission.activity.status == "success":
                flag = False
                print "444444444444444444"
                continue
            elif (subEndTime >= startTime and subEndTime <= endTime) and submission.activity.status == "success":
                flag = False
                print "55555555555555555"
                continue
        if flag == True:
            locationList.append({"name": location.name, "locationid": location.locationid, "id": location.id})

    # print "!!!!!!!!!!"
    # for l in locationList:
    #     print l["name"].decode("utf8") + str(l["locationid"])

    return locationList

def getAvailableNumber(request):
    startTime = request.GET.get("startTime", None)
    endTime = request.GET.get("endTime", None)
    campus = request.GET.get("campus", "zhuhai")
    try:
        startTime = datetime.datetime.strptime(startTime, "%Y-%m-%d %H:%M:%S")
        endTime = datetime.datetime.strptime(endTime, "%Y-%m-%d %H:%M:%S")
        if startTime > endTime:
            print "EEEEEEEEEEEEEEEEEEEEEEEEEEerror"
            return HttpResponse("开始时间不能晚于结束时间")
    except:
        return HttpResponse("时间格式不正确")
    result = AvailableNumber(startTime, endTime, campus)

    return HttpResponse(json.dumps(result))

def AvailableNumber(startTime, endTime, campus):
    print campus   
    print startTime, "|", endTime 
    number = Number.objects.get(campus = campus)
    limit = LimitNumber.objects.get(campus = campus)
    limit = {"desk": limit.desk, "beachDesk": limit.beachDesk, "tent": limit.tent}
    number = {"desk": number.desk, "beachDesk": number.beachDesk, "tent": number.tent}
    temp = number.copy()
    delta = datetime.timedelta(hours = 8) 
    
    submission = Submission.objects.filter(activity__campus = campus, type = "chair", activity__status = "success", hasReturned = False)
   
    submission = submission.exclude(endTime__lt = startTime).exclude(startTime__gt = endTime)
    for sub in submission:
        # print sub.activity.id
        temp["desk"] -= sub.number
        temp["beachDesk"] -= sub.chairNumber
        temp["tent"] -= sub.tentNumber
    if temp["desk"] < 0:
        temp["desk"] = 0
    if temp["beachDesk"] < 0:
        temp["beachDesk"] = 0
    if temp["tent"] < 0:
        temp["temt"] = 0
    print "%%%%%%%%%%%%%%"
    
    return {"total": number, "available": temp, "limit": limit}

# ------------------------ all end ---------------------------
