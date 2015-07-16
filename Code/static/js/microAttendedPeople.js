$(document).ready(function(){
	$(".onekey a").click(function(){
		var name = $(this).prop("name");
		var id = $(this).parent().parent().attr("data-id");
		if (name == "onekeyToSignIn") {
			oneKeyPostInfo("/activity/oneKeyToSignIn/",id);//一键签到
		}
		if (name == "onekeyToSignOut") {
			oneKeyPostInfo("/activity/oneKeyToSignOut/",id);//一键签退
		}
	})
	$(".signingBtn a").click(function(){
		var name = $(this).prop("name");
		var id = $(this).parent().attr("data-id");
		if (name == "signIn") {
			postInfo("/activity/signInActivity/",id);//签到
		}
		else {
			postInfo("/activity/signOutActivity/",id);//签退
		}
	})

	//确认结束
    $(".confirmEnd").click(function(){
        var data = $(this).attr('data-aid');
        $.post('/activity/comfirm/',
        {
            'activityID' : data,
        }, function(data) {
            if(data['success']) {
                alert("活动已经结束");
            }
            else {
                alert(data['message']);
            }
        }, 'json')
    })
    
	function oneKeyPostInfo(address,activityID){
		$.post(address,
        {
            'activityID' : activityID,
        }, function(data) {
            if(data['success']) {
            	alert("成功");
            }
        }, 'json')
	}
	function postInfo(address,registrantID){
		$.post(address,
        {
            'registrantID' : registrantID,
        }, function(data) {
            if(data['success']) {
            	alert("成功");
            }
        }, 'json')
	}
});