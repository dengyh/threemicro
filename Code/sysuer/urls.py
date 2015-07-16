from django.conf.urls import patterns, include, url
from sysuer.views import *

urlpatterns = patterns('',
    url(r'^hello/$', index),
    url(r'^login/$', loginView),
    url(r'^logout/$', logoutView),
)
