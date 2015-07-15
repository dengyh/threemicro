# -*- coding: utf-8 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response

from django.contrib.auth.models import User
from feedback.models import Feedback
from feedback.forms import FeedbackForm

from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt

from django.template import RequestContext

def getFeedback(request, templateName):
    if request.method == 'POST':
        form = FeedbackForm(request.POST)
        if form.is_valid():
            clean = form.cleaned_data
            if request.user.is_authenticated():
                no = request.user.last_name
            else:
                no = '匿名'
            Feedback.objects.create(
                netid = no,
                content = clean['content'],
                campus = clean['campus'],
                name = clean['name'],
                phone = clean['phone'],
                email = clean['email'],
                )
        else:
            print form.errors
            return HttpResponseRedirect('/feedback/')
    else:
        form = FeedbackForm()
    return render_to_response(templateName, {
        'form' : form,
        }, context_instance = RequestContext(request))

def feedbackSuccess(request, templateName):
    return render_to_response(templateName)