<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value='/cms/css/webFonts.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/cms/css/base.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/cms/css/common.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/cms/css/style.css'/>" rel="stylesheet" type="text/css" />
<title>idasystem</title>
</head>
<body>
	<div class="errorPageWrap">
		<div class="pageWrap">
			<div class="title">원하시는 페이지를 찾을 수 없습니다.</div>
			<div class="detail">
				찾으시는 페이지의 주소가 잘못 입력되었거나 변경 혹은 삭제로 인해 현재 사용하실 수 없습니다.<br>서비스 이용에 불편을 드려 죄송합니다.
			</div>
			<div class="btnWrap">
				<a href="#a;" class="btn large prev">이전페이지</a> <a href="#a;" class="btn large do">메인화면</a>
			</div>
		</div>
	</div>
</body>
</html>
