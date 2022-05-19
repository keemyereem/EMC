<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<%@ taglib prefix="file" uri="/WEB-INF/tlds/fileLib.tld"%>
<p class="subTitle">담당자 목록</p>

<form name="mainForm" id="mainForm" method="post" enctype="multipart/form-data" action="/sys/auth/insertAuthManageAjax.do" >
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" id="currentPageNo" name="currentPageNo" value="1" >
    <!-- name, id는 저장할 File의 Field명을 넣는다. fileCode는 필수 ( 공동코드 에서 ) F001001은 이미지 파일 업로드로 이미지 설명을 넣어야 한다. value는 수정일 경우 넣는다. -->
    <code:upload name="file01" id="file01" fileCode="F001001" minFileCount="0" maxFileCount="2" title="파일 추가" value="lk3iyYDPl2GOBaSq6Y1O" isViweImage="false" />

</form>

<div class="btnWrap right marginT40">
  <a href="javascript:onSave()" class="btn large do">저장</a>
</div>

<file:fileView id="img" fileId="lk3iyYDPl2GOBaSq6Y1O" title="제목" separatorHtml="<br>" />

<br>

<file:imageView id="img" fileId="lk3iyYDPl2GOBaSq6Y1O" title="제목"/>



<br>
<br>
<script >
   function onSave(){

	     // 필수 등록 처리
	     if(!validation.checkFile("file01")) return;

       ajax.attFileJson('/smmple/testFileUploadProcessAjax.do');

   }

</script>

