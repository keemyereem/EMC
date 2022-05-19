<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>      
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="file" uri="/WEB-INF/tlds/fileLib.tld"%>

<link type="text/css" href="/resources/service/env/css/swiper.css" rel="stylesheet">
<link type="text/css" href="/resources/service/env/css/swiper.min.css" rel="stylesheet">    
<script type="text/javascript" src="/resources/service/env/js/lib/swiper.js"></script>
<script type="text/javascript" src="/resources/service/env/js/lib/swiper.min.js"></script>
		
		<div class="sub_visual business_visual">
                <div class="sub_visual_nav">
                    <h2>사업소개</h2>
                    <div class="sub_visual_nav_prev">
                        <a href="javascript:link(1,0);" title="이전메뉴로 이동">
                            <span>회사소개</span>
                            <img src="/resources/service/env/images/common/sub_visual_nav_prev.png" alt="sub_visual_nav_prev">
                        </a>
                    </div>
                    <div class="sub_visual_nav_next">
                        <a href="javascript:link(3,0);" title="다음메뉴로 이동">
                            <img src="/resources/service/env/images/common/sub_visual_nav_next.png" alt="sub_visual_nav_next">
                            <span>지속가능경영</span>
                        </a>
                    </div>
                </div>  
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
                <div class="sub_visual_menu">
                    <div class="home"></div>
                    
                </div>
            </div>
            
<form name="mainForm" id="mainForm" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" id="searchBsnsintrcnCode" name="searchBsnsintrcnCode" value="<c:out value="${webResult.params.searchBsnsintrcnCode}" />" />
    <input type="hidden" id="searchClCode" name="searchClCode" value="<c:out value="${webResult.params.searchClCode}" />" />
    <input type="hidden" id="bsnsintrcnNo" name="bsnsintrcnNo" value="<c:out value="${webResult.params.bsnsintrcnNo}" />" />
    
    <input type="hidden" id="searchCtgryNo" name="searchCtgryNo" value="<c:out value="${webResult.params.searchCtgryNo}" />" />
    <input type="hidden" id="strLocale" name="strLocale" value="<c:out value="${webResult.params.strLocale}" />" />
    <input type="hidden" id="section_no" name="section_no" value="1" />
    <input type="hidden" id="slide_no" name="slide_no" value="" />
    
    <input type="hidden" id="currentPageNo" name="currentPageNo" value="1" />
    <input type="hidden" id="totalPageCount" name="totalPageCount" value="" />
            
            <div class="contents cont_business">
                <div class="contents_inner onm_inner">
                    <div class="icon" data-aos="fade-up">
                        <img src="/resources/service/env/images/business/businessIntro_tit_icon.png" alt="타이틀 아이콘">
                    </div>
                    <h3 class="title" data-aos="fade-up" data-aos-offset="200">
                    	<c:if test="${webResult.params.searchBsnsintrcnCode eq 'A012001'}">환경기초시설 O&M</c:if>
                        <c:if test="${webResult.params.searchBsnsintrcnCode eq 'A012002'}">환경건설</c:if>
                    </h3>
                    <div class="tit_line"></div>
                    <div class="business_contents sub_contents">
                        <div class="inner">
                            <section class="section1">
                                <p class="sub_con">
                                <c:choose>
                                    <c:when test="${webResult.params.searchBsnsintrcnCode eq 'A012001'}">
                                    환경시설관리주식회사는 대한민국의 환경분야 <b>기초시설 운영관리 선두주자</b>로서,<br class="br_pc" />
                                    더 맑고 깨끗한 환경에서 국민들이 행복한 생활을 영위할 수 있도록<br class="br_pc" />
                                    환경과 관련한 다양한 사업을 추진하고 있습니다. 
                                    </c:when>
                                    <c:otherwise>
                                     환경시설관리주식회사는 1997년 설립 이래 <br class="br_m">20여 년간 축적된 설계, 시공, 운영 경험을 바탕으로<br class="br_pc">
                                    보다 효율적이고 <b>경제적 처리기술 개발</b>에 많은 투자와 노력을 기울이고 있으며,<br class="br_pc">
                                    <b>환경시설 신설/개량 사업</b>에 적극 참여, <br class="br_m">소중한 공공자
                                    
                                    </c:otherwise>
                                 </c:choose>
                                </p>
                                <div class="nav_btn_wrap" data-aos="fade-up" data-aos-duration="600" data-aos-offset="500">
                                
                                <ul class="nav_btn">
                                    <c:forEach var="item" items="${cateList}" varStatus="i" >
                                    
                                    <li class="<c:if test="${i.count eq 1 }">on</c:if>">
                                        <a href="javascript:fnCategoryList('<c:out value="${item.code}" />','<c:out value="${i.count}" />');">
                                            
                                            <div class="icon">
                                                <c:choose>
                                    			<c:when test="${webResult.params.searchBsnsintrcnCode eq 'A012001'}">
                                                <img src="/resources/service/env/images/business/onm_icon0<c:out value="${i.count}" />.png" alt="onm_icon0<c:out value="${i.count}" />">
                                                <img src="/resources/service/env/images/business/onm_icon0<c:out value="${i.count}" />_on.png" alt="onm_icon0<c:out value="${i.count}" />_on">
                                                </c:when>
			                                    <c:otherwise>
			                                    <img src="/resources/service/env/images/business/envir_icon0<c:out value="${i.count}" />.png" alt="envir_icon0<c:out value="${i.count}" />">
                                                <img src="/resources/service/env/images/business/envir_icon0<c:out value="${i.count}" />_on.png" alt="envir_icon0<c:out value="${i.count}" />_on">
			                                    </c:otherwise>
			                                 </c:choose>
                                            </div>
                                            <p class="nav_tit">
                                                <c:out value="${item.codeNm }" />                                                   
                                            </p>
                                        </a>
                                    </li>
                                    </c:forEach>
                                    
                                     
                                </ul>
                            </div>
                            </section>
                            
                            <section class="section2">
                                <c:forEach var="item" items="${cateList}" varStatus="i" >
                                <div class="nav_box box0<c:out value="${i.count}" /><c:if test="${i.count eq 1 }"> on</c:if>"  id="section2_<c:out value="${i.count}" />">
                                
                                </div>
                                </c:forEach>
                             </section>
                             
                                
                                 
                        </div>
                    </div>
                </div>
                <section class="bus_section3">
                    <div class="search">
                        <div class="input_row input_search">
                            <input type="text" id="searchText" name="searchText" value="<c:out value="${webResult.params.searchText}" />" placeholder="검색어를 입력해 주세요." />
                            <a href="javascript:fnSearchList();"><img src="/resources/service/env/images/common/icon_inp_search.png" alt="검색"></a>
                        </div>
                    </div>
                    <div data-aos="fade-up" data-aos-easing="ease-in-sine" data-aos-once="true" class="onm_list_wrap">
                        <div class="onm_list onm_list01 on">
                            <ul id ="ul-list">
                            	                               
                            </ul>
                        </div>
                         
                    </div>
                    
                    <div id="btn-more" class="btn_more">
                          <a href="javascript:onViewMore();">
                              <div class="icon"><i></i><i></i></div>
                              <span>more list</span>
                          </a>
                     </div>

                     
                </section>
            </div>

			<!-- popup -->
			<%// O&M - 6하수관거BTL 외 %>
            <div class="popup card_popup card_popup01">
                <div class="popup_inner">
                    <div class="pop_close"><a href="javascript:;">닫기</a></div>
                    <div class="pop_cont" id="popData1">   
                        
                    </div>
                </div>
            </div>
			<%// O&M - 6하수관거BTL %>
            <div class="popup card_popup card_popup02">
                <div class="popup_inner">
                    <div class="pop_close"><a href="javascript:;">닫기</a></div>
                    <div class="pop_cont" id="popData2">   
                        
                    </div>
                </div>
            </div>            
            <%// 환경 건설 %>
            <div class="popup card_popup card_const">
                <div class="popup_inner">
                    <div class="pop_close"><a href="javascript:;">닫기</a></div>
                    <div class="pop_cont" id="popData3">   
                         
                    </div>
                </div>
            </div>
            <!-- //popup -->
            
            
 </form> 
<script>
	$(function () {
		//onmEvent.init();
		currentPageNum('<c:out value="${webResult.params.MENUNO}" />','<c:out value="${webResult.params.SUB_MENUNO}" />');  // 로케이션 세팅   		
		fnCategoryList('','1'); 	 // 첫번재 카테고리 호출
	});
    
    // 검색 
    function fnSearchList(){
    	/* if( $("#searchText").val() == "" ){
    		alert("검색어를 입력해 주세요.");
    		$("#searchText").focus();
    		return;
    	} */
    	$.ajax({
			type : "POST",
			url : "/env/bsnsintrcn/import/bsnsintrcnListSearchAjax.do",
			data : $('#mainForm').serialize(),
			success : function(data) {
				//console.log(data);
				 $("#ul-list").html(data);				 
				 fn_viewMoreResult();
			},
			error : function(error) {
				alert(error.responseText);
			}
		});   
    	
    }
 	// 더보기 버튼 클릭
    function onViewMore() {
        var currentPageNo = parseInt($("#currentPageNo").val())+1;
        $("#currentPageNo").val(currentPageNo) ;
        onMakeMoreList();
    }
    
    // 더보기 리스트 가져오기
    function onMakeMoreList() {
    	console.log("onMakeMoreList...............................start");
        //ajax.moreList("<c:url value="/env/bsnsintrcn/import/bsnsintrcnListSearchAjax.do" />", "ul-list", fn_viewMoreResult);
        
    	$.ajax({
			type : "POST",
			url : "/env/bsnsintrcn/import/bsnsintrcnListSearchAjax.do",
			data : $('#mainForm').serialize(),
			success : function(data) {
				//console.log(data);
				 $("#ul-list").append(data);
				 fn_viewMoreResult();
			},
			error : function(error) {
				alert(error.responseText);
			}
		});   
    }

    function fn_viewMoreResult() {
		console.log("currentPageNo.............."+ $('#currentPageNo').val() );
		console.log("totalPageCount.............."+ $('#totalPageCount').val() );		
        if (parseInt($('#currentPageNo').val()) >= parseInt($('#totalPageCount').val()) ) {
             $("#btn-more").hide();
        } else {
        	$("#btn-more").show();        	
        }

    }
     
	// 상세 화면 페이어 팝업
    function fn_viewDtl(bsnsintrcnNo,bsnsintrcnCode,ctgryNo){
        var layerNo    = 1;
        var layerCssNm = "card_popup01";
        
        if(bsnsintrcnCode=="A012001"){
        	// O&M
            if(ctgryNo==null||ctgryNo==""){
                layerNo    = 2;
                layerCssNm = "card_popup02";
            }else{
                layerNo    = 1;
                layerCssNm = "card_popup01";
            }   
        } else {
        	layerNo    = 3; // 환경 건설
        	layerCssNm = "card_const";
        }
        
        $("#bsnsintrcnNo").val(bsnsintrcnNo);
        $.ajax({
			type : "POST",
			url : "/env/bsnsintrcn/import/bsnsintrcnViewAjax.do",
			data : $('#mainForm').serialize(),
			success : function(data) {
				 $("#popData" + layerNo).html(data);
				 popupbusiness(layerCssNm);
				  
			},
			error : function(error) {
				alert(error.responseText);
			}
		});
        
    }
    
    // 사업소개 1차 카테고리 선택 : 카테고리명, 설명 세팅 후 fnSubCategoryList 호출
    function fnCategoryList(searchClCode, no){
    	//alert(searchClCode);
    	if( searchClCode != null && searchClCode != ""){
    		$("#searchClCode").val(searchClCode);	
    	}
    	$("#section_no").val(no);
    	$("#currentPageNo").val(1);    	
    	$("#searchText").val("");
    	$.ajax({
			type : "POST",
			url : "/env/bsnsintrcn/import/bsnsintrcnSection2ListAjax.do",
			data : $('#mainForm').serialize(),
			success : function(data) {
				 $("#section2_" + no).html(data);
				 //onmEvent.init();
			},
			error : function(error) {
				alert(error.responseText);
			}
		});
    	 
    }
	
    // 슬라이드 2차 카테고리 리스트
    function fnSubCategoryList(ctgryNo, slide_no){
    	console.log("fnSubCategoryList......................ctgryNo="+ctgryNo + ", slide_no=" + slide_no);
    	if( ctgryNo != null && ctgryNo != ""){
    		$("#searchCtgryNo").val(ctgryNo);	
    	}
    	$("#slide_no").val(slide_no);
    	var section_no = $("#section_no").val();
    	$("#currentPageNo").val(1);
    	
    	$.ajax({
			type : "POST",
			url : "/env/bsnsintrcn/import/bsnsintrcnSlideListAjax.do",
			data : $('#mainForm').serialize(),
			success : function(data) {
				//console.log(data);
				 $("#slideList_" +section_no).html(data);				 
				 $("#ul-list").html("");
				 onMakeMoreList();
				 onmEvent.init();
			},
			error : function(error) {
				alert(error.responseText);
			}
		});    	
    }
    
</script>
            
                    
        
        