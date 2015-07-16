from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('principal.views',
    url(r'^$', 'showPrincipalPage', {'templateName' : 'principalPage.html'}),
    url(r'^(rights)/$', 'showFeedback', {'templateName' : 'rightsOnline.html'}),
    url(r'^(finish)/$', 'showFeedback', {'templateName' : 'rightsOnline.html'}),
    url(r'^change/$', 'changePrincipalInformation'), # for ajax
    url(r'^reply/$', 'replyFeedback'), # for ajax
    )

urlpatterns += patterns('activity.views', 
    url(r'^campus/(\w+)/$', 'getOneCampusActivity', {'templateName' : 'campusActivity.html'}),
    url(r'^detail/(\d+)/$', 'showActivityDetail', {'templateName' : 'campusActivityDetail.html'}),
    )
