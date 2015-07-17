$(document).ready(function(){
    $('#signUp').click(function() {
        var activityID = $(this).attr('data-id');
        var temp = $(this);
        $.post('/activity/sign/',
        {
            'activityID' : activityID,
        }, function(data) {
            alert(data['message']);
            if(data['success']) {
                $(".signIn").css("display","none");
                $(".signOut").css("display","block");
            }
        }, 'json')
    });
    $('#cancelSigning').click(function() {
        var activityID = $(this).attr('data-id');
        $.post('/activity/cancel/',
        {
            'activityID' : activityID,
        }, function(data) {
            if(data['success']) {
                alert(data['message']);
                $(".signIn").css("display","block");
                $(".signOut").css("display","none");
            }
        }, 'json')
    });
});