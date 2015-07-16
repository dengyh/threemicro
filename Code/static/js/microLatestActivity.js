$(document).ready(function(){
	var x = 1;
	$(".vertical").css("height","0rem");
	// $(".Campus").css("display","none");
	// $(".campus").css("display","none");
	// $(".pass").css("display","none");
	// $(".unpass").css("display","none");
	$("#unpassActivity").prop("name","close");
	$("#unpassActivity").click(function(){
		var temp = $(".activity a button").attr("id");
		if (x == 1) {
			x = 0;
		if ($(this).prop("name") == "open") {
			disappear(this,temp);
		}
		else {
			appear(this,temp);
		}
	}
	})
	$(".activity button").click(function(){
		if ($(this).html() == "未截止") {
			$(this).html("截止");
			$(this).attr("id","pass");
			change($(this).attr("id"));
		}
		else {
			$(this).html("未截止");
			$(this).attr("id","unpass");
			change($(this).attr("id"));
		}
	})

	function appear(temp, id){
		change(id);
		$(".activity .campus").fadeIn();
		$(".activity .Campus").fadeIn();
		$(".vertical").animate({height:"80%"},400);
        $(temp).prop("name","open");
        setTimeout(function(){	
        	$("."+id+" .Campus").fadeIn();
			$("."+id+" .campus").fadeIn();
		},200);
		setTimeout(function(){
			x = 1;
    	},400);
	}
	function disappear(temp, id){
		if (id == "pass") {
			$(".pass").css("display","none");
			$(".unpass").css("display","none");
			$(".pass .campus").fadeOut();
			$(".pass .Campus").fadeOut();
		}
		else {
			$(".pass").css("display","none");
			$(".unpass").css("display","none");
			$(".unpass .campus").fadeOut();
			$(".unpass .Campus").fadeOut();
		}
		$("."+id).css("display","block");
    	$("."+id+" .Campus").fadeOut();
		$("."+id+" .campus").fadeOut();
		$(".activity .campus").fadeOut();
		$(".activity .Campus").fadeOut();
		$(".vertical").animate({height:"0px"},400);
		$(temp).prop("name","close");
		setTimeout(function(){
        	x = 1;
    	},400);
	}
	function change(temp){
		if (temp == "pass") {
			$(".pass").css("display","block");
			$(".pass .campus").fadeIn();
			$(".pass .Campus").fadeIn();
			$(".unpass").css("display","none");
			$(".unpass .campus").fadeOut();
			$(".unpass .Campus").fadeOut();

		}
		else {
			$(".unpass").css("display","block");
			$(".unpass .campus").fadeIn();
			$(".unpass .Campus").fadeIn();
			$(".pass").css("display","none");
			$(".pass .campus").fadeOut();
			$(".pass .Campus").fadeOut();
		}
	}
});