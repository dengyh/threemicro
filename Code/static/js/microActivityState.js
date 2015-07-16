$(document).ready(function(){
    var top = 0;
    var bottom = 0;
    $(".state span").each(function(){
        if ($(this).html() == "失败")  {
            $(this).removeClass().addClass("failed");
        }
        if ($(this).html() == "成功") {
            $(this).removeClass().addClass("success");
        }
        if ($(this).html() != "失败" && $(this).html() != "成功"){
            $(this).removeClass().addClass("waiting");
        }
    })
    // $(document).on("scrollstart",function(){
    //     var temp = $(".innerDiv").scrollTop();
    //     top = temp;
    // });
    // $(document).on("scrollstop",function(){
    //     var temp = $(".innerDiv").scrollTop();
    //     bottom = temp;
    //     alert(bottom - top)
    //     if (top - bottom < 0) {
    //         $(".innerDiv").animate($(".innerDiv").scrollTop($(".innerDiv").scrollTop() + bottom - top), 10);
    //         // setTimeout($(".innerDiv").scrollTop(bottom + (bottom - top)/2/2), 2000);
    //         // setTimeout($(".innerDiv").scrollTop(bottom + (bottom - top)/2/2), 3000);
    //     }
    //     if (top - bottom > 0) {
    //         setTimeout($(this).scrollTop(),30);
    //         setTimeout($(this).scrollTop(temp - 5), 3);
    //     }
    // });
});