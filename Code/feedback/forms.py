# -*- coding: utf-8 -*-
from django import forms

class FeedbackForm(forms.Form):
    content = forms.CharField(widget = forms.Textarea)
    campus = forms.ChoiceField(choices = (
        ('south', u'南校区'),
        ('east', u'东校区'),
        ('north', u'北校区'),
        ('zhuhai', u'珠海校区'),
        ))
    name = forms.CharField(max_length = 16)
    phone = forms.CharField(max_length = 16)
    email = forms.EmailField()

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        for item in phone:
            if item > '9' or item < '0':
                raise forms.ValidationError('There is word in phone')
        return phone