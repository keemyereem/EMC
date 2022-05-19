var file = {
         addFile: function (fileId) {
             console.log('---'+ fileId + '---');
             // 첨부된 파일의 갯 수 를 찾는다.
             var orders = 0 ;
             var maxOrders = 0 ;
             var fileArr = $("input[name='" + fileId + "Orders']") ;

             var orders = fileArr.length + 1 ;
             if( fileArr != null && fileArr.length > 0){
                 for( i = 0 ; i < fileArr.length ; i++){
                     if( $(fileArr[i]).val() >= orders) {
                         orders = parseInt($(fileArr[i]).val()) + 1 ;
                     }
                     maxOrders = $(fileArr[i]).val() ;
                 }
             }

             // 파일의 최대 수를 확인 한다.
             var maxFileCount = $("#" + fileId + "Info").attr('maxFileCount') ;
             var deleteObjects = $("input[name='" + fileId + "deleteAt']") ;
             var fileArrCnt = 0 ;
             console.log("--deleteObjects--");
             console.log(deleteObjects.length);
             for( i = 0 ; i < deleteObjects.length ; i++){
                if( $(deleteObjects[i]).val() == 'N' ){
                  fileArrCnt++ ;
                }
             }

             if(maxFileCount <= fileArrCnt ){
                 alert('파일은 최대 ' + maxFileCount + "까지만 등록 가능 합니다.");
                 return ;
             }

             var strbuffer = new StringBuffer();
             strbuffer.append(jQuery.validator.format("<ul id='div{0}{1}' name='div{0}' >",fileId, orders));
             strbuffer.append("<li class='marginT10'>");
             strbuffer.append(jQuery.validator.format("<input type='file' name='{0}' id='{0}{1}' class='invisible' orders='{1}' onclick=\"file.initialize(event)\" onchange=\"file.fileChange('{0}','{1}', this);\" >", fileId, orders ));
             strbuffer.append(jQuery.validator.format("<input type='hidden' name='{0}Orders' id='{0}{1}Orders' value='0' >", fileId, orders ));
             strbuffer.append(jQuery.validator.format("<input type='hidden' name=\"{0}expsrOrdr\" id=\"{0}{1}expsrOrdr\" value=\"{1}\" >", fileId, orders ));
             strbuffer.append(jQuery.validator.format("<input type='hidden' name='{0}deleteAt' id='{0}{1}deleteAt' value='N' >", fileId, orders ));
             strbuffer.append(jQuery.validator.format("<input type='hidden' name=\"{0}reprsntAt\" id=\"{0}{1}reprsntAt\" value=\"{2}\" >", fileId, orders, 'N'));

             strbuffer.append(jQuery.validator.format("<div class='inBlock' id='{0}{1}Nm' ></div>", fileId, orders));
             strbuffer.append(jQuery.validator.format("<div class='inBlock' > <a href=\"javascript:file.deleteFile('{0}','{1}');\" class='btn small del undo'>삭제</a></div>", fileId, orders));
             strbuffer.append(jQuery.validator.format("<div class='marginT5'><input type='text' name='{0}Dc' id='{0}{1}Dc' placeholder='파일설명을 입력하세요.''></div>", fileId, orders));
             strbuffer.append("</li>");
             strbuffer.append("</ul>");

             if(maxOrders == 0 ){
              $("#" + fileId).append(strbuffer.toString());
             } else {
              $("#div" + fileId + maxOrders).after(strbuffer.toString());
             }
             $("#" + fileId + orders).click();

             let letFileId = fileId ;
             let letOrders = orders ;

             document.body.onfocus = function (event) {
                 document.body.onfocus = null ;
                 setTimeout( function() {
                     file.cancelFile(letFileId, letOrders) ;
                 }, 500) ;

             } ;
         },
         cancelFile : function(fileId, orders){
             if( $("#" + fileId + orders).val() == ''){
                 $(jQuery.validator.format("#div{0}{1}", fileId, orders)).remove();
             }
         },
         deleteFile : function(fileId, orders){
             $(jQuery.validator.format("#div{0}{1}", fileId, orders)).remove();
         },
         fileChange : function(fileId, orders, obj){
          // 파일 확장자 선택
          console.log("--uploadExtsnStr--");
          var uploadExtsnStrv =$("#" + fileId + "Info").attr('uploadExtsnStr') ;
          var mxmmUploadSize =$("#" + fileId + "Info").attr('mxmmUploadSize') ;
          console.log($("#" + fileId + orders).val());
          var fileExtsn = util.fileName( $("#" + fileId + orders).val() ).split('.').pop().toLowerCase();
          console.log(fileExtsn);
          console.log(uploadExtsnStrv.indexOf("." +fileExtsn));

          if(uploadExtsnStrv.indexOf(fileExtsn) < 0){
              alert(fileExtsn + "파일은 첨부 할 수 없습니다.\n" + "첨부 가능한 파일은 " + uploadExtsnStrv + "입니다.");
              file.deleteFile(fileId, orders);
              return ;
          }

          // 파일 크기 검증
          var fileSize = $("#" + fileId + orders)[0].files[0].size;
          console.log("--fileSize--");
          console.log(fileSize);
          if(mxmmUploadSize * 1024 * 1024 < fileSize){
              alert('업로드 파일의 최대 크기는 ' + mxmmUploadSize + "M 이하로 등록해 주세요.");
              file.deleteFile(fileId, orders);
              return ;
          }

          // 파일 명 검증
          var pattern =  /[\{\}\/?,;:|*~`!^\+<>@\#$%&\\\=\'\"]/gi;
          console.log("--pattern--");
          if(pattern.test($("#" + fileId + orders).val().split('\\').pop().toLowerCase()) ){
              alert('파일명에 특수문자가 포함되어 있습니다.');
              file.deleteFile(fileId, orders);
              return ;
          }
          console.log("--file명--");
          console.log($("#" + fileId + orders).val());

         $("#" + fileId + orders + "Nm" ).html( util.fileName($("#" + fileId + orders).val()) );

         // 이미지를 보여주는 것을 처리
         if($("#" + fileId + "isViweImage" ).val() == 'true'){
	         var strbuffer = new StringBuffer();
	         // strbuffer.append(jQuery.validator.format("<ul id=\"img{0}\" name=\"img{0}\" >", fileId ));


	         strbuffer.append(jQuery.validator.format("<li class=\"marginT10\" id=\"{0}{1}viewImage\" >" , fileId, orders ) );
			 strbuffer.append(jQuery.validator.format("<img id=\"imgObj{0}{1}\" ", fileId, orders ) );
			 strbuffer.append("title=\"" + this.title + "\" ");
			 // strbuffer.append(jQuery.validator.format("src=\"{0}\"", file.readURL($("#" + fileId + orders).val()) ));
			 strbuffer.append("/>");
			 strbuffer.append("<div class=\"radioWrap\">");
			 strbuffer.append(jQuery.validator.format("<input type='radio' id=\"{0}{1}reprsntAtCheck\" name=\"{0}reprsntAtCheck\" onclick=\"file.onChangeReprsnt(''{0}'',''{1}'')\" {2} > <label for=\"{0}{1}reprsntAtCheck\" >대표 이미지</label>"
			        , fileId, orders
			        , ""
			        ));
			 strbuffer.append("</div>");
			 strbuffer.append("</li>");
			 console.log(strbuffer);
	         console.log($("#img" + fileId ));
	         $("#img" + fileId ).append(strbuffer.toString());

	         var imgObj = document.getElementById("imgObj" + fileId + orders);
	         var fileObj = document.getElementById(fileId + orders);
	         file.readURL( imgObj, fileObj, obj );
        }

     },
     initialize : function(event){

     },
     deleteViewFile : function(fileId, orders){
        $(jQuery.validator.format("#div{0}{1}", fileId, orders)).hide();
        $(jQuery.validator.format("#{0}{1}deleteAt", fileId, orders)).val('Y');
        $(jQuery.validator.format("#{0}{1}viewImage", fileId, orders)).hide();

     },
     onFileView : function(fileId, fileOrder){

    },
    onFileDwonLoad : function(fileId, fileOrdr){

        var header = $("meta[name='_csrf_header']").attr('content');
        var token = $("meta[name='_csrf']").attr('content');

        var newForm = document.createElement('form');
        newForm.name = 'newForm';
        newForm.method = 'post';
        newForm.action = '/cmm/file/fileDown.do';

        var iframe = document.createElement('iframe');
        iframe.name = "filedown" ;
        newForm.target = 'filedown';

        var csrf = document.createElement('input');
        csrf.type = "hidden";
        csrf.name = "_csrf";
        csrf.value = token ;
        newForm.appendChild(csrf);

        var hideFileId = document.createElement('input');
        hideFileId.type = "hidden";
        hideFileId.name = "fileId";
        hideFileId.value = fileId ;
        newForm.appendChild(hideFileId);

        var hidFileOrdr = document.createElement('input');
        hidFileOrdr.type = "hidden";
        hidFileOrdr.name = "fileOrdr";
        hidFileOrdr.value = fileOrdr ;
        newForm.appendChild(hidFileOrdr);

        document.body.appendChild(newForm);
        document.body.appendChild(iframe);

        newForm.submit();

        iframe.style.display = 'none';
        newForm.style.display = 'none';
    },
    onChangeReprsnt : function(fileId, fileOrdr){
        var reprsntAt = $("input[name=" + fileId + "reprsntAt]" );
        console.log(reprsntAt);
        for(i = 0 ; i < reprsntAt.length ; i++){
            $(reprsntAt[i]).val('N');
        }
        $("#" + fileId + fileOrdr + "reprsntAt" ).val('Y');
    },
    readURL : function(imgObj, fileObj, obj) {
       // FileReader
        if (window.FileReader) {
            // image 파일만
            //console.log(obj.type.match(/image\//));
            //if (!obj.type.match(/image\//)) return;

            // preview
            try {
                var reader = new FileReader();
                reader.onload = function(e){
                    console.log('-----src---------');
                    console.log(imgObj);
                    imgObj.src = e.target.result;
                    //img.style.width  = defaultOpt.w+'px';
                    //img.style.height = defaultOpt.h+'px';
                    //img.style.display = '';
                }
                console.log('-----file---------');
                console.log(fileObj);
                reader.readAsDataURL(obj.files[0]);
            } catch (e) {
                // exception...
            }
        // img.filters (MSIE)
        } else if (imgObj.filters) {

            var imgSrc = document.selection.createRange().text;

            imgObj.style.width  = defaultOpt.w+'px';
            imgObj.style.height = defaultOpt.h+'px';
            imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";
            imgObj.style.display = '';
        // no support
        } else {
            // Safari5, ...
        }
    },
    onFileChangeUpOrder : function(fileId, fileOrdr) {

    },

    onFileChangeDwonOrder : function(fileId, fileOrdr) {

    },


   };