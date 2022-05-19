<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="file" uri="/WEB-INF/tlds/fileLib.tld"%>

<% pageContext.setAttribute("newLine", "\n"); %>

<form name="mainForm" id="mainForm" method="post">
    <input type="hidden" name="<c:out value='${_csrf.parameterName}' />" value="<c:out value='${_csrf.token}' />" />

    <%-- 검색조건  --%>
    <input type="hidden" id="currentPageNo" name="currentPageNo" value="<c:out value="${webResult.params.currentPageNo}" />" />
    <input type="hidden" id="pageSize" name="pageSize" value="<c:out value="${webResult.params.pageSize}" />" />
    <input type="hidden" id="searchText" name="searchText" value="<c:out value="${webResult.params.searchText}" />" />
    <%-- // 검색조건  // --%>

    <input type="hidden" id="nttNo" name="nttNo" value="<c:out value="${retMap.nttNo}" />" />
    <input type="hidden" id="bbsNo" name="bbsNo" value="<c:out value="${bbsMstDtl.bbsNo}" />" />

    <input type="hidden" id="MENUNO" name="MENUNO" value="<c:out value='${webResult.params.MENUNO}' />" />
    <input type="hidden" id="MENUID" name="MENUID" value="<c:out value='${webResult.params.MENUID}' />" />

    <input type="hidden" id="tabIndex" name="tabIndex" value="<c:out value='${tabIndex}' />" />

            <div class="sub_visual invest_visual">
                <div class="sub_visual_nav">
                    <h2><c:out value='${bbsMstDtl.bbsNm}' /></h2>
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

            <div class="contents cont_invest">
                <div class="contents_inner">

                    <div class="sub_contents detail_sub_contents">
                        <div class="inner">
                            <div class="tb_view">
                                <div class="tb_row row_head">
                                    <div class="tit"><c:out value='${retMap.sj}' /></div>
                                    <div class="date"><fmt:formatDate type="date" pattern="yyyy.MM.dd" value="${retMap.registDe}" /></div>
                                </div>
                                <div class="view_box">
                                    <div class="view_info">
                                        ${retMap.cn}
                                    <div class="file_box">
                                        <file:fileView id="attachFileId" fileId="${retMap.attachFileId}" title="첨부파일" separatorHtml="<br />" />
                                    </div>

	                                <div class="view_nav">
	                                    <c:if test="${not empty prevMap}">
	                                    <dl class="nav_prev">
	                                        <dt><span>이전글</span></dt>
	                                        <dd><a href="javascript:onGoDtl('${prevMap.nttNo}');"><c:out value='${prevMap.sj}' /></a></dd>
	                                    </dl>
	                                    </c:if>
	                                    <c:if test="${not empty nextMap}">
	                                    <dl class="nav_next">
	                                        <dt><span>다음글</span></dt>
	                                        <dd><a href="javascript:onGoDtl('${nextMap.nttNo}');"><c:out value='${nextMap.sj}' /></a></dd>
	                                    </dl>
	                                     </c:if>
	                                </div>

	                                <div class="btn_box">
	                                    <div class="btn_line"><a href="javascript:onGoListPage();">목록</a></div>
	                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</form>

<script>

    currentPageNum(4,0);

    function onGoListPage() {
        util.fnPostSend('<c:url value="/bbs/data/bbsDataList.do" />');
    }

    function onGoDtl(nttNo) {
    	$("#nttNo").val(nttNo);
        util.fnPostSend('<c:url value="/bbs/data/bbsDataView.do" />');
    }

</script>