$(document).ready(function(){
	$("button").click(function(){
		var id = $(this).parent().prop("id");
			postInfo("",id);
	})
	function postInfo(address,mes){
		$.post(address,
		{
		 info: mes,
		})
	}
});