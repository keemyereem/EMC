<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.CommonUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="file" uri="/WEB-INF/tlds/fileLib.tld"%>

<!-- BT00001 : 일반 게시판 -->
<!-- BT00002 : 갤러리 게시판 -->

<c:if test="${not empty webResult.listPage.listMap}" >

    <c:forEach var="item" items="${webResult.listPage.listMap}" varStatus="i" >
	    <c:choose>
	        <c:when test="${bbsMstDtl.tmplatCode eq 'BT00002'}">

                <li data-aos="fade-up" data-aos-duration="700" onclick="onView('${item.nttNo}')" id="bbs-data-${item.nttNo}">
                    <div class="lineTop"></div>
                    <div class="lineLeft"></div>
                    <div class="lineRight"></div>
                    <div class="lineBottom"></div>
                    <div class="top">
                        <p class="tit">
                            <c:out value='${item.sj}' />
                        </p>
                        <p class="date"><fmt:formatDate type="date" pattern="yyyy-MM-dd" value="${item.registDe}" /></p>
                    </div>
                    <div class="img">
                        <file:imageView id="thumbFileId" fileId="${item.thumbFileId}" title="썸네일 이미지"/>
                    </div>
                </li>

            </c:when>
            <c:otherwise>
		        <div class="tb_row row_body" id="bbs-data-${item.nttNo}">
	                <div class="num"><c:out value="${CommonUtils.getListNumberDESC(webResult.listPage.paging, i.index) }" /></div>
	                <div class="tit"><a href="javascript:onView('${item.nttNo}')"><c:out value='${item.sj}' /></a></div>
	                <div class="view"><b>조회수</b>${not empty item.rdcnt ? item.rdcnt : '0'}</div>
	                <div class="date"><b>작성일</b><fmt:formatDate type="date" pattern="yyyy-MM-dd" value="${item.registDe}" /></div>
	            </div>
	        </c:otherwise>
	    </c:choose>
    </c:forEach>
</c:if>

<c:if test="${empty webResult.listPage.listMap}">

</c:if>

<script>

    $(document).ready(function () {
    	<c:if test="${bbsMstDtl.tmplatCode ne 'BT00002'}">
    	onSetPageHtml(util.paging(${webResult.listPage.paging.currentPageNo}, ${webResult.listPage.paging.totalRecordCount}, ${webResult.listPage.paging.pageSize}, ${webResult.listPage.paging.recordCountPerPage}))
    	</c:if>
        onSetSearchText(${webResult.listPage.paging.currentPageNo}, ${webResult.listPage.paging.totalRecordCount}, ${webResult.listPage.paging.totalPageCount});
	});

</script>