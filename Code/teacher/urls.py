from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('activity.views',
    url(r'^pass/$', 'examineActivity'), # for PC ajax
    url(r'^detail/(\d+)/$', 'showActivityDetail', {'templateName' : 'tActivityDetail.html'}),
    )

urlpatterns += patterns('teacher.views',
    url(r'^$', 'showTeacherPage', {'templateName' : 'teacherPage.html'}),
    url(r'^assess/$', 'showAssessView', {'templateName' : 'assessActivity.html'}),
    url(r'^withdraw/$', 'withdrawActivity', {'templateName' : 'selfPassActivity.html'}),
    url(r'^checkout/$', 'showCheckoutView', {'templateName' : 'checkOutActivity.html'}),
    url(r'^half/$', 'halfAssessActivity', {'templateName' : 'halfPassActivity.html'}),
    url(r'^password/$', 'changePassword'), # for ajax
    url(r'^change/$', 'changeTeacherInformation'), # for ajax
    )
