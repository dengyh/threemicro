$(document).ready(function(){
    
    $(".status").each(function(){
        if ($(this).html() == "失败")  {
            $(this).removeClass("success").removeClass("waiting").addClass("failed");
        }
        else if ($(this).html() == "成功") {
            $(this).removeClass("failed").removeClass("waiting").addClass("success");
        }
        else if ($(this).html() != "失败" && $(this).html() != "成功"){
            $(this).removeClass("success").removeClass("failed").addClass("waiting");
        }
    })

});