# -*- coding:UTF-8 -*-
import urllib
import urllib2
import cookielib
import re
def sysuNetid(username, password):
    cj = cookielib.MozillaCookieJar()
    cookieSupport = urllib2.HTTPCookieProcessor(cj)
    opener = urllib2.build_opener(cookieSupport, urllib2.HTTPHandler)
    urllib2.install_opener(opener)
    url = 'https://sso.sysu.edu.cn/cas/login'
    text = urllib2.urlopen(url)  # the first open, I got cookie, lt and execution from this
    cookie =''
    # print text.read()
    try:
        cookie = repr(cj)
        patOfCk = re.compile("value='(.*?)',")
        cookie = 'JSESSIONID=' + patOfCk.search(cookie).group(1)
        # cookie has been got by re
    except:
        pass
    dataDic = getData(text)
    headers = {
        'Host' : 'sso.sysu.edu.cn',
        'User-Agent' : 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:30.0) Gecko/20100101 Firefox/30.0',
        'Referer' : 'https://sso.sysu.edu.cn/cas/login',
        'Content-Type' : 'application/x-www-form-urlencoded',
        'Accept' : 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Language' : 'zh-cn,zh;q=0.8,en-us;q=0.5,en;q=0.3',
        'Connection' : 'keep-alive',
        'Cookie' : cookie,
        'Cache-Control' : 'max-age=0'
        }
    data = {
        'username' : username,   # use you netid
        'password' : password,   # use you password
        'lt' : dataDic['lt'],
        'execution' : dataDic['execution'],
        '_eventId' : dataDic['eventId'],
        'code' : '',
        'submit' : '登录'
        }
    urlData = urllib.urlencode(data)   # the second open, I post the data(include cookie) which were got from the first time
    try:
        req = urllib2.Request(url = url, data = urlData, headers = headers)
        res = urllib2.urlopen(req)
        text = res.read()
    except:
        return ''
    if judge(text):
        try:
            req = urllib2.Request('http://my.sysu.edu.cn/mail2')
            req.add_header('User-Agent', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:30.0) Gecko/20100101 Firefox/30.0')
            res = urllib2.urlopen(req)
            t = res.read()
            if len(t) < 2:
                return username
            else:
                return getName(t)
        except:
            return 'outdate'
    else:
        return ''

def getData(text):
    flag = 0
    lt = ''
    execution = ''
    code = ''
    submit = ''
    patOfLt = re.compile('name=.lt. value=.(.*?)...>')
    patOfExecution = re.compile('name=.execution. value=.(.*?)...>')
    patOfEventId = re.compile('name=._eventId. value=.(.*?)...>')
    for line in text:
        # get lt
        checkLt = patOfLt.search(line)
        if checkLt:
            flag += 1
            lt = checkLt.group(1)
        # get execution
        checkExecution = patOfExecution.search(line)
        if checkExecution:
            flag += 1
            execution = checkExecution.group(1)
        # get _eventId
        checkEventId = patOfEventId.search(line)
        if checkEventId:
            flag += 1
            eventId = checkEventId.group(1)
        # jump judge
        if flag == 3:
            break
    dic = {}
    dic['lt'] = lt  # lt has been got by re
    dic['execution'] = execution  # execution has been got by re
    dic['eventId'] = eventId  # eventId has been got by re
    return dic

def getName(text):
    pat = re.compile('data-controlPanelCategory="my" > <img alt="(.*?)" src=')
    check = pat.search(text)
    if check:
        originName = check.group(1)
        nameList = originName.split(' ')
        name = nameList[1] + nameList[0]
        return name
    else:
        return ''
    
def judge(text):
    pat = re.compile('class=.success.')
    if pat.search(text):
        return True
    else:
        return False
