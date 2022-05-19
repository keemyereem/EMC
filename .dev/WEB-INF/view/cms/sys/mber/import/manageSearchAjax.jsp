<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.CommonUtils"%>
<%@ page import="java.util.Arrays"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<form name="mainPopForm" id="mainPopForm" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" id="currentPageNo" name="currentPageNo" value="1" >
    <input type="hidden" id="mngrIdArr" name="mngrIdArr" >
	<div class="popup">
	  <div class="titleWrap">
	      <p class="title">담당자 조회</p>
	      <a href="javascript:popClose('${webResult.params.openId }');" class="close"><span>닫기</span></a>
	  </div>
	  <div class="contWrap">
	      <div class="searchWrap">
	          <div class="searchInWrap type2">
	              <div class="boxWrap paddingR10">
	                  <div class="box width50">
	                      <div class="title">부서
	                      </div>
	                      <div class="inBlock width100">
	                        <code:selectBox id="searchDeptCode" name="searchDeptCode" title="부서" defultCode="C002001" listCodeVo="${webResult.obj }" />
	                      </div>
	                  </div>
	                  <div class="box width50">
	                      <div class="title">담당자</div>
	                      <div class="inBlock width100">
	                          <input type="text" id="searchMngrExpsrNm" name="searchMngrExpsrNm" value="" placeholder="이름 또는 ID">
	                      </div>
	                  </div>
	              </div>
	              <div class="btnWrap">
	                  <a href="#a;" class="btn search">검색</a>
	                  <a href="#a;" class="btn do">초기화</a>
	              </div>
	          </div>
	      </div>
	      <table class="col cursor" id="listTable" >
	          <caption></caption>
	          <colgroup>
	              <col style="width: 10%;">
	              <col>
	              <col style="width: 25%;">
	              <col style="width: 25%;">
	          </colgroup>
	            <thead>
	                <tr>
	                    <th>번호</th>
	                    <th>부서명</th>
	                    <th>담당자명</th>
	                    <th>담당자ID</th>
	                </tr>
	            </thead>
	            <tbody>

	            </tbody>
	        </table>
	        <div id="paging" class="paging marginT40"></div>
	    </div>
	</div>
</form>
<script>

    $(document).ready(function () {
        onMovePage(1);
	});

    function onMovePage(pageNo){
        // 사이트 리스트의 내용을 가지고 온다.
        $("#currentPageNo").val(pageNo) ;

        var mngrAddr = $("input:hidden[name=mngrId]") ;
        console.log(mngrAddr.length)
        var str = "" ;
        for(i = 0 ; i < mngrAddr.length ; i++){
            console.log(mngrAddr[i])
            str += $(mngrAddr[i]).val() + "/" ;
        }
        console.log(str)
        $("#mngrIdArr").val(str);
        ajax.tableList("/sys/manage/import/manageListAjax.do", "listTable", null, null, "mainPopForm");
    }

</script>