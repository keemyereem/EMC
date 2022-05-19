<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.CommonUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${not empty webResult.listPage.listMap }" >
    <c:forEach var="item" items="${webResult.listPage.listMap }" varStatus="i" >
       <tr onclick="onAddMngr('${item.mngrId}', '${item.deptNm}', '${item.mngrExpsrNm}')">
           <td><c:out value="${CommonUtils.getListNumberDESC(webResult.listPage.paging, i.index) }" /></td>
           <td ><c:out value="${item.deptNm}" /></td>
           <td ><c:out value="${item.mngrExpsrNm}" /></td>
           <td ><c:out value="${item.mngrId}" /></td>
       </tr>
    </c:forEach>
     
</c:if>
<c:if test="${empty webResult.listPage.listMap }" >
    <tr>
        <td colspan="4">검색된 정보가 없습니다.</td>
    </tr>
</c:if>
ㅇㅇㅇㅇㅇㅇㅇㅇ

<script>

$(document).ready(function () {
    onSetPageHtml(util.paging(${webResult.listPage.paging.currentPageNo}, ${webResult.listPage.paging.totalRecordCount}, ${webResult.listPage.paging.pageSize}, ${webResult.listPage.paging.recordCountPerPage}))
    onSetSearchText(${webResult.listPage.paging.currentPageNo}, ${webResult.listPage.paging.totalRecordCount}, ${webResult.listPage.paging.totalPageCount});
});


</script>