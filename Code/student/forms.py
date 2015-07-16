# -*- coding: utf-8 -*-
from django import forms

class ActivityForm(forms.Form):
    type = forms.CharField(max_length = 32)
    maxTime = forms.FloatField(required = False)
    totalNumber = forms.IntegerField(required = False)
    title = forms.CharField(max_length = 64)
    location = forms.CharField(max_length = 64)
    sponsor = forms.CharField(max_length = 32)
    campus = forms.CharField(max_length = 16)
    societies = forms.CharField(max_length = 16)
    teacher = forms.CharField(max_length = 32)
    deadline = forms.DateTimeField(required = False)
    content = forms.CharField(widget = forms.Textarea)
    