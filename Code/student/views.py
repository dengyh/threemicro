# -*- coding: utf-8 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response

from django.contrib.auth.models import User
from student.models import Student
from activity.models import Activity, Registrant, Submission, Attachment, Number, Location
from student.forms import ActivityForm
from committee.models import Committee, Societies, TableSet, Teacher
from principal.models import Principal

from base.processor import *

from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt

from django.template import RequestContext

import json
import datetime
import smtplib
import re
import os.path
import settings
from email.MIMEText import MIMEText

import sys  
reload(sys)  
sys.setdefaultencoding('utf8')  


def checkStudent(request):
    if request.user.first_name == 'teacher':
        return HttpResponseRedirect('/teacher/')
    if request.user.first_name == 'committee':
        return HttpResponseRedirect('/committee/')
    if request.user.first_name == 'principal':
        return HttpResponseRedirect('/principal/')

@login_required
def showStudentPage(request, templateName):
    checkStudent(request)
    print getInformation(request)
    return render_to_response(templateName, {
        }, context_instance = RequestContext(request, processors = [getInformation]))

@login_required
def applyNewActivity(request, templateName):
    checkStudent(request)
    committee = Committee.objects.get(campus = 'zhuhai')
    societies = Societies.objects.filter(committee = committee)
    tables = TableSet.objects.filter(committee = committee)

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

    if tables:
        firstTable = tables[0].file.url
    else:
        firstTable = '#'
    if societies:
        teachers = Teacher.objects.filter(isActive = True,
            societies = societies[0])
    else:
        teachers = None
    return render_to_response(templateName, {
        'teachers' : teachers,
        'societies' : societies,
        'tables' : tables,
        'firstTable' : firstTable,
        'zhuhaiNumber' : zhuhaiNumber,
        'northNumber' : northNumber,
        'eastNumber' : eastNumber,
        'southNumber' : southNumber,
        'zhuhaiTotalNumber' : zhuhaiTotalNumber,
        'northTotalNumber' : northTotalNumber,
        'eastTotalNumber' : eastTotalNumber,
        'southTotalNumber' : southTotalNumber,
        }, context_instance = RequestContext(request, processors = [getInformation]))


@login_required
def createActivity(request):
    if request.method == 'POST':
        form = ActivityForm(request.POST)
        academicType = request.POST.get("academicKind", "")
        detailType = ""
        if academicType == "other":
            detailType = request.POST.get("detailKind", "")
        if form.is_valid():
            clean = form.cleaned_data
            student = Student.objects.get(netid = request.user.username)
            content = clean['content'].replace('../', '').replace('media/upload/', '/media/upload/')
            try:
                time = int(float(clean['maxTime']) * 3600)
            except:
                time = 0
            activity = Activity.objects.create(
                title = clean['title'],
                location = clean['location'],
                campus = clean['campus'],
                sponsor = clean['sponsor'],
                content = content,
                student = student,
                type = clean['type'],
                maxTime = time,
                teacher = Teacher.objects.get(tno = clean['teacher']),
                societies = Societies.objects.get(id = clean['societies']),
                totalNumber = clean['totalNumber'],
                deadline = clean['deadline'],
                startDateTime = request.POST.get('startDateTime', None),
                endDateTime = request.POST.get('endDateTime', None),
                academicType = academicType,
                detailType = detailType,
                )

            attachmentCount = 1
            attachment = request.FILES.get('attachment-' + str(attachmentCount) + '-file', None)
            while attachment:
                description = request.POST.get('attachment-' + str(attachmentCount) + '-description')
                if description:
                    fileType = attachment.name.split('.').pop()
                    attachment.name = datetime.datetime.now().strftime('%Y%m%d%H%M%S') + "attachment." + fileType
                    Attachment.objects.create(
                        file = attachment,
                        description= description,
                        activity = activity
                        )
                    attachmentCount += 1
                    attachment = request.FILES.get('attachment-' + str(attachmentCount) + '-file', None)

            submission = 1
            submissionType = request.POST.get('submission-' + str(submission) + '-type', None)
            while submissionType:
                file = request.FILES.get('submission-' + str(submission) + '-file', None)
                startTime = request.POST.get('submission-' + str(submission) + '-start', None)
                endTime = request.POST.get('submission-' + str(submission) + '-end', None)
                location = request.POST.getlist('submission-' + str(submission) + '-location', [])
                number = request.POST.get('submission-' + str(submission) + '-numberDesk', None)
                chairNumber = request.POST.get('submission-' + str(submission) + '-numberBeachDesk', None)
                tentNumber = request.POST.get('submission-' + str(submission) + '-numberTent', None)
                otherNumber = request.POST.get('submission-' + str(submission) + '-other', None)
                if not number:
                    number = 0
                if not chairNumber:
                    chairNumber = 0
                if not tentNumber:
                    tentNumber = 0
                if not otherNumber:
                    otherNumber = '无'
                fileType = file.name.split('.').pop()
                file.name = datetime.datetime.now().strftime('%Y%m%d%H%M%S') + submissionType + '.' + fileType
                newSubmission = Submission.objects.create(
                    file = file,
                    activity = activity,
                    type = submissionType,
                    startTime = startTime,
                    endTime = endTime,
                    location = location,
                    number = int(number),
                    chairNumber = int(chairNumber),
                    tentNumber = int(tentNumber),
                    otherNumber = otherNumber,
                    )
                

                # get the apply locations
                print request.POST
                locationID = request.POST.getlist('submission-' + str(submission) + '-locationList', [])
                print locationID
                print "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
                for id_ in locationID:
                    print "insert location " + str(id_)  + " to submission " + str(newSubmission.id)
                    location_ = Location.objects.get(id = id_)
                    newSubmission.locations.add(Location.objects.get(id = id_))
                    newSubmission.save()


                submission += 1
                submissionType = request.POST.get('submission-' + str(submission) + '-type', None)

            return HttpResponse('提交成功，等待审批')
        else:
            print form.errors
    else:
        form = ActivityForm()
    return HttpResponse('提交失败')

@login_required
def modifyActivity(request):
    if request.method == "POST":
        # get the new value
        activityID = request.POST.get("activityID", None)
        activity = Activity.objects.get(id = activityID)
        title = request.POST.get("title", activity.title)
        location = request.POST.get("location", activity.location)
        campus = request.POST.get("campus", activity.campus)
        type = request.POST.get("type", activity.type)
        sponsor = request.POST.get("sponsor", activity.sponsor)
        content = request.POST.get("content", activity.content)
        content = content.replace('../', '').replace('media/upload/', '/media/upload/')
        societies = request.POST.get("scocieties", activity.societies)
        teacher = request.POST.get("teacher", activity.teacher)
        deadline = request.POST.get("deadline", activity.deadline)
        startDateTime = request.POST.get("startDateTime", activity.startDateTime)
        endDateTime = request.POST.get("endDateTime", activity.endDateTime)
        academicType = request.POST.get("academicKind", activity.academicType)
        detailType = ""
        if academicType == "other":
            detailType = request.POST.get("detailKind", activity.detailType)
        # set the new value
        try:
            Activity.objects.filter(id = activityID).update(
                title = title,
                location = location,
                campus = campus,
                type = type,
                sponsor = sponsor,
                content = content,
                societies = societies,
                teacher = teacher,
                startDateTime = startDateTime,
                endDateTime = endDateTime,
                academicType = academicType,
                detailType = detailType,
                titleMark = True,
                locationMark = True,
                campusMark = True,
                typeMark = True,
                sponsorMark = True,
                contentMark = True,
                societiesMark = True,
                teacherMark = True,
                deadlineMark = True,
                startDateTimeMark = True,
                endDateTimeMark = True,
                academicTypeMark = True,
                detailTypeMark = True,
            )
        except Exception, e:
            print e
            return HttpResponse("修改失败，注意时间是否填写正确")
        try:            
            Activity.objects.filter(id = activityID).update(deadline = deadline)
        except Exception, e:
            if deadline == "" and deadline is not None:
                pass
            else:
                print "deadline :", deadline
                return HttpResponse("修改失败，注意截止时间是否填写正确")

        attachmentCount = Attachment.objects.filter(activity = activity).count() + 1
        attachment = request.FILES.get('attachment-' + str(attachmentCount) + '-file', None)
        while attachment:
            fileType = attachment.name.split('.').pop()
            attachment.name = datetime.datetime.now().strftime('%Y%m%d%H%M%S') + "attachment." + fileType
            Attachment.objects.create(
                file = attachment,
                activity = activity
                )
            attachmentCount += 1
            attachment = request.FILES.get('attachment-' + str(attachmentCount) + '-file', None)

        submission = Submission.objects.filter(activity = activity).count() + 1
        submissionType = request.POST.get('submission-' + str(submission) + '-type', None)
        while submissionType:
            file = request.FILES.get('submission-' + str(submission) + '-file', None)
            startTime = request.POST.get('submission-' + str(submission) + '-start', None)
            endTime = request.POST.get('submission-' + str(submission) + '-end', None)
            location = request.POST.get('submission-' + str(submission) + '-location', None)
            number = request.POST.get('submission-' + str(submission) + '-numberDesk', None)
            chairNumber = request.POST.get('submission-' + str(submission) + '-numberBeachDesk', None)
            tentNumber = request.POST.get('submission-' + str(submission) + '-numberTent', 0)
            otherNumber = request.POST.get('submission-' + str(submission) + '-other', None)
            if not number:
                number = 0
            if not chairNumber:
                chairNumber = 0
            if not otherNumber:
                otherNumber = '无'
            fileType = file.name.split('.').pop()
            file.name = datetime.datetime.now().strftime('%Y%m%d%H%M%S') + submissionType + '.' + fileType
            Submission.objects.create(
                file = file,
                activity = activity,
                type = submissionType,
                startTime = startTime,
                endTime = endTime,
                location = location,
                number = int(number),
                chairNumber = int(chairNumber),
                tentNumber = int(tentNumber),
                otherNumber = otherNumber,
                )
            submission += 1
            submissionType = request.POST.get('submission-' + str(submission) + '-type', None)
        activity.status = "first"
        activity.save()
        return HttpResponse("修改成功，等待审批")
    else:
        return HttpResponse("修改失败")

@login_required
def selectRegistrant(request):
    success = False
    message = ''
    if request.method == 'POST':
        registrantID = request.POST.get('registrantID', None)
        activityID = request.POST.get('activityID', None)
        if registrantID and activityID:
            activity = Activity.objects.get(id = activityID)
            if activity.isReady is False:
                registrant = Registrant.objects.get(id = registrantID)
                if activity.nowNumber < activity.totalNumber:
                    if registrant.isSelected is False:
                        activity.nowNumber += 1
                        activity.save()
                    registrant.isSelected = True
                    registrant.save()
                    success = True
                else:
                    message = '超过可报名'
            else:
                message = '活动人选已经确认'
    return HttpResponse(json.dumps({
        'success' : success,
        'message' : message,
        }))

@login_required
def cancelRegistrant(request):
    success = False
    message = ''
    if request.method == 'POST':
        registrantID = request.POST.get('registrantID', None)
        activityID = request.POST.get('activityID', None)
        if registrantID and activityID:
            activity = Activity.objects.get(id = activityID)
            if activity.isReady is False:
                registrant = Registrant.objects.get(id = registrantID)
                if registrant.isSelected is True or registrant.isMachine is True:
                    registrant.isSelected = False
                    registrant.isMachine = False
                    registrant.save()
                    activity = Activity.objects.get(id = activityID)
                    activity.nowNumber -= 1
                    activity.save()
                success = True
            else:
                message = '已确认参加活动人选'
    return HttpResponse(json.dumps({
        'success' : success,
        'message' : message,
        }))

@login_required
def machineSelect(request):
    success = False
    message = ''
    students = []
    if request.method == 'POST':
        activityID = request.POST.get('activityID', None)
        if activityID:
            activity = Activity.objects.get(id = activityID)
            if activity.isReady is False:
                restNumber = activity.totalNumber - activity.nowNumber
                students = Activity.objects.credit_sort(activity, restNumber)
                success = True
    return HttpResponse(json.dumps({
        'success' : success,
        'students' : students,
        }))

@login_required
def confirmRegistrant(request):
    success = False
    message = ''
    if request.method == 'POST':
        activityID = request.POST.get('activityID', None)
        if activityID:
            activity = Activity.objects.get(id = activityID)
            if activity.isReady is False:
                activity.isReady = True
                activity.save()
                registrants = Registrant.objects.filter(activity = activity)
                passList = []
                faildList = []
                for item in registrants:
                    student = Student.objects.get(netid = item.netid)
                    if item.isSelected or item.isMachine:
                        item.isPass = True
                        item.save()
                        student.registTimes += 1
                        student.save()
                        passList.append(student.email)
                    else:
                        faildList.append(student.email)
                success, message = sendEmail(passList, activity.sponsor,
                    '你已经通过"' +  activity.title + '"的筛选,请准时出席', '活动报名通知')
                success, message = sendEmail(faildList, activity.sponsor,
                    '你未通过"' + activity.title +'"的筛选,如有问题,请联系活动举办方', '活动报名通知')
                message = '已确认参加活动人选'
                success = True
            else:
                message = '你已经确认过参加活动人选'
        else:
            message = '操作失败'
    return HttpResponse(json.dumps({
        'success' : success,
        'message' : message,
        }))

@login_required
def sendEmailToRegistrants(request):
    success = False
    message = ''
    if request.method == 'POST':
        activityID = request.POST.get('activityID', None)
        content = request.POST.get('content', None)
        title = request.POST.get('title', None)
        if activityID and content and title:
            try:
                activity = Activity.objects.get(id = activityID)
                registrants = Registrant.objects.filter(activity = activity)
                emails = []
                for item in registrants:
                    student = Student.objects.get(netid = item.netid)
                    emails.append(student.email)
                success, message = sendEmail(emails, activity.sponsor,
                    content, title)
                success = True
            except:
                message = '发送错误,请重新发送'
    return HttpResponse(json.dumps({
        'success' : success,
        'message' : message,
        }))

def sendEmail(students, sponsor, content, title):
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
        return (True, 'Send email success!')
    except Exception, e:
        return (False, 'Send email faild!')

@login_required
def getTeachersBySocieties(request):
    success = False
    tno = []
    societiesID = request.GET.get('societiesID', None)
    if societiesID:
        try:
            societies = Societies.objects.get(id = societiesID)
        except:
            societies = None
        teachers = Teacher.objects.filter(isActive = True,
            societies = societies)
        for teacher in teachers:
            tno.append({'name' : teacher.name, 'tno' : teacher.tno})
        success = True
    return HttpResponse(json.dumps({
        'tno' : tno,
        'success' : success,
        }))

@login_required
def getSocietiesByCampus(request):
    success = False
    sid = []
    tables = []
    campus = request.GET.get('campus', None)
    if campus:
        try:
            committee = Committee.objects.get(campus = campus)
        except:
            committee = None
        societies = Societies.objects.filter(committee = committee)
        tableSet = TableSet.objects.filter(committee = committee)
        for item in tableSet:
            tables.append({'description' : item.description, 'url' : item.file.url})
        for item in societies:
            sid.append({'name' : item.name, 'sid' : item.id})
        success = True
    return HttpResponse(json.dumps({
        'sid' : sid,
        'tables' : tables,
        'success' : success,
        }))

@login_required
def changeInformation(request):
    checkStudent(request)
    success = False
    student = Student.objects.get(user = request.user)
    if request.method == 'POST':
        name = request.POST.get('name', None)
        phone = request.POST.get('phone', None)
        email = request.POST.get('email', None)
        college = request.POST.get('college', None)
        grade = request.POST.get('grade', None)
        gender = request.POST.get('gender', None)
        sno = request.POST.get('sno', None)
        if name:
            student.name = name
        if phone:
            student.phone = phone
        if email:
            student.email = email
        if college:
            student.college = college
        if grade:
            student.grade = grade
        if gender:
            student.gender = gender
        if sno:
            student.sno = sno
        student.save()
        success = True
    return HttpResponse(json.dumps({
        'success' : success,
        }))

@login_required
def uploadPictures(request):
    if request.method == 'POST':
        files = request.FILES.getlist('pictures')
        path = os.path.join(settings.PROJECT_PATH, 'media/upload/').replace('\\', '/')
        result = ''
        for file in files:
            time = datetime.datetime.now().strftime('%Y%m%d%H%M%S%f')
            fileType = file.name.split('.').pop()
            filename = time + '.' + fileType
            filename = filename.decode('utf-8').encode('utf-8')
            destination = open(path + filename, 'wb+')
            for chunk in file.chunks():
                destination.write(chunk)
            destination.close()
            result += '<p>/media/upload/' + filename + '</p>'
        return HttpResponse(result)
    return HttpResponse('上传失败')

