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
        $(".sub_visual_menu .depth").click(function(){
            $(this).toggleClass("open");
        });
    },

    headerEvent:function(){
        $('.lang_select .lang_choice li').click(function(){
            $('.lang_select .lang_choice li').removeClass("on");
            $(this).addClass("on");
        });
    },
};

$(document).ready(function() {
    var Tabs = $('.business_contents .section1 .nav_btn li');
    var Tabs_on = $('.on');
    var Tabs_off = $('.off');

    Tabs_on.css('display', 'flex');
    Tabs_off.css('display', 'none');

    $('.onm_title').html(Tabs_on.find('.nav_tit').text());
    $('.onm_description').html(Tabs_on.find('.nav_desc').html());

    $(".swiper_2depth_tabs p").click(function() {
        $(this).addClass('on');
        $(this).siblings().removeClass('on');

        var tabsIdx = $('.swiper_2depth_tabs p a').index(this);
        $('.onm_box_slider1 .swiper-wrapper:eq(' + tabsIdx + ')').addClass('on')
        $('.onm_box_slider1 .swiper-wrapper:not(:eq(' + tabsIdx + '))').addClass('off')
        $('.onm_box_slider1 .swiper-wrapper:eq(' + tabsIdx + ')').removeClass('off')
        $('.onm_box_slider1 .swiper-wrapper:not(:eq(' + tabsIdx + '))').removeClass('on')
    });

    Tabs.click(function() {
        $(this).addClass('on');
        $(this).siblings().removeClass('on');
        
        /* 탭 버튼 index 값 호출 */
        var Tabs_tit = $(this).find('.nav_tit').text();
        var Tabs_desc = $(this).find('.nav_desc').html();
        var Tabs_idx = Tabs.index(this) + 1;

        /* onm_box_slider 탭버튼 index값과 연동 출력 */
        $('.onm_box_slider' + Tabs_idx + '').fadeIn();
        for (var i= 1; i <= Tabs.length; i++) {
            $('.onm_box_slider' + i + '').not($('.onm_box_slider' + Tabs_idx + '')).fadeOut();
        }

        /* onm_text_box 애니메이션 효과 */
        $('.onm_title, .onm_description').css({'opacity': '0', 'transition': 'all ease .2s'});
        
        setTimeout(function() {
            $('.onm_title, .onm_description').css({'opacity': '1'});
            $('.onm_title').html(Tabs_tit);
            $('.onm_description').html(Tabs_desc);
            
        }, 200);
        

    });

    
    var swiper = new Swiper('.onm_box_slider1', {
        slidesPerView: 2,
        spaceBetween: 20,
        observer: true,
        speed: 700,
        observeParents: true,
        navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
        },
    });

    var swiper2 = new Swiper('.onm_box_slider2', {
        slidesPerView: 2,
        spaceBetween: 20,
        observer: true,
        speed: 700,
        observeParents: true,
        navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
        },
    });

    var swiper3 = new Swiper('.onm_box_slider3', {
        slidesPerView: 2,
        spaceBetween: 20,
        observer: true,
        speed: 700,
        observeParents: true,
        navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
        },
    });

    var swiper4 = new Swiper('.onm_box_slider4', {
        slidesPerView: 2,
        spaceBetween: 20,
        observer: true,
        speed: 700,
        observeParents: true,
        navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
        },
    });

    var swiper5 = new Swiper('.onm_box_slider5', {
        slidesPerView: 2,
        spaceBetween: 20,
        observer: true,
        speed: 700,
        observeParents: true,
        navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
        },
    });

    var swiper6 = new Swiper('.onm_box_slider6', {
        slidesPerView: 2,
        spaceBetween: 20,
        observer: true,
        speed: 700,
        observeParents: true,
        navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
        },
    });
})
