from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('activity.views',
    # for student
    # url(r'^$', 'showActivities', {'templateName' : 'activities.html'}),
    url(r'^student/$', 'showActivityIndex', {'templateName' : 'microStudent.html'}),
    url(r'^waiting/$', 'showWaitingActivity', {'templateName' : 'microActivityState.html'}),
    url(r'^complete/$', 'getCompleteActivities', {'templateName' : 'microPersonalGain.html'}), # for ajax
    url(r'^registing/$', 'getRegistingActivities', {'templateName' : 'microAttendedActivity.html'}), # for ajax
    url(r'^applied/$', 'getAppliedActivities', {'templateName' : 'microApplyedActivity.html'}),
    url(r'^campus/$', 'getCampus', {'templateName' : 'microLatestActivity.html'}),
    url(r'^campus/(\w+)/$', 'getOneCampusActivity', {'templateName' : 'microCampusActivity.html'}),
    url(r'^campus/complete/(\w+)/$', 'getOneCampusCompleteActivity', {'templateName': 'microCampusActivity.html'}),
    url(r'^registrants/(\d+)/$', 'showActivityRegistrant', {'templateName' : 'microAttendedPeople.html'}),
    url(r'^sign/$', 'signActivity'), # for ajax
    url(r'^signIn/$', 'signInActivity'), # for ajax
    url(r'^signOut/$', 'signOutActivity'), # for ajax
    url(r'^allSignIn/$', 'oneKeyToSignIn'), # for ajax
    url(r'^allSignOut/$', 'oneKeyToSignOut'), # for ajax
    url(r'^comfirm/$', 'comfirmActivityEnd'), # for ajax
    url(r'^cancel/$', 'cancelSignActivity'), # for ajax
    url(r'^getAvailableLocation/$', 'getAvailableLocation'), # for ajax
    url(r'^getAvailableNumber/$', 'getAvailableNumber'), # for ajax

    # for teacher and committee
    url(r'^examine/$', 'showMicroApplying', {'templateName' : 'microAssessActivity.html'}),
    url(r'^pass/$', 'examineActivity'), # for ajax

    # for all
    url(r'^microApply/$', 'assignViewer'),
    url(r'^sdetail/(\d+)/$', 'showActivityDetail', {'templateName' : 'microActivityDetail.html'}),
    url(r'^tdetail/(\d+)/$', 'showActivityDetail', {'templateName' : 'microActivityDetailTeacher.html'}),
    )
