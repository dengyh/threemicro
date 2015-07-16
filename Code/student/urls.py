from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('student.views',
    url(r'^$', 'showStudentPage', {'templateName' : 'studentPage.html'}),
    url(r'^apply/$', 'applyNewActivity', {'templateName' : 'applyActivity.html'}),
    url(r'^create/$', 'createActivity'), # for ajax
    url(r'^modify/$', 'modifyActivity'), # for ajax
    url(r'^select/$', 'selectRegistrant'), # for ajax
    url(r'^cancel/$', 'cancelRegistrant'), # for ajax
    url(r'^machine/$', 'machineSelect'), # for ajax
    url(r'^confirm/$', 'confirmRegistrant'), # for ajax
    url(r'^teacher/$', 'getTeachersBySocieties'), # for ajax
    url(r'^societies/$', 'getSocietiesByCampus'), # for ajax
    url(r'^change/$', 'changeInformation'), # for ajax
    url(r'^send/$', 'sendEmailToRegistrants'), # for ajax
    url(r'^upload/$', 'uploadPictures'), # for ajax
    )

urlpatterns += patterns('activity.views',
    url(r'^campus/(\w+)/$', 'getOneCampusActivity', {'templateName' : 'signUpActivity.html'}),
    url(r'^registing/$', 'getRegistingActivities', {'templateName' : 'signingActivity.html'}),
    url(r'^applied/$', 'getAppliedActivitiesPC', {'templateName' : 'appliedActivity.html'}),
    url(r'^attended/$', 'getCompleteActivities', {'templateName' : 'attendedActivity.html'}),
    url(r'^detail/(\d+)/$', 'showActivityDetail', {'templateName' : 'activityDetail.html'}),
    url(r'^screen/(\d+)/$', 'showRegistingRegistrant', {'templateName' : 'screenPeople.html'}),
    url(r'^register/(\d+)/$', 'showActivityRegistrant', {'templateName' : 'registerPeople.html'}),
    url(r'^sign/$', 'signActivity'), # for ajax
    url(r'^signIn/$', 'signInActivity'), # for ajax
    url(r'^signOut/$', 'signOutActivity'), # for ajax
    url(r'^allSignIn/$', 'oneKeyToSignIn'), # for ajax
    url(r'^allSignOut/$', 'oneKeyToSignOut'), # for ajax
    url(r'^comfirm/$', 'comfirmActivityEnd'), # for ajax
    url(r'^cancel/$', 'cancelSignActivity'), # for ajax
    )