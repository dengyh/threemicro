from django.conf.urls import patterns, include, url
from weixin.views import *

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'microsysu.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^wechat/$', wechat),
    url(r'^test/$', test),
    # url(r'^createMenu/$', createMenu),
    # url(r'^deleteMenu/$', deleteMenu),
    url(r'^images/(?P<path>.*)','django.views.static.serve',{'document_root':'/www/web/ThreeMicro/Code/static/images'}),
)
