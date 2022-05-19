

var ajax = {
    // form post 형식으로 Ajax를 호출 한다.
    json: function (inUrl, inReturnFunction, inData, inFormId) {
        //$.blockUI();

        try {
            var header = $("meta[name='_csrf_header']").attr('content');
            var token = $("meta[name='_csrf']").attr('content');
            console.log("--------------")
            if( inData == undefined || inData == null){
                if(inFormId == undefined || inFormId == null){
                    inData = new FormData($("#mainForm")[0]);
                } else {
                    inData = new FormData($("#" + inFormId)[0]);
                }
            }

            console.log(inData)
            $.ajax({
                type: "post",
                url: _contextPath + inUrl,
                data: inData,
                dataType: "json",
                contentType: false,
                processData: false,
                cache: false,
                beforeSend: function(xhr){
                    //xhr.setRequestHeader(header, token);
                },
                success: function (webResult) {
                    console.log(webResult)
                	if (inReturnFunction == undefined || inReturnFunction == null || inReturnFunction == "") {
                		util.fnAjaxDefaultResult(webResult);
                    } else {
                        inReturnFunction(webResult);
                    }
                },
                error: function (xhr, txtStatus, errorThrown) {
                    return util.ajaxErrorEvent(xhr, txtStatus, errorThrown) ;
                }
            });
        } catch (ex) {
        	 console.log(ex)
        }
    },
    dataJson: function (inUrl, inData, inReturnFunction, inFormId) {
        //$.blockUI();
        console.log("dataJson...........................................");
    	try {
            var header = $("meta[name='_csrf_header']").attr('content');
	        var token = $("meta[name='_csrf']").attr('content');

            if( inData == undefined || inData == null){
		        if(inFormId == undefined || inFormId == null){
	                inData = new FormData($("#mainForm")[0]);
	            } else {
	                inData = new FormData($("#" + inFormId)[0]);
	            }
            }

	        $.ajax({
	            type: "post",
	            url: _contextPath + inUrl,
	            data: inData,
	            dataType: "json",
	            contentType: false,
	            processData: false,
	            cache: false,
	            beforeSend: function(xhr){
	                    //xhr.setRequestHeader(header, token);
	            },
	            success: function (webResult) {
	                //$.unblockUI();
	                if (inReturnFunction == undefined || inReturnFunction == null || inReturnFunction == "") {
	                	util.fnAjaxDefaultResult(webResult);
                    } else {
                        inReturnFunction(webResult);
                    }
	            },
	            error: function (xhr, txtStatus, errorThrown) {
	                return util.ajaxErrorEvent(xhr, txtStatus, errorThrown) ;
	            }
	        });
        } catch(e) {


        }

    },
    attFileJson: function (inUrl, inData, inReturnFunction, inFormId) {
        //$.blockUI();
        console.log("dataJson...........................................");
        try {
            var header = $("meta[name='_csrf_header']").attr('content');
            var token = $("meta[name='_csrf']").attr('content');

            if( inData == undefined || inData == null){
                if(inFormId == undefined || inFormId == null){
                    inData = new FormData($("#mainForm")[0]);
                } else {
                    inData = new FormData($("#" + inFormId)[0]);
                }
            }

            $.ajax({
                type: "post",
                url: _contextPath + inUrl,
                data: inData,
                dataType: "json",
                contentType: false,
                processData: false,
                cache: false,
                beforeSend: function(xhr){
                        //xhr.setRequestHeader(header, token);
                },
                success: function (webResult) {
                    util.fnFileSaveResult(webResult) ;

                    if (inReturnFunction == undefined || inReturnFunction == null || inReturnFunction == "") {
                        util.fnAjaxDefaultResult(webResult);
                    } else {
                        inReturnFunction(webResult);
                    }
                },
                error: function (xhr, txtStatus, errorThrown) {
                    return util.ajaxErrorEvent(xhr, txtStatus, errorThrown) ;
                }
            });
        } catch(e) {


        }

    },
    jsonToJson: function (inUrl, inReturnFunction, inData, inFormId) {
        //$.blockUI();
        try {
            var header = $("meta[name='_csrf_header']").attr('content');
            var token = $("meta[name='_csrf']").attr('content');
            if( inData == undefined || inData == null){
                if(inFormId == null || inFormId == undefined){
                    inData = new FormData($("#mainForm")[0]) ;
                } else {
                    inData = new FormData($("#" + inFormId)[0]);
                }
            }

            $.ajax({
                type: "post",
                url: _contextPath + inUrl ,
                data: inData,
                contentType: "application/json; charset=UTF-8",
                dataType: "json",
                beforeSend: function(xhr){
                    //xhr.setRequestHeader(header, token);
                },
                success: function (webReauest) {
                    console.log(webReauest);
                    if (inReturnFunction == undefined || inReturnFunction == null || inReturnFunction == "") {
                    	util.fnAjaxDefaultResult(webReauest);
                    } else {
                        inReturnFunction(webReauest);
                    }
                },
                error: function (xhr, txtStatus, errorThrown) {
                    return util.ajaxErrorEvent(xhr, txtStatus, errorThrown) ;
                }
            });
        } catch (ex) {
            //$.unblockUI();
		}
    },
    tableList: function (inUrl, tableId, inReturnFunction, inData, inFormId) {
        //$.blockUI();

        try {
            var header = $("meta[name='_csrf_header']").attr('content');
            var token = $("meta[name='_csrf']").attr('content');
            if( inData == undefined || inData == null){
                if(inFormId == null || inFormId == undefined){
                    inData = $('#mainForm').serialize();
                } else {
                    inData = $('#' + inFormId).serialize();
                }
            }

            $.ajax({
                type: "post",
                url: _contextPath + inUrl,
                data: inData,
                cache: false,
                dataType: "html",
                beforeSend: function(xhr){
                    //xhr.setRequestHeader(header, token);
                },
                success: function (html) {
                    $("#" + tableId + " tbody").html(html);

                    if (inReturnFunction == undefined || inReturnFunction == null || inReturnFunction == "") {
                        // onSetPageHtml();
                    } else {
                        inReturnFunction();
                    }
                },
                error: function (xhr, txtStatus, errorThrown) {
                    console.log('3333333333');
                    return util.ajaxErrorEvent(xhr, txtStatus, errorThrown) ;
                }
            });
        } catch (ex) {
            console.log(ex);
        }
    },
    moreList: function (inUrl, ulTagId, inReturnFunction, inData, inFormId) {
        //$.blockUI();

        try {
            var header = $("meta[name='_csrf_header']").attr('content');
            var token = $("meta[name='_csrf']").attr('content');
            if( inData == undefined || inData == null){
                if(inFormId == null || inFormId == undefined){
                    inData = $('#mainForm').serialize();
                } else {
                    inData = $('#' + inFormId).serialize();
                }
            }

            $.ajax({
                type: "post",
                url: _contextPath + inUrl,
                data: inData,
                cache: false,
                dataType: "html",
                beforeSend: function(xhr){
                    //xhr.setRequestHeader(header, token);
                },
                success: function (html) {

                	//console.log(html);
                    $("#" + ulTagId).append(html);

                    //$("#ulTagId .lst_in_li:last").after(resultHTML);

                    if (inReturnFunction == undefined || inReturnFunction == null || inReturnFunction == "") {
                        // onSetPageHtml();
                    } else {
                       inReturnFunction();
                    }
                },
                error: function (xhr, txtStatus, errorThrown) {
                    console.log('3333333333');
                    return util.ajaxErrorEvent(xhr, txtStatus, errorThrown) ;
                }
            });
        } catch (ex) {
            console.log(ex);
        }
    },
    jsonToHtml: function (inUrl, inData, targetHtmlId, inReturnFunction) {
        try {
            var header = $("meta[name='_csrf_header']").attr('content');
            var token = $("meta[name='_csrf']").attr('content');

            $.ajax({
                type: "post",
                url: _contextPath + inUrl ,
                data: inData,
                contentType: "application/json; charset=UTF-8",
                dataType: "html",
                beforeSend: function(xhr){
                    //xhr.setRequestHeader(header, token);
                },
                success: function (html) {
                    $("#" + targetHtmlId).html(html);
                    $('#' + targetHtmlId).show();
                },
                error: function (xhr, txtStatus, errorThrown) {
                    return util.ajaxErrorEvent(xhr, txtStatus, errorThrown) ;
                }
            });
        } catch (ex) {
            //$.unblockUI();
        }
    },
    jsonToLayerHtml: function (inUrl, inData, targetHtmlId, inReturnFunction) {
        try {
            var header = $("meta[name='_csrf_header']").attr('content');
            var token = $("meta[name='_csrf']").attr('content');

            $.ajax({
                type: "post",
                url: _contextPath + inUrl ,
                data: inData,
                contentType: "application/json; charset=UTF-8",
                dataType: "html",
                beforeSend: function(xhr){
                    //xhr.setRequestHeader(header, token);
                },
                success: function (html) {
                    $("#" + targetHtmlId).html(html);
                    $('#' + targetHtmlId).show();
                    $('body').addClass('fixed');
                },
                error: function (xhr, txtStatus, errorThrown) {
                    return util.ajaxErrorEvent(xhr, txtStatus, errorThrown) ;
                }
            });
        } catch (ex) {
            //$.unblockUI();
        }
    },
    jsonToAppendHtml: function (inUrl, inData, targetHtmlId, inReturnFunction) {
        try {
            var header = $("meta[name='_csrf_header']").attr('content');
            var token = $("meta[name='_csrf']").attr('content');

            $.ajax({
                type: "post",
                url: _contextPath + inUrl ,
                data: inData,
                contentType: "application/json; charset=UTF-8",
                dataType: "html",
                beforeSend: function(xhr){
                    //xhr.setRequestHeader(header, token);
                },
                success: function (html) {
                    $("#" + targetHtmlId).append(html);
                },
                error: function (xhr, txtStatus, errorThrown) {
                    return util.ajaxErrorEvent(xhr, txtStatus, errorThrown) ;
                }
            });
        } catch (ex) {
            //$.unblockUI();
        }
    },
    dataToHtml: function (inUrl, inData, targetHtmlId, inReturnFunction, inFormId) {
        //$.blockUI();

        try {
            var header = $("meta[name='_csrf_header']").attr('content');
            var token = $("meta[name='_csrf']").attr('content');
            if( inData == undefined || inData == null){
                if(inFormId == null || inFormId == undefined){
                	inData = new FormData($("#mainForm")[0]) ;
                } else {
                    inData = new FormData($('#' + inFormId)[0]);
                }
            }
            $.ajax({
                type: "post",
                url: _contextPath + inUrl,
                data: inData,
                cache: false,
                dataType: "html",
                beforeSend: function(xhr){
                    //xhr.setRequestHeader(header, token);
                },
                success: function (html) {
                    $("#" + targetHtmlId ).html(html);

                    if (inReturnFunction == undefined || inReturnFunction == null || inReturnFunction == "") {
                        // util.fnAjaxDefaultResult(html);
                    } else {
                        inReturnFunction();
                    }
                },
                error: function (xhr, txtStatus, errorThrown) {
                    return util.ajaxErrorEvent(xhr, txtStatus, errorThrown) ;
                }
            });
        } catch (ex) {
            console.log(ex);
        }
    },
    tabHtml: function (inUrl, menuCode, inForm, inReturnFunction, inTabContents) {
        //$.blockUI();
        try {
			var inData = null ;
			if( inForm == undefined || inForm == null){
				inData = $('#mainForm').serialize();
			} else {
				inData = $('#' + inForm).serialize();
			}

            //console.log(inData);
            $.ajax({
                type: "post",
                url: _contextPath + inUrl ,
                data: inData,
                cache: false,
    		    dataType: "html",
                success: function (html) {

                    if (menuCode == undefined || menuCode == null || menuCode == ''){

					} else {
						$("li[name=liClass]").prop("class", "");
        	    		$("#" + menuCode).prop("class", "on");
					}

                    if (inTabContents == undefined || inTabContents == null || inTabContents == ''){
						$("#tabContents").html(html);
					} else {
						$("#" + inTabContents).html(html);
					}

                    if (inReturnFunction == undefined || inReturnFunction == null || inReturnFunction == "") {
                        util.fnAjaxDefaultResult(menuCode);
                    } else {
                        inReturnFunction(menuCode);
                    }
                },
                error: function (xhr, txtStatus, errorThrown) {
                    return util.ajaxErrorEvent(xhr, txtStatus, errorThrown) ;
                }
            });
        } catch (ex) {
            //$.unblockUI();
		}
    },
}