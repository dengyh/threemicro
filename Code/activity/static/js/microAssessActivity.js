$(document).ready(function(){
    activity("waitToAssess");
    $(".passAssess a").css("color","#aeaea9");
    $(".waitToAssess a").css("color","#6bb070");
    $(".personAssessList").css("display","none");
    $(".assess a").click(function(){
        var name= $(this).prop("name");
        if (name == "waitToAssess") {
            $(this).css("color","#6bb070");
            $(".passAssess a").css("color","#aeaea9");
            $(".personAssess a").css("color","#aeaea9");
            $(".personAssessList").css("display","none");
            activity("waitToAssess");
        }
        else if (name == "passAssess"){
            $(this).css("color","#6bb070");
            $(".waitToAssess a").css("color","#aeaea9");
            $(".personAssess a").css("color","#aeaea9");
            $(".personAssessList").css("display","none");
            activity("passAssess");
        }
        else if (name == "personAssess"){
            $(this).css("color","#6bb070");
            $(".waitToAssess a").css("color","#aeaea9");
            $(".passAssess a").css("color","#aeaea9");
            $(".personAssessList").css("display","block");
            activity("personAssess");
        }
    })
    $("button").click(function(){
        var data = $(this).attr('data-id');
        if ($(this).attr("data-name") == "pass") {
            postInfo('/activity/pass/',data,'success','审批通过');//通过
        }
        else{
            postInfo('/activity/pass/',data,'faild','审批不通过');//不通过

        }
        $(this).parent().parent().remove();
    })
    function postInfo(address,id,state,mes){
        $.post(address,
        {
            'activityID' : id,
            'status' : state,
        }, function(data) {
            var result = JSON.parse(data);
            if (result['success']) {
                alert(mes);
            }
        });
    }
    function activity(temp){
        $(".itemBox").each(function(target){
                if ($(this).attr("data-name") == temp) {
                    $(this).show();
                }
                else {
                    $(this).hide();
                }
        })
    }
});