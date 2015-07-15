from django.conf.urls import patterns, include, url

urlpatterns = patterns('activityNews.views',
    url(r'^school/$', 'showSchoolNews', {'templateName' : 'indexActivity.html'}),
    url(r'^activity/$', 'showActivityNews', {'templateName' : 'indexActivity.html'}),
    url(r'^(\w+)/detail/(\S+)/$', 'showDetail', {'templateName' : 'indexActivityDetail.html'}),
    url(r'^micro/school/$', 'showSchoolNews', {'templateName' : 'microTrends.html'}),
    url(r'^micro/activity/$', 'showActivityNews', {'templateName' : 'microTrends.html'}),
    url(r'^micro/(\w+)/detail/(\S+)/$', 'showDetail', {'templateName' : 'microTrendsDetail.html'}),
)
