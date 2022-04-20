
$(function(){
    selEvent.init();
    fileImage.init();
    fileEvent.init();
    uploadFiles.init();
    dateEvent.init();
    tabEvent.init();
});

//select
var selEvent = {
  init:function(){
    var selectType0 = $(".select_box select");
      selectChange(selectType0);
      function selectChange(type){
        type.change(function(){
          var select_name = $(this).children("option:selected").text();
          $(this).siblings("label").text(select_name);
        });
      };
    }
};

//input image
var fileImage = {
  init:function(){
      $(":input[name='img_file']").change(function() {
          if( $(":input[name='img_file']").val() == '' ) {
              $('.imgarea').attr('src' , '');
          }
          $('.imgview').css({ 'display' : 'block' });
          $('.filearea').removeClass("blind");
          readURL(this);
      });
  }
};
// 사진 수정 시 이미지 미리보기
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('.imgarea').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
// 이미지 에러 시 미리보기영역 미노출
function imgAreaError(){
    $('.filearea').addClass("blind");
}



//input file
var fileEvent = {
  init:function(){
    var fileTarget = $(":input[name='upload_file']");
    fileTarget.on('change', function(){
      if(window.FileReader){
         var filename = $(this)[0].files[0].name;
       }else {
         var filename = $(this).val().split('/').pop().split('\\').pop();
       }
       $(".filearea2").removeClass("blind");
    });


  }
};
var uploadFiles = {
  init:function(){
    for (var n=1; n<7; n++){
      var selectFile = $(":input[name='upload_file" + n + "']");
      var fileInfo = $("p[data-info=upload_file"+n+"]");

      $(selectFile).change(function(){
        filename = $(this).val();
        $(this).siblings('.upload_name').val(filename);
        $(fileInfo).text(filename);
        

      });
    }return false;
  }
};

//popup
function popupOpen() {
  var popthis = $(".popup");
  popthis.css("display","block");
  popthis.find(".pop_close").click(function(){
    popthis.css("display","none");
  });
}

//datepicker
var dateEvent = {
    init:function(){
      $(".date").datepicker({
          dateFormat : 'yy-mm-dd',
          showOn: "both",
          buttonImage: "images/icon_schedule.png",
          buttonImageOnly: true
      });
    }
};

var tabEvent = {
  init:function(){
      $(".tab_menu ul li a").on("click",function(){
        var tabType = $(this).parent().index();
        $(".tab_menu ul li").removeClass("active");
        $(this).parent().addClass("active");
        $(".tab_cont .tabcon").addClass("blind");
        $(".tab_cont .tabcon"+tabType).removeClass("blind");
      });
  }
};
