# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User
import datetime

# Create your models here.

class Student(models.Model):
    netid = models.CharField(max_length = 16, primary_key = True)
    name = models.CharField(max_length = 32)
    email = models.EmailField(null = True, blank = True)
    phone = models.CharField(max_length = 16, null = True, blank = True)
    college = models.CharField(max_length = 64, null = True, blank = True)
    grade = models.CharField(max_length = 16, null = True, blank = True)
    sno = models.CharField(max_length = 16, null = True, blank = True)
    gender = models.CharField(max_length = 8, null = True, blank = True,
        choices = (
            ('male', u'男'),
            ('female', u'女'),
        ))
    societies = models.CharField(max_length = 128, null = True, blank = True)
    user = models.OneToOneField(User)
    registTimes = models.IntegerField(default = 0)
    completeTimes = models.IntegerField(default = 0)
    totalTime = models.IntegerField(default = 0)
    lastTime = models.DateTimeField(default = datetime.datetime(2014, 1, 1))
    lastLastTime = models.DateTimeField(default = datetime.datetime(2014, 1, 1))

    def __unicode__(self):
        return 'NetID : ' + self.netid + ', Name : ' + self.name

    class Meta:
        verbose_name = u'学生'
        verbose_name_plural = u'学生'

