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

////////////////////////////////////////////// O&M 수처리 페이지 슬라이드 이벤트 (FD-02-01-0011)
var onmEvent = {
    init:function(){
        this.onmSwiper();
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
                    nextEl: '.swiper-button-next01_0' + index,
                    prevEl: '.swiper-button-prev01_0' + index,
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

