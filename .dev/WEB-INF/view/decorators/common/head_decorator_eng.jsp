<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.system.config.Globals"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.PropertieUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1,  user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<meta name="_csrf_header" content="<c:out value='${_csrf.headerName}'/>">
<meta name="_csrf" content="<c:out value ='${_csrf.token}'/>">

<!-- SET FILE PATH :: compatibility ie9 code -->
   <base href="../" />
   <!--[if IE]><script type="text/javascript">
            // Fix for IE ignoring relative base tags.
            (function() {
                var baseTag = document.getElementsByTagName('base')[0];
                baseTag.href = baseTag.href;
            })();
    </script><![endif]-->
    <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Page-Enter" content="revealtrans(duration=1,transition=12)">
    <meta http-equiv="Page-Exit" content="revealtrans(duration=1,transition=12)">
    <title>EMC</title>
    <link rel="icon" href="/resources/service/env/images/favicon.png" sizes="32x32">
    <link type="text/css" href="/resources/service/env/css/font.css" rel="stylesheet">
    <link type="text/css" href="/resources/service/env/css/common.css" rel="stylesheet">
    <link type="text/css" href="/resources/service/env/css/sub.css" rel="stylesheet">
    <link type="text/css" href="/resources/service/env/css/media.css" rel="stylesheet">
    <link type="text/css" href="/resources/service/env/css/en.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/service/env/css/jquery-ui.min.css">
    <link rel="stylesheet" href="/resources/service/env/css/jquery.swiper.min.css">
    <link type="text/css" href="/resources/service/env/css/aos.css" rel="stylesheet">

    <script type="text/javascript" src="/resources/service/env/js/lib/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/resources/service/env/js/lib/jquery-ui-1.12.1.min.js"></script>
    <script type="text/javascript" src="/resources/service/env/js/lib/jquery.swiper.min.js"></script>
    <script type="text/javascript" src="/resources/service/env/js/lib/TweenMax.min.js"></script>
    <script type="text/javascript" src="/resources/service/env/js/lib/aos.js"></script>
    <script type="text/javascript" src="/resources/service/env/js/lib/skrollr.min.js"></script>
<script>
var memberCountConTxt1_prev= '${retMap.prevCarbonPercentage}';    // 이전값
var memberCountConTxt1= '${retMap.carbonPercentage}';    // 갱신된 변수값 저장
var memberCountConTxt2= '${retMap.totalPine }';    // 갱신된 변수값 저장
var memberCountConTxt2_prev= '${retMap.prevTotalPine}';    // 이전값
</script>
    <script type="text/javascript" src="/resources/service/env/js/common.js"></script>
    <script type="text/javascript" src="/resources/service/cms/js/jquery/jquery.validate.min.js"></script>
    
<script type="text/javascript" src="/resources/service/env_eng/js/jsonData.js"></script>
<script type="text/javascript" src="/resources/service/env_eng/js/ui.js"></script>
<script type="text/javascript" src="/resources/service/cms/js/common/ajaxScript.js"></script>
<script type="text/javascript" src="/resources/service/cms/js/common/commonUtil.js"></script>
<script type="text/javascript" src="/resources/service/cms/js/common/validation.js"></script>
<script type="text/javascript" src="/resources/service/cms/js/common/file.js"></script>

<script type="text/javascript">
  let Globals_MainPage="${Globals.MAIN_PAGE}" ;
  let Globals_Login_Url="${Globals.LOGIN_URL}" ;
  // js파일에서 사욯할 문자
  let js_cmm_login_fail_logout="<spring:message code='cmm.login.fail.logout' />".replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
  let js_cmm_login_fail_system="<spring:message code='cmm.login.fail.system' />".replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');

  const _contextPath = "${pageContext.request.contextPath }" ;

</script>
<c:if test="${webResultJson != null }">
    <script>
        $(document).ready( function() {
            var webResult = ${webResultJson} ;
            util.result(webResult);
        });
    </script>
</c:if>

