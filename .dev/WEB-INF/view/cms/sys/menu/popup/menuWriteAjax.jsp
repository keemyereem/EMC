<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<div class="popup">
    <div class="titleWrap">
        <p class="title">하위메뉴 등록</p>
        <a href="javascript:popClose('subMenuRegister');" class="close"><span>닫기</span></a>
    </div>
    <div class="contWrap">
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
                    <th>메뉴위치</th>
                    <td><c:out value="${webResult.obj.menuNameLocation }" /> > 하위</td>
                </tr>
                <tr>
                    <th>메뉴코드 <span class="required">*</span></th>
                    <td>
                        <div class="width40">
                            <input type="text" name="menuCode" id="menuCodeSub" value="${webResult.obj.newMenuCode}" >
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>메뉴명 <span class="required">*</span></th>
                    <td>
                        <div class="width40">
                            <input type="text" name="menuNm" id="menuNmSub" placeholder="메뉴명을 입력하세요.">
                        </div>
                        <div class="helpTxt">최대 길이에 맞게 입력하세요. (100Byte)</div>
                    </td>
                </tr>
                <tr>
                    <th>프로그램 <span class="required">*</span></th>
                    <td>
                        <div class="width20">
                            <code:selectBox name="progrmCode" id="progrmCodeSub" defultCode="C002001" title="프로그램 선택" listCodeVo="${webResult.obj.codeVoList }" isOptionAttr="true" eventName="onchange" eventValue="onChangeProgram('progrmCodeSub')" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>메뉴 URL</th>
                    <td>
                        <input type="text" name=beginPage id="beginPageSub" maxlength="200">
                    </td>
                </tr>
                <tr>
                    <th>파라미터</th>
                    <td>
                        <input type="text" name="paramtr" id="paramtrSub" placeholder="파라미터 입력하세요." maxlength="300">
                        <div class="helpTxt">최대 길이에 맞게 입력하세요. (300Byte)</div>
                    </td>
                </tr>
                <tr>
                    <th>GNB여부 <span class="required">*</span></th>
                    <td>
                        <code:radio tagClass="radioWrap" name="gnbAt" title="GNB여부" upperCode="C033005" valueType="aditValueOne" />
                    </td>
                </tr>
                <tr>
                    <th>탭메뉴여부 <span class="required">*</span></th>
                    <td>
                        <code:radio tagClass="radioWrap" name="tabAt" title="탭여부" upperCode="C033008" valueType="aditValueOne" />
                    </td>
                </tr>
                <tr>
                    <th>링크종류 <span class="required">*</span></th>
                    <td>
                        <div class="width20">
                            <code:selectBox name="linkCode" id="linkCodeSub" upperCode="C033001" defultCode="C002001" title="링크종류" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>사용여부 <span class="required">*</span></th>
                    <td>
                        <code:radio tagClass="radioWrap" name="useAt" title="사용 여부" upperCode="C010000" valueType="aditValueOne" />
                    </td>
                </tr>
                <tr>
                    <th>안내사항</th>
                    <td>
                        <textarea name="guidanceMatter" id="guidanceMatterSub" rows="5" placeholder="안내사항을 입력하세요." maxlength="300"></textarea>
                        <div class="helpTxt">최대 길이에 맞게 입력하세요. (300Byte)</div>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="btnWrap right marginT40">
            <a onclick="onMenuSave()" class="btn large do">등록</a>
        </div>
    </div>
</div>
<script>

    /**  */
    function onChangeProgram(programId){
        $("#beginPageSub").val($("#" + programId + " option:selected").attr('addOption')) ;
    }

    /**  */
    function onMenuSave(){
        if(!validation.inputObj("menuCodeSub", '메뉴코드는 필수 등록 항목입니다.', 7, 7)) return;
        if(!validation.inputObj("menuNmSub", '메뉴명은 필수 등록 항목입니다.', 2, 100)) return;
        if(!validation.inputObj("progrmCodeSub", '프로그램은 필수 등록 항목입니다.')) return;
        if(!validation.radioFromName("writeForm", "gnbAt", "GNB여부는 필수 항목입니다.") ) return;
        if(!validation.radioFromName("writeForm", "tabAt", "탭메뉴여부는 필수 항목입니다.") ) return;
        if(!validation.inputObj("linkCodeSub", '링크종류는 필수 등록 항목입니다.')) return;
        if(!validation.radioFromName("writeForm", "useAt", "사용여부는 필수 항목입니다.") ) return;

        ajax.json("/sys/menu/menuInsertAjax.do", onInsertReturn, null, "writeForm");

    }



</script>



