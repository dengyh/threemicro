from django.conf.urls import patterns, include, url
import settings
import xadmin

xadmin.autodiscover()

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    url(r'', include('sysuer.urls')),
    url(r'', include('base.urls')),
    url(r'^activity/', include('activity.urls')),
    url(r'^teacher/', include('teacher.urls')),
    url(r'^committee/', include('committee.urls')),
    url(r'^feedback/', include('feedback.urls')),
    url(r'^principal/', include('principal.urls')),
    url(r'^student/', include('student.urls')),
    url(r'^weixin/', include('weixin.urls')),
    url(r'^news/', include('activityNews.urls')),
    url(r'^xadmin/', include(xadmin.site.urls)),
    url(r'^(?P<path>.*)$', 'django.views.static.serve', {
        'document_root' : settings.PROJECT_PATH
        }),
    )
