from django.conf.urls import patterns, include, url
from django.views.generic import TemplateView

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', TemplateView.as_view(template_name = 'index.html')),
    url(r'^student/404/$', TemplateView.as_view(template_name = 'microStudent404.html')),
    url(r'^teacher/404/$', TemplateView.as_view(template_name = 'microTeacher404.html')),
    )