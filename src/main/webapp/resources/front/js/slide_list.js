// JavaScript Document

$(function() {
		$(".menu_open").click(function() {
			$('#aside').toggle('slide', { direction: 'right' }, 'normal');
            $('#aside').css("margin-top",$(window).scrollTop()+40);
		$(".close").click(function() {
			$('#aside').hide('slide', { direction: 'right' }, 'normal');
		});
	});

    $(window).scroll(function(){
        //$('#aside').css("margin-top",$(window).scrollTop()+40);
    });
});

