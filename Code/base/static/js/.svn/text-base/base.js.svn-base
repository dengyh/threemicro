var base = {
    resizeTimer : null,
    rotate : 0,
    query : false
}
window.onload=function(){
    $('.topBack').css('height',$('.topPart').height());
}

$(window).resize(function() {
    if (base.resizeTimer) clearTimeout(base.resizeTimer);
    base.resizeTimer = setTimeout("$('.topBack').css('height',$('.topPart').height())");
});

// 初始化性别和年级
$('#modifyMes select').each(function() {
    var value = $(this).attr('data-value');
    $(this).find('option').each(function() {
        if ($(this).val() == value) {
            $(this).attr('selected', 'selected');
        }
    });
});

//修改个人信息.学生
$("#studentChange").submit(function() {
    var name = $(this).find('input[name="name"]').val();
    var sex = $(this).find('.sex option:checked').val();
    var num = $(this).find('input[name="sno"]').val();
    var grade = $(this).find('.grade option:checked').val();
    var phone = $(this).find('input[name="phone"]').val();
    var email = $(this).find('input[name="email"]').val();
    var college = $(this).find('input[name="college"]').val();

    if (!string(name) || !string(sex) || !string(num) || !string(grade) ||
        !string(phone) || !string(email) || !string(college)) {
        alerts('不能为空!');
        return false;
    }
    else {
        $.post('/student/change/', {
            'name' : name,
            'gender' : sex,
            'sno' : num,
            'grade' : grade,
            'phone' : phone,
            'email' : email,
            'college' : college,
        }, function(data) {
            if (data['success']) {
                alerts('修改成功');
            } else {
                alerts('修改失败');
            }
        }, 'json');
        return false;
    }
});

//修改个人信息.老师
$('#teacherChange').submit(function() {
    var sex = $(this).find('.sex option:checked').val();
    var work = $(this).find('input[name="work"]').val();
    var wageNumber = $(this).find('input[name="wageNumber"]').val();
    var phone = $(this).find('input[name="phone"]').val();
    var email = $(this).find('input[name="email"]').val();
    var name = $(this).find('input[name="name"]').val();
    if (!string(name) || !string(sex) || !string(work) || !string(wageNumber) ||
        !string(phone) || !string(email)) {
        alerts('不能为空!');
        return false;
    }
    else {
        $.post('/teacher/change/', {
            'gender' : sex,
            'work' : work,
            'wageNumber' : wageNumber,
            'phone' : phone,
            'email' : email,
            'name' : name,
        }, function(data) {
            if (data['success']) {
                alerts('修改成功');
            } else {
                alerts('修改失败');
            }
        }, 'json');
        return false;
    }
});

//修改个人信息.团委
$('#tuanWeiChange').submit(function() {
    var wageNumber = $(this).find('input[name="wageNumber"]').val();
    var phone = $(this).find('input[name="phone"]').val();
    var email = $(this).find('input[name="email"]').val();
    var name = $(this).find('input[name="name"]').val();
    if (!string(name) || !string(wageNumber) || !string(phone) || !string(email)) {
        alerts("不能为空!");
        return false;
    }
    else {
        $.post('/committee/change/', {
            'wageNumber' : wageNumber,
            'phone' : phone,
            'email' : email,
            'name' : name,
        }, function(data) {
            if (data['success']) {
                alerts('修改成功');
            } else {
                alerts('修改失败');
            }
        }, 'json');
        return false;
    }
});

//修改个人信息.管理
$('#guanLiChange').submit(function() {
    var wageNumber = $(this).find('input[name="wageNumber"]').val();
    var phone = $(this).find('input[name="phone"]').val();
    var email = $(this).find('input[name="email"]').val();
    var name = $(this).find('input[name="name"]').val();
    $.post("/principal/change/", {
        'wageNumber' : wageNumber,
        'phone' : phone,
        'email' : email,
        'name' : name,
    }, function(data) {
        if (data['success']) {
            alerts('修改成功');
        } else {
            alerts('修改失败');
        }
    }, 'json');
    return false;
});

//修改密码
$('#change-password').submit(function() {
    var inputOld = $(this).find('input[name="oldPassword"]');
    var inputNew1 = $(this).find('input[name="newPassword1"]');
    var inputNew2 = $(this).find('input[name="newPassword2"]');
    var old = inputOld.val();
    var new1 = inputNew1.val();
    var new2 = inputNew2.val();
    if (!(string(old) || string(new1) || string(new2))) {
        alerts('不能为空!');
        return false;
    }
    else if (new1 != new2) {
        alerts('新密码不一致!');
        return false;
    }
    else {
        $.post('/teacher/password/', {
            'oldPassword' : old,
            'newPassword' : new1,
        }, function(data) {
            if (data['success']) {
                alerts('修改成功');
                inputOld.val("");
                inputNew1.val("");
                inputNew2.val("");
            } else {
                alerts(data['message']);
            }
        }, 'json');
        return false;
    }
});

/*所有模块公用部分*/

//导航栏滚动条监测事件
$(window).scroll(function(){
    setTimeout(function(){
        if ($(this).scrollTop() < 20) {
            $('.navbar-inverse').animate({'padding-top':10, 'padding-bottom':10},500);
        } else {
            $('.navbar-inverse').animate({padding:0},500);
        }
    },550)
    
})

//alerts窗口
function alerts(temp){
    $("#alert p").html(temp);
    $(".alert").click();
}

//字符串内容非空判断
function string(temp){
    return temp.length != 0;
}

//判断数字
function number(temp){
    return !isNaN(Number(temp)) && temp != "";
}

//判断时间
function time(temp){
    //格式要求为 2014-5-5 14:30
    var reg = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))(\s(([01]\d{1})|(2[0123])):([0-5]\d))?$/;
    return reg.test(temp);
}

//加载等待
$(document).on('click', 'a[data-href]', function(){
    var href = $(this).attr('data-href');
    waitStart(href);
})

function waitStart(){
    var href = arguments[0];
    $('.wait').css('display','block');
    $('.waitContainer').fadeIn();
    count = 0;
    base.rotate = setInterval(function(){
        count += 3;
        count %= 360;
        $('.waitContainer').css('transform','rotate('+count+'deg)');
    },10)
    
    setTimeout(function(){
        if(href != undefined) {
            var reg = new RegExp("(page=)(\\d+)");
            if (reg.test(href)) {
                if (location.href.indexOf("?") == -1) {
                    href = '?' + href;
                    location.href=href;
                }
                else {
                    if (reg.test(location.href))
                        location.href = location.href.replace(reg, href);
                    else
                        location.href += '&' + href;
                }
            }
            else {
                location.href=href;
            }
            waitStop();
        }
        
    },500);
}
function waitStop(){
    setTimeout(function(){
        $('.wait').css('display','none');
    },1000);
}
//申请时间排序
$(".searchBox .applyTime a").click(function(){
    var order = $(this).attr("class");
    if (order == "acend") {
        location.href = "?orderBy=-signDateTime"
    }
    else if (order == "decend") {
        location.href = "?orderBy=signDateTime"
    }
})
//审批时间排序
$(".searchBox .accessTime a").click(function(){
    var order = $(this).attr("class");
    if (order == "acend") {
        location.href = "?orderBy=-id"
    }
    else if (order == "decend") {
        location.href = "?orderBy=id"
    }
})