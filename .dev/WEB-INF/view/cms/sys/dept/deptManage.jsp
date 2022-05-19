<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<link rel="stylesheet" href="/resources/service/cms/js/jstree/themes/default/style.min.css" />
<script type="text/javascript" src="/resources/service/cms/js/jstree/jstree.min.js"></script>
<div class="flex">
	<div class="width15 treeMenuWrap">
		<p class="subTitle">코드 목록</p>
		<div class="">
			<div id="codeTree" class="demo jstree jstree-1 jstree-default"></div>
		</div>

		<div class="menuBtnWrap">
			<a href="javascript:onAllOpen(); " class="open">+</a> <a href="javascript:onAllClose(); " class="close">-</a>
		</div>
		<div class="marginT20">
			<a href="javascript:onSaveOrder();" class="btn large do">순서 변경</a>
		</div>
	</div>
	<div class="width85">
		<form name="mainForm" id="mainForm" method="post">
            <input type="hidden" name="deleteAt" id="deleteAt" value="N" >
			<p class="subTitle">부서 상세</p>
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
						<th>상위부서코드</th>
						<td><spen id="textUpperDeptNm"></spen>(<spen id="textUpperDeptCode"></spen>) <input type="hidden" name="upperDeptCode" id="upperDeptCode"></td>
					</tr>
					<tr>
						<th>부서코드</th>
						<td><spen id="textDeptCode"></spen> <input type="hidden" name="deptCode" id="deptCode"></td>
					</tr>
					<tr>
						<th>부서명 <span class="required">*</span></th>
						<td>
							<div class="width40">
								기본  <input type="text" name="deptNm" id="deptNm" placeholder="부서명을 입력하세요.">
								    <input type="hidden" name="langCode" id="langCode" value="">

								<c:forEach var="codeVo" items="${listCodeVo}" varStatus="status">
									<c:out value="${codeVo.codeNm }" />
									<input type="text" name="deptNm" id="deptNm" placeholder="부서명을 입력하세요.">
									<input type="hidden" name="langCode" id="langCode" value="${codeVo.code }">
								</c:forEach>
							</div>
							<div class="helpTxt">길이에 맞게 입력하세요. (2~100 Byte 사이)</div>
						</td>
					</tr>
					<tr>
                        <th>전화번호</th>
                        <td>
                            <div class="flex width100">
                                <input type="text" name="tlphonNo" id="tlphonNo">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>팩스번호</th>
                        <td>
                            <div class="flex width100">
                                <input type="text" name="faxNo" id="faxNo">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>주요업무</th>
                        <td>
                            <textarea name="mainJob" id="mainJob" rows="5" placeholder="주요업무를 입력하세요."></textarea>
                            <div class="helpTxt">최대 길이에 맞게 입력하세요. (300Byte)</div>
                        </td>
                    </tr>
					<tr>
						<th>사용여부 <span class="required">*</span></th>
						<td>
                            <code:radio tagClass="radioWrap" name="useAt" title="사용 여부" upperCode="C010000" defultCode="C010001" value="${param.useAt }" valueType="aditValueOne" />
						</td>
					</tr>
					<tr>
						<th>등록정보</th>
						<td>관리자(<spen id="textFrstRegisterId"></spen>) / <spen id="textFrstRegistDt"></spen></td>
					</tr>
					<tr>
						<th>수정정보</th>
						<td>관리자(<spen id="textLastUpdusrId"></spen>) / <spen id="textLastUpdtDt"></spen></td>
					</tr>
				</tbody>
			</table>
			<div class="btnWrap right marginT40">
				<a href="javascript:onSavePopOpen();" class="btn large do">하위코드등록</a>
				<a href="javascript:onSave(); " id="btnSave" class="btn large do">저장</a>
				<a href="javascript:onDelete(); " id="btnDelete" class="btn large undo">삭제</a>
			</div>
	   </form>
	</div>
</div>

<!-- 하위부서 등록 -->
<div class="popupWrap" id="subCodeRegister">
    <div class="popup">
        <form name="popupForm" id="popupForm" method="post" encType="multipart/form-data">
			<div class="titleWrap">
				<p class="title">하위코드 등록</p>
				<a href="javascript:popClose('subCodeRegister');" class="close"><span>닫기</span></a>
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
							<th>상위코드</th>
							<td><spen id="textUpperDeptNmPop"></spen>(<spen id="textUpperDeptCodePop"></spen>) <input type="hidden" name="upperDeptCode" id="upperDeptCodePop"></td>
						</tr>
						<tr>
							<th>코드 <span class="required">*</span></th>
							<td>
								<div class="inBlock width40 marginR20">
									<input type="text" name="deptCode" id="popDeptCode" placeholder="부서를 입력하세요." maxlength="7">
								</div> <!-- <div class="helpTxt" id="textUseCode">사용이 가능합니다.</div> -->
								<div>
									<div class="helpTxt">길이에 맞게 입력하세요. (7 Byte)</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>코드명 <span class="required">*</span></th>
							<td>
								<div class="width40">
									기본 <input type="text" name="deptNm" id="deptNmPop" placeholder="부서명을 입력하세요.">
									   <input type="hidden" name="langCode" id="langCodePop" value="" maxlength="100" >

									<c:forEach var="codeVo" items="${listCodeVo}" varStatus="status">
										<c:out value="${codeVo.codeNm }" />
										<input type="text" name="deptNm" id="deptNmPop" placeholder="부서명을 입력하세요." maxlength="100" >
										<input type="hidden" name="langCode" id="langCodePop" value="${codeVo.code }">
									</c:forEach>
								</div>
								<div class="helpTxt">길이에 맞게 입력하세요. (2~100 Byte 사이)</div>
							</td>
						</tr>
						<tr>
	                        <th>전화번호</th>
	                        <td>
	                            <div class="flex width100">
	                                <input type="text" name="tlphonNo" id="tlphonNoPop">
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>팩스번호</th>
	                        <td>
	                            <div class="flex width100">
	                                <input type="text" name="faxNo" id="faxNoPop">
	                            </div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>주요업무</th>
	                        <td>
	                            <textarea name="mainJob" id="mainJobPop" rows="5" placeholder="주요업무를 입력하세요."></textarea>
	                            <div class="helpTxt">최대 길이에 맞게 입력하세요. (300Byte)</div>
	                        </td>
	                    </tr>
						<tr>
							<th>사용여부<span class="required">*</span></th>
							<td>
								<div class="radioWrap">
									<input type="radio" name="useAt" id="useAtPopY" value="Y"> <label for="useAtPopY">사용</label>
								</div>
								<div class="radioWrap">
									<input type="radio" name="useAt" id="useAtPopN" value="N"> <label for="useAtPopN">미사용</label>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btnWrap right marginT40">
					<a href="javascript:onInsert();" class="btn large do">등록</a>
				</div>
			</div>
        </form>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function() {
        // 트리를 초기화 한다.
        fnSetJstree(null);

    });

    //트리를 만든다.
    function fnSetJstree(nodeId) {

        $('#codeTree').on("select_node.jstree", function(e, data) {
            // 선택시 발생
            //console.log(data);
            $('#codeTree').jstree('open_node', data.node.id);
            fnSetDeptCode(data.node);
        }).on("move_node.jstree", function(evt, data) {
            // 이동 후 처리
        }).on('loaded.jstree', function() {
            // load완료 후 처리
            if (nodeId != null) {
                $('#codeTree').jstree('select_node', nodeId);
            } else {
                $('#codeTree').jstree('select_node', 'D010000');
            }
        }).jstree({
            'core' : {
                'multiple' : false,
                'data' : {
                    "url" : "/sys/dept/listDeptCodeAjax.do",
                    "dataType" : "json",
                    "success" : function(node) {
                        // json 성공시 처리
                        console.log(node)
                    },
                    error : function(error) {
                        console.log(error);
                    }
                },
                "check_callback" : true,
                check_callback : function(op, node, parent, position, more) {
                    if (op === "move_node" && more && more.core) {
                        var result = true;
                        /*
                        if(node.original.upperCode != parent.original.code){
                          alert('같은 노드에서만 이동이 가능 합니다.');
                          result = false ;
                        }
                         */
                        return result;
                    }
                }
            },
            'plugins' : [ "contextmenu", "dnd" ],
            'contextmenu' : {
                "items" : function(node) {
                    return {
                        "add" : { //사실상 "test"라는 이름은 변수에 가깝기 때문에 뭐든 상관없다 생각한다.
                            "separator_before" : false,
                            "separator_after" : true,
                            "label" : "하위 부서 추가",
                            "_class" : "",
                            "action" : function(obj) {
                                // 선택된 코드를 상위 코드로 변경 한다.
                                onSavePopOpen();

                            }
                        },
                        "delte" : {
                            "separator_before" : false,
                            "separator_after" : true,
                            "label" : "삭제",
                            "_class" : "",
                            "action" : function(obj) {
                                onDelete();
                            }
                        }
                    }
                }
            }

        });
    }

    //코드 선택
    function fnSetDeptCode(node) {

        $("#textUpperDeptCode").text(node.original.upperDeptCode==null?'':node.original.upperDeptCode);
        $("#upperDeptCode").val(node.original.upperDeptCode);
        $("#textDeptCode").text(node.original.deptCode);
        $("#deptCode").val(node.original.deptCode);
        $("#deptNm").val(node.original.deptNm);

        $("#tlphonNo").val(node.original.tlphonNo);
        $("#faxNo").val(node.original.faxNo);
        $("#mainJob").val(node.original.mainJob);

        util.fnSetCheckBox('useAt', node.original.useAt, 'mainForm');

        $("#textFrstRegisterId").text(node.original.frstRegisterId);
        $("#textFrstRegistDt").text(node.original.frstRegistDt);

        $("#textLastUpdusrId").text(node.original.lastUpdusrId);
        $("#textLastUpdtDt").text(node.original.lastUpdtDt);

        var newNode = node;
        var arrUpperDeptNm = "";
        var forCount = 0;
        while (true) {
            if (newNode.parent == '#') {
                break;
            }

            newNode = $("#codeTree").jstree(true).get_node(newNode.parent);
            if (forCount > 0) {
                arrUpperDeptNm = newNode.text + " > " + arrUpperDeptNm

            } else {
                arrUpperDeptNm = newNode.text
            }
            forCount++;

        }

        $("#textUpperDeptNm").text(arrUpperDeptNm);

        var data = new Object();
        data.deptCode = node.original.deptCode;

        ajax.jsonToJson("/sys/dept/listDeptCodeLangAjax.do", setLangCode, JSON.stringify(data));
    }

    function setLangCode(listLangCode) {
        var deptNmArr = $("#mainForm input:text[name='deptNm']");
        for (i = 0; i < listLangCode.length; i++) {
            $(deptNmArr[i + 1]).val(listLangCode[i].deptNm);
        }
    }

    // 모두 펼치기
    function onAllOpen() {
        $("#codeTree").jstree('open_all');
    }

    // 모두 닫기
    function onAllClose() {
        $("#codeTree").jstree('close_all');
    }

    // 하위 코드 등록 팝업
    function onSavePopOpen() {
        var selNode = $('#codeTree').jstree('get_selected', true)[0];
        var newNode = selNode;

        var arrUpperDeptNm = newNode.text;

        while (true) {
            if (newNode.parent == null || newNode.parent == '#') {
                break;
            }
            newNode = $("#codeTree").jstree(true).get_node(newNode.parent);

            arrUpperDeptNm = newNode.text + " > " + arrUpperDeptNm
        }
        $("#textUpperDeptNmPop").text(arrUpperDeptNm);
        $("#textUpperDeptCodePop").text(selNode.id);
        $("#upperDeptCodePop").val(selNode.id);

        $("#tlphonNoPop").val('');
        $("#faxNoPop").val('');
        $("#mainJobPop").val('');


        var deptNmArr = $("#popupForm input:text[name='deptNm']");
        for( i = 0 ; i < deptNmArr.length ; i++ ){
            $(deptNmArr[i]).val('');
        }

        // 코드 자동 생성
        var data = new Object();
        data.upperCode = selNode.id;
        ajax.jsonToJson("/sys/dept/getMakeDeptCodeAjax.do", setPopCode, JSON.stringify(data));
        popOpen('subCodeRegister');
    }

    // 신규 생성 코드 반환 설정
    function setPopCode(webReauest) {
        $("#popDeptCode").val(webReauest.obj);
    }

    // 하위 코등 등록
    function onInsert() {
        // 등록 검증
        if(!validation.inputObj('upperDeptCodePop', '상위 부서를 선택해 주세요.', 7, 7)) return;
        if(!validation.inputObj('popDeptCode', '부서는 필수 등록 항목입니다.', 7, 7)) return;

        var deptNmArr = $("#popupForm input:text[name='deptNm']");

        if(!validation.inputStr($(deptNmArr[0]).val(), '기본 부서명은 필수 등록 항목입니다.', $(deptNmArr[0]), 2, 100)) return;

        if(!validation.radioFromName("popupForm", "useAt", "사용여부는 필수 항목입니다.") ) return;

        ajax.json("/sys/dept/insertDeptCodeAjax.do", onInsertReturn, null, "popupForm");

        return;
    }

    function onInsertReturn(webReauest){

        if(webReauest != null){

            if(webReauest.returnCode == "R001000"){
                alert('하위부서 등록 처리 완료  하였습니다.');
                popClose('subCodeRegister');
                var selNode = $('#codeTree').jstree('get_selected', true)[0];

                // 트리 다시 로딩
                $('#codeTree').jstree('destroy');
                fnSetJstree(selNode.id);

            } else {
                alert(webReauest.alertMessage);
            }
        } else {
            util.alert('<spring:message code="cmm.login.fail.system" />');
        }
    }

    // 수정
    function onSave() {
        // 등록 검증
        var selNode = $('#codeTree').jstree('get_selected', true)[0];

        if(selNode.parent != '#'){
            if(!validation.inputObj('upperDeptCode', '상위 부서를 선택해 주세요.', 7, 7)) return;
        }
        if(!validation.inputObj('deptCode', '부서코드는 필수 등록 항목입니다.', 7, 7)) return;

        var deptNmArr = $("#mainForm input:text[name='deptNm']");

        if(!validation.inputStr($(deptNmArr[0]).val(), '기본 코드명은 필수 등록 항목입니다.', $(deptNmArr[0]), 2, 100)) return;

        if(!validation.radioFromName("mainForm", "useAt", "사용여부는 필수 항목입니다.") ) return;

        ajax.json("/sys/dept/updateDeptCodeAjax.do", onUpdateReturn, null, "mainForm");

        return;
    }

    function onUpdateReturn(webReauest){

        if(webReauest != null){

            if(webReauest.returnCode == "R001000"){
                alert('부서코드를 저장 완료하였습니다.');
                var selNode = $('#codeTree').jstree('get_selected', true)[0];

                // 트리 다시 로딩
                $('#codeTree').jstree('destroy');

                fnSetJstree(selNode.id);

            } else {
                alert(webReauest.alertMessage);
            }
        } else {
            util.alert('<spring:message code="cmm.login.fail.system" />');
        }
    }

    function onDelete(){
        if(confirm('부서를 삭제 하시겠습니까?')){
            if(!validation.inputObj('deptCode', '부서 코드는 필수 등록 항목입니다.', 7, 7)) return;
            ajax.json("/sys/dept/deleteDeptCodeAjax.do", onDeleteReturn, null, "mainForm");
        }
        return;
    }

    function onDeleteReturn(webReauest){

        if(webReauest != null){

            if(webReauest.returnCode == "R001000"){
                alert('코드 삭제를 완료하였습니다.');
                var selNode = $('#codeTree').jstree('get_selected', true)[0];
                console.log(selNode);
                var selNodePrant = selNode.parent;
                // 트리 다시 로딩
                $('#codeTree').jstree('destroy');
                console.log("selNodePrant=" + selNodePrant);
                fnSetJstree(selNodePrant);

            } else {
                alert(webReauest.alertMessage);
            }
        } else {
            util.alert('<spring:message code="cmm.login.fail.system" />');
        }
    }

    // 순서 변경
    function onSaveOrder(){
        if(confirm('코드의 순서를 변경 하시겠습니까?')){
	        var jsonData =$("#codeTree").jstree(true).get_json('#', { 'flat': true });

	        var jsonObj = new Array() ;
	        for( i = 0 ; i < jsonData.length; i++){
	            var data = new Object() ;
	            data.code = jsonData[i].id ;
	            data.upperCode = jsonData[i].parent ;
	            jsonObj.push(data) ;
	        }

	        ajax.jsonToJson("/sys/dept/changeDeptCodeOrderAjax.do", onSaveOrderReturn, JSON.stringify(jsonObj) ) ;
        }
    }

    function onSaveOrderReturn(webReauest){

        if(webReauest != null){

            if(webReauest.returnCode == "R001000"){
                alert('부서 순서를 변경하였습니다.');
                // 트리 다시 로딩
                $('#codeTree').jstree('destroy');
                fnSetJstree(null);

            } else {
                alert(webReauest.alertMessage);
            }
        } else {
            util.alert('<spring:message code="cmm.login.fail.system" />');
        }
    }

</script>