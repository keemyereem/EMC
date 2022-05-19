<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.CommonUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<code:upload name="${webResult.obj.name }" id="${webResult.obj.id }" fileCode="${webResult.obj.fileCode }" maxFileCount="${webResult.obj.maxFileCount }" title="파일 추가" value="${webResult.obj.fileId }" isAjax="true" isViweImage="${webResult.obj.isViweImage }" />