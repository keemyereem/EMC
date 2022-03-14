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