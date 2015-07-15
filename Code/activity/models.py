# -*- coding: utf-8 -*-
from django.db import models
from committee.models import Teacher, Societies
from student.models import Student

# Create your models here.

class ActivityManager(models.Manager):
    def credit_sort(self, activity, number):
        registrants = Registrant.objects.filter(activity = activity)
        students = []
        sno = []
        for item in registrants:
            if item.isSelected or item.isMachine:
                continue
            student = Student.objects.get(netid = item.netid)
            student.r_id = item.id
            students.append(student)
        sorted(students, key = lambda x : (x.completeTimes * 1.0 / (x.registTimes + 1)), reverse = True)
        for item in students[:min(number, len(students))]:
            registrant = Registrant.objects.get(id = item.r_id)
            registrant.isMachine = True
            registrant.save()
            activity.nowNumber += 1
            sno.append({'name' : item.name, 'netid' : item.netid})
        activity.save()
        return sno

# *Mark的字段表示该字段是否审批通过
class Activity(models.Model):
    title = models.CharField(max_length = 64)
    titleMark = models.BooleanField(default = True)
    location = models.CharField(max_length = 64)
    locationMark = models.BooleanField(default = True)
    status = models.CharField(max_length = 16, default = 'first',
        choices = (
        ('first', u'第一阶段申请'),
        ('second', u'第二阶段申请'),
        ('success', u'成功'),
        ('ready', u'预审批'),
        ('faild', u'失败'),
        ))
    campus = models.CharField(max_length = 16, choices = (
        ('south', u'南校区'),
        ('east', u'东校区'),
        ('north', u'北校区'),
        ('zhuhai', u'珠海校区'),
        ))
    campusMark = models.BooleanField(default = True)
    type = models.CharField(max_length = 16, choices = (
        ('publicWelfare', u'公益活动'),
        ('nonPublicWelfare', u'非公益活动'),
        ('academic', u'学术活动'),
        ('sport', u'体育活动'),
        ('other', u'其它活动'),
        ('classroom', u'课室申请'),
        ('chair', u'桌椅申请'),
        ('poster', u'张贴申请'),
        ('location', u'校区场地申请'),
        ('actionCenter', u'学生活动中心申请'),
        ('functionRoom', u'校团委功能室申请'),
        ))    
    typeMark = models.BooleanField(default = True)
    academicType = models.CharField(max_length = 16, blank = True, null = True, choices = (
        ('technology', u'科技类'),
        ('culture', u'人文类'),
        ('career', u'职场类'),
        ('internationalCommunication', u'国际交流类'),
        ('newsMedia', u'新闻传播类'),
        ('other', u'其他类'),
        ))    
    academicTypeMark = models.BooleanField(default = True)
    detailType = models.CharField(max_length = 16, blank = True, null = True)
    detailTypeMark = models.BooleanField(default = True)
    sponsor = models.CharField(max_length = 32)
    sponsorMark = models.BooleanField(default = True)
    content = models.TextField()
    contentMark = models.BooleanField(default = True)
    student = models.ForeignKey(Student)
    societies = models.ForeignKey(Societies)
    societiesMark = models.BooleanField(default = True)
    teacher = models.ForeignKey(Teacher)
    teacherMark = models.BooleanField(default = True)
    nowNumber = models.IntegerField(default = 0)
    totalNumber = models.IntegerField(default = 0)
    totalNumberMark = models.BooleanField(default = True)
    deadline = models.DateTimeField(null = True, blank = True)
    deadlineMark = models.BooleanField(default = True)
    startDateTime = models.DateTimeField(null = True, blank = True)
    startDateTimeMark = models.BooleanField(default = True)
    endDateTime = models.DateTimeField(null = True, blank = True)
    endDateTimeMark = models.BooleanField(default = True)
    signDateTime = models.DateTimeField(auto_now_add = True)
    maxTime = models.IntegerField(default = 0)
    maxTimeMark = models.BooleanField(default = True)
    isCompleted = models.BooleanField(default = False)
    isReady = models.BooleanField(default = False)
    firstRemark = models.CharField(max_length = 256, null = True, blank = True)
    secondRemark = models.CharField(max_length = 256, null = True, blank = True)
    objects = ActivityManager()

    def __unicode__(self):
        return self.title + '(活动)'

    class Meta:
        verbose_name = u'公益活动'
        verbose_name_plural = u'公益活动'

class Submission(models.Model):
    description = models.CharField(max_length = 32, null = True, blank = True)
    file = models.FileField(upload_to = 'files', null = True, blank = True)
    type = models.CharField(max_length = 16, choices = (
        ('classroom', u'课室申请'),
        ('chair', u'桌椅申请'),
        ('poster', u'张贴申请'),
        ('location', u'校区场地申请'),
        ('actionCenter', u'学生活动中心申请'),
        ('functionRoom', u'校团委功能室申请'),
        ('car', u'大型车辆进出申请'),
        ))
    startTime = models.DateTimeField(null = True, blank = True)
    endTime = models.DateTimeField(null = True, blank = True)
    location = models.CharField(max_length = 64,
        null = True, blank = True)
    locations = models.ManyToManyField("Location", related_name = "submission")
    number = models.IntegerField(default = 0)
    chairNumber = models.IntegerField(default = 0)
    tentNumber = models.IntegerField(default = 0)
    otherNumber = models.CharField(max_length = 256, null = True, blank = True)
    activity = models.ForeignKey(Activity)
    submissionMark = models.BooleanField(default = True)
    startTimeMark = models.BooleanField(default = True)
    endTimeMark = models.BooleanField(default = True)
    locationMark = models.BooleanField(default = True)
    numberMark = models.BooleanField(default = True)
    chairNumberMark = models.BooleanField(default = True)
    tentNumberMark = models.BooleanField(default = True)
    otherNumberMark = models.BooleanField(default = True)
    hasReturned = models.BooleanField(default = False)

    def __unicode__(self):
        return '申请项 : ' + "self.description"

    class Meta:
        verbose_name = u'申请项'
        verbose_name_plural = u'申请项'

class Attachment(models.Model):
    description = models.CharField(max_length = 256, null = True, blank = True)
    file = models.FileField(upload_to = 'files', null = True, blank = True)
    activity = models.ForeignKey(Activity)
    attachmentMark = models.BooleanField(default = True)

    def __unicode__(self):
        return '附件 : ' + self.description

    class Meta:
        verbose_name = u'附件'
        verbose_name_plural = u'附件'

class Registrant(models.Model):
    netid = models.CharField(max_length = 16)
    activity = models.ForeignKey(Activity)
    registTime = models.DateTimeField(auto_now_add = True)
    isPass = models.BooleanField(default = False)
    isSelected = models.BooleanField(default = False) # manual selsect
    isMachine = models.BooleanField(default = False) # machine select
    isCompleted = models.BooleanField(default = False)
    isStarted = models.BooleanField(default = False)
    startTime = models.DateTimeField(blank = True, null = True)
    endTime = models.DateTimeField(blank = True, null = True)
    time = models.IntegerField(default = 0)

    def __unicode__(self):
        return '参与者 : ' + self.netid

    class Meta:
        verbose_name = u'报名者'
        verbose_name_plural = u'报名者'

class Location(models.Model):
    name = models.CharField(max_length = 64)
    locationid = models.IntegerField(default = 0)
    multiple = models.BooleanField(default = False)
    visible = models.BooleanField(default= True)
    campus = models.CharField(max_length = 16, choices = (
        ('south', u'南校区'),
        ('east', u'东校区'),
        ('north', u'北校区'),
        ('zhuhai', u'珠海校区'),
        ))
    type = models.CharField(max_length = 32, choices = (
        ('classroom', u'课室'),
        ('schoolPlace', u'校区场地0'),
        ('poster', u'宣传场地'),
        ('actionCenter', u'学生活动中心'),
        ('functionRoom', u'校团委功能室申请'),
        ('location', u'校区场地'),
        ))

    def __unicode__(self):
        if self.locationid == 0:
            return '地点 : ' + self.name
        else:
            return '地点 : ' + self.name + " 编号：" + str(self.locationid)

    class Meta:
        verbose_name = u'活动地点'
        verbose_name_plural = u'活动地点'

class Occupation(models.Model):
    location = models.ForeignKey(Location)
    activity = models.ForeignKey(Activity)
    startTime = models.DateTimeField()
    endTime = models.DateTimeField()
    isValid = models.BooleanField(default = True)

    def __unicode__(self):
        return self.activity + ' is using ' + self.location + 'from ' + self.startTime + ' to ' + self.endTime

    class Meta:
        verbose_name = u'占用场地'
        verbose_name_plural = u'占用场地'

class Number(models.Model):
    desk = models.IntegerField(default = 0)
    beachDesk = models.IntegerField(default = 0)
    tent = models.IntegerField(default = 0)
    campus = models.CharField(max_length = 10, choices = (
        ('south', u'南校区'),
        ('east', u'东校区'),
        ('north', u'北校区'),
        ('zhuhai', u'珠海校区'),
        ))
    def __unicode__(self):
        return '校区:' + self.get_campus_display() + ' 资源数量'
    class Meta:
        verbose_name = u'资源数量'
        verbose_name_plural = u'资源数量'

class LimitNumber(models.Model):
    desk = models.IntegerField(default = 0)
    beachDesk = models.IntegerField(default = 0)
    tent = models.IntegerField(default = 0)
    campus = models.CharField(max_length = 10, choices = (
        ('south', u'南校区'),
        ('east', u'东校区'),
        ('north', u'北校区'),
        ('zhuhai', u'珠海校区'),
        ))
    def __unicode__(self):
        return '校区:' + self.get_campus_display() + ' 资源申请限制'
    class Meta:
        verbose_name = u'资源申请限制'
        verbose_name_plural = u'资源申请限制'
