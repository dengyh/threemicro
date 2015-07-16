$(document).ready(function(){
    //若为实名制，则强制弹出
    var name = $('#modifyMes input[name="name"]').val();
    if (name == "")
        $('.modifyMessage a').click();
    else if (name == 'undefined')
        alerts("error!");
})