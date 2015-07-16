# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Principal(models.Model):
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
        ('all', u'四校区'),
        ))

    def __unicode__(self):
        return self.get_campus_display() + u'权益在线负责人'

    class Meta:
        verbose_name = u'权益在线负责人'
        verbose_name_plural = u'权益在线负责人'