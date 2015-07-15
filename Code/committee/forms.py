# -*- coding: utf-8 -*-
from django import forms

class TeacherForm(forms.Form):
    tno = forms.CharField(max_length = 16)
    name = forms.CharField(max_length = 32)
    password = forms.CharField(max_length = 256)
