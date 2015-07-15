from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('feedback.views',
    url(r'^$', 'getFeedback', {'templateName' : 'microRightsOnline.html'}),
    url(r'^success/$', 'feedbackSuccess', {'templateName' : 'feedbackSuccess.html'}),
    )
