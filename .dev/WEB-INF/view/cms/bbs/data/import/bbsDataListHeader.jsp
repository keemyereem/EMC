<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.CommonUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- BT00001 : 일반 게시판 -->
<!-- BT00002 : 갤러리 게시판 -->

        <c:choose>
            <c:when test="${bbsMstDtl.tmplatCode eq 'BT00002'}">
                <caption></caption>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: auto;">
                    <col style="width: 20%;">
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                </colgroup>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>출처</th>
                        <th>조회</th>
                        <th>등록일</th>
                    </tr>
                </thead>
            </c:when>
            <c:otherwise>
                <caption></caption>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: auto;">
                    <col style="width: 20%;">
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                </colgroup>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>출처</th>
                        <th>첨부파일</th>
                        <th>등록일</th>
                    </tr>
                </thead>
            </c:otherwise>
        </c:choose>
