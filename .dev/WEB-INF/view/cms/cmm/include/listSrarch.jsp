<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<input type="hidden" id="currentPageNo" name="currentPageNo" value="${empty webResult.params.currentPageNo ? '1' : webResult.params.currentPageNo}" />
<input type="hidden" id="pageSize" name="pageSize" value="<c:out value='${webResult.params.pageSize}' />" />

<input type="hidden" id="valTotalRecordCount" value="<c:out value='${webResult.params.totalRecordCount}' />" />
<input type="hidden" id="valTotalPageCount" value="<c:out value='${webResult.params.totalPageCount}' />" />

<!--
<div class="listCountWrap">
    <div class="count">
        전체 <strong id="textTotalRecordCount"> 0</strong>건 (
        <spen id="textCurrentPageNo"></spen>
        페이지 / 전체
        <spen id="textTotalPageCount"></spen>
        페이지)
    </div>
</div>
-->
<script>
	function onSetSearchText(currentPageNo, totalRecordCount, totalPageCount){

		if(totalRecordCount > 0){
		    $("#textTotalRecordCount").html(totalRecordCount);
	        $("#textCurrentPageNo").html(currentPageNo);
	        $("#textTotalPageCount").html(totalPageCount);

	        $("#valTotalRecordCount").val(totalRecordCount);
	        $("#valTotalPageCount").val(totalPageCount);
		} else {
		    $("#textTotalRecordCount").html(0);
            $("#textCurrentPageNo").html('');
            $("#textTotalPageCount").html('');

            $("#valTotalRecordCount").val(0);
            $("#valTotalPageCount").val(0);
		}

	}

	function onChangePageSize(obj){
	    onMovePage(1);
	}
</script>