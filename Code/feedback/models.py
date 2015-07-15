# -*- coding: utf-8 -*-
from django.db import models

# Create your models here.

class Feedback(models.Model):
    netid = models.CharField(max_length = 16, null = True, blank = True)
    content = models.TextField()
    datetime = models.DateTimeField(auto_now_add = True)
    campus = models.CharField(max_length = 16, choices = (
        ('south', u'南校区'),
        ('east', u'东校区'),
        ('north', u'北校区'),
        ('zhuhai', u'珠海校区'),
        ))
    name = models.CharField(max_length = 16)
    phone = models.CharField(max_length = 16)
    email = models.EmailField()
    type = models.CharField(max_length = 64, null = True, blank = True)
    reply = models.TextField(null = True, blank = True)
    isFinish = models.BooleanField(default = False)
    isOpen = models.BooleanField(default = True)

    def __unicode__(self):
        return u'feedback of ' + self.campus

    class Meta:
        verbose_name = u'反馈'
        verbose_name_plural = u'反馈'