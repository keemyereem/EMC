<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<style>
input.password {
	-webkit-text-security: disc;
}
</style>
<div class="bgWrap">
	<div class="loginWrap">
		<p class="title">관리시스템 관리자 로그인</p>
		<form action="/login/actionlogin.do" name="mainForm" id="mainForm" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="inputWrap">
				<label for="id_val" class="invisible">아이디를 입력하세요</label> <input type="text" name="mngrId" id="mngrId" value="idamngr" placeholder="아이디를 입력하세요" autocomplete="off" autocomplete="false" maxlength="20" aria-hidden="true">
			</div>
			<div class="inputWrap">
				<label for="pw_val" class="invisible">비밀번호를 입력하세요</label> <input type="password" name="mngrPassword" id="mngrPassword" value="5741@you" placeholder="비밀번호를 입력하세요" autocomplete="off" maxlength="20">
			</div>
		</form>
		<a href="javascript:fnLogin();" class="login">로그인</a>
		<p class="notice">
			※ 접속 권한이 없는 불법적인 행위는 정보통신망법 및 정보보안법 위반으로<br> 행사처벌 조치를 받으실 수 있습니다.
		</p>

	</div>
</div>

<script type="text/javascript">

  $(document).ready(function () {

  });

	function fnLogin() {
		if(!validation.inputObj('mngrId', '<spring:message code="message.login.empty.id"/>')) return;
		if(!validation.inputObj('mngrPassword', '<spring:message code="message.login.empty.pw"/>')) return;
		$("#mainForm").submit();
	}
	/*
	function fnLoginResult(result){
		$("#userId").val('');
	  $("#userPw").val('');

	  if (result.ReturnUrl != null && result.ReturnUrl.length > 0) {
			if (result.ReturnCode == "R001000") {
				location.href = result.ReturnUrl;
			} else {
				alert(result.Message);
			}
		} else {
			alert(result.Message);
		}
	}
	*/
</script>

