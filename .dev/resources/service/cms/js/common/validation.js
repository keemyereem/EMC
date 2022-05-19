var validation = {
	// Input 값을 가지고 처리 한다.
	// inStr : 입력 값
	// inMsg : alert 문자열
	// inObj : 선택 Object
	inputStr: function (inStr, inMsg, inObj, inMinLength, inMaxLength) {
		if (inStr != null || inStr.length != 0) {
            var inStrLength = util.getBytes(inStr);
            var maxLangth = inMaxLength == undefined ? 999999999 : inMaxLength;
            var minLangth = inMinLength == undefined ? 0 : inMinLength;
            if (!(minLangth <= inStrLength && maxLangth >= inStrLength)) {
                if (minLangth <= inStrLength) {
                    alert(inMsg + ' ' + minLangth + '자 이상으로 작성해 주세요.');
                    return false;
                } else {
                    alert(inMsg + ' ' + maxLangth + '자 미만으로 작성해 주세요.');
                    return false;
                }
            }

		} else {
            alert(inMsg);
            if (inObj != null && inObj != undefined) {
                $("#"+inObj).focus();
            }
			return false;
		}
		return true;
	},
	// Input ID를 기준으로 한다.
	inputObj: function (inObjId, inMsg, inMinLength, inMaxLength ) {
		var inObj = $("#" + inObjId);
		try {
			if (inObj != null && inObj.val() != '') {
				var inStrLength = util.getBytes(inObj.val());
				var minLangth = inMinLength == undefined ? 0 : inMinLength;
				var maxLangth = inMaxLength == undefined ? 999999999 : inMaxLength;
				if (!(minLangth <= inStrLength && maxLangth >= inStrLength)) {
					if (minLangth < inStrLength) {
						alert(inMsg + ' ' + minLangth + '자 이상으로 작성해 주세요.');
						return false;
					} else {
						alert(inMsg + ' ' + maxLangth + '자 미만으로 작성해 주세요.');
						return false;
					}
				}
			} else {
				alert(inMsg);
				return false;
			}
		} catch (e) {
			alert('Validation 처리중 오류가 발생 하였습니다.');
			return false;
		}
		return true;
	},
	checkBox: function (inObjId, inMsg) {
		try {
			if ($("#" + inObjId) != null && $("#" + inObjId).is(":checked") == false) {
				alert(inMsg);
				return false;
			}
		} catch (e) {
			alert('Validation 처리중 오류가 발생 하였습니다.');
			return false;
		}
		return true;
	},
	// Radio Name를 기준으로 한다.
	radioName: function (inName, inMsg) {
		var rad = document.getElementsByName(inName);
		if (rad != null && rad.length > 0) {
			for (i = 0; i < rad.length; i++) {
				if (rad[i].checked) {
					return true;
				}
			}
		} else {
			return true;
		}
		alert(inMsg);
		return false;
	},
	// Radio From Nmae 를 기준으로 한다.
	radioFromName: function (formId, inName, inMsg) {
		var rad = $("#" + formId + " input:radio[name='" + inName + "']") ;
		if (rad != null && rad.length > 0) {
			for (i = 0; i < rad.length; i++) {
				if (rad[i].checked) {
					return true;
				}
			}
		} else {
			return true;
		}
		alert(inMsg);
		return false;
	},
	// 이메일 검사
	validateEmail: function (inEmailId, isRequired, inMsg, inErrorMsg) {
		try {
			var inEmail = $("#" + inEmailId);
			if (isRequired == undefined || ! isRequired) {
				if (inEmail == null || inEmail.val() == '') {
					alert(inMsg == null || inMsg == undefined || inMsg == '' ? '이메일을 적어 주세요.' : inMsg);
					inEmail.focus();
					return false;
				} else {
					var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
					if (re.test(inEmail.val())) {
						return true;
					} else {
						alert(inErrorMsg == null || inErrorMsg == undefined ? '이메일이 형식에 맞지 않습니다.' : inErrorMsg);
						inEmail.focus();
						return false;
					}
				}
			}
			else
			{
				if (inEmail != null && inEmail.value != '')
				{
					var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
					if (re.test(inEmail.val())) {
						return true;
					} else {
						alert(inErrorMsg == null || inErrorMsg == undefined ? '이메일이 형식에 맞지 않습니다.' : inErrorMsg);
						inEmail.focus();
						return false;
					}
				}
			}
		}
		catch (e) {
			alert('이메일 처리중 오류가 발생 하였습니다.');
			return false;
		}
	},
	// 숫자만 입력
	validateNumber: function (inObjNm, inMsg) {
		var regexp = /^[0-9]*$/
		v = $("#" + inObjNm).val();
		if (!regexp.test(v)) {
			alert(inMsg);
			$("#" + inObjNm).focus();
			return false;
		}
		return true;
	},
	// 전화번호 검사
	validatePhonNum: function (inObjNm, inMsg) {
		var inObj = document.getElementById(inObjNm);
		if (inObj == null || inObj.value == '') {
			alert(inMsg);
			inObj.focus();
			return false;
		} else {
			inObj.value.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g)
			var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

			if (!regExp.test(inObj.value)) {
				alert(inMsg == null || inMsg == undefined ? '전화번호 형식에 맞지 않습니다.' : inMsg);
				inObj.focus();
				return false;
			} else {
				inObj.value = inObj.value.replace(/\-/g, '').replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");

				return true;
			}
		}
	},
	// 날자 크기 비요
	validateTerm: function (startDate, endDate, checkLength, inMsgOne, inMsgTwo) {
		if (startDate.length != checkLength || endDate.length != checkLength) {
			alert(inMsgOne == null || inMsgOne == undefined || inMsgOne.length == 0 ? '날짜가 형식에 맞지 않습니다.' : inMsgOne);
			return false;
		}
		if (startDate > endDate) {
			alert(inMsgTwo == null || inMsgTwo == undefined || inMsgTwo.length == 0 ? '시작 일자가 종료 일자보다 큽니다.' : inMsgTwo);
			return false;
		}
		return true;
	},
	// 비밀번호 검사
	validatePassword: function (idObjNm, pwdObjNm, comPwdObjNm) {
		var idObj = document.getElementById(idObjNm);
		var pwdObj = document.getElementById(pwdObjNm);
		var comPwdObj = document.getElementById(comPwdObjNm);

		var pw = pwdObj.value;
		var id = idObj.value;
		var checkNumber = pw.search(/[0-9]/g);
		var checkEnglish = pw.search(/[a-z]/ig);
		if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw)) {
			alert('암호는 대문자와 소문자 알파벳, 숫자, 특수 문자를 포함할 수 있으며 8자 이상이어야 합니다.');
			return false;
		} else if (checkNumber < 0 || checkEnglish < 0) {
			alert("암호는 대문자와 소문자 알파벳, 숫자, 특수 문자를 포함할 수 있으며 8자 이상이어야 합니다.");
			return false;
		} else if (/(\w)\1\1\1/.test(pw)) {
			alert('동일한 문자를 네 번 이상 사용할 수 없습니다.');
			return false;
		} else if (id.length > 2 && pw.search(id) > -1) {
			alert("비밀번호에 ID가 포함 되어 있습니다.");
			return false;
		} else {
			if (pw != comPwdObj.value) {
				alert("입력한 비밀번호가 동일하지 않습니다. 다시 확인해 주세요.");
				return false;
			} else {
				return true;
			}

		}
	},
	// 비밀번호 검사 실시간 테스트 반환
	validatePasswordText: function (idObjNm, pwdObjNm, comPwdObjNm, guideObjNm) {

		var idObj = document.getElementById(idObjNm);
		var pwdObj = document.getElementById(pwdObjNm);
		var comPwdObj = document.getElementById(comPwdObjNm);
		var guideObjNmObj = document.getElementById(guideObjNm);

		var pw = pwdObj.value;
		var id = idObj.value;
		var pwCom = comPwdObj.value;
		var checkNumber = pw.search(/[0-9]/g);
		var checkEnglish = pw.search(/[a-z]/ig);

		var guideText = "";

		if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pw)) {
			guideText = '암호는 대문자와 소문자 알파벳, 숫자, 특수 문자를 포함할 수 있으며 8자 이상이어야 합니다.';
		} else if (checkNumber < 0 || checkEnglish < 0) {
			guideText = "암호는 대문자와 소문자 알파벳, 숫자, 특수 문자를 포함할 수 있으며 8자 이상이어야 합니다.";
		} else if (/(\w)\1\1\1/.test(pw)) {
			guideText = '동일한 문자를 네 번 이상 사용할 수 없습니다.';
		} else if (id.length > 2 && pw.search(id) > -1) {
			guideText = "비밀번호에 ID가 포함 되어 있습니다.";
		} else {

			if (pwCom.length > 3) {
				if (pw != pwCom) {
					guideText = "입력한 비밀번호가 동일하지 않습니다. 다시 확인해 주세요.";
				} else {
					guideText = "";
				}
			}

		}

		guideObjNmObj.innerHTML = guideText;

	},
	// 파일 확장자
	validateFile: function (idObjNm, inType, inMsg) {
		var inObj = document.getElementById(idObjNm);
		if ($('#' + inObj.id).val() == "") {
			alert(inMsg);
			inObj.focus();
			return false;
		} else {
			var ext = $('#' + inObj).val().split('.').pop().toLowerCase();
			if (inType == 'doc') {
				if ($.inArray(ext, ['doc', 'docx', 'pdf', 'ppt', 'pptx']) == -1) {
					alert('You can only upload doc,docx,pdf,ppt files.');
					return false;
				}
			} else if (inType == 'img') {
				if ($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
					alert('gif,png,jpg,jpeg upload doc,docx,pdf,ppt files.');
					return false;
				}
			}
		}
		return true;
	},
	// 전화번호 확인
	isPhone : function(phoneId, isDefault, errorMessage) {
	   var tel1 = $("#" + phoneId + "tel1" ).val() ;
	   var tel2 = $("#" + phoneId + "tel2" ).val() ;
	   var tel3 = $("#" + phoneId + "tel3" ).val() ;
	   var tel = $("#" + phoneId ).val() ;

       if( isDefault ){
            if( tel1 != "" && tel2 != "" && tel3 != ""){
                if(!isPhone(tel)){
                    alert(errorMessage);
                    return false;
                }
            } else {
                alert(errorMessage);
            }
       } else {
            if( tel1 == "" && tel2 == "" && tel3 == ""){

            } else {
                if(!isPhone(tel)){
                    alert(errorMessage);
                    return false;
                }
            }
       }
        return true;

	},
	checkFile : function(fileId){
		// 파일의 최대 수를 확인 한다.
		var minFileCount = $("#" + fileId + "Info").attr('minFileCount') ;
		var maxFileCount = $("#" + fileId + "Info").attr('maxFileCount') ;
		var deleteObjects = $("input[name='" + fileId + "deleteAt']") ;
		var fileArrCnt = 0 ;
		for( i = 0 ; i < deleteObjects.length ; i++){
		   if( $(deleteObjects[i]).val() == 'N' ){
		       fileArrCnt++ ;
		   }
		}

		if(minFileCount > fileArrCnt ){
		     if( minFileCount == "1" ){
		          alert("파일은 필수 등록 사항 입니다.");
		     } else {
		          alert("파일은 최소 " + minFileCount + "개 이상을 등록해야합니다.");
		     }
             return false ;
        }
        return true;
	}
}

function validateInputNumber(object) {
	$(object).keyup(function () {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
}

function fnValidateInputNumber(object) {
	$(object).val($(object).val().replace(/[^0-9]/g, ""));
}

function isPhone(phoneNum) {
	var regExp = /(02)([0-9]{3,4})([0-9]{4})$/;
	var myArray;
	if (regExp.test(phoneNum)) {
		myArray = regExp.exec(phoneNum);
		return true;
	} else {
		regExp = /(0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
		if (regExp.test(phoneNum)) {
			myArray = regExp.exec(phoneNum);
			return true;
		} else {
			return false;
		}
	}
}

function fnSendSetForm(action) {
	var sendForm = $('<form></form>');
	$(sendForm).attr('action', action);
	$(sendForm).attr('method', 'post');
	$(sendForm).appendTo('body');
	return sendForm;
}

function fnSendSetHidden(inName, inValue) {
	var hidden = $('<input type="hidden" ></>');
	hidden.attr('name', inName);
	hidden.attr('value', inValue);
	return hidden;
}

function fnGetListForm(action) {
	var form = fnSendSetForm(action);
	var sendParam = $("input[method=search]");
	for (i = 0; i < sendParam.length; i++) {
		$(form).append(fnSendSetHidden($(sendParam[i]).attr('sendName'), sendParam[i].value));
	}
	return form;
}

function lpad(str, padLen, padStr) {
	if (padStr.length > padLen) {
		return str;
	}
	str += ""; // 문자로
	padStr += ""; // 문자로
	while (str.length < padLen)
		str = padStr + str;
	str = str.length >= padLen ? str.substring(0, padLen) : str;
	return str;
}

/**
 * 우측문자열채우기
 * @params
 *  - str : 원 문자열
 *  - padLen : 최대 채우고자 하는 길이
 *  - padStr : 채우고자하는 문자(char)
 */
function rpad(str, padLen, padStr) {
	if (padStr.length > padLen) {
		return str + "";
	}
	str += ""; // 문자로
	padStr += ""; // 문자로
	while (str.length < padLen)
		str += padStr;
	str = str.length >= padLen ? str.substring(0, padLen) : str;
	return str;
}

