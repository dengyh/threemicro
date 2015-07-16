$(document).ready(function(){
	$('.confirm').click(function(){
		var id = $(this).parents('.indexSonTitle').attr('data-id');
		var url = '/committee/makeReturned/';
		returnTheChair(id,url);
	})
	function returnTheChair(id,url){
        // waitStart();
        $.post(url,
        {
            'submissionID' : id,
        }, function(data) {
            if(data['success']) {
                alerts(data['message']);
            } else {
                alerts(data['message']);
            }
            location.reload();
            // waitStop();
        }, 'json')
        
    };
})