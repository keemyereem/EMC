<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<p class="subTitle">담당자 목록</p>

<form name="mainForm" id="mainForm" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" id="currentPageNo" name="currentPageNo" value="1" >
    <div class="searchWrap">
	    <div class="searchInWrap type2">
	        <div class="boxWrap paddingR10">
	            <div class="box width50">
	                <div class="title">부서</div>

	                <select name="searchDept" id="searchDept">
	                    <option value="">선택</option>
	                </select>
	            </div>
	            <div class="box width50">
	                <div class="title">담당자</div>
	                <div class="inBlock width100">
	                    <input type="text" id="searchMberNm" name="searchMberNm" value="" placeholder="이름 또는 ID">
	                </div>
	            </div>
	        </div>
	        <div class="boxWrap paddingR10 marginT5">
	            <div class="box width25">
	                <div class="title">사용여부</div>

	                <select name="searchUseYN" id="searchUseYN">
	                    <option value="">선택</option>
	                </select>
	            </div>
	            <div class="box width25">
	                <div class="title">계정상태</div>

	                <select name="searchStat" id="searchStat">
	                    <option value="">선택</option>
	                </select>
	            </div>
	            <div class="box width50">
	                <div class="title">검색사유 <span class="required">*</span></div>
	                <div class="inBlock width100">
	                    <input type="text" id="searchReason" name="searchReason" value="" placeholder="검색사유를 입력하세요">
	                </div>
	            </div>
	        </div>
	        <div class="btnWrap">
	            <a href="javascript:" class="btn search">검색</a>
	            <a href="javascript:" class="btn do">초기화</a>
	        </div>
	    </div>
	</div>

	<div class="helpTxt type2 marginT5">※ 담당자정보를 조회하시려면 <strong>검색사유</strong>를 꼭 입력하셔야 합니다.</div>


    <jsp:include page="/WEB-INF/view/cms/cmm/include/listSrarch.jsp"></jsp:include>

	<table class="col" id="listTable">
		<caption></caption>
		<colgroup>
			<col style="width: 5%;">
            <col style="width: 5%;">
            <col style="width: 15%;">
            <col style="width: 15%;">
            <col style="width: 15%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col style="width: 15%;">
		</colgroup>
		<thead>
			<tr>
				<th>
                    <div class="chkWrap none">
                        <input type="checkbox" name="chkAll" id="chkAll">
                        <label for="chkAll"></label>
                    </div>
                </th>
                <th>번호</th>
                <th>담당자ID</th>
                <th>담당자명</th>
                <th>부서</th>
                <th>직급</th>
                <th>사용여부</th>
                <th>계정상태</th>
                <th>최종접속일시</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
</form>
<div id="paging" class="paging marginT40"></div>

<div class="btnWrap right marginT40">
	<a href="javascript:util.fnPostSend('<c:url value="/sys//siteForm.do" />')" class="btn large do">사이트등록</a>
</div>

<script >
	$(document).ready(function () {
	    onMovePage(1);
	});

   function onMovePage(pageNo){
       // 사이트 리스트의 내용을 가지고 온다.
       $("#currentPageNo").val(pageNo) ;
       ajax.tableList("/sys/site/import/siteListAjax.do", "listTable");
   }

   function onSetPageHtml(){

   }

</script>

