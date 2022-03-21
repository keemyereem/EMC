$(function(){
    var w = $(window).width();
	responsiveImage(w);

    commonEvent.init();
});

var resizeEvent;

$(window).on("resize", function() {
	resizeEvent = setTimeout(function(){
		var w = $(window).width();
		responsiveImage(w);
	}, 200);

});

// Responsive Image 
function responsiveImage(w) {
    var src = "src-pc";
    if (w <= 650) src = "src-mobile";
    else if (w <= 1024 && w > 650) src = "src-tablet";
    else src = "src-pc";

    var obj;
    var img = $('body').find('img');
    for(var i=0; i<img.length; i++) {
        obj = img.eq(i);
        if (obj.data(src)) obj.attr('src', obj.data(src));
    }
    

}

var commonEvent = {
    init:function(){
        this.submenuEvent();
        this.headerEvent();
    },
    submenuEvent:function(){
        $(document).on('click', '.sub_visual_menu .depth', function(){
            $(this).toggleClass("open");
        });
    },

    headerEvent:function(){
        $(document).on('click', '.lang_choice li', function(){
            $('.lang_choice li').removeClass('on');
            $(this).addClass('on');  
        });
    },
};

$(document).ready(function() {
    
    var Tabs = $('.business_contents .section1 .nav_btn li');
    var Tabs_depth2 = $(".swiper_2depth_tabs p");

    $(".swiper").each(function(index, element){
        var swiper1_01 = new Swiper('.swiper1_01', {
            observer: true,
            observeParents: true,
            slidesPerView : 2,
            spaceBetween: 70,
            speed: 700,
            
            navigation: {
                nextEl: '.swiper-button-next01_01',
                prevEl: '.swiper-button-prev01_01',
            },
            watchOverflow: true
        });
        var swiper1_02 = new Swiper('.swiper1_02', {
            observer: true,
            observeParents: true,
            slidesPerView : 2,
            spaceBetween: 70,
            speed: 700,
            
            navigation: {
                nextEl: '.swiper-button-next01_02',
                prevEl: '.swiper-button-prev01_02',
            },
            watchOverflow: true
        });
        var $this = $(this);
        $this.addClass('instance-' + index);
        var swiper2 = new Swiper('.swiper2', {
            observer: true,
            observeParents: true,
            slidesPerView : 2,
            spaceBetween: 70,
            speed: 700,
            
            navigation: {
                nextEl: '.swiper-button-next02',
                prevEl: '.swiper-button-prev02',
            },
            watchOverflow: true
        });
        var swiper3 = new Swiper('.swiper3', {
            observer: true,
            observeParents: true,
            slidesPerView : 2,
            spaceBetween: 70,
            speed: 700,
            
            navigation: {
                nextEl: '.swiper-button-next03',
                prevEl: '.swiper-button-prev03',
            },
            watchOverflow: true
        });
        var swiper4 = new Swiper('.swiper4', {
            observer: true,
            observeParents: true,
            slidesPerView : 2,
            spaceBetween: 70,
            speed: 700,
            
            navigation: {
                nextEl: '.swiper-button-next04',
                prevEl: '.swiper-button-prev04',
            },
            watchOverflow: true
        });
        var swiper5 = new Swiper('.swiper5', {
            observer: true,
            observeParents: true,
            slidesPerView : 2,
            spaceBetween: 70,
            speed: 700,
            
            navigation: {
                nextEl: '.swiper-button-next05',
                prevEl: '.swiper-button-prev05',
            },
            watchOverflow: true
        });
        var swiper6 = new Swiper('.swiper6', {
            observer: true,
            observeParents: true,
            slidesPerView : 2,
            spaceBetween: 70,
            speed: 700,
            
            navigation: {
                nextEl: '.swiper-button-next06',
                prevEl: '.swiper-button-prev06',
            },
            watchOverflow: true
        });

        Tabs.click(function() {
            $(this).addClass('on');
            $(this).siblings().removeClass('on');
            
            var Tabs_idx = Tabs.index(this)+1;
            $('.section2 .nav_box').removeClass('on');
            $('.section2 .box0' + Tabs_idx).addClass('on');
            $('.section3 .onm_list').removeClass('on');
            $('.section3 .onm_list0' + Tabs_idx).addClass('on');
            swiper.slideTo(0, 0);

            console.log(swiper1);
            
        });
        Tabs_depth2.click(function(){
            var idx = Tabs_depth2.index(this)+1;
            var tab_slide = $(this).parent().siblings('.swiper1_box');
            Tabs_depth2.removeClass('on');
            $(this).addClass('on');
            tab_slide.css({display:'none'});
            $('.section2 .swiper_container .swiper1_box0' + idx).css({display:'block'});
        });
    });


});
