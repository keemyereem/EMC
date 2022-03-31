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
        this.footerEvent();
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
                $('.header').removeClass('fixed');
            }
        });

        $(document).on('click', '.lang_choice li', function(){
            $('.lang_choice li').removeClass('on');
            $(this).addClass('on');  
        });
    },
    footerEvent:function() {
        $(window).scroll(function() {
            // top button controll
            if ($(this).scrollTop() > 500) {
                $('#topButton').fadeIn();
            } else {
                $('#topButton').fadeOut();
            }
            var footerTop = $('.footer').offset().top - $(window).outerHeight();
            var pos = $('.footer').outerHeight() + Number(80);
            
            if($(this).scrollTop() > footerTop){
                $('#topButton').addClass('on').css({'bottom':pos});
            }else {
                $('#topButton').removeClass('on').css({'bottom':'8rem'});
            }
        });

        $(document).on('click', '#topButtonImg', function() {
            $('html, body').animate({scrollTop:0}, '300');
        });
    },
};

////////////////////////////////////////////// O&M 수처리 페이지 이벤트 (FD-02-01-0011)
var onmEvent = {
    init:function(){
        this.onmSwiper();
        this.onmAOStit();
    },
    onmAOStit:function(){
        // O&M 페이지 타이틀, 라인 지정
        const aos_order1 = document.querySelector('.title');
        const aos_order2 = document.querySelector('.tit_line');

        // O&M 페이지 타이틀, 라인, 설명 각각 모션효과 종료될 때 다음 모션 진행하도록 
        aos_order1.addEventListener('transitionend', function(e){
            $(aos_order2).addClass('on');
            aos_order2.addEventListener('transitionend', function(e){
                $('.sub_tit').addClass('on');
            });  
        });   
    },
    onmSwiper:function(){
        // 탭 버튼 및 2depth 탭 버튼
        var Tabs = $('.business_contents .section1 .nav_btn li');
        var Tabs_depth2 = $(".swiper_2depth_tabs p");
        
        
        $(".swiper").each(function(index, element){

            // 첫번째 슬라이드 2depth 스와이퍼 
            var swiper1 = new Swiper('.swiper1_0' + index, {
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

            // 탭 메뉴 슬라이드 스와이퍼
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
            
            // 탭버튼 function
            Tabs.on("click", function() {
                // 탭 버튼 CSS 액티브 효과
                $(this).addClass('on');
                $(this).siblings().removeClass('on');
                
                // Tab버튼 index값 추출
                var Tabs_idx = Tabs.index(this)+1;

                // 클릭요소 제외한 다른 슬라이드 컨테이너, 탭 버튼 및 AOS 모션 삭제
                $('.section2 .nav_box').removeClass('on');
                $('.box_text, .swiper, .swiper_2depth_tabs, .onm_box_slider_button').removeClass('aos-animate');
                // 클릭요소의 슬라이드 컨테이너 출력
                $('.section2 .box0' + Tabs_idx).addClass('on');
                
                // 첫번째 슬라이드 컨테이너 내부 2Depth 슬라이드 컨테이너 초기화(첫번째로)
                $('.swiper1_box').hide();
                $('.swiper1_box01').css({display:'block'});

                setTimeout(function() {
                    // 클릭요소의 슬라이드 컨테이너 내부 AOS 모션 초기화
                    $('.box0' + Tabs_idx + ' .box_text, .box0' + Tabs_idx + ' .swiper, .swiper_2depth_tabs, .box0' + Tabs_idx + ' .onm_box_slider_button').addClass('aos-animate');

                    // 첫번째 슬라이드 컨테이너 내부 2Depth 탭 초기화(첫번째로)
                    Tabs_depth2.removeClass('on');
                    Tabs_depth2.eq(0).addClass('on');
                    swiper1.slideTo(0, 0);
                }, 0);

                // 클릭요소의 하단 그리드형 리스트 출력
                $('.section3 .onm_list').removeClass('on');
                $('.section3 .onm_list0' + Tabs_idx).addClass('on');
                
                // 모든 슬라이드 컨테이너 첫번째 슬라이드로 초기화
                swiper.slideTo(0, 0);
                
            });
            
            // 첫번째 슬라이드 컨테이너 내부 2depth 탭 버튼
            Tabs_depth2.on('click', function(){
                // 클릭한 2depth 탭 버튼 인덱스 값 추출 및 같은 인덱스값의 슬라이드 컨테이너 추적
                var idx = Tabs_depth2.index(this)+1;
                var tab_slide = $(this).parent().siblings('.swiper1_box');
                
                // 2depth 탭 버튼 CSS 액티브 효과
                Tabs_depth2.removeClass('on');
                $(this).addClass('on');
                
                // 2depth 클릭요소 제외한 다른 슬라이드 컨테이너 및 AOS 모션 삭제
                tab_slide.hide();
                $('.swiper1_box0' + idx).css({display:'block'});
                $('.swiper1_box .swiper').removeClass('aos-animate');

                setTimeout(function() {
                    // 2depth 클릭요소의 슬라이드 컨테이너 AOS 모션 초기화
                    $('.swiper1_box0' + idx + ' .swiper').addClass('aos-animate');

                    // 2depth 모든 슬라이드 컨테이너 첫번째 슬라이드로 초기화
                    swiper1.slideTo(0, 0);
                }, 0);
                
            });
        });
    },

    
};

////////////////////////////////////////////// 메인 페이지 이벤트 (FD-00-01-001)
var mainEvent = {
    init:function(){
        this.mainSwiper();
    },
    mainSwiper:function(){
        var _ = this;

        var windowHeight = $(window).height();

        //main slider
        var slidemenu = ['01', '02', '03', '04']
        var mySwiper = new Swiper("#main_visual", {
            slidesPerView:1,
            slidesPerGroup:1,
            autoplay:{
                delay:_.slideTime,
                disableOnInteraction: false
            },
            loop: true,
            navigation: {
              prevEl:"#fPrev",
              nextEl:"#fNext"
          },
          allowTouchMove: false,
          pagination: {
              el: '.swiper-pagination',
        	  clickable: true,
              renderBullet: function (index, className) {
                  return '<span class="' + className + '">' + (slidemenu[index]) + '</span>';
              },
          },
        });

        var dummyLen = 2;
        var mainLastPage = $(".main_visual .swiper-slide").length - dummyLen;

        var windowHeight = $(window).height();
        $(".main_visual .swiper-slide").height(windowHeight);

        $(".main_visual .naviPlay .lastPage").text(mainLastPage);

        $(".main_visual .naviPlay .playbar").eq(0).addClass("autoplay");

        window.onload = function(){
            setTimeout(function() {
                $(".main_visual .swiper-slide .txt").removeClass("on");
                $(".main_visual .swiper-slide.swiper-slide-active .txt").addClass("on");
            }, 100);
        }

        mySwiper.on("slideChangeTransitionStart",function(){
            var curIdx = this.activeIndex;
            if(curIdx > mainLastPage){
                curIdx = 1;
            }else if(curIdx < 1){
                curIdx = mainLastPage;
            }

            $(".main_visual .naviPlay .playbar").removeClass("autoplay");
            $(".main_visual .naviPlay .playbar.playbar").removeClass("active");
            if(!$(".main_visual .naviPlay .naviAuto a").hasClass("autoplay")){
                $(".main_visual .naviPlay .playbar.autoplay").removeClass("autoplay");
                $(".main_visual .naviPlay .playbar.playbar"+curIdx).addClass("active");
            }else{
                $(".main_visual .naviPlay .playbar").eq(curIdx-1).addClass("autoplay");
                $(".main_visual .naviPlay .playbar.playbar").removeClass("active");
            }

            $(".main_visual .swiper-slide .txt").removeClass("on");
            $(".main_visual .swiper-slide.swiper-slide-active .txt").addClass("on");

        });

        $(".main_visual .naviPlay .naviAuto a").on("click",function(){
            var idx = $(".swiper-pagination-bullet-active").index() + 1;
            if(!$(this).hasClass("autoplay")){
                $(this).find("img").attr("src","images/common/icon_pause.png");
                $(this).addClass("autoplay");
                mySwiper.autoplay.start();

                $(".main_visual .naviPlay .playbar.playbar"+idx).addClass("autoplay");
                $(".main_visual .naviPlay .playbar.playbar").removeClass("active");
            }else{
                $(this).find("img").attr("src","images/common/icon_play.png");
                $(this).removeClass("autoplay");
                mySwiper.autoplay.stop();

                $(".main_visual .naviPlay .playbar").removeClass("autoplay");
                $(".main_visual .naviPlay .playbar.playbar"+idx).addClass("active");
            }
        });
    },
};

