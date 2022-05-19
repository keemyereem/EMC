<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:choose>
<c:when test="${SITE_TYPE eq '/en' }">
<jsp:include page="/WEB-INF/view/decorators/common/head_decorator_eng.jsp"></jsp:include>
</c:when>
<c:otherwise>
<jsp:include page="/WEB-INF/view/decorators/common/head_decorator.jsp"></jsp:include>
</c:otherwise>
</c:choose>
</head>
<body>

	<div class="skip_navigation"><a href="#contents" title="본문으로 이동">Skip to the menu / 본문가기</a></div>
    <!-- wrap -->
    <div class="wrap">
        <!-- header -->
        <c:import url="/WEB-INF/view/decorators/common/header_decorator.jsp" />
        <!-- //header -->
        
        <!-- sitemap -->
        <div class="dim"></div>
        <div class="sitemap_bg"></div>
        <div class="sitemap"></div>
        <!-- //sitemap -->
        
<c:choose>
<c:when test="${SITE_TYPE eq '/en' }">
	<div class="container container_en">
</c:when>
<c:otherwise>
	<div class="container" >
</c:otherwise>
</c:choose>
        
			
			<decorator:body />

     	</div>
        <!-- footer -->
        <c:import url="/WEB-INF/view/decorators/common/footer_decorator.jsp" />
        <!-- //footer -->
    </div>
    
    <script>
         // 기존 head_decorator 위치 => 현재 위치로 변경
         // document.ready로 하면 출력 안될 경우가 있음
	     $(".header").load("${SITE_TYPE }/env/import/headerAjax.do");
	     $(".sitemap").load("${SITE_TYPE }/env/import/sitemapAjax.do");
	     $(".footer").load("${SITE_TYPE }/env/import/footerAjax.do");	     
    </script>
    
</body>    
</html>
