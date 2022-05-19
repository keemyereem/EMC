<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.PropertieUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>

<form name="mainForm" id="mainForm" method="post" >
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" id="currentPageNo" name="currentPageNo" value="<c:out value="${param.currentPageNo }" />" >
    <input type="hidden" id="pageSize" name="pageSize" value="<c:out value="${param.pageSize }" />" >
    <input type="hidden" id="modeType" name="modeType" value="<c:out value="${modeType}" />" >
    <input type="hidden" id="mngrId" name="mngrId" value="<c:out value="${webResult.obj.mngrId }" />" >



                <p class="subTitle">담당자 상세</p>
                <div class="tab">
                    <ul>
                        <li class="on"><a href="#a;"><span class="name">담당자정보</span></a></li>
                        <li><a href="#a;"><span class="name">권한지정</span></a></li>
                        <li><a href="#a;"><span class="name">지정권한메뉴</span></a></li>
                    </ul>
                </div>

                <div class="tabContainer">
                    <div class="tabConts">

                        <p class="txtRight"><span class="required">*</span> 항목은 필수 입력항목입니다.</p>
                        <table class="row">
                            <caption></caption>
                            <colgroup>
                                <col style="width: 15%;">
                                <col style="width: 85%;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>아이디 <span class="required">*</span></th>
                                    <td>${webResult.obj.mngrId }</td>
                                </tr>
                                <tr>
                                    <th>이름 <span class="required">*</span></th>
                                    <td>
                                        <div class="width40">
                                            <input type="text" name="mngrExpsrNm" id="mngrExpsrNm" placeholder="이름을 입력하세요." maxlength="60" value="${webResult.obj.mngrExpsrNm }">
                                        </div>
                                        <div class="helpTxt">최대 길이에 맞게 입력하세요. (60Byte)</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>부서명 <span class="required">*</span></th>
                                    <td>
                                        <div class="inBlock"><a href="javascript:popDeptSearchOpen();" class="btn small do">부서조회</a></div>
                                        <ul class="marginT10" id="ulDept">

                                              <li class="marginT5" id="<c:out value="${webResult.obj.deptCode}" />">${webResult.obj.deptNm }
                                                    <input type="hidden" name="deptCode" value="<c:out value="${webResult.obj.deptCode}" />" >
                                                    <div class="inBlock"><a href="javascript:onDelDeptCode('${webResult.obj.deptCode}');" class="btn del undo">삭제</a></div>
                                              </li>

                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th>직급 <span class="required">*</span></th>
                                    <td>
                                        <div class="width20">
                                            <code:selectBox id="clsfCode" title="직급 선택" upperCode="A010000" defultCode="C002001" value="${webResult.obj.clsfCode }" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>개인정보취급여부 <span class="required">*</span></th>
                                    <td>
                                        <code:radio tagClass="radioWrap" name="indvdlInfoTrtmntAt" title="사용 여부" upperCode="C032000" defultCode="C010001" value="${webResult.obj.indvdlInfoTrtmntAt }" valueType="aditValueOne" />

                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일 <span class="required">*</span></th>
                                    <td>
                                        <code:email id="mngrEmail" name="mngrEmail" tagClass="flex width70" title="담당자 이메일" value="${webResult.obj.mngrEmail }"/>

                                    </td>
                                </tr>
                                <tr>
                                    <th>전화번호</th>
                                    <td>
                                        <code:tel id="telno" tagClass="flex width50" telUpperCode="C030000" defultCode="C002001" title="전화번호선택" value="${webResult.obj.telno }"/>

                                    </td>
                                </tr>
                                <tr>
                                    <th>팩스번호</th>
                                    <td>
                                        <code:tel id="fxnum"  tagClass="flex width50" telUpperCode="C030000" defultCode="C002001" title="팩스번호 선택" value="${webResult.obj.fxnum }"/>

                                    </td>
                                </tr>
                                <tr>
                                    <th>휴대폰번호</th>
                                    <td>
                                        <code:tel id="mbtlnum"  tagClass="flex width50" telUpperCode="C031000" defultCode="C002001" title="휴대폰번호 선택" value="${webResult.obj.mbtlnum }"/>

                                    </td>
                                </tr>
                                <tr>
                                    <th>담당업무</th>
                                    <td>
                                        <textarea name="chrgJob" id="chrgJob" rows="5" placeholder="담당업무를 입력하세요.">${webResult.obj.chrgJob }</textarea>
                                        <div class="helpTxt">길이에 맞게 입력하세요. (2~2000 Byte 사이)</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>사용여부 <span class="required">*</span></th>
                                    <td>
                                        <code:radio tagClass="radioWrap" name="useAt" title="사용 여부" upperCode="C010000" defultCode="C010001" value="${webResult.obj.useAt }" valueType="aditValueOne" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>계정상태</th>
                                    <td>
                                        ${webResult.obj.mngrAcntSttusNm }
                                        <div class="marginL20 inBlock"><a href="javascript:popOpen('loginLockHistory');" class="btn small do">계정해제이력</a></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>등록정보</th>
                                    <td>${webResult.obj.frstRegisterNm }(${webResult.obj.frstRegisterId }) / <fmt:formatDate type="date" pattern="yyyy-MM-dd HH:mm:ss" value="${webResult.obj.frstRegistDt}" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>수정정보</th>
                                    <td>${webResult.obj.lastUpdusrNm }(${webResult.obj.lastUpdusrId }) / <fmt:formatDate type="date" pattern="yyyy-MM-dd HH:mm:ss" value="${webResult.obj.lastUpdtDt}" />
                                    </td>
                                </tr>



                            </tbody>
                        </table>
                        <div class="btnWrap right marginT40">
                            <a href="#a;" class="btn large do">비밀번호재설정</a>
                            <c:if test="${webResult.obj.mngrAcntSttus eq 'A011002'}">

                            </c:if>
                            <a href="javascript:popOpen('loginLock');" class="btn large do">계정잠김해제</a>

                            <a href="javascript:onSave()" class="btn large do">저장</a>
                            <a href="javascript:onDelete()" class="btn large do">삭제</a>
                            <a href="javascript:onList()" class="btn large list">목록</a>
                        </div>
                    </div>
                    <div class="tabConts">
                        <div class="helpTxt marginT20">※ 지정하고자 하는 권한그룹을 선택한 후 저장버튼을 클릭하세요.</div>
                        <div class="flex marginT20">
                            <div class="width15">
                                <p class="subTitle type2">권한그룹 목록</p>
                                <div class="roleScrollWrap">
                                    <table class="col">
                                        <caption></caption>
                                        <colgroup>
                                            <col style="width: 20%;">
                                            <col>
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="chkWrap none">
                                                        <input type="checkbox" name="chkAll" id="chkAll">
                                                        <label for="chkAll"></label>
                                                    </div>
                                                </th>
                                                <th>권한그룹</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="chkWrap none">
                                                        <input type="checkbox" name="chk" id="chk">
                                                        <label for="chk"></label>
                                                    </div>
                                                </td>
                                                <td><a href="#a;">권한 1</a></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="chkWrap none">
                                                        <input type="checkbox" name="chk" id="chk">
                                                        <label for="chk"></label>
                                                    </div>
                                                </td>
                                                <td><a href="#a;">권한 1</a></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="chkWrap none">
                                                        <input type="checkbox" name="chk" id="chk">
                                                        <label for="chk"></label>
                                                    </div>
                                                </td>
                                                <td><a href="#a;">권한 1</a></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="chkWrap none">
                                                        <input type="checkbox" name="chk" id="chk">
                                                        <label for="chk"></label>
                                                    </div>
                                                </td>
                                                <td><a href="#a;">권한 1</a></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="chkWrap none">
                                                        <input type="checkbox" name="chk" id="chk">
                                                        <label for="chk"></label>
                                                    </div>
                                                </td>
                                                <td><a href="#a;">권한 1</a></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="chkWrap none">
                                                        <input type="checkbox" name="chk" id="chk">
                                                        <label for="chk"></label>
                                                    </div>
                                                </td>
                                                <td><a href="#a;">권한 1</a></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="chkWrap none">
                                                        <input type="checkbox" name="chk" id="chk">
                                                        <label for="chk"></label>
                                                    </div>
                                                </td>
                                                <td><a href="#a;">권한 1</a></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="chkWrap none">
                                                        <input type="checkbox" name="chk" id="chk">
                                                        <label for="chk"></label>
                                                    </div>
                                                </td>
                                                <td><a href="#a;">권한 1</a></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="chkWrap none">
                                                        <input type="checkbox" name="chk" id="chk">
                                                        <label for="chk"></label>
                                                    </div>
                                                </td>
                                                <td><a href="#a;">권한 1</a></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="chkWrap none">
                                                        <input type="checkbox" name="chk" id="chk">
                                                        <label for="chk"></label>
                                                    </div>
                                                </td>
                                                <td><a href="#a;">권한 1</a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="marginT20">
                                    <a href="#a;" class="btn large do">저장</a>
                                </div>
                            </div>
                            <div class="width85 paddingL20">
                                <p class="subTitle type2">권한그룹별 지정 메뉴 목록</p>
                                <div class="listCountWrap">
                                    <div class="count">권한그룹 : 권한 1 (<strong>2</strong>건)</div>
                                </div>
                                <table class="col">
                                    <caption></caption>
                                    <colgroup>
                                        <col>
                                        <col style="width: 20%;">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>메뉴명</th>
                                            <th>사용권한</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>시스템관리</td>
                                            <td>조회권한</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="tabConts">
                        <p class="subTitle type2 marginT20">권한그룹 : 권한1, 권한2</p>
                        <div class="listCountWrap">
                            <div class="count">지정 권한 메뉴 : <strong>4</strong>건</div>
                        </div>
                        <table class="col">
                            <caption></caption>
                            <colgroup>
                                <col>
                                <col style="width: 20%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>메뉴명</th>
                                    <th>사용권한</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>시스템관리</td>
                                    <td>조회권한</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>


                <!-- 부서조회 -->
                <div class="popupWrap" id="findDept">

                </div>

                <!-- 계정잠김해제 -->
                <div class="popupWrap" id="loginLock">
                    <div class="popup small">
                        <div class="titleWrap">
                            <p class="title">계정잠김해제</p>
                            <a href="javascript:popClose('loginLock');" class="close"><span>닫기</span></a>
                        </div>
                        <div class="contWrap">
                            <p class="txtRight"><span class="required">*</span> 항목은 필수 입력항목입니다.</p>
                            <table class="row">
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 25%;">
                                    <col style="width: 75%;">
                                </colgroup>
                                <tbody>
                                    </tr>
                                    <tr>
                                        <th>잠김해제 사유 <span class="required">*</span></th>
                                        <td>
                                            <textarea name="lockReason" id="lockReason" rows="5" placeholder="잠김해제 사유를 입력하세요."></textarea>
                                            <div class="helpTxt">최대 길이에 맞게 입력하세요. (100Byte)</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="btnWrap right marginT40">
                                <a href="#a;" class="btn large do">잠김해제</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 계정해제이력 -->
                <div class="popupWrap" id="loginLockHistory">
                    <div class="popup small">
                        <div class="titleWrap">
                            <p class="title">계정해제이력</p>
                            <a href="javascript:popClose('loginLockHistory');" class="close"><span>닫기</span></a>
                        </div>
                        <div class="contWrap">
                            <table class="col">
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 15%;">
                                    <col style="width: 35%;">
                                    <col>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>일시</th>
                                        <th>잠김해제사유</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>10</td>
                                        <td>2020-02-15 11:00:26</td>
                                        <td>비밀번호 오류</td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>2020-02-15 11:00:26</td>
                                        <td>비밀번호 오류</td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>2020-02-15 11:00:26</td>
                                        <td>비밀번호 오류</td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>2020-02-15 11:00:26</td>
                                        <td>비밀번호 오류</td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>2020-02-15 11:00:26</td>
                                        <td>비밀번호 오류</td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>2020-02-15 11:00:26</td>
                                        <td>비밀번호 오류</td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>2020-02-15 11:00:26</td>
                                        <td>비밀번호 오류</td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>2020-02-15 11:00:26</td>
                                        <td>비밀번호 오류</td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>2020-02-15 11:00:26</td>
                                        <td>비밀번호 오류</td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>2020-02-15 11:00:26</td>
                                        <td>비밀번호 오류</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                 </div>

</form>


    <script >
        $(document).ready(function () {

        });
        // 이메일 세팅
        function onChangeEmailDomn(obj){
            $('#email2').val(obj.value);
        }
        // 부서조회 팝업
        function popDeptSearchOpen(){
            var data = new Object();
            data.openId = "findDept";

            ajax.jsonToLayerHtml("<c:url value="/sys/dept/import/popDeptSearchAjax.do" />", JSON.stringify(data), "findDept" );

        }
        // 부서 선택 추가
        function onAddDept(deptCode, deptNm){

            var str = "<li class=\"marginT5\" id=\"" + deptCode + "\">" ;
            str += deptNm ;
            str += "<input type=\"hidden\" name=\"deptCode\" value=\"" + deptCode + "\">" ;
            str += " <div class=\"inBlock\"><a href=\"javascript:onDelDeptCode('" + deptCode + "')\" class=\"btn del undo\">삭제</a></div>";
            str += "</li>" ;

            //$("#ulDept").append(str);
            $("#ulDept").html(str);

            $('body').removeClass('fixed');
            $('#findDept').hide();
        }
        // 부서 삭제
        function onDelDeptCode(deptCode){
            $("#" + deptCode).remove();
        }


        // 등록 처리
        function onSave() {
            var msg   = "";
            var goUrl = "";

            msg   = "수정 하시겠습니까?";
            goUrl = "<c:url value="/sys/mngr/mngrModifyProcessAjax.do" />";

            // 이메일 처리
            util.setEmail("mngrEmail");
            // 전화번호 저리
            util.setPhone("telno");
            // 팩스번호
            util.setPhone("fxnum");
            // 휴대폰번호
            util.setPhone("mbtlnum");

            if(!validation.inputObj("mngrExpsrNm", '이름은 필수 등록 항목입니다.', 1, 60)) return;
            if(!validation.inputObj('clsfCode', '직급을 선택해 주세요.', 7, 7)) return;
            if(!validation.radioFromName("mainForm", "indvdlInfoTrtmntAt", "개인정보취급여부는 필수 항목입니다.") ) return;
            if(!validation.validateEmail("mngrEmail")) return;
            if(!validation.isPhone("telno",   false, "전화번호 형식이 아닙니다.")) return;
            if(!validation.isPhone("fxnum",   false, "전화번호 형식이 아닙니다.")) return;
            if(!validation.isPhone("mbtlnum", false, "휴대폰 형식이 아닙니다.")) return;

            if(!validation.radioFromName("mainForm", "useAt", "사용여부는 필수 항목입니다.") ) return;

            if( confirm(msg)){
                ajax.json(goUrl);
            }
            return;
        }

        function onDelete(){
            var goUrl = "<c:url value="/sys/mngr/mngrDeleteProcessAjax.do" />";
            if( confirm("삭제 하시겠습니까?")){
                ajax.json(goUrl);
            }
        }

        function onPasswordReset(){
            var goUrl = "<c:url value="/sys/mngr/mngrPasswordProcessAjax.do" />";
            if( confirm("비밀번호를 재설정 하시겠습니까?")){
                ajax.json(goUrl);
            }
        }

        function onList(){
            util.fnPostSend('<c:url value="/sys/mngr/mngrList.do" />');
        }

    </script>
