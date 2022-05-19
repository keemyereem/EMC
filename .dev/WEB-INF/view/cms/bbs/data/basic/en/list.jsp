<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<%@ taglib prefix="file" uri="/WEB-INF/tlds/fileLib.tld"%>

<form name="mainForm" id="mainForm" method="post">
    <input type="hidden" name="<c:out value='${_csrf.parameterName}' />" value="<c:out value='${_csrf.token}' />" />
    <input type="hidden" id="bbsNo" name="bbsNo" value="<c:out value="${bbsMstDtl.bbsNo}" />" />
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
                        <a href="javascript:link(1,0);" title="다음메뉴로 이동">
                            <img src="/resources/service/env/images/common/sub_visual_nav_next.png" alt="sub_visual_nav_next">
                            <span>회사소개</span>
                        </a>
                    </div>
                </div>

                <div class="sub_visual_m">
                    <h2>투자정보</h2>
                    <div class="location">
                        <a href="javascript:;" class="loccation_tit" title="하위메뉴열기"><c:out value='${bbsMstDtl.bbsNm}' /></a>
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

            <jsp:include page="/WEB-INF/view/cms/cmm/include/listSrarch.jsp" />

            <div class="contents cont_invest">
                <div class="contents_inner">
                    <div class="icon" data-aos="fade-up">
                        <img src="/resources/service/env/images/invest/disclosure_tit_icon.png" alt="타이틀 아이콘">
                    </div>

                    <h3 class="title" data-aos="fade-up" data-aos-offset="200"><c:out value='${bbsMstDtl.bbsNm}' /></h3>

                    <div class="disclosure_banner" data-aos="fade-up" data-aos-duration="600">
                        <p>전자공시시스템(Dart)에서<br/>EMC의 공시를 확인해 보실 수 있습니다.</p>
                        <a href="javascript:;" class="btn_goDart">전자공시시스템 바로가기</a>
                    </div>

                    <div class="irsearch_contents sub_contents">
                        <div class="inner">

	                           <div class="tb_top">
	                                <div class="search">
	                                    <div class="input_row input_search">
	                                        <input type="text" id="searchText" name="searchText" placeholder="Search" value="<c:out value='${webResult.params.searchText}' />" />
	                                        <a href="javascript:onMovePage(1);"><img src="/resources/service/env/images/common/icon_inp_search.png" alt="Search"></a>
	                                    </div>
	                                </div>
	                                <div class="total">
	                                    <span>총 <b id="textTotalRecordCount">0</b>건</span>
	                                    <span class="blind"><b class="red">&quot; <c:out value='${webResult.params.searchText}' /> &quot;</b> 검색 결과 게시물 <b id="textTotalPageCount">8</b>개</span>
	                                </div>
	                            </div>

                            <div class="tb_box">
                                <div class="tb_row row_head">
                                    <div class="num">번호</div>
                                    <div class="tit">제목</div>
                                    <div class="view">조회</div>
                                    <div class="date">등록일</div>
                                </div>
                                    <%@ include file="/WEB-INF/view/cms/bbs/data/import/bbsDataListAjax.jsp" %>
                                    <div id="paging" class="paging">

                                    </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

</form>

<script>

    currentPageNum(4,2);

   function onMovePage(pageNo) {
       $("#currentPageNo").val(pageNo) ;
       util.fnPostSend('<c:url value="/en/bbs/data/bbsDataList.do" />') ;
   }

   function onSetPageHtml(pageHtml) {
       $("#paging").html(pageHtml);
   }

   function onView(nttNo) {
       $("#nttNo").val(nttNo) ;
       util.fnPostSend('<c:url value="/en/bbs/data/bbsDataView.do" />') ;
   }

   $(document).ready(function () {
	   const prevViewNttNo = "<c:out value='${webResult.params.nttNo}' />";
       if (prevViewNttNo != "" && $("#bbs-data-" + prevViewNttNo).length == 1) {
    	   var offset = $("#bbs-data-" + prevViewNttNo).offset();
    	   $("html").animate({scrollTop : offset.top - 400}, 400);
       }
   });
</script>