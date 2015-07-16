# -*- coding: utf-8 -*-
from django import forms

class WorksOrNewsForm(forms.Form):
    title = forms.CharField(max_length = 32)
    content = forms.CharField(widget = forms.Textarea)
    article = forms.CharField(max_length = 16)