from django.http import HttpResponse
import lib

def wechat(request):
    if request.method == 'GET':
        echostr = request.GET['echostr']
        return HttpResponse(echostr)
    response = lib.xmlParse(request.raw_post_data)
    return HttpResponse(response)

def createMenu(request):
    return HttpResponse(lib.createMenu())

def deleteMenu(request):
    return HttpResponse(lib.deleteMenu())

def test(request):
    return HttpResponse("hello world!")
