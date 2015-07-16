$(document).ready(function(){
    
    //人工筛选
    $(".man").click(function(){
        var dom = $(this);
        if ($(this).siblings('.machine').hasClass('selected')) {
            alerts("请先取消机器筛选状态");
            return;
        }
        if ($(this).hasClass("selected")) {
            return;
        }
        waitStart();
        var activityID = $(this).parent().attr("data-activityid");
        var studentID = $(this).parent().attr("data-manid");
        $.post('/student/select/',
        {
            'registrantID' : studentID,
            'activityID' : activityID,
        }, function(data) {
            if (!data['success']) {
                alerts(data['message']);
            } else {
                dom.siblings().removeClass("selected");
                dom.addClass("selected");
            }
            waitStop();
        }, 'json')
        
    })

    $(".cancel").click(function(){
        waitStart();
        if ($(this).hasClass("selected")) {
            return;
        }
        var activityID = $(this).parent().attr("data-activityid");
        var studentID = $(this).parent().attr("data-manid");
        var dom = $(this);
        $.post('/student/cancel/',
        {
            'registrantID' : studentID,
            'activityID' : activityID,
        }, function(data) {
            if (!data['success']) {
                alerts(data['message']);
            } else {
                dom.siblings().removeClass("selected");
                dom.addClass("selected");
            }
            waitStop();
        }, 'json')
        
    })
    $(".machine-selected").click(function() {
        waitStart();
        var dom = $(this);
        $.post('/student/machine/', {
            'activityID' : dom.attr('data-aid'),
        }, function(data) {
            if (data['success']) {
                for (var i = 0; i < data['students'].length; i++) {
                    var select = $('#registrant' + data['students'][i].netid).find('.machine');
                    select.siblings().removeClass("selected");
                    select.addClass("selected");
                }
                alerts('筛选成功');
            } else {
                alerts('操作有误');
            }
            waitStop();
        }, 'json');
        
    });

    //确定
    $("#confirm button").click(function(){
        waitStart();
        var name = $(this).attr("name");
        var activityID = $('.confirm').first().attr('data-aid');
        if (name == "sure") {
            $.post('/student/confirm/',
                {
                    'activityID' : activityID,
                }, function(data) {
                    if (data['success']) {
                        alerts('已确认参加活动人选,具体通知已发送到报名者邮箱');
                    } else {
                        alerts(data['message']);
                    }
                    waitStop();
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
            var activityID = $('.confirm').first().attr('data-aid');
            $.post('/student/send/',
                {
                    'content' : content,
                    'activityID' : activityID,
                    'title' : '活动通知'
                }, function(data) {
                    if (data['success']) {
                        $('.announcementText').find('textarea').val('');
                        alerts("您的通知已经成功发送到报名者的邮箱！");
                    }
                    else {
                        alerts(data['message']);
                    }
                    waitStop();
                }, 'json')
        }
        
    })
});