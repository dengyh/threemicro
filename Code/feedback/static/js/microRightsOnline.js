$(document).ready(function(){
	$(".tip").click(function(){
		$(this).css("display","none");
	})
	$("form").submit(function(){
		if ($("#user input").val() == "" || !check_email($("#email input").val()) ||
			!check_tel($("#tel input").val()) || $("#content input").val() == "") {
			$(".tip").css("display","block");
			return false;
		}
		alerts("您已经成功提交，感谢您！")
		return true;
	})
	function check_email($email) {
 		var search_str = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if(!search_str.test($email)){
		  return false;
		}
		return true;
	}
	function check_tel($tel) {
		if ($tel.length != 11) {
			return false;
		}
		for (i = 0; i < $tel.length; i++) {
			if ($tel[i] < '0' || $tel[i] > '9')
				return false;
		}
		return true;
	}
});