$(document).ready(function(){
    $(".onekey a").click(function(){
        var name = $(this).prop("name");
        var activityID = $(this).attr("data-aid");
        if (name == "onekeyToSignIn") {
            oneKeyPostInfo("/activity/allSignIn/",activityID );//一键签到
        }
        if (name == "onekeyToSignOut") {
            oneKeyPostInfo("/activity/allSignOut/",activityID );//一键签退
        }
    })
    $(".signingBtn a").click(function(){
        var name = $(this).prop("name");
        var studentID = $(this).attr("data-id");
        var activityID = $(this).parents().attr("data-aid");
        if (name == "signIn") {
            postInfo("/activity/signIn/",studentID,activityID,"signIn");//签到
        }
        else {
            postInfo("/activity/signOut/",studentID,activityID,"signOut");//签退
        }
    })
    function oneKeyPostInfo(address,activityID){
        $.post(address,
        {
            'activityID' : activityID,
        }, function(data) {
            if(data['success']) {
                alert("一键签到成功");
            } else {
                alert(data['message']);
            }
        }, 'json')
    }
    function postInfo(address,registrantID,activityID,way){
        $.post(address,
        {
            'activityID' : activityID,
            'registrantID' : registrantID,
        }, function(data) {
            if(data['success']) {
                alert("签到成功");
            } else {
                alert(data['message']);
            }
        }, 'json')
    }
});