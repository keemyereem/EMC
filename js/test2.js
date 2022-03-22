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
        $(document).on('click', '.lang_choice li', function(){
            $('.lang_choice li').removeClass('on');
            $(this).addClass('on');  
        });
    },
};
var onmEvent = {
    init:function(){
        this.onmSwiper();
        this.onmScroll();
    },
    onmSwiper:function(){
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
                watchOverflow: true,   
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
    
            Tabs.on("click", function() {
                $(this).addClass('on');
                $(this).siblings().removeClass('on');
                
                var Tabs_idx = Tabs.index(this)+1;
                $('.section2 .nav_box').removeClass('on');
                $('.section2 .nav_box .box_text, .section2 .nav_box .swiper, .swiper_2depth_tabs').removeClass('aos-animate');
                $('.section2 .box0' + Tabs_idx).addClass('on');
     
                setTimeout(function() {
                    $('.section2 .box0' + Tabs_idx + ' .box_text, .section2 .box0' + Tabs_idx + ' .swiper, .swiper_2depth_tabs').addClass('aos-animate');
                }, 0);
                $('.section3 .onm_list').removeClass('on');
                $('.section3 .onm_list0' + Tabs_idx).addClass('on');
                swiper.slideTo(0, 0);
            });
            Tabs_depth2.on('click', function(){
                var idx = Tabs_depth2.index(this)+1;
                var tab_slide = $(this).parent().siblings('.swiper1_box');
                Tabs_depth2.removeClass('on');
                $(this).addClass('on');
                tab_slide.css({display:'none'});
                $('.swiper1_box0' + idx).css({display:'block'});

                $('.swiper1_box .swiper').removeClass('aos-animate');
                setTimeout(function() {
                    $('.swiper1_box0' + idx + ' .swiper').addClass('aos-animate');
                }, 0);
                swiper1_01.slideTo(0, 0);
                swiper1_02.slideTo(0, 0);
            });
        });
    },
    onmScroll:function(){
        $(window).on('scroll',function(){
            
            var tit = $('.business_contents .section1 .title');
            var st = $(window).scrollTop(),
                winH = $(window).height(),
                tit_line = $('.business_contents .section1 .tit_line'),
                tit_offTop = tit_line.offset().top;

                
            if ($(tit_offTop-winH) > 0){  
                tit_line.addClass('on');
            }

            console.log('window height : '+winH);
            console.log(tit_offTop);
            console.log('offsetTop - scrollTop : '+ Number(tit_offTop - st));
           
        }); 

    },
};

