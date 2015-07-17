$(document).ready(function(){
    // $("button").click(function(){
    //     var data = $(this).attr('data-id');
    //     $(".choice").attr("data-id",data);
    //     $(".choice").attr("data-object",$(this).parent().parent().attr("id"));
    //     if ($(this).attr("data-name") == "pass") {
    //         $(".choice").attr("name","pass");
    //     }
    //     else{
    //         $(".choice").attr("name","unpass");
    //     }
    // })
    // $("#confirm button").click(function(){
    //     var name = $(this).attr("name");
    //     if (name == "sure") {
    //         var data = $(".choice").attr("data-id");
    //         alerts(data)
    //         if ($(".choice").attr("name") == "pass") {
    //             postInfo('/activity/pass/',data,'success','审批通过');//通过
    //         }
    //         else {
    //             postInfo('/activity/pass/',data,'faild','审批不通过');//不通过
    //         }
    //         var id = '#' + $(".choice").attr("data-object");
    //         $(id).remove();
    //     }      
    // })
    // function postInfo(address,id,state,mes){
    //     waitStart();
    //     $.post(address,
    //     {
    //         'activityID' : id,
    //         'status' : state,
    //     }, function(data) {
    //         var result = JSON.parse(data);
    //         if (result['success']) {
    //             alerts(mes);
    //         }
    //         waitStop();
    //     });
    // }

    // Date.prototype.format = function(fmt) 
    // { //author: meizz 
    //   var o = { 
    //     "M+" : this.getMonth()+1,                 //月份 
    //     "d+" : this.getDate(),                    //日 
    //     "h+" : this.getHours(),                   //小时 
    //     "m+" : this.getMinutes(),                 //分 
    //     "s+" : this.getSeconds(),                 //秒 
    //     "q+" : Math.floor((this.getMonth()+3)/3), //季度 
    //     "S"  : this.getMilliseconds()             //毫秒 
    //   }; 
    //   if(/(y+)/.test(fmt)) 
    //     fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
    //   for(var k in o) 
    //     if(new RegExp("("+ k +")").test(fmt)) 
    //   fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length))); 
    //   return fmt; 
    // }


    //导出
    // $('#input-start').val(new Date().format('yyyy-MM-dd'));
    // $('#input-end').val(new Date().format('yyyy-MM-dd'));


    $('.exportButton').click(function() {
        var start = $('#input-start').val();
        var end = $('#input-end').val();
        var href = $(this).attr('href') + '?start=' + start + '&end=' + end;
        location.href = href;
        return false;
    });
    
});