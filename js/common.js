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
    var Tabs_on = $('.on');

    $('.swiper:eq(0)').css('display', 'block');
    $('.onm_title').html(Tabs_on.find('.nav_tit').text());
    $('.onm_description').html(Tabs_on.find('.nav_desc').html());

    $(".swiper").each(function(index, element){
        var $this = $(this);
        $this.addClass('instance-' + index);
        var swiper = new Swiper('.instance-' + index, {
            observer: true,
            observeParents: true,
            slidesPerView : 2,
            spaceBetween: 70,
            autoplay: true,
            speed: 700,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            watchOverflow: true
        });

        $(".swiper_2depth").each(function(index, element){
            var $this = $(this);
            $this.addClass('instance_2depth-' + index);
            var swiper = new Swiper('.instance_2depth-' + index, {
                observer: true,
                observeParents: true,
                slidesPerView : 2,
                spaceBetween: 70,
                // autoplay: true,
                speed: 700,
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                watchOverflow: true
            });
        });
        
        // Tabs.click(function() {
           
        // });
    

 
        Tabs_depth2.click(function() {
            $(this).addClass('on');
            $(this).siblings().removeClass('on');

            // var tabsIdx = $('.swiper_2depth_tabs p').index(this);
            // $('.instance-0 .swiper-wrapper:eq(' + tabsIdx + ')').fadeIn();
            // $('.instance-0 .swiper-wrapper:not(:eq(' + tabsIdx + '))').fadeOut();
        });

        Tabs.click(function() {
            $(this).addClass('on');
            $(this).siblings().removeClass('on');
            

            /* 탭 버튼 index 값 호출 */
            var Tabs_tit = $(this).find('.nav_tit').text();
            var Tabs_desc = $(this).find('.nav_desc').html();
            var Tabs_idx = Tabs.index(this);

            /* onm_box_slider 탭버튼 index값과 연동 출력 */
            for (var i= 0; i < Tabs.length; i++) {
                $('.instance-' + i + '').not($('.instance-' + Tabs_idx + '')).fadeOut(200);
                $('.instance-' + i + '').not($('.instance-' + Tabs_idx + '')).removeClass('on');
            }

            /* onm_text_box 애니메이션 효과 */
            $('.onm_title, .onm_description').css({'opacity': '0', 'transition': 'all ease .2s'});
            
            setTimeout(function() {
                $('.onm_title, .onm_description').css({'opacity': '1'});
                $('.onm_title').html(Tabs_tit);
                $('.onm_description').html(Tabs_desc);      
                $('.instance-' + Tabs_idx + '').fadeIn(200);
                $('.instance-' + Tabs_idx + '').addClass('on');
                
                swiper.slideTo(0, 0);
            }, 200);
        });
    });
   

});
