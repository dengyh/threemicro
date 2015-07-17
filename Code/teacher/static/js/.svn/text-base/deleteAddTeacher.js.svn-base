$(document).ready(function(){
    var flag = true;
    $("#submit").click(function(){
        waitStart();
        if ($(".name input").val() == "" || $(".num input").val() == "" ||
            $(".password input").val() == ""){
            alerts("输入信息有误！");
            return false;
        }
        if (flag) {
            alerts("增加成功！");
            waitStop();
            return true;
        }
    }); //增加老师
    $('.num input').blur(function() {
        waitStart();
        $.post('/committee/check/teacher/', {
            'username' : $(".num input").val(),
        }, function(data) {
            if (data['success'] == false) {
                alerts(data['message']);
                flag = false;
            } else {
                flag = true;
            }
            waitStop();
        }, 'json');
    });
});