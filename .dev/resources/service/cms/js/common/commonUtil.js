var util = {
	// xml을 Json으로 변경
	xmlToJson: function (xml) {
		// Create the return object
	    var obj = {};

	    if (xml.nodeType == 1) { // element
	        // do attributes
	        if (xml.attributes.length > 0) {
	            obj["@attributes"] = {};
	            for (var j = 0; j < xml.attributes.length; j++) {
	                var attribute = xml.attributes.item(j);
	                obj["@attributes"][attribute.nodeName] = attribute.nodeValue;
	            }
	        }
	    } else if (xml.nodeType == 3) { // text
	        obj = xml.nodeValue;
	    }

	    // do children
	    if (xml.hasChildNodes()) {
	        for (var i = 0; i < xml.childNodes.length; i++) {
	            var item = xml.childNodes.item(i);
	            var nodeName = item.nodeName;
	            if (typeof (obj[nodeName]) == "undefined") {
	                obj[nodeName] = xmlToJson(item);
	            } else {
	                if (typeof (obj[nodeName].push) == "undefined") {
	                    var old = obj[nodeName];
	                    obj[nodeName] = [];
	                    obj[nodeName].push(old);
	                }
	                obj[nodeName].push(xmlToJson(item));
	            }
	        }
	    }
	    return obj;
	},

	mapToJson: function (map) {
	   var resultJson = [];
	   var str = map.split('[{').join('').split('}]').join('');
	   //양끝 문자열 제거
	   var rows = str.split('}, {');
	   //str는 배열
	   for(var i = 0; rows.length > i; i++){
	     // rows 배열만큼 for돌림
	     var cols = rows[i].split(', ');
	     var rowData = {};
	     for(var j = 0; cols.length > j; j++){
	       var colData = cols[j];
	       colData = colData.trim();
	       var key = colData.substring(0, colData.indexOf("="));
	       var val = colData.substring(colData.indexOf("=") +1);
	       rowData[key] = val;
	     }
	     resultJson.push(rowData); }
	     return resultJson;
	},
	makeParam : function(webResult, formName){
	   if(formName == null || formName == undefined ){
	     formName = "mainForm" ;
	   }
	   if (webResult.params != null) {
	    for (key in webResult.params) {
	      var itmes = $("#" + key);
	      if (itmes != null) {
	        $("#" + key).val(webResult.params[key]);
	      } else {
	        $("#" + formName).add("<input type='hidden' name='" + key + "' value='" + webResult.params[key] + "'>");
	      }
	    }
	  }
	},
	postSend : function(webResult, formName){
	   if(formName == null || formName == undefined ){
         formName = "mainForm" ;
       }
       $("#" + formName).prop("action", webResult.moveUrl ).submit();
	},
	result : function(webResult){
       console.log(webResult);
       if(webResult != null){
          // Alert 메세지 있을 경우
          if(webResult.isAlert) {
            alert(webResult.alertMessage);
            // Confirm 있을 경우
            if(webResult.isConfirm) {
              if(confirm(webResult.confirmMessage)){
                if (webResult.isMove) {
                  if(webResult.isPost){
                    util.makeParam(webResult);
                    util.postSend(webResult) ;
                  } else {
                    document.location.href = webResult.moveUrl ;
                  }
                }
              }
            } else {
                // 이동이 있을 경우
              if (webResult.isMove) {
                if(webResult.isPost){
                    util.makeParam(webResult);
                    util.postSend(webResult) ;
                  } else {
                    document.location.href = webResult.moveUrl ;
                  }
              }
            }
          } else {
            // Alert 메세지 없을 경우
            if(webResult.isConfirm) {
              if(confirm(webResult.confirmMessage)){
                if (webResult.isMove) {
                  if(webResult.isPost){
                    util.makeParam(webResult);
                    util.postSend(webResult) ;
                  } else {
                    document.location.href = webResult.moveUrl ;
                  }
               }
             }
            }
          }
       }
    },
    // checkbox 박스 값설정 하기
    fnSetCheckBox : function(name, value, formId){
        if(value != null){
            if(formId == undefined || formId == null){
                $("input:radio[name='" + name + "'][value='" + value + "']").prop('checked', true);
            } else {
                $("#" + formId + " input:radio[name='" + name + "'][value='" + value + "']").prop('checked', true);
            }
	    } else {
	       if(formId == undefined || formId == null){
	           $("input:radio[name='" + name + "']").prop('checked', false);
	       } else {
	           $("#" + formId + " input:radio[name='" + name + "']").prop('checked', false);
	       }
	    }
    },
    fnSetCheckBoxForm : function(form, name, value){
        if(value != null){
	        $("#" + form + " input:radio[name='" + name + "'][value='" + value + "']").prop('checked', true);
	    } else {
	        $("#" + form + " input:radio[name='" + name + "']").prop('checked', false);
	    }
    },
    fnAjaxDefaultResult : function(webResult){
        if (webResult != null && webResult != undefined) {

        if (webResult.params != null) {
            for (key in webResult.params) {
                var itmes = $("#" + key );
                if (itmes != null) {
                    $("#" + key).val(webResult.params[key]);
                } else {
                    if($("#mainForm") == null){
                        var newForm = document.createElement('form');
                        newForm.name = 'mainForm';
                        newForm.method = 'post';
                        document.body.appendChild(newForm);
                        $("#mainForm").add("<input type='hidden' name='" + key + "' value='" + webResult.Params[key] + "'>");
                    } else {
                        $("#mainForm").add("<input type='hidden' name='" + key + "' value='" + webResult.Params[key] + "'>");
                    }
                }
            }
        }

        util.result(webResult);

      }
    },
    getBytes : function(inStr){
        console.log(inStr);
        if(inStr == undefined || inStr == null ) return 0 ;
        var str_character;
	    var int_char_count = 0;
	    var int_contents_length = inStr.length;

	    for (k = 0; k < int_contents_length; k++) {
	        str_character = inStr.charAt(k);
	        if (escape(str_character).length > 4)
	            int_char_count += 2;
	        else
	            int_char_count++;
	    }
        console.log(int_char_count);
	    return int_char_count;
    },
    alert : function(inAlert){
        alert(inAlert.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
    },
    ajaxErrorEvent : function(xhr, txtStatus, errorThrown){
        console.log(xhr);
        console.log(txtStatus);
        console.log(errorThrown);
        if (xhr.status == '403') {
            alert(js_cmm_login_fail_logout);
            document.href = Globals_Login_Url;
        } else {
            alert(js_cmm_login_fail_system);
        }
        return false;
    },
    paging : function(currentPageNo, totalRecordCount, pageSize, pageBlockSize, jsFunction){
	    var randerStr = "";

        if(jsFunction == undefined || jsFunction == null){
            jsFunction = "onMovePage" ;
        }

        if(pageSize == undefined || pageSize == null){
            if($("#pageSize") != null){
                pageSize = parseInt($("#pageSize").val()) ;
                if(isNaN(pageSize)){
                    pageSize = 10 ;
                }
            }
            pageSize = 10 ;
        }

        if(pageBlockSize == undefined && pageBlockSize == null){
            pageBlockSize = 10 ;
        }

/*
        <div class="paging">
            <a href="javascript:;" class="front" title="맨 앞"></a>
            <a href="javascript:;" class="prev" title="이 전"></a>
            <ul>
                <li class="active"><a href="javascript:;">1</a></li>
                <li><a href="javascript:;">2</a></li>
                <li><a href="javascript:;">3</a></li>
                <li><a href="javascript:;">4</a></li>
                <li><a href="javascript:;">5</a></li>
            </ul>
            <a href="javascript:;" class="next" title="다음"></a>
            <a href="javascript:;" class="last" title="맨끝"></a>
        </div>
*/
	    var firstPageLabel = "<a onclick=\"{0}({1}); return false; \" title=\"맨 앞\" class=\"front\"></a>";
	    var previousPageLabel = "<a onclick=\"{0}({1});return false; \" title=\"이 전\" class=\"prev\" ></a>";

	    var currentPageLabel = "<a ><strong>{0}</strong></a>";
	    var otherPageLabel = "<a onclick=\"{0}({1}); \">{1}</a>";

	    var nextPageLabel = "<a onclick=\"{0}({1}); \"  class=\"next\" title=\"다음\"></a>";
	    var lastPageLabel = "<a onclick=\"{0}({1}); \" class=\"last\" title=\"맨끝\"></a>";

	    var firstNoLabel = "<a class=\"front\" title=\"맨 앞\"></a>";
	    var previousNoLabel = "<a class=\"prev\" title=\"이 전\"></a>";
	    var nextNoLabel = "<a class=\"next\" title=\"다음\"></a>";
	    var lastNoLabel = "<a class=\"last\" title=\"맨끝\"></a>";

	    var point = "";
	    var trim = "";

        var totalPageCount = totalRecordCount == 0 ? 0 : Math.ceil( totalRecordCount / pageSize ) ;
        console.log(currentPageNo / pageBlockSize);

        var firstPageNo = ( Math.floor( currentPageNo / pageBlockSize ) * pageBlockSize ) + 1;
        var lastPageNo = ( Math.ceil( currentPageNo / pageBlockSize ) * pageBlockSize ) == 0 ? totalPageCount : ( Math.ceil( currentPageNo / pageBlockSize ) * pageBlockSize ) ;
        var previousPageNo = firstPageNo - pageBlockSize > 0 ? firstPageNo - pageBlockSize : 0 ;

        // 첫페이지
        if(totalPageCount > 0 ){
            randerStr += jQuery.validator.format(firstPageLabel, jsFunction, 1);
        } else {
            randerStr += firstNoLabel;
        }
        // 이전 블럭
        if( previousPageNo > 0 ){
             randerStr += jQuery.validator.format(previousPageLabel, jsFunction, previousPageNo);
        } else {
            randerStr += previousNoLabel;
        }
        // 페이지

        randerStr += "<ul>";

        for( i = firstPageNo; i <= lastPageNo ; i++){
            if( i > totalPageCount ) break ;
            if( i == currentPageNo ) {
            	randerStr += "<li class='active'>";
                randerStr += jQuery.validator.format(currentPageLabel, i);
            } else {
            	randerStr += "<li";
                randerStr += jQuery.validator.format(otherPageLabel, jsFunction, i);
            }

            randerStr += "</li>";

        }

        randerStr += "</ul>";

        // 다음 블럭
        if( totalPageCount > firstPageNo + pageBlockSize - 1 ){
            randerStr += jQuery.validator.format(nextPageLabel, jsFunction, firstPageNo + pageBlockSize );
        } else {
            randerStr += nextNoLabel;
        }
        // 마지막 페이지
        if( totalPageCount > currentPageNo ){
            randerStr += jQuery.validator.format(lastPageLabel, jsFunction, totalPageCount );
        } else {
            randerStr += lastNoLabel;
        }

	    return randerStr ;
	},
	fnPostSend : function(moveUrl, formId){
        if(formId == undefined || formId == null){
            formId = "mainForm" ;
        }

        $("#" + formId).prop('action', moveUrl).submit();
	},
	stringFormat : function(formatted) {
        var args = Array.prototype.slice.call(arguments, 1);
	    return formatted.replace(/{(\d+)}/g, function(match, number) {
	        return typeof args[number] != 'undefined' ? args[number] : match;
	    });
    },
    fileName : function(fileFullName) {
        var fileNameArray = fileFullName.split('\\');
        var fileName = fileNameArray[fileNameArray.length - 1];
        return fileName ;
    },
    formToJson : function(formId){
        var formSerializeArray = $('#' + formId ).serializeArray();
        var object = {};
        for (var i = 0; i < formSerializeArray.length; i++){
            object[formSerializeArray[i]['name']] = formSerializeArray[i]['value'];
        }
        return object;
    },
    fnFileSaveResult : function(webResult){
		console.log('---webResult.obj---');
		console.log(webResult.obj);
		if(webResult.obj != null){
            var keys = Object.keys(webResult.obj);
            for(i = 0 ; i < keys.length ; i++){
                $("#" + keys[i] + "fileId").val(webResult.obj[keys[i]]) ;
            }

            var divFile = $("div[name='_divFile']") ;
	        if(divFile != null){
	            for( i = 0 ; i < divFile.length ; i++){
	                var jsonData = new Object();
	                jsonData.name = $(divFile[i]).attr('id');
	                jsonData.id = $(divFile[i]).attr('id');

	                jsonData.fileCode = $("#" + jsonData.id + "FileCode").val();
	                jsonData.maxFileCount = $("#" + jsonData.id + "Info").attr('mxmmUploadSize');
	                jsonData.fileId = $("#" + jsonData.id + "fileId").val();
	                jsonData.isViweImage = $("#" + jsonData.id + "isViweImage").val() == 'true' ? true : false ;
	                var strData = JSON.stringify(jsonData) ;
	                $("ul[name=div" + jsonData.id + "]").remove();
	                $("ul[name=img" + jsonData.id + "]").remove();

	                ajax.jsonToAppendHtml('/cmm/file/fileReloadAjax.do', strData, jsonData.id );
	            }
	        }
		}


    },
    setPhone : function(phoneId) {
       if($("#" + phoneId + "tel1" ).val() != ""
            && $("#" + phoneId + "tel2" ).val() != ""
            && $("#" + phoneId + "tel3" ).val() != "" ){
            $("#" + phoneId).val($("#" + phoneId + "tel1" ).val() + $("#" + phoneId + "tel2" ).val() + $("#" + phoneId + "tel3" ).val() );
       } else {
           $("#" + phoneId).val('');
       }
    },
    onChangeEmailDomn : function(emailId) {
        $("#" + emailId + "email2" ).val($("#" + emailId + "email3" ).val());
    },
    setEmail : function(emailId){
        $("#" + emailId ).val( $("#" + emailId + "email1" ).val() + "@" + $("#" + emailId + "email2" ).val() );
    },


}

var StringBuffer = function() {
    this.buffer = new Array();
};

StringBuffer.prototype.append = function(str) {
    this.buffer[this.buffer.length] = str;
};

StringBuffer.prototype.toString = function() {
    return this.buffer.join("");
};


$(document).on("keyup", ".numberOnly", function() {
    $(this).val($(this).val().replace(/[^0-9]/gi, ""));
});


/**
 * 입력값이 특정 문자(chars)만으로 되어있는지 체크
 * 특정 문자만 허용하려 할 때 사용
 * ex) if (!containsCharsOnly(form.blood,"ABO")) {
 *         alert("혈액형 필드에는 A,B,O 문자만 사용할 수 있습니다.");
 *     }
 */
function containsCharsOnly(input,chars) {
    for (var inx = 0; inx < input.value.length; inx++) {
       if (chars.indexOf(input.value.charAt(inx)) == -1)
           return false;
    }
    return true;
}


/**
 * 입력값이 알파벳,숫자로 되어있는지 체크
 */
function isAlphaNum(input) {
    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    return containsCharsOnly(input,chars);
}



//