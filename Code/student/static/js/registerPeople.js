$(document).ready(function(){
    
    $(".onekey a").click(function(){
        var name = $(this).prop("name");
        var activityID = $(this).attr("data-aid");
        if (name == "onekeyToSignIn") {
            oneKeyPostInfo("/activity/allSignIn/", activityID, "in");//一键签到
        }
        if (name == "onekeyToSignOut") {
            oneKeyPostInfo("/activity/allSignOut/", activityID, "out");//一键签退
        }
    })

    $(".signingBtn a").click(function(){
        var name = $(this).prop("name");
        var studentID = $(this).attr("data-id");
        var activityID = $(this).parents().attr("data-aid");
        if (name == "signIn") {
            postInfo("/activity/signIn/",studentID,activityID, "in");//签到
        }
        else {
            postInfo("/activity/signOut/",studentID,activityID, "out");//签退
        }
    })

    //确认结束
    $(".confirmEnd").click(function(){
        var data = $(this).attr('data-aid');
        $(".choice").attr("data-id",data);
        $(".choice").attr("data-object",$(this).parent().parent().attr("id"));
        $(this).parent().children("a").get(0).click();
    })
    $("#confirm button").click(function(){
        var name = $(this).attr("name");
        if (name == "sure") {
            var data = $(".choice").attr("data-id");
            $.post('/activity/comfirm/',
            {
                'activityID' : data,
            }, function(data) {
                if(data['success']) {
                    alerts("活动已经结束");
                }
                else {
                    alerts(data['message']);
                }
            }, 'json')
        }      
    })

    //通知
    $(".announcement").click(function(){
        $(".announcementText").slideToggle();
    })
    //内容发送
    $(document).on("click",".announcementText button",function(){
        
        var content = $(this).parent().prev().val();
        if (content == ''){
            alerts("内容不能为空!");
        }

        else {
            waitStart();
            var activityID = $('.announcement').attr('data-aid');
            $.post('/student/send/',
                {
                    'content' : content,
                    'activityID' : activityID,
                    'title' : '活动通知'
                }, function(data) {
                    if (data['success']) {
                        $('.announcementText').find('textarea').val('');
                        alerts("您的通知已经成功发送到参与人员的邮箱！");
                    }
                    else {
                        alerts(data['message']);
                    }
                    waitStop();
                }, 'json')
        }
        
    })

    function oneKeyPostInfo(address, activityID, way){
        waitStart();
        $.post(address,
        {
            'activityID' : activityID,
        }, function(data) {
            if(data['success']) {
                if (way == 'in') {
                    alerts("一键签到成功");
                } else {
                    alerts("一键签退成功");
                }
            } else {
                alerts(data['message']);
            }
            waitStop();
        }, 'json')
        
    }

    function postInfo(address,registrantID,activityID,way){
        waitStart();
        $.post(address,
        {
            'activityID' : activityID,
            'registrantID' : registrantID,
        }, function(data) {
            if(data['success']) {
                if (way == 'in') {
                    alerts("签到成功");
                } else {
                    alerts("签退成功");
                }
            } else {
                alerts(data['message']);
            }
            waitStop();
        }, 'json')
        
    }
});