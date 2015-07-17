$(document).ready(function(){
    $("button").click(function(){
        var data = $(this).attr('data-id');
        if ($("#remark").val() == "") {
            alert("评论区不能为空！")
            return;
        }
        if ($(this).attr("data-name") == "pass") {
            postInfo('/activity/pass/',data,'success','审批通过',$("#remark").val());//通过
        }
        else if ($(this).attr("data-name") == "unpass"){
            postInfo('/activity/pass/',data,'faild','审批不通过',$("#remark").val());//不通过
        }
        else if ($(this).attr("data-name") == "halfPass") {
            postInfo('/activity/pass/',data,'halfPass','预审批', $("#remark").val());//预审批
        }
        else if ($(this).attr('data-name') == 'cancel') {
            postInfo('/activity/pass/',data,'faild','审批不通过', $('#remark').val());
        }
        $(this).parent().parent().remove();
    })
    function postInfo(address,id,state,mes,remark){
        $.post(address,
        {
            'activityID' : id,
            'status' : state,
            'remark' : remark,
        }, function(data) {
            var result = JSON.parse(data);
            if (result['success']) {
                alert(mes);
            }
        });
    }

});