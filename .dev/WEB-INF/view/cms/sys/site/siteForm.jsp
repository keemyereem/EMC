<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.PropertieUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<p class="subTitle">사이트 등록</p>
<p class="txtRight"><span class="required">*</span> 항목은 필수 입력항목입니다.</p>

<form name="mainForm" id="mainForm" method="post" >
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" id="currentPageNo" name="currentPageNo" value="<c:out value="${param.currentPageNo }" />" >
    <input type="hidden" id="pageSize" name="pageSize" value="<c:out value="${param.pageSize }" />" >
    <input type="hidden" id="siteCode" name="siteCode" value="<c:out value="${webResult.obj.siteCode  }" />" >
    <input type="hidden" id="modeType" name="modeType" value="<c:out value="${modeType}" />" >

    <table class="row">
        <caption></caption>
        <colgroup>
            <col style="width: 6%;">
            <col style="width: 9%;">
            <col style="width: 85%;">
        </colgroup>
        <tbody>
            <tr>
                <th colspan="2">사이트 구분</th>
                <td>
                    <div class="width20">
                       <code:selectBox id="siteSe" name="siteSe" title="페이지 컨텐츠 수" upperCode="C006000" defultCode="C002001" value="${webResult.obj.siteSe }" />
                    </div>
                </td>
            </tr>
            <tr>
                <th colspan="2">사이트명 <span class="required">*</span></th>
                <td>
                    <div class="width40">
                        <input type="text" name="siteNm" id="siteNm" placeholder="홈페이지명을 입력하세요." value="${webResult.obj.siteNm }">
                    </div>
                    <div class="helpTxt">고유한 사이트를 입력하세요. (2~100 Byte 사이)</div>
                </td>
            </tr>
            <tr>
                <th colspan="2">윈도우 타이틀 <span class="required">*</span></th>
                <td>
                    <div class="width40">
                        <input type="text" name="windowSj" id="windowSj" placeholder="윈도우 타이틀을 입력하세요." value="${webResult.obj.windowSj }">
                    </div>
                    <div class="helpTxt">길이에 맞게 입력하세요. (2~100 Byte 사이)</div>
                </td>
            </tr>
            <tr>
                <th colspan="2">사이트 소개</th>
                <td>
                    <textarea name="siteIntrcn" id="siteIntrcn" rows="5" placeholder="사이트 소개를 입력하세요.">${webResult.obj.siteIntrcn }</textarea>
                    <div class="helpTxt">최대 길이에 맞게 입력하세요. (300Byte)</div>
                </td>
            </tr>
            <tr>
                <th colspan="2">도메인 1 <span class="required">*</span></th>
                <td>
                    <div class="flex width40">
                        <div class="http"> http://</div>
                        <input type="text" name="domnOne" id="domnOne" placeholder="도메인을 입력하세요." value="${webResult.obj.domnOne }">
                    </div>
                </td>
            </tr>
            <tr>
                <th colspan="2">도메인 2</th>
                <td>
                    <div class="flex width40">
                        <div class="http"> http://</div>
                        <input type="text" name="domnTwo" id="domnTwo" placeholder="도메인을 입력하세요." value="${webResult.obj.domnTwo }">
                    </div>
                </td>
            </tr>
            <tr>
                <th colspan="2">도메인 3</th>
                <td>
                    <div class="flex width40">
                        <div class="http"> http://</div>
                        <input type="text" name="domnThree" id="domnThree" placeholder="도메인을 입력하세요." value="${webResult.obj.domnThree }">
                    </div>
                </td>
            </tr>
            <tr>
                <th colspan="2">모바일 URL</th>
                <td>
                    <div class="flex width40">
                        <div class="http"> http://</div>
                        <input type="text" name="mobileUrl" id="mobileUrl" placeholder="모바일 URL를 입력하세요." value="${webResult.obj.mobileUrl }">
                    </div>
                </td>
            </tr>
            <tr>
                <th colspan="2">사이트 언어 <span class="required">*</span></th>
                <td>
                    <div class="width20">
                       <code:selectBox id="langCode" name="langCode" title="기본 언어" upperCode="C001000" defultCode="C002001" value="${webResult.obj.langCode }" />
                    </div>
                    <div class="helpTxt">언어가 없는 경우 <b>공통코드관리</b>에서 해당 국가 언어의 사용여부를 사용으로 변경하세요.</div>
                </td>
            </tr>
            <tr>
                <th colspan="2">운영자 <span class="required">*</span></th>
                <td>
                    <div class="inBlock"><a href="javascript:popUserSearchOpen();" class="btn small do">담당자조회</a></div>
                    <ul class="marginT10" id="ulManage" >

                        <c:forEach var="item" items="${listSiteManage}" varStatus="status">
                        <li class="marginT5" id="${item.mngrId }">
                            <c:if test="${!empty(item.deptNm) }">${item.deptNm } / </c:if>
                            ${item.mngrExpsrNm } (${item.mngrId })
                            <input type="hidden" name="mngrId" value="<c:out value="${item.mngrId}" />" >
                            <div class="inBlock"><a href="javascript:onDelMngrId('${item.mngrId }');" class="btn del undo">삭제</a></div>
                        </li>
                        </c:forEach>

                    </ul>
                </td>
            </tr>
            <tr>
                <th rowspan="4">FOOTER</th>
                <th>담당부서 <span class="required">*</span></th>
                <td>
                    <div class="width40">
                        <input type="text" name="deptNm" id="deptNm" placeholder="담당부서를 입력하세요." value="${webResult.obj.deptNm }">
                    </div>
                </td>
            </tr>
            <tr>
                <th>담당자 <span class="required">*</span></th>
                <td>
                    <div class="width40">
                        <input type="text" name="charger" id="charger" placeholder="담당자를 입력하세요." value="${webResult.obj.charger }">
                    </div>
                </td>
            </tr>
            <tr>
                <th>담당자 연락처 <span class="required">*</span></th>
                <td>
                    <code:tel id="chargerCttpc" tagClass="flex width50" telUpperCode="C030000" defultCode="C002001" title="담당자 전화번호" value="${webResult.obj.chargerCttpc }"/>
                </td>
            </tr>
            <tr>
                <th>담당자 이메일 <span class="required">*</span></th>
                <td>
                    <code:email id="chargerEmail" tagClass="flex width40" title="담당자 이메일" value="${webResult.obj.chargerEmail }"/>
                </td>
            </tr>
            <tr>
                <th colspan="2">서비스여부 <span class="required">*</span></th>
                <td>
                   <code:radio tagClass="radioWrap" name="svcAt" title="사용 여부" upperCode="C010000" defultCode="C010001" value="${webResult.obj.svcAt }" valueType="aditValueOne" />
                </td>
            </tr>

        </tbody>
    </table>
    <div class="btnWrap right marginT40">
        <c:choose>
            <c:when test="${modeType eq 'mod'}">
        <a href="javascript:onSave()" class="btn large do">수정</a>
        <a href="javascript:onDelete()" class="btn large do">삭제</a>
            </c:when>
            <c:otherwise>
        <a href="javascript:onSave()" class="btn large do">등록</a>
            </c:otherwise>
        </c:choose>
        <a href="javascript:onList()" class="btn large list">목록</a>
    </div>
</form>
    <!-- 담당자 조회 -->
    <div class="popupWrap" id="findMgr">

    </div>

    <script >
        $(document).ready(function () {

        });

        // 담당자 조회 레이어 팝업
        function popUserSearchOpen(){
            var data = new Object();
            data.openId = "findMgr";
            ajax.jsonToLayerHtml("/sys/mngr/import/popMngrSearchAjax.do", JSON.stringify(data), "findMgr" );
        }

        function onAddMngr(mngrId, deptNm, mngrExpsrNm){
            var str = "<li class=\"marginT5\" id=\"" + mngrId + "\">" ;
            str += deptNm + "/" + mngrExpsrNm + "(" + mngrId + ")" ;
            str += "<input type=\"hidden\" name=\"mngrId\" value=\"" + mngrId + "\">" ;
            str += " <div class=\"inBlock\"><a href=\"javascript:onDelMngrId('" + mngrId + "')\" class=\"btn del undo\">삭제</a></div>";
            str += "</li>" ;

            $("#ulManage").append(str);

            $('body').removeClass('fixed');
            $('#findMgr').hide();
        }

        function onDelMngrId(mngrId){
            $("#" + mngrId).remove();
        }


        // 등록 처리
        function onSave() {
            var msg = "";
            var goUrl = "";

        	<c:choose>
            <c:when test="${modeType eq 'mod'}">
            msg = "수정 하시겠습니까?";
            goUrl = "/sys/site/siteModifyProcessAjax.do";
            </c:when>
            <c:otherwise>
            msg = "등록 하시겠습니까?";
            goUrl = "/sys/site/siteWriteProcessAjax.do";
            </c:otherwise>
            </c:choose>
            // 이메일 처리
            util.setEmail("chargerEmail");
            // 전화번호 저리
            util.setPhone("chargerCttpc");

            if(!validation.inputObj('siteSe', '사이트 구분을 선택해 주세요.', 7, 7)) return;
            if(!validation.inputStr($("#mainForm input:text[name='siteNm']").val(), '사이트명은 필수 등록 항목입니다.', "siteNm", 2, 100)) return;
            if(!validation.inputStr($("#mainForm input:text[name='windowSj']").val(), '윈도우 타이틀은 필수 등록 항목입니다.', "windowSj", 2, 100)) return;
            if(!validation.inputStr($("#mainForm input:text[name='domnOne']").val(), '도메인 1은 필수 등록 항목입니다.', "domnOne", 2, 100)) return;
            if(!validation.inputObj('langCode', '사이트 언어를 선택해 주세요.', 7, 7)) return;

            if(!validation.inputStr($("#mainForm input:text[name='deptNm']").val(), '담당부서는 필수 등록 항목입니다.', "deptNm", 2, 100)) return;
            if(!validation.inputStr($("#mainForm input:text[name='charger']").val(), '담당자는 필수 등록 항목입니다.', "charger", 2, 100)) return;

            if(!validation.isPhone("chargerCttpc", false, "전화번호 형식이 아닙니다.")) return;
            if(!validation.validateEmail("chargerEmail", false)) return;


            if(!validation.radioFromName("mainForm", "svcAt", "사용여부는 필수 항목입니다.") ) return;

            if( confirm(msg)){
            	ajax.json(goUrl);
            }
            return;
        }

        function onDelete(){
        	var goUrl = "<c:url value="/sys/site/siteDeleteProcessAjax.do" />";
        	if( confirm("삭제 하시겠습니까?")){
                ajax.json(goUrl);
            }
        }

        function onList(){
            util.fnPostSend('<c:url value="/sys/site/siteList.do" />');
        }

    </script>

