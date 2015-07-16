$(document).ready(function(){

	$(document).on("click", "a[data-href]", function(){
		var href = $(this).attr("data-href");
		waitStart(href);
		
		// waitStop();
	})
})