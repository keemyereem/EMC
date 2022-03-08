var typeAEvent = {
    slideTime:5000,
    pSlideTime:5000,
    init:function(){
        this.mainEvent();
    },
    mainEvent:function(){
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
        //num count
        numberCountUp1();
        draw(60, '.carbon_chart', '#7bcc40', '#198c7a');

        function numberCountUp1() {
            var memberCountConTxt1= 4650;
            // var memberCountConTxt2= 6405232;
            // var memberCountConTxt3= 4650;
            // var memberCountConTxt4= 732901;

            $({ val : 0 }).animate({ val : memberCountConTxt1 }, {
                duration: 2000,
                step: function() {
                    var num = numberWithCommas(Math.floor(this.val));
                    $(".mov_num1").text(num);
                },
                complete: function() {
                    var num = numberWithCommas(Math.floor(this.val));
                    $(".mov_num1").text(num);
                }
            });
        //    $({ val : 0 }).animate({ val : memberCountConTxt2 }, {
        //         duration: 2000,
        //         step: function() {
        //             var num = numberWithCommas(Math.floor(this.val));
        //             $(".mov_num2").text(num);
        //         },
        //         complete: function() {
        //             var num = numberWithCommas(Math.floor(this.val));
        //             $(".mov_num2").text(num);
        //         }
        //     });
        //     $({ val : 0 }).animate({ val : memberCountConTxt3 }, {
        //         duration: 2000,
        //         step: function() {
        //             var num = numberWithCommas(Math.floor(this.val));
        //             $(".mov_num3").text(num);
        //         },
        //         complete: function() {
        //             var num = numberWithCommas(Math.floor(this.val));
        //             $(".mov_num3").text(num);
        //         }
        //     });
        //     $({ val : 0 }).animate({ val : memberCountConTxt4 }, {
        //         duration: 4000,
        //         step: function() {
        //             var num = numberWithCommas(Math.floor(this.val));
        //             $(".mov_num4").text(num);
        //         },
        //         complete: function() {
        //             var num = numberWithCommas(Math.floor(this.val));
        //             $(".mov_num4").text(num);
        //         }
        //     });

            function numberWithCommas(x) {
                return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
        };



        function draw(max, classname, colorname1, colorname2){
            var i=1;
             var func1 = setInterval(function(){
               if(i<max){
                   color1(i,classname, colorname1, colorname2);
                   i++;
               } else{
                 clearInterval(func1);
               }
             },10);
        };
        function color1(i, classname, colorname1, colorname2){
            $(classname).css({
                 "background":"conic-gradient("+colorname1+" 0% ,"+ colorname2 +" 30%"+ i+"%, transparent "+i+"% 100%)"
            });
        };

        sec3();
        function sec3(){
            $(".container .section3 .sec3_menu ul li").eq(1).hover(function(){
                $(".container .section3 .contents").addClass("on");
            },function(){
                $(".container .section3 .contents").removeClass("on");
            });
        };
    },
    scrollEvent:function(){
        var wW = $(window).width();
        var wH = $(window).height();
        var scTop = $(window).scrollTop();
        var $sec01 = $(".section1");
        var $sec02 = $(".section2");
        var $sec03 = $(".section3");

        var $sec02Box = $(".section2 .box_wrap");
        var $sec02inner = $(".section2 .inner");
        /* var $sec02Box02 = $(".sec2_box02"); */
        /* var $sec02Box03 = $(".sec2_box03"); */
        /* var $sec02Box04 = $(".sec2_box04"); */
        /* var $sec02Box05 = $(".sec2_box05"); */
        /* var $sec02Box06 = $(".sec2_box06"); */

        var $sec04 = $(".section4");

        var scrollDetect = function(){
            scTop = $(window).scrollTop();
            winH = top.window.innerHeight;

            if($sec01.offset().top < (scTop+winH*0.5)){
                $sec01.addClass("on");
                // numberCountUp2();
            }

            if($sec02.offset().top < (scTop+winH*0.5)){
                $sec02.addClass("on");
            
            }
            if($sec02Box.offset().top < (scTop+winH*0.5)){
                $sec02inner.toggleClass("on");
            }

            if($sec03.offset().top < (scTop+winH*0.5)){
                $sec03.addClass("on");
            }

            if($sec04.offset().top < (scTop+winH*0.5)){
                $sec04.addClass("on");
            }
        };


        function runAction(direction) {
            // console.log(direction+' 실행 !!!!');
            numberCountUp2();
            draw2(60, '.carbon_chart', '#7bcc40', '#198c7a');
          }
          
          var currentDirection = ''; // 현재의 방향을 나타내는 변수
          var lastScrollTop = 0; // 방향을 구하기 위해 사용되는 변수
          
          $(window).scroll(function(event){
             var currentPos = $(this).scrollTop();
             if (currentPos > lastScrollTop){
                 // 아래로 스크롤 중
                 if(currentDirection != 'down') { // 마지막 방향 확인
                  currentDirection = 'down';
                  runAction('down');
                 }
                 
             } else {
                // 위로 스크롤 중
                if(currentDirection != 'up') { // 마지막 방향 확인
                  currentDirection = 'up';
                //   runAction('up');
                }
             }
             lastScrollTop = currentPos; // 방향을 구하기 위해 마지막 스크롤 지점을 저장
          });


        function numberCountUp2() {
            // var memberCountConTxt1= 4650;
            var memberCountConTxt2= 6405232;
            var memberCountConTxt3= 4650;
            var memberCountConTxt4= 732901;

            // $({ val : 0 }).animate({ val : memberCountConTxt1 }, {
            //     duration: 2000,
            //     step: function() {
            //         var num = numberWithCommas(Math.floor(this.val));
            //         $(".mov_num1").text(num);
            //     },
            //     complete: function() {
            //         var num = numberWithCommas(Math.floor(this.val));
            //         $(".mov_num1").text(num);
            //     }
            // });
            $({ val : 0 }).animate({ val : memberCountConTxt2 }, {
                duration: 2000,
                step: function() {
                    var num = numberWithCommas(Math.floor(this.val));
                    $(".mov_num2").text(num);
                },
                complete: function() {
                    var num = numberWithCommas(Math.floor(this.val));
                    $(".mov_num2").text(num);
                }
            });
            $({ val : 0 }).animate({ val : memberCountConTxt3 }, {
                duration: 2000,
                step: function() {
                    var num = numberWithCommas(Math.floor(this.val));
                    $(".mov_num3").text(num);
                },
                complete: function() {
                    var num = numberWithCommas(Math.floor(this.val));
                    $(".mov_num3").text(num);
                }
            });
            $({ val : 0 }).animate({ val : memberCountConTxt4 }, {
                duration: 2000,
                step: function() {
                    var num = numberWithCommas(Math.floor(this.val));
                    $(".mov_num4").text(num);
                },
                complete: function() {
                    var num = numberWithCommas(Math.floor(this.val));
                    $(".mov_num4").text(num);
                }
            });

            function numberWithCommas(x) {
                return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
        };

        function draw2(max, classname, colorname1, colorname2){
            var i=1;
             var func1 = setInterval(function(){
               if(i<max){
                   color1(i,classname, colorname1, colorname2);
                   i++;
               } else{
                 clearInterval(func1);
               }
             },10);
        };
        function color1(i, classname, colorname1, colorname2){
            $(classname).css({
                 "background":"conic-gradient("+colorname1+" 0% ,"+ colorname2 +" 30%"+ i+"%, transparent "+i+"% 100%)"
            });
        };

        $(window).on("scroll", function(){
            scrollDetect();
        }).trigger("scroll");
    },
    carbonEvent:function(){

        $(window).scroll(function(){
            var wt = $(window).scrollTop();
            var s1Top = $('.section1').offset().top - $(window).outerHeight();

            if (wt>363) {
                $('.carbon_level1').addClass("on");
            }else {
                $('.carbon_level1').removeClass("on");
            }

            if (wt> 758){  
                $('.carbon_level1').hide();
                $('.carbon_level2').show();
            }else {
                $('.carbon_level1').show();
                $('.carbon_level2').hide();
            }
            // console.log(wt);

            // var gotopP = $('.section1').outerHeight() + Number(30);

            // console.log(wt);
            // console.log();

            // if(wt > s1Top){
            //     $('.carbon_level1').addClass('on').css('bottom', gotopP);
            // }else{
            //     $('.carbon_level1').removeClass('on').css('bottom', '30px')
            // }
        });



    },
    gotopEvent:function(){

        $(window).scroll(function(){
            var wt = $(window).scrollTop();
            var footerTop = $('.footer').offset().top - $(window).outerHeight();
            if (wt> 1740){  
                $('.gotop').fadeIn();
            }else {
                $('.gotop').hide();
            }
            var gotopP = $('.footer').outerHeight() + Number(160);

            if(wt > footerTop){
                $('.gotop').addClass('on').css('bottom', gotopP);
            }else{
                $('.gotop').removeClass('on').css('bottom', '160px')
            }
        });
        $('.gotop').click(function(){
            $('html, body').animate({scrollTop: 0}, 400);
        });


    },


}