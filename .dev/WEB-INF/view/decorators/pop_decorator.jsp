<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1,  user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />


<link href="<c:url value='/cms/css/webFonts.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/cms/css/base.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/cms/css/jquery.mCustomScrollbar.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/cms/css/common.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/cms/css/layout.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/cms/css/style.css'/>" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<c:url value='/cms/js/jquery/jquery-1.12.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/cms/js/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/cms/js/dragscroll/dragscroll.js'/>"></script>
<script type="text/javascript" src="<c:url value='/cms/js/sticky/jquery.sticky.js'/>"></script>
<script type="text/javascript" src="<c:url value='/cms/js/tweenmax/TweenMax.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/cms/js/tweenmax/jquery.gsap.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/cms/js/datepicker/datepicker.js'/>"></script>
<script type="text/javascript" src="<c:url value='/cms/js/selectric/jquery.selectric.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/cms/js/ui.js'/>"></script>

<script type="text/javascript" src="<c:url value='/cms/js/utils/common.js'/>"></script>
<script type="text/javascript" src="<c:url value='/cms/js/utils/cmmRequest.js'/>"></script>
<script type="text/javascript" src="<c:url value='/cms/js/utils/cmmAlert.js'/>"></script>
<script type="text/javascript" src="<c:url value='/cms/js/utils/cmmStrUtil.js'/>"></script>

<title>이다시스템</title>

</head>
<body>

	<!-- header decorator -->
	<c:import url="/WEB-INF/jsp/decorators/common/header_decorator.jsp" />

	<div class="body contentsWrap">
		<div class="contents scrollWrap">
			<!-- body content area -->
			<decorator:body />
		</div>
	</div>


	<!-- left decorator -->
	<c:import url="/WEB-INF/jsp/decorators/common/footer_decorator.jsp" />
</body>
</html>