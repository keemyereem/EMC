<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<p class="subTitle">메뉴 상세</p>
<p class="txtRight">
    <span class="required">*</span> 항목은 필수 입력항목입니다.
</p>
<table class="row">
    <caption></caption>
    <colgroup>
        <col style="width: 15%;">
        <col style="width: 85%;">
    </colgroup>
    <tbody>
        <tr>
            <th>메뉴코드</th>
            <td><c:out value="${webResult.obj.menuCode }" /></td>
        </tr>
        <tr>
            <th>메뉴위치</th>
            <td><c:out value="${webResult.obj.menuNameLocation }" /></td>
        </tr>
        <tr>
            <th>메뉴명 <span class="required">*</span></th>
            <td>
                <div class="width40">
                    <input type="text" name="menuNm" id="menuNm" value="<c:out value="${webResult.obj.menuNm }" />" placeholder="메뉴명을 입력하세요.">
                </div>
                <div class="helpTxt">최대 길이에 맞게 입력하세요. (100Byte)</div>
            </td>
        </tr>
        <tr>
            <th>프로그램 <span class="required">*</span></th>
            <td>
                <div class="width20">
                    ${webResult.obj.progrmCode }
                    <code:selectBox name="progrmCode" id="progrmCode" value="${webResult.obj.progrmCode }" defultCode="C002001" title="프로그램 선택" listCodeVo="${webResult.obj.codeVoList }" isOptionAttr="true" eventName="onchange" eventValue="onChangeProgram('progrmCodeSub')" />
                </div>
            </td>
        </tr>
        <tr>
            <th>메뉴 URL</th>
            <td>
                <input type="text" name="beginPage" id="beginPage" value="<c:out value="${webResult.obj.beginPage }" />" >
            </td>
        </tr>
        <tr>
            <th>파라미터</th>
            <td>
                <div class="width40">
                    <input type="text" name="paramtr" id="paramtr" value="<c:out value="${webResult.obj.paramtr }" />" placeholder="파라미터 입력하세요.">
                </div>
                <div class="helpTxt">최대 길이에 맞게 입력하세요. (300Byte)</div>
            </td>
        </tr>
        <tr>
            <th>GNB여부 <span class="required">*</span></th>
            <td>
                <code:radio tagClass="radioWrap" name="gnbAt" value="${webResult.obj.gnbAt }" title="GNB여부" upperCode="C033005" valueType="aditValueOne" />
            </td>
        </tr>
        <tr>
            <th>탭메뉴여부 <span class="required">*</span></th>
            <td>
                <code:radio tagClass="radioWrap" name="tabAt" value="${webResult.obj.tabAt }" title="탭여부" upperCode="C033008" valueType="aditValueOne" />
            </td>
        </tr>
        <tr>
            <th>링크종류 <span class="required">*</span></th>
            <td>
                <div class="width20">
                    <code:selectBox name="linkCode" id="linkCodeSub" value="${webResult.obj.linkCode }" upperCode="C033001" defultCode="C002001" title="링크종류" />
                </div>
            </td>
        </tr>
        <tr>
            <th>사용여부 <span class="required">*</span></th>
            <td>
                <code:radio tagClass="radioWrap" name="useAt" value="${webResult.obj.useAt }" title="사용 여부" upperCode="C010000" valueType="aditValueOne" />
            </td>
        </tr>
        <tr>
            <th>안내사항</th>
            <td>
                <textarea name="infoConts" id="infoConts" rows="5" placeholder="안내사항을 입력하세요." maxlength="300"><c:out value="${webResult.obj.infoConts }" /></textarea>
                <div class="helpTxt">최대 길이에 맞게 입력하세요. (300Byte)</div>
            </td>
        </tr>
        <tr>
            <th>지정된 권한</th>
            <td>권한1, 권한2</td>
        </tr>
        <tr>
            <th>등록정보</th>
            <td><c:out value="${webResult.obj.frstRegisterNm }" />(<c:out value="${webResult.obj.frstRegisterId }" />) / <c:out value="${webResult.obj.frstRegistDt }" /></td>
        </tr>
        <tr>
            <th>수정정보</th>
            <td><c:out value="${webResult.obj.lastUpdusrNm }" />(<c:out value="${webResult.obj.lastUpdusrId }" />) / 2020-02-13 11:00:26</td>
        </tr>
    </tbody>
</table>
<div class="btnWrap right marginT40">
    <a href="javascript:popOpen('subMenuRegister');" class="btn large do">하위메뉴등록</a> <a href="javascript:popOpen('menuHistory');" class="btn large search">메뉴변경이력</a> <a href="#a;" class="btn large do">저장</a> <a href="#a;" class="btn large undo">삭제</a>
</div>