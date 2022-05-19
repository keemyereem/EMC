<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.StringUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<p class="subTitle">사이트 목록</p>

<form name="mainForm" id="mainForm" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" id="currentPageNo" name="currentPageNo" value="${param.currentPageNo eq null ? '1' : param.currentPageNo }" >
    <input type="hidden" id="siteCode" name="siteCode" value="" >

    <jsp:include page="/WEB-INF/view/cms/cmm/include/listSrarch.jsp"></jsp:include>

	<table class="col" id="listTable">
		<caption></caption>
		<colgroup>
			<col style="width: 5%;">
			<col style="width: 10%;">
			<col>
			<col style="width: 20%;">
			<col style="width: 10%;">
			<col style="width: 10%;">
			<col style="width: 15%;">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>사이트구분</th>
				<th>사이트명</th>
				<th>도메인</th>
				<th>운영자</th>
				<th>서비스여부</th>
				<th>등록일시</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
</form>
<div id="paging" class="paging marginT40"></div>

<div class="btnWrap right marginT40">
	<a href="javascript:util.fnPostSend('<c:url value="/sys/site/siteForm.do" />')" class="btn large do">사이트등록</a>
</div>

<script >

    window.onpopstate = function(event) {
        if(event.state != null){
            $("#pageSize").val(event.state.pageSize);
            $("#currentPageNo").val(event.state.currentPageNo);
            onMakeTableList();
        }
    }


	$(document).ready(function () {
	    // 사이트 리스트의 내용을 가지고 온다.
	    onMovePage($("#currentPageNo").val()); // totalRecordCount, pageSize, pageBlockSize, jsFunction
	});

   function onMovePage(pageNo){
       $("#currentPageNo").val(pageNo) ;
       history.pushState( util.formToJson("mainForm"), null, document.location.href);
       onMakeTableList();
   }

   function onMakeTableList(){
       ajax.tableList("<c:url value="/sys/site/import/siteListAjax.do" />", "listTable");
   }

   // 페이징 설정
   function onSetPageHtml(pageHtml){
       $("#paging").html(pageHtml);
   }

   function onModifyForm(siteCode){
       $("#siteCode").val(siteCode) ;
       util.fnPostSend('<c:url value="/sys/site/siteModify.do" />') ;
       // $("#mainForm").prop('action', '<c:url value="/sys/site/siteModify.do" />').submit();

   }

</script>

