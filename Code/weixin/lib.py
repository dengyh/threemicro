# -*- coding: utf8 -*-
import time
import urllib
import urllib2
import hashlib
import sys
import json
from weixin.values import *
from xml.etree import ElementTree
from wp00001.models import *

def xmlParse(data):
    request = ElementTree.fromstring(data)
    xml = {}
    xml['ToUserName'] = request.find('ToUserName').text
    xml['FromUserName'] = request.find('FromUserName').text
    xml['MsgType'] = request.find('MsgType').text
    if xml['MsgType'] == 'event':
        xml['Event'] = request.find('Event').text
        return dueEvent(xml, request)
    if xml['MsgType'] == 'text':
        xml['Content'] = request.find('Content').text
        return dueText(xml, request)
    else:
        return ''

def dueEvent(xml, request):
    if xml['Event'] == 'subscribe':
        return subscribe(xml)
    elif xml['Event'] == 'unsubscribe':
        unsubscribe(xml)
    elif xml['Event'] == 'CLICK':
        return click(xml, request)
    else:
        response = res % (xml['FromUserName'], xml['ToUserName'], str(int(time.time())), 'Exception!')
        return response

def subscribe(xml):
    response = res % (xml['FromUserName'], xml['ToUserName'], str(int(time.time())), welcomeMsg)
    return response

def unsubscribe(xml):
    pass

def dueText(xml, request):
    if xml['Content'] == '演唱会':
        showTitle = '【节目单】90周年校庆--校友音乐作品及校园歌曲演唱会（四校区）巡回演出'
        showDescription = '中山大学90周年校庆--校友音乐作品及校园歌曲演唱会（四校区）巡回演出节目单。技术支持: 中山大学Zeta团队'
        showPicUrl = 'http://mmbiz.qpic.cn/mmbiz/FVexWA9icicj0DDvbNvvpYoUGwmsc1ss03B7ugMQzmWTPmwT50MSSpJI2ticdKcgkMWKq2XPwGsuBJdGnnC6ONzlQ/640?tp=webp'
        showPicUrl = 'http://swgc.sysu.edu.cn/weixin/images/show.jpg'
        showUrl = 'http://mp.weixin.qq.com/s?__biz=MzA5NjQzMTUxMA==&mid=202944131&idx=1&sn=bab665a4bd8c3df31d0c7267a5226fc1#rd'
        showArticle = article % (showTitle,showDescription,showPicUrl,showUrl)
        response = generalArticle % (xml['FromUserName'], xml['ToUserName'], str(int(time.time())),'1',showArticle)
        return response
    elif xml['Content'] == '交响音乐会':
        showTitle = '庆祝孙中山先生创办中山大学90周年交响音乐会节目单'
        showDescription = '中山大学90周年校庆--校友音乐作品及校园歌曲演唱会（四校区）巡回演出节目单。技术支持: 中山大学Zeta团队'
        showPicUrl = 'http://mmbiz.qpic.cn/mmbiz/FVexWA9icicj0MCkUUBamqia1TgNQFGeEFFC3kPuU4BNibvKfXcGLtlpXVyS6YoLY3BM8o6GlicOB4QNuLH5RlKicmUQ/640?tp=webp'
        showPicUrl = 'http://swgc.sysu.edu.cn/weixin/images/music90.jpg'
        showUrl = 'http://mp.weixin.qq.com/s?__biz=MzA5NjQzMTUxMA==&mid=203005134&idx=1&sn=6d4ee61460e90fa8af62a5eca9342f8c#rd'
        showArticle = article % (showTitle,showDescription,showPicUrl,showUrl)
        response = generalArticle % (xml['FromUserName'], xml['ToUserName'], str(int(time.time())),'1',showArticle)
        return response
    elif xml['Content'] == '美国IUPUI' or xml['Content'] == '美国iupui':
        showTitle = '美国2014IUPUI音乐团演出节目单'
        showDescription = '美国2014IUPUI音乐团演出节目单。技术支持: 中山大学Zeta团队'
        showPicUrl = 'http://mmbiz.qpic.cn/mmbiz/FVexWA9icicj0MCkUUBamqia1TgNQFGeEFFbce3X0Iibk8NADeBjXficK9eMr3yozGpic5l68514kjjSY0SMrBYH7kfA/640?tp=webp'
        showPicUrl = 'http://swgc.sysu.edu.cn/weixin/images/IUPUI.jpg'
        showUrl = 'http://mp.weixin.qq.com/s?__biz=MzA5NjQzMTUxMA==&mid=202997482&idx=1&sn=b4a7a201947a199d31a446bd5498ee77#rd'
        showArticle = article % (showTitle,showDescription,showPicUrl,showUrl)
        response = generalArticle % (xml['FromUserName'], xml['ToUserName'], str(int(time.time())),'1',showArticle)
        return response
    else:
        return ''

def click(xml, request):
    xml['EventKey'] = request.find('EventKey').text
    if xml['EventKey'] == keyOfNews:
        postsId = Term_relationships.objects.using('qnsk').filter(term_taxonomy_id = 35)
        newsTitle = []
        newsTime = []
        newsUrl = []
        for postId in postsId:
            post = Posts.objects.using('qnsk').get(ID = postId.object_id)
            newsTitle.append(post.post_title)
            newsTime.append(post.post_date)
            newsUrl.append(repr(post.ID))
        newsInfo = []
        maxLen = len(newsTitle)
        for i in range(maxLen):
            newsInfo.append({'newsTitle' : newsTitle[i], 'newsTime' : newsTime[i], 'newsUrl' : newsUrl[i],})
        newsInfo.sort(key = lambda x:x['newsTime'], reverse = True)
        articleStr = firstarticle
        for i in range(4):
            articleStr += article % (newsInfo[i]['newsTitle'], '', '', 'swgc.sysu.edu.cn/news/micro/activity/detail/' + newsInfo[i]['newsUrl'] + '/')
        response = jump % (xml['FromUserName'], xml['ToUserName'], str(int(time.time())), articleStr)
        return response

    elif xml['EventKey'] == keyOfLookBack:
        postsId = Term_relationships.objects.using('qnsk').filter(term_taxonomy_id = 26)
        newsTitle = []
        newsTime = []
        newsUrl = []
        for postId in postsId:
            post = Posts.objects.using('qnsk').get(ID = postId.object_id)
            newsTitle.append(post.post_title)
            newsTime.append(post.post_date)
            newsUrl.append(repr(post.ID))
        newsInfo = []
        maxLen = len(newsTitle)
        for i in range(maxLen):
            newsInfo.append({'newsTitle' : newsTitle[i], 'newsTime' : newsTime[i], 'newsUrl' : newsUrl[i],})
        newsInfo.sort(key = lambda x:x['newsTime'], reverse = True)
        articleStr = firstarticle
        for i in range(4):
            articleStr += article % (newsInfo[i]['newsTitle'], '', '', 'swgc.sysu.edu.cn/news/micro/school/detail/' + newsInfo[i]['newsUrl'] + '/')
        response = jump % (xml['FromUserName'], xml['ToUserName'], str(int(time.time())), articleStr)
        return response
    else:
        pass

def getAccessToken():
    accessTokenUrl = accessTokenAPI % (APPID, APPSECRET)
    accessTokenRequest = urllib2.Request(accessTokenUrl)
    accessTokenResponse = urllib2.urlopen(accessTokenRequest).read()
    accessToken = (json.loads(accessTokenResponse))['access_token']
    return accessToken

def createMenu():
    accessToken = getAccessToken()
    data = '''{"button" : [
                        {
                         "type" : "view",
                         "name" : "wsq,
                         "url" : "%s"
                         },
                        {
                         "name" : "wgy",
                         "sub_button" : [
                                         {
                                          "type" : "click",
                                          "name" : "xyxw",
                                          "key":"news"
                                          },
                                         {
                                          "type" : "click",
                                          "name" : "hdtz",
                                          "key":"lookback"
                                          }]
                         },
                         {
                         "name" : "wfw",
                         "sub_button" : [
                                         {
                                          "type" : "view",
                                          "name" : "wgy",
                                          "url" : "%s"
                                          },
                                          {
                                          "type" : "view",
                                          "name" : "qyzx",
                                          "url" : "%s"
                                          },
                                          {
                                          "type" : "view",
                                          "name" : "tcdl",
                                          "url" : "%s"
                                          }]
                         }]
            }''' % ("http://swgc.sysu.edu.cn/activity/microApply/", "http://swgc.sysu.edu.cn/activity/student/", "http://swgc.sysu.edu.cn/feedback/", "http://swgc.sysu.edu.cn/logout/")
    createMenuUrl = createMenuAPI % accessToken
    request = urllib2.Request(url = createMenuUrl, data = data)
    response = urllib2.urlopen(request)
    return response.read()

def deleteMenu():
    accessToken = getAccessToken()
    deleteMenuUrl = deleteMenuAPI % accessToken
    response = urllib2.urlopen(deleteMenuUrl)
    return response.read()
