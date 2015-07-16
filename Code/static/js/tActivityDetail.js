 $(document).ready(function(){

    //禁用右键
    $(document).bind("contextmenu",function(e){   
          return false;   
    });

    //标记和取消的窗口显示
    var currentTarget;
    $("span[data-flag],td[data-flag]").mousedown(function(e){
        var pointX = e.pageX;
        var pointY = e.pageY;
        var which = e.which;
        currentTarget = $(this);
        if (which == 3) {
            $('.rejectedBox').animate({
                'margin-left':pointX,
                'margin-top':pointY,
            },100).fadeIn();
        }
        else if(which == 1) {
            $('.rejectedBox').fadeOut();
        }
        
    })

    //标记
    $(".rejectedBox>.mark").click(function(){
        var o = currentTarget;
        if (o) {
            o.addClass('tag')
            .attr('data-flag','false');
        }
    })
    //取消
    $(".rejectedBox>.unmark").click(function(){
        var o = currentTarget;
        if (o) {
            o.removeClass('tag')
            .attr('data-flag','true');
        }
    })
    $(".operation button").click(function(){
        var data = $(this).attr('data-id');
        if ($("#remark").val() == "") {
            alerts("评论区不能为空！")
            return;
        }
        $(this).parent().children("a").get(0).click();
        $(".choice").attr("data-id",data);
        $(".choice").attr("data-object",$(this).parent().parent().attr("id"));
        if ($(this).attr("data-name") == "pass") {
            $(".choice").attr("name","pass");
        }
        else if ($(this).attr("data-name") == "unpass"){
            $(".choice").attr("name","unpass");
        }
        else if ($(this).attr("data-name") == "halfPass") {
            $(".choice").attr("name","halfPass");
        }
        else if ($(this).attr('data-name') == 'cancel') {
            $('.choice').attr('name','cancel');
        }
    })
    $("#confirm button").click(function(){
        var name = $(this).attr("name");
        var mark = [];
        var submissionMark = [];
        var attachmentMark = [];
        if (name == "sure") {
            var data = $('.choice').attr("data-id");
            if ($(".choice").attr("name") == "pass") {
                postInfo('/activity/pass/',data,'success','审批通过', $("#remark").val(), mark);//通过
            }
            else if ($(".choice").attr("name") == "unpass") {
                
                //一般信息栏
                $("span[data-flag=false]").each(function(){
                    var target = $(this).attr('data-class');
                    //mark[target] = "false";
                    if ($(this).attr('data-flag') == "false")
                        mark.push(target);
                })
                //submission
                $(".submission tr").each(function(i){
                    var temp = [];
                    
                    if (i != 0){
                        var id = $(this).attr('data-id');
                        temp.push(id);
                        var td = $(this).children('td');
                        var flag = false;
                        for (var i = 0; i < td.length; i++) {
                            if (td.eq(i).attr('data-flag') == "false") {
                                temp.push(td.eq(i).attr('data-class'));
                                flag = true;
                            }
                        }
                        if (flag)
                            submissionMark.push(temp);
                    }

                })
                // attachment
                $(".attachment tr").each(function(i){
                    var temp = [];
                    
                    if (i != 0){
                        var id = $(this).attr('data-id');
                        temp.push(id);
                        var td = $(this).children('td');
                        var flag = false;
                        for (var i = 0; i < td.length; i++) {

                            if (td.eq(i).attr('data-flag') == "false") {
                                temp.push(td.eq(i).attr('data-class'));
                                flag = true;
                            }
                        }
                        if (flag)
                            attachmentMark.push(temp);
                    }
                })
                mark.push(submissionMark)
                mark.push(attachmentMark)
                postInfo('/activity/pass/',data,'faild','审批不通过', $("#remark").val(), mark);//不通过
            }
            else if ($(".choice").attr("name") == "halfPass") {
                postInfo('/activity/pass/',data,'halfPass','预审批', $("#remark").val(), mark);//预审批
            }
            else if ($('.choice').attr('name') == 'cancel') {
                postInfo('/activity/pass/',data,'faild','审批不通过', $('#remark').val(), mark);
            }
            var id = '#' + $(".choice").attr("data-object");
            if (id != "undefined") {
                $(id).after("<a href='/teacher/assess/'>跳转...3s自动跳转回审批页面</a>")
                $(id).remove();
                jump("/teacher/assess/");
            }
        }      
    })
    function postInfo(address,id,state,mes,remark,mark){
        waitStart();
        $.post(address,
        {
            'activityID' : id,
            'status' : state,
            'remark' : remark,
            'mark' : mark
        }, function(data) {
            var result = JSON.parse(data);
            if (result['success']) {
                alerts(mes);
            } else {
                alerts(result['message']);
            }
            waitStop();
        });
        
    }
    function jump(front){
        setTimeout(function(){
            waitStart();
            location.href=front;
        },4000)
    }

});