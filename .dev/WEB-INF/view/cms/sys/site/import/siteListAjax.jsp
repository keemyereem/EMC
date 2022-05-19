<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.CommonUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${not empty webResult.listPage.listMap }" >
    <c:forEach var="item" items="${webResult.listPage.listMap }" varStatus="i" >
	<tr>
	    <td><c:out value="${CommonUtils.getListNumberDESC(webResult.listPage.paging, i.index) }" /></td>
	    <td>${item.siteSeNm }</td>
	    <td><a href="javascript:onModifyForm('${item.siteCode }')">${item.siteNm }</a></td>
	    <td>${item.domnOne}</td>
	    <td>${item.mgrNm }(${item.frstRegisterId })</td>
	    <td><span class="use${item.svcAt }">${item.svcAt }</span></td>
	    <td><fmt:formatDate type="date" pattern="yyyy-MM-dd HH:mm:ss" value="${item.frstRegistDt}" /></td>
	</tr>
	</c:forEach>
</c:if>
<c:if test="${empty webResult.listPage.listMap }" >
	<tr>
	    <td colspan="7">검색된 정보가 없습니다.</td>
	</tr>
</c:if>
<script>

    $(document).ready(function () {
        onSetPageHtml(util.paging(${webResult.listPage.paging.currentPageNo}, ${webResult.listPage.paging.totalRecordCount}, ${webResult.listPage.paging.pageSize}, ${webResult.listPage.paging.recordCountPerPage}))
        onSetSearchText(${webResult.listPage.paging.currentPageNo}, ${webResult.listPage.paging.totalRecordCount}, ${webResult.listPage.paging.totalPageCount});
	});


</script>