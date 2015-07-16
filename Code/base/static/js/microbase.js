	var flag = 0;
    $('html').css('font-size',document.body.scrollWidth / 320 * 11  + 'px');
    var resizeTimer = null;
    $(window).resize(function() {
        if (resizeTimer) clearTimeout(resizeTimer);
        resizeTimer = setTimeout("$('html').css('font-size',document.body.scrollWidth / 320 * 11  + 'px');", 50);
    });
        // disable ajax nav
    $.mobile.ajaxEnabled=false;
