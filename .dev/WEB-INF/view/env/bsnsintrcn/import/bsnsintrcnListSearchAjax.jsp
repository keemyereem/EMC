<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="file" uri="/WEB-INF/tlds/fileLib.tld"%>

 
<c:forEach var="item" items="${bsnsintrcnList.listPage.listMap}" varStatus="i" >
	<c:set var="ctgryNm" value="${item.ctgryCodeNm }" />
	<c:if test="${empty(ctgryNm) }"><c:set var="ctgryNm" value="${item.ctgryNm }" /></c:if>

    <li>
        <a href="javascript:fn_viewDtl('<c:out value="${item.bsnsintrcnNo}" />','<c:out value="${item.bsnsintrcnCode}" />','<c:out value="${item.ctgryNo}" />');" >
            <div class="list_img"> <file:imageView id="attachFileId" fileId="${item.attachFileId}" reprsntAt="Y" title="썸네일 이미지"/> </div>
            <div class="list_cont">
               <dl>
                   <dt><c:out value="${ctgryNm}" /></dt>
                   <dd><c:out value="${item.bsnsNm}" /></dd>                   
               </dl>
            </div>
        </a>
    </li>
</c:forEach>




<script>

$(function () {
	$("#currentPageNo").val('<c:out value="${bsnsintrcnList.listPage.paging.currentPageNo}" />');
    $("#totalPageCount").val('<c:out value="${bsnsintrcnList.listPage.paging.totalPageCount}" />');
});    
    
</script>
                     