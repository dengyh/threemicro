$(document).ready(function(){
    $('.feedback').click(function() {
        waitStart();
        var feedbackID = $(this).attr('data-id');
        var content = $('#feedbackContent').val();
        if (content == '') {
            alerts('回复不能为空');
        } else {
            $.post('/principal/reply/', {
                'feedbackID' : feedbackID,
                'content' : content,
            }, function(data) {
                if (data['success']) {
                    alerts('回复成功');
                } else {
                    alerts(data['message']);
                }
                waitStop();
            }, 'json');
        }
    });
});