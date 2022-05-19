<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<p class="subTitle">담당자 목록</p>

<form name="mainForm" id="mainForm" method="post" enctype="multipart/form-data" action="/sys/auth/insertAuthManageAjax.do" >
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" id="currentPageNo" name="currentPageNo" value="1" >
  <div class="flex">
    <div class="width15">
        <p class="subTitle">권한 목록</p>
        <div class="roleScrollWrap">
            <ul class="permissionList">
                <li>
                    <div class="listWrap">
                        <div class="manager">
                            <a href="permission_modify.jsp" class="name">수퍼관리자</a>
                            <a href="javascript:popOpen('permissionMgr');" class="num">4</a>
                        </div>
                        <a href="permissionByMenu_list.jsp" class="btn">메뉴</a>
                    </div>
                </li>
                <li>
                    <div class="listWrap">
                        <div class="manager">
                            <a href="permission_modify.jsp" class="name">권한2</a>
                            <a href="javascript:popOpen('permissionMgr');" class="num">0</a>
                        </div>
                        <a href="permissionByMenu_list.jsp" class="btn">메뉴</a>
                    </div>
                </li>
            </ul>
        </div>
        <div class="marginT20">
            <a href="javascript:popOpen('permissionRegister');" class="btn large do">권한등록</a>
        </div>
    </div>
    <div class="width85 paddingL40">
        <p class="subTitle">권한 상세</p>
        <div class="noData">
			            항목이 선택되지 않았습니다.<br>
			            좌측 목록에서 권한을 선택하시거나 권한등록 버튼을 클릭하세요.
        </div>
    </div>
	</div>







</form>


<script >
		window.onpopstate = function(event) {
		    if(event.state != null){
		        $("#pageSize").val(event.state.pageSize);
		        $("#currentPageNo").val(event.state.currentPageNo);
		        onMakeTableList();
		    }
		}

		$(document).ready(function () {
			onMovePage($("#currentPageNo").val());
		});

	 function onMovePage(pageNo){
	       $("#currentPageNo").val(pageNo) ;
	       history.pushState( util.formToJson("mainForm"), null, document.location.href);
	       onMakeTableList();
	 }

	 function onMakeTableList(){
       ajax.tableList("<c:url value="/sys/site/import/siteListAjax.do" />", "listTable");
   }

   function onSetPageHtml(){

   }

   // 페이징 설정
   function onSetPageHtml(pageHtml){
       $("#paging").html(pageHtml);
   }

   function onSiteSave(){
       ajax.dataJson('/sys/auth/insertAuthManageAjax.do', null, onSaveResult);
   }

   /*
   function onSaveResult(webResult){

	 }
	 */



</script>

