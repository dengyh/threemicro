$(document).ready(function(){
	var rate = document.body.scrollWidth/document.body.scrollHeight;
	$('#applied').css('margin-top', 24 + (320 / 533 - rate) * 70 + '%');
	$('#signingUp').css('margin-top', 12 + (320 / 533 - rate) * 70 + '%');
	$('#attended').css('margin-top', 14.5 + (320 / 533 - rate) * 40 + '%');
	$('#latest').css('margin-top', 15 + (320 / 533 - rate) * 70 + '%');
	var resizeTimer = null;
	$(window).resize(function() {
		var rate = document.body.scrollWidth/document.body.scrollHeight;
		$('#applied').css('margin-top', 24 + (320 / 533 - rate) * 70 + '%');
		$('#signingUp').css('margin-top', 12 + (320 / 533 - rate) * 70 + '%');
		$('#attended').css('margin-top', 14.5 + (320 / 533 - rate) * 40 + '%');
		$('#latest').css('margin-top', 15 + (320 / 533 - rate) * 70 + '%');
	    if (resizeTimer) clearTimeout(resizeTimer);
	    resizeTimer = setTimeout("$('html').css('font-size',document.body.scrollWidth / 320 * 11  + 'px');", 50);
	});
});
