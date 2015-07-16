$(document).ready(function(){
    
    $('#signUp').bind('click', signUp);
    $('#cancelSigning').bind('click', cancelSigning);
    $(".activityItem > dt > button").bind("click", modify);
    $("#cancel").bind("click",modify);

    function cancelSigning(){
        waitStart();
        var activityID = $(this).attr('data-id');
        $.post('/activity/cancel/',
        {
            'activityID' : activityID,
        }, function(data) {
            if(data['success']) {
                alerts(data['message']);
                $(".signIn").css("display","block");
                $(".signOut").css("display","none");
            } else {
                alerts(data['message']);
            }
            waitStop();
        }, 'json')
        
    };

    function signUp(){
        waitStart();
        var activityID = $(this).attr('data-id');
        var temp = $(this);
        $.post('/activity/sign/',
        {
            'activityID' : activityID,
        }, function(data) {
            if(data['success']) {
                $(".signIn").css("display","none");
                $(".signOut").css("display","block");
            } else {
                alerts(data['message']);
            }
            waitStop();
        }, 'json')
    };

    function modify(){
        $(".activityItem").slideToggle();
        $(".modifyActivity").slideToggle();
        loadingMove();
    }

});