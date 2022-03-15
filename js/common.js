$(function(){
    var w = $(window).width();
	responsiveImage(w);
    
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

var ddiEvent = {
    init:function(){
        this.ddislide();
    },
    ddislide:function(){
        var devmenu = ['01', '02', '03', '04']
        var devswiper = new Swiper('.onm_box_slider', {
            effect : 'fade',
            slidesPerView: 2,
            allowTouchMove: false,
            observer: true,
            observeParents: true,
            pagination: {
                el: '.onm_visual .swiper-pagination',
          	  clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '">' + (devmenu[index]) + '</span>';
                },
            },
        });             
    },
   
};

$(document).ready(function() {
    var Tabs = $('.business_contents .section1 .nav_btn li');
    var Tabs_on = $('.business_contents .section1 .nav_btn .on');

    $('.onm_title').text(Tabs_on.find('.nav_tit').text());
    $('.onm_description').text(Tabs_on.find('.nav_desc').text());

    Tabs.click(function() {
        $(this).addClass('on');
        $(this).siblings().removeClass('on');
        
        /* 탭 버튼 index 값 호출 */
        var Tabs_tit = $(this).find('.nav_tit').text();
        var Tabs_desc = $(this).find('.nav_desc').text();
        var Tabs_idx = Tabs.index(this);

        
        
        $('.onm_title, .onm_description').css({'opacity': '0', 'transition': 'all ease .1s'});
        setTimeout(function() {
            $('.onm_title, .onm_description').css({'opacity': '1'});
            $('.onm_title').text(Tabs_tit);
            $('.onm_description').text(Tabs_desc);
        }, 200);
        

    });
})
