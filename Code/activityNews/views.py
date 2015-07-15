# -*- coding: utf-8 -*-
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.shortcuts import render_to_response
from django.template import RequestContext
from wp00001.models import *
import datetime

def showSchoolNews(request, templateName):
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
    newsInfo = newsInfo[:10]
    return render_to_response(templateName, {
        'newsInfo' : newsInfo,
        'type' : 'school',
        'title' : '新闻资讯',
        }, context_instance = RequestContext(request))

def showActivityNews(request, templateName):
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
    newsInfo = newsInfo[:10]
    return render_to_response(templateName, {
        'newsInfo' : newsInfo,
        'type' : 'activity',
        'title' : '活动资讯',
        }, context_instance = RequestContext(request))


def showDetail(request, type, postId, templateName):
    postId = str(int(long(postId)))
    post = Posts.objects.using('qnsk').get(ID = postId)
    title = post.post_title
    content = post.post_content
    time = post.post_date
    authorId = post.post_author
    author = Users.objects.using('qnsk').get(ID = authorId)
    authorName = author.display_name
    return render_to_response(templateName, {
        'title' : title,
        'content' : content,
        'time' : time,
        'authorName' : authorName,
        'type' : type,
        }, context_instance = RequestContext(request))
