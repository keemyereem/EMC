<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<%@ taglib prefix="file" uri="/WEB-INF/tlds/fileLib.tld"%>

<form name="mainForm" id="mainForm" method="post">
    <input type="hidden" name="<c:out value='${_csrf.parameterName}' />" value="<c:out value='${_csrf.token}' />" />
    <input type="hidden" id="bbsNo" name="bbsNo" value="<c:out value='${webResult.params.bbsNo}' />" />
    <input type="hidden" id="nttNo" name="nttNo" />

    <input type="hidden" id="MENUNO" name="MENUNO" value="<c:out value='${webResult.params.MENUNO}' />" />
    <input type="hidden" id="MENUID" name="MENUID" value="<c:out value='${webResult.params.MENUID}' />" />

    <div class="sub_visual invest_visual">
                <div class="sub_visual_nav">
                    <h2>투자정보</h2>
                    <div class="sub_visual_nav_prev">
                        <a href="javascript:link(3,0);" title="이전메뉴로 이동">
                            <span>지속가능경영</span>
                            <img src="/resources/service/env/images/common/sub_visual_nav_prev.png" alt="sub_visual_nav_prev">
                        </a>
                    </div>
                    <div class="sub_visual_nav_next">
                        <a href="javascript:link(5,0);" title="다음메뉴로 이동">
                            <img src="/resources/service/env/images/common/sub_visual_nav_next.png" alt="sub_visual_nav_next">
                            <span>인재채용</span>
                        </a>
                    </div>
                </div>

                <!--
                <div class="sub_visual_m">
                    <h2>투자정보</h2>
                    <div class="location">
                        <a href="javascript:;" class="loccation_tit" title="하위메뉴열기">공고</a>
                        <div class="drop_box">
                            <ul>
                                <li><a href="javascript:;" title="페이지 이동">매출 및 이익추이</a></li>
                                <li><a href="javascript:;" title="페이지 이동">재무재표</a></li>
                                <li><a href="javascript:;" title="페이지 이동">공시정보</a></li>
                                <li class="active"><a href="javascript:;" title="페이지 이동">공고</a></li>
                                <li><a href="javascript:;" title="페이지 이동">주가현황</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                -->

                <div class="sub_visual_menu">
                    <div class="home"></div>

                </div>
            </div>

            <jsp:include page="/WEB-INF/view/cms/cmm/include/listSrarch.jsp" />

            <div class="contents cont_invest">
                <div class="contents_inner">

                    <div class="icon" data-aos="fade-up">
                        <img src="/resources/service/env/images/invest/disclosure_tit_icon.png" alt="타이틀 아이콘">
                    </div>

                    <h3 class="title" data-aos="fade-up" data-aos-offset="200"><c:out value='${bbsMstDtl.bbsNm}' /></h3>

                    <div class="irsearch_contents sub_contents">

                        <div class="inner">

	                        <div class="search">
	                            <div class="input_row input_search">
	                                <input type="text" id="searchText" name="searchText" placeholder="검색어를 입력해 주세요." value="<c:out value='${webResult.params.searchText}' />" />
	                                <a href="javascript:fn_search();"><img src="/resources/service/env/images/common/icon_inp_search.png" alt="검색"></a>
	                            </div>
	                        </div>

	                            <div class="news_list">
	                                <ul id="ul-list">
	                                    <%@ include file="/WEB-INF/view/cms/bbs/data/import/bbsDataListAjax.jsp" %>
	                                </ul>
	                                <div id="btn-more" class="btn_more">
	                                    <a href="javascript:onViewMore();">
	                                        <div class="icon"><i></i><i></i></div>
	                                        <span id="moreListSpan"></span>
	                                    </a>
	                               </div>
	                            </div>

                        </div>
                    </div>
                </div>
            </div>
    <input type="text" style="display:none;"/>
</form>

<script>

    currentPageNum(4,0);

    $("#searchText").on("keyup",function(key){
        if(key.keyCode==13) {
            fn_search();
            return false;
        }
    });

    function fn_search() {

    	$("#pageSize").val(6);
    	$("#currentPageNo").val(1);

    	onMakeNewMoreList();

    }

    function onMakeNewMoreList() {

    	$("#ul-list").html("");

        ajax.moreList("<c:url value="/bbs/data/import/bbsDataListAjax.do" />", "ul-list", fn_viewMoreResult);
    }

   function onViewMore() {

	   let pageSize = $("#pageSize").val();
	   let currentPageNo = parseInt($("#currentPageNo").val());

	   currentPageNo = currentPageNo + 1;

	   $("#currentPageNo").val(currentPageNo) ;

       onMakeMoreList();
   }

   function onMakeMoreList() {
       ajax.moreList("<c:url value="/bbs/data/import/bbsDataListAjax.do" />", "ul-list", fn_viewMoreResult);
   }

   function fn_viewMoreResult() {

	   let totalCnt = $('#valTotalRecordCount').val();
	   let showCnt = $('#ul-list > li').size();

	   $("#moreListSpan").html("more list (" + showCnt + " / " + totalCnt + ")");

       if (showCnt >= totalCnt || totalCnt  == 0 || totalCnt == "0") {
    	    $("#btn-more").css("display", "none");
       } else {
    	   $("#btn-more").css("display", "block");
       }

   }

   function onView(nttNo) {
       $("#nttNo").val(nttNo) ;
       util.fnPostSend('<c:url value="/bbs/data/bbsDataView.do" />') ;
   }

   $(document).ready(function () {
       fn_viewMoreResult();

       const prevViewNttNo = "<c:out value='${webResult.params.nttNo}' />";
       if (prevViewNttNo != "" && $("#bbs-data-" + prevViewNttNo).length == 1) {
    	   var offset = $("#bbs-data-" + prevViewNttNo).offset();
    	   $("html").animate({scrollTop : offset.top - 400}, 400);
       }
   });
</script>