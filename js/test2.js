$(function(){
    var w = $(window).width();
	responsiveImage(w);

    commonEvent.init();

    //Run AOS - Global Setting
    AOS.init({
        //offset: 120,
        //delay: 500,
        //mirror: false,
        once: true,
        easing: 'ease-in-sine',
        duration: 500,
        anchorPlacement: 'bottom-bottom',
    });
    
    // O&M 페이지 타이틀 순서대로 모션 출력
    const aos_order1 = document.querySelector('.title');
    const aos_order2 = document.querySelector('.tit_line');

    aos_order1.addEventListener('transitionend', function(e){
        $(aos_order2).addClass('on');
        aos_order2.addEventListener('transitionend', function(e){
            $('.sub_tit').addClass('on');
        });  
    });   
    
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

        $(document).on('click', '.sub_visual_menu .depth .drop_box li a', function(){
            var selected = $(this).text();
            var dep_tit = $(this).closest('.drop_box').siblings('.dep_tit');
            dep_tit.text(selected);     
        });
    },
    headerEvent:function(){
        
        $(window).on('scroll',function(){
            var st = $(window).scrollTop();
            if (st>=100){
                $('.header').addClass('fixed');
            }else{
                $('.header').remClass('fixed');
            }
        });

        $(document).on('click', '.lang_choice li', function(){
            $('.lang_choice li').removeClass('on');
            $(this).addClass('on');  
        });
    },
};
var onmEvent = {
    init:function(){
        this.onmSwiper();
    },
    onmSwiper:function(){
        var Tabs = $('.business_contents .section1 .nav_btn li');
        var Tabs_depth2 = $(".swiper_2depth_tabs p");
        
        $(".swiper").each(function(index, element){
            var swiper1 = new Swiper('.swiper1_0' + index, {
                observer: true,
                observeParents: true,
                slidesPerView : 2,
                spaceBetween: 70,
                speed: 700,
                
                navigation: {
                    nextEl: '.swiper-button-next01_0' + index,
                    prevEl: '.swiper-button-prev01_0' + index,
                },
                watchOverflow: true,   
            });

            var $this = $(this);
            $this.addClass('swiper' + index);

            var swiper = new Swiper('.swiper' + index, {
                observer: true,
                observeParents: true,
                slidesPerView : 2,
                spaceBetween: 70,
                speed: 700,
                
                navigation: {
                    nextEl: '.swiper-button-next0' + index,
                    prevEl: '.swiper-button-prev0' + index,
                },
                watchOverflow: true
            });
    
            Tabs.on("click", function() {
                $(this).addClass('on');
                $(this).siblings().removeClass('on');
                
                var Tabs_idx = Tabs.index(this)+1;
                $('.section2 .nav_box').removeClass('on');
                $('.box_text, .swiper, .swiper_2depth_tabs, .onm_box_slider_button').removeClass('aos-animate');
                $('.section2 .box0' + Tabs_idx).addClass('on');
     
                setTimeout(function() {
                    $('.box0' + Tabs_idx + ' .box_text, .box0' + Tabs_idx + ' .swiper, .swiper_2depth_tabs, .box0' + Tabs_idx + ' .onm_box_slider_button').addClass('aos-animate');
                }, 0);
                $('.section3 .onm_list').removeClass('on');
                $('.section3 .onm_list0' + Tabs_idx).addClass('on');
                swiper.slideTo(0, 0);

                Tabs_depth2.removeClass('on');
                Tabs_depth2.eq(0).addClass('on');
            });
            
            Tabs_depth2.on('click', function(){
                var idx = Tabs_depth2.index(this)+1;
                var tab_slide = $(this).parent().siblings('.swiper1_box');
                
                Tabs_depth2.removeClass('on');
                $(this).addClass('on');
                
                tab_slide.hide();
                $('.swiper1_box0' + idx).css({display:'block'});
                $('.swiper1_box .swiper').removeClass('aos-animate');

                setTimeout(function() {
                    $('.swiper1_box0' + idx + ' .swiper').addClass('aos-animate');
                    swiper1.slideTo(0, 0);
                }, 0);
                // swiper1.slideTo(0, 0);
                
            });
        });
    },

    
};

