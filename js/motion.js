let scTop = 0;
let winH = 0;
    
function scrollMotionListener(){
    winH = top.window.innerHeight
    scTop = $(window).scrollTop();
    $(".motionup").each(function(){
        if($(this).attr('motion') === 'false'){
            if($(this).attr('default-top')<(scTop+winH*0.9)){
                $(this).attr('motion',true)
                let delayNum = Number($(this).attr('data-delay')) || 0
                let moveTime = Number($(this).attr('data-movetime')) || 0.9
                TweenMax.to($(this),moveTime,{delay:delayNum*0.1,x:0, y:0, autoAlpha:1, ease:Cubic.easeOut});
                $(this).addClass("on");
            }
        }else{

        }
    });
}
  
function defaultTopReset(){
    scTop = $(window).scrollTop();
    $(".motionup").each(function(){
        if($(this).attr('default-top') == '0'){
            $(this).attr('default-top',($(this).offset().top));
        }
        if($(this).attr('default-top')>(scTop+winH*0.65)){
            $(this).attr('motion',false)
            let gapNum = Number($(this).attr('data-movegap')) || 100
            let moveX = Number($(this).attr('data-moveX')) || 0
            TweenMax.to($(this),0.5,{x:moveX, y:gapNum, autoAlpha:0, ease:"none"});
        }else{
            TweenMax.to($(this),0.5,{x:0, y:0, autoAlpha:1, ease:Sine.easeOut});
        }
    })
}

function pageTopClickHandler(e){
    e.preventDefault()
    TweenMax.to($('body',document),0.5,{scrollTop:0, ease:Cubic.easeOut});
}
  
$(document).ready(function(){
    $(".motionup").each(function(){
        $(this).attr('default-top',($(this).offset().top));
        let gapNum = Number($(this).attr('data-movegap')) || 100;
        let initMotion = $(this).attr('data-init') || '';
        let moveX = Number($(this).attr('data-moveX')) || 0
        $(this).attr('motion',false);
        if($(this).attr('default-top')>(scTop+winH*0.9) || initMotion != ''){
            TweenMax.to($(this),0,{x:moveX, y:gapNum, autoAlpha:0, ease:Expo.easeOut});
        }
    })
    $(document,window).bind("scroll",scrollMotionListener);
    scrollMotionListener()

    $(".swiper_2depth_tabs p").bind("click",scrollMotionListener);
    scrollMotionListener()


});
