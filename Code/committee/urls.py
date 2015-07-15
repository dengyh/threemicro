from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('activity.views',
    url(r'^pass/$', 'examineActivity'), # for PC ajax
    url(r'^detail/(\d+)/$', 'showActivityDetail', {'templateName' : 'tActivityDetail.html'}),
    )

urlpatterns += patterns('committee.views',
    url(r'^create/teacher/$', 'createTeacher', {'templateName' : 'deleteAddTeacher.html'}),
    url(r'^create/societies/$', 'createSocieties', {'templateName' : 'deleteAddSocieties.html'}),
    url(r'^delete/(\S+)/$', 'deleteTeacher'), # for ajax
    url(r'^reSet/(\S+)/$', 'reSetPassword'), # for ajax
    url(r'^change/$', 'changeCommitteeInformation'), # for ajax
    url(r'^check/teacher/$', 'checkCreateTeacher'), # for ajax
    url(r'^export/(\S+)/$', 'exportAsExcel'),
    url(r'^resource/$', 'resource'),
    url(r'^moreApply/$', 'moreApply'),
    url(r'^resourceDetail/$', 'resourceDetail'),
    url(r'^makeReturned/$', 'makeReturned'),
    )

urlpatterns += patterns('teacher.views',
    url(r'^$', 'showTeacherPage', {'templateName' : 'teacherPage.html'}),
    url(r'^assess/$', 'showAssessView', {'templateName' : 'assessActivity.html'}),
    url(r'^withdraw/$', 'withdrawActivity', {'templateName' : 'selfPassActivity.html'}),
    url(r'^half/$', 'halfAssessActivity', {'templateName' : 'halfPassActivity.html'}),
    url(r'^checkout/$', 'showCheckoutView', {'templateName' : 'checkOutActivity.html'}),
    url(r'^password/$', 'changePassword'), # for ajax
    )
