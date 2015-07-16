# coding: UTF-8
res = '<xml><ToUserName><![CDATA[%s]]></ToUserName>' +\
        '<FromUserName><![CDATA[%s]]></FromUserName>' +\
        '<CreateTime>%s</CreateTime>' +\
        '<MsgType><![CDATA[text]]></MsgType>' +\
        '<Content><![CDATA[%s]]></Content>' +\
        '<FuncFlag>0</FuncFlag></xml>'
jump = '<xml><ToUserName><![CDATA[%s]]></ToUserName>' +\
       '<FromUserName><![CDATA[%s]]></FromUserName>' +\
       '<CreateTime>%s</CreateTime>' +\
       '<MsgType><![CDATA[news]]></MsgType>' +\
       '<ArticleCount>5</ArticleCount>' +\
       '<Articles>%s</Articles>' +\
       '</xml>'
generalArticle = '<xml><ToUserName><![CDATA[%s]]></ToUserName>' +\
       '<FromUserName><![CDATA[%s]]></FromUserName>' +\
       '<CreateTime>%s</CreateTime>' +\
       '<MsgType><![CDATA[news]]></MsgType>' +\
       '<ArticleCount>%s</ArticleCount>' +\
       '<Articles>%s</Articles>' +\
       '</xml>'
article = '<item> '+\
          '<Title><![CDATA[%s]]></Title>' +\
          '<Description><![CDATA[%s]]></Description>' +\
          '<PicUrl><![CDATA[%s]]></PicUrl>' +\
          '<Url><![CDATA[%s]]></Url>' +\
          '</item>'
firstarticle = '<item> '+\
          '<Title><![CDATA[]]></Title>' +\
          '<Description><![CDATA[]]></Description>' +\
          '<PicUrl><![CDATA[http://imgsrc.baidu.com/forum/w%3D580/sign=bee9624c6d061d957d4637304bf50a5d/ce984d66d0160924bcf0b96fd70735fae7cd3455.jpg]]></PicUrl>' +\
          '<Url><![CDATA[swgc.sysu.edu.cn]]></Url>' +\
          '</item>'

welcomeMsg = '以团而聚，聚之以青年兮，聚之以思想矣，欢迎关注中山大学团委！\n\n\
/玫瑰你是一个动人的故事，讲了许多年。千百个梦里总把校园当家园，让我们一起，重回时光，再听一次，属于我们的歌！\n\n\
/强回复“交响音乐会”，可阅读“庆祝孙中山先生创办中山大学90周年交响音乐会节目单”\n\n\
/强回复“演唱会”，可阅读“中山大学90周年校庆--校友音乐作品及校园歌曲演唱会（四校区）巡回演出节目单“\n\n\
/强回复”美国IUPUI“，可阅读”美国2014IUPUI音乐团演出节目单“\n\n\
/爱心更多精彩，尽在中山大学团委！'

showMsg = 'Oh yeh'

APPID = 'wxc66a9e7bf5e17833'
APPSECRET ='424dd38f5a084c2f989912a4ded1c895'
keyOfNews = 'xyxw'
keyOfLookBack = 'lookback'
accessTokenAPI = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s'
createMenuAPI = 'https://api.weixin.qq.com/cgi-bin/menu/create?access_token=%s'
deleteMenuAPI = 'https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=%s'
microRequestUrl = 'www.baidu.com'
publicGoodUrl = 'www.baidu.com'
complainUrl = 'www.baidu.com'
