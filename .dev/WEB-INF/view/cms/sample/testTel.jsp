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
    <code:tel id="t01" tagClass="flex width50" telUpperCode="C030000" defultCode="C002001" title="담당자 전화번호" value="${webResult.obj.chargerCttpc }"/>
    <code:tel id="t02" tagClass="flex width50" telUpperCode="C030000" defultCode="C002001" title="담당자 전화번호" value="${webResult.obj.chargerCttpc }"/>

</form>

<div class="btnWrap right marginT40">
  <a href="javascript:onSave()" class="btn large do">저장</a>
</div>

<br>
<br>
<script >
   function onSave(){

	     // 필수 등록 처리
	     if(!validation.checkFile("file01")) return;

       ajax.attFileJson('/smmple/fileUploadTestAjax.do');

   }


</script>

