# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Committee(models.Model):
    user = models.OneToOneField(User)
    name = models.CharField(max_length = 32, null = True, blank = True)
    email = models.EmailField(null = True, blank = True)
    phone = models.CharField(max_length = 16, null = True, blank = True)
    wageNumber = models.CharField(max_length = 32, null = True, blank = True)
    campus = models.CharField(max_length = 16, choices = (
        ('south', u'南校区'),
        ('east', u'东校区'),
        ('north', u'北校区'),
        ('zhuhai', u'珠海校区'),
        ))

    def __unicode__(self):
        return self.get_campus_display() + '团委'

    class Meta:
        verbose_name = u'团委'
        verbose_name_plural = u'团委'

class Teacher(models.Model):
    tno = models.CharField(max_length = 16, primary_key = True)
    name = models.CharField(max_length = 32)
    email = models.EmailField(null = True, blank = True)
    phone = models.CharField(max_length = 16, null = True, blank = True)
    gender = models.CharField(max_length = 8, null = True, blank = True,
        choices = (
            ('male', u'男'),
            ('female', u'女'),
        ))
    work = models.CharField(max_length = 64, null = True, blank = True)
    wageNumber = models.CharField(max_length = 32, null = True, blank = True)
    user = models.OneToOneField(User)
    isActive = models.BooleanField(default = True)
    committee = models.ForeignKey(Committee)

    def __unicode__(self):
        return 'Teacher Name : ' + self.name

    class Meta:
        verbose_name = u'业务指导老师'
        verbose_name_plural = u'业务指导老师'


class Societies(models.Model):
    name = models.CharField(max_length = 64)
    committee = models.ForeignKey(Committee)
    teachers = models.ManyToManyField(Teacher)

    def __unicode__(self):
        return self.name + '(' + self.committee.get_campus_display() + ')'

    class Meta:
        verbose_name = u'社团'
        verbose_name_plural = u'社团'

class TableSet(models.Model):
    description = models.CharField(max_length = 256)
    committee = models.ForeignKey(Committee)
    file = models.FileField(upload_to = 'tables')

    def __unicode__(self):
        return self.committee.get_campus_display() + self.description

    class Meta:
        verbose_name = u'申请表'
        verbose_name_plural = u'申请表'
