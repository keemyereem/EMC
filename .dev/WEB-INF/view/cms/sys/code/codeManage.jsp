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
			<p class="subTitle">코드 상세</p>
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
						<td><spen id="textUpperCodeNm"></spen>(<spen id="textUpperCode"></spen>) <input type="hidden" name="upperCode" id="upperCode"></td>
					</tr>
					<tr>
						<th>코드</th>
						<td><spen id="textCode"></spen> <input type="hidden" name="code" id="code"></td>
					</tr>
					<tr>
						<th>코드명 <span class="required">*</span></th>
						<td>
							<div class="width40">
								기본 <input type="text" name="codeNm" id="codeNm" placeholder="코드명을 입력하세요."> <input type="hidden" name="langCode" id="langCode" value="">

								<c:forEach var="codeVo" items="${listCodeVo}" varStatus="status">
									<c:out value="${codeVo.codeNm }" />
									<input type="text" name="codeNm" id="codeNm" placeholder="코드명을 입력하세요.">
									<input type="hidden" name="langCode" id="langCode" value="${codeVo.code }">
								</c:forEach>
							</div>
							<div class="helpTxt">길이에 맞게 입력하세요. (2~100 Byte 사이)</div>
						</td>
					</tr>
					<tr>
						<th>기타</th>
						<td>
							<div class="width40">
								<input type="text" name="aditValueOne" id="aditValueOne" placeholder="기타 1 입력하세요.">
							</div>
							<div class="width40 marginT5">
								<input type="text" name="aditValueTwo" id="aditValueTwo" placeholder="기타 2 입력하세요.">
							</div>
							<div class="width40 marginT5">
								<input type="text" name="aditValueThree" id="aditValueThree" placeholder="기타 3 입력하세요.">
							</div>
							<div class="helpTxt">길이에 맞게 입력하세요. (2~100 Byte 사이)</div>
						</td>
					</tr>
					<tr>
						<th>코드설명</th>
						<td><textarea name="codeDc" id="codeDc" rows="5" placeholder="코드설명을 입력하세요."></textarea>
							<div class="helpTxt">최대 길이에 맞게 입력하세요. (2000Byte)</div></td>
					</tr>
					<tr>
						<th>사용여부 <span class="required">*</span></th>
						<td>
							<div class="radioWrap">
								<input type="radio" name="useAt" id="useAtY" value="Y"> <label for="useAtY">사용</label>
							</div>
							<div class="radioWrap">
								<input type="radio" name="useAt" id="useAtN" value="N"> <label for="useAtN">미사용</label>
							</div>
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

<!-- 엑셀일괄등록 -->
<div class="popupWrap" id="excelUpload">
	<div class="popup">
		<div class="titleWrap">
			<p class="title">엑셀일괄등록</p>
			<a href="javascript:popClose('excelUpload');" class="close"><span>닫기</span></a>
		</div>
		<div class="contWrap type2">
			<div>
				<b class="title">※ 일괄등록순서</b>
				<ul class="list">
					<li>1. 샘플서식파일을 다운로드 받는다.</li>
					<li>2. 다운로드 받은 서식을 열고 작성한다.
						<ul>
							<li>∙ 엑셀 데이터의 행은 500행을 넘지 않게 작성합니다.</li>
							<li>∙ 부서코드 20자 이하, 상위부서코드 20자 이하, 코드명은 30자 이하, 주요업무 100자 이하</li>
						</ul>
					</li>
					<li>3. 작성된 엑셀파일을 업로드한다.</li>
					<li>4. 불러오기 버튼을 클릭하여 업로드한 정보를 확인한다.</li>
					<li>5. 일괄 등록한 정보를 제외하고는 삭제 처리한다.</li>
					<li>6. 일괄등록 버튼을 클릭한다.</li>
				</ul>
			</div>
			<table class="row marginT15">
				<caption></caption>
				<colgroup>
					<col style="width: 30%;">
					<col style="width: 70%;">
				</colgroup>
				<tbody>
					<tr>
						<th>샘플서식</th>
						<td>
							<div class="inBlock">
								<a href="#a;" class="btn small do">샘플서식파일 다운로드</a>
							</div>
						</td>
					</tr>
					<tr>
						<th>업로드 <span class="required">*</span></th>
						<td>
							<div class="fileWrap">
								<div class="inBlock">
									<label for="fileUpload" class="invisible"></label> <input type="file" name="fileUpload" id="fileUpload">
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="tab marginT35">
				<ul>
					<li class="on"><a href="#a;"><span class="name">정상</span></a></li>
					<li><a href="#a;"><span class="name">오류</span></a></li>
				</ul>
			</div>
			<div class="tabContainer">
				<div class="tabConts">
					<div class="btnWrap right">
						<a href="#a;" class="btn large do">불러오기</a>
					</div>
					<table class="col">
						<caption></caption>
						<colgroup>
							<col style="width: 5%;">
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col>
							<col style="width: 9%;">
						</colgroup>
						<thead>
							<tr>
								<th>
									<div class="chkWrap none">
										<input type="checkbox" name="chkAll" id="chkAll"> <label for="chkAll"></label>
									</div>
								</th>
								<th>상위부서명</th>
								<th>상위부서코드</th>
								<th>부서명</th>
								<th>부서코드</th>
								<th>전화번호</th>
								<th>팩스번호</th>
								<th>주요업무</th>
								<th>사용여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="chkWrap none">
										<input type="checkbox" name="chk" id="chk"> <label for="chk"></label>
									</div>
								</td>
								<td>부서목록 > 고객지원사업부 > IB</td>
								<td>D10357</td>
								<td>경영지원실</td>
								<td>D14890</td>
								<td>02-0000-0000</td>
								<td>02-1000-1000</td>
								<td>경영지원</td>
								<td>사용</td>
							</tr>
						</tbody>
					</table>
					<div class="btnWrap right marginT10">
						<a href="#a;" class="btn large undo">선택삭제</a> <a href="#a;" class="btn large do">일괄등록</a>
					</div>
					<div class="paging marginT40">
						<a href="#a;" class="first">첫 페이지</a> <a href="#a;" class="prev">이전 페이지</a> <a href="#a;"><strong>1</strong></a> <a href="#a;">2</a> <a href="#a;">3</a> <a href="#a;">4</a> <a href="#a;">5</a> <a href="#a;">6</a> <a href="#a;">7</a> <a href="#a;">8</a> <a href="#a;">9</a> <a href="#a;" class="next">다음 페이지</a> <a href="#a;" class="last">마지막 페이지</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

    <!-- 하위코드 등록 -->
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
							<td><spen id="textUpperCodeNmPop"></spen>(<spen id="textUpperCodePop"></spen>) <input type="hidden" name="upperCode" id="upperCodePop"></td>
						</tr>
						<tr>
							<th>코드 <span class="required">*</span></th>
							<td>
								<div class="inBlock width40 marginR20">
									<input type="text" name="code" id="popCode" placeholder="코드를 입력하세요." maxlength="7">
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
									기본 <input type="text" name="codeNm" id="codeNmPop" placeholder="코드명을 입력하세요."> <input type="hidden" name="langCode" id="langCodePop" value="" maxlength="100" >

									<c:forEach var="codeVo" items="${listCodeVo}" varStatus="status">
										<c:out value="${codeVo.codeNm }" />
										<input type="text" name="codeNm" id="codeNmPop" placeholder="코드명을 입력하세요." maxlength="100" >
										<input type="hidden" name="langCode" id="langCodePop" value="${codeVo.code }">
									</c:forEach>
								</div>
								<div class="helpTxt">길이에 맞게 입력하세요. (2~100 Byte 사이)</div>
							</td>
						</tr>
						<tr>
							<th>기타</th>
							<td>
								<div class="width40">
									<input type="text" name="aditValueOne" id="aditValueOnePop" placeholder="기타 1 입력하세요." maxlength="100" >
								</div>
								<div class="width40 marginT5">
									<input type="text" name="aditValueTwo" id="aditValueTwoPop" placeholder="기타 2 입력하세요." maxlength="100" >
								</div>
								<div class="width40 marginT5">
									<input type="text" name="aditValueThree" id="aditValueThreePop" placeholder="기타 3 입력하세요." maxlength="100" >
								</div>
								<div class="helpTxt">길이에 맞게 입력하세요. (100 Byte 이내)</div>
							</td>
						</tr>
						<tr>
							<th>코드설명</th>
							<td><textarea name="codeDc" id="codeDcPop" rows="5" placeholder="코드설명을 입력하세요." maxlength="200" ></textarea>
								<div class="helpTxt">최대 길이에 맞게 입력하세요. (200 Byte 이내)</div></td>
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
            fnSetCode(data.node);
        }).on("move_node.jstree", function(evt, data) {
            // 이동 후 처리
        }).on('loaded.jstree', function() {
            // load완료 후 처리
            if (nodeId != null) {
                $('#codeTree').jstree('select_node', nodeId);
            } else {
                $('#codeTree').jstree('select_node', 'C000000');
            }
        }).jstree({
            'core' : {
                'multiple' : false,
                'data' : {
                    "url" : "/sys/code/listCodeAjax.do",
                    "dataType" : "json",
                    "success" : function(node) {
                        // json 성공시 처리
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
                            "label" : "하위 코드 추가",
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
    function fnSetCode(node) {
        console.log('---------fnSetCode--------');
        console.log(node);

        $("#textUpperCode").text(node.original.upperCode==null?'':node.original.upperCode);
        $("#upperCode").val(node.original.upperCode);
        $("#textCode").text(node.original.code);
        $("#code").val(node.original.code);
        $("#codeNm").val(node.original.codeNm);

        $("#aditValueOne").val(node.original.aditValueOne);
        $("#aditValueTwo").val(node.original.aditValueTwo);
        $("#aditValueThree").val(node.original.aditValueThree);

        $("#codeDc").val(node.original.codeDc);

        util.fnSetCheckBox('useAt', node.original.useAt, 'mainForm');

        $("#textFrstRegisterId").text(node.original.frstRegisterId);
        $("#textFrstRegistDt").text(node.original.frstRegistDt);

        $("#textLastUpdusrId").text(node.original.lastUpdusrId);
        $("#textLastUpdtDt").text(node.original.lastUpdtDt);

        var newNode = node;
        var arrUpperCodeNm = "";
        var forCount = 0;
        while (true) {
            if (newNode.parent == '#') {
                break;
            }

            newNode = $("#codeTree").jstree(true).get_node(newNode.parent);
            if (forCount > 0) {
                arrUpperCodeNm = newNode.text + " > " + arrUpperCodeNm

            } else {
                arrUpperCodeNm = newNode.text
            }
            forCount++;

        }

        $("#textUpperCodeNm").text(arrUpperCodeNm);

        var data = new Object();
        data.code = node.original.code;

        ajax.jsonToJson("/sys/code/listCodeLangAjax.do", setLangCode, JSON.stringify(data));
    }

    function setLangCode(listLangCode) {
        var codeNmArr = $("#mainForm input:text[name='codeNm']");
        for (i = 0; i < listLangCode.length; i++) {
            $(codeNmArr[i + 1]).val(listLangCode[i].codeNm);
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

        var arrUpperCodeNm = newNode.text;

        while (true) {
            if (newNode.parent == null || newNode.parent == '#') {
                break;
            }
            newNode = $("#codeTree").jstree(true).get_node(newNode.parent);

            arrUpperCodeNm = newNode.text + " > " + arrUpperCodeNm
        }
        $("#textUpperCodeNmPop").text(arrUpperCodeNm);
        $("#textUpperCodePop").text(selNode.id);
        $("#upperCodePop").val(selNode.id);

        $("#aditValueOnePop").val('');
        $("#aditValueTwoPop").val('');
        $("#aditValueThreePop").val('');
        $("#codeDcPop").val('');

        var codeNmArr = $("#popupForm input:text[name='codeNm']");
        for( i = 0 ; i < codeNmArr.length ; i++ ){
            $(codeNmArr[i]).val('');
        }

        // 코드 자동 생성
        var data = new Object();
        data.upperCode = selNode.id;
        ajax.jsonToJson("/sys/code/getMakeCodeAjax.do", setPopCode, JSON.stringify(data));
        popOpen('subCodeRegister');
    }

    // 신규 생성 코드 반환 설정
    function setPopCode(webReauest) {
        $("#popCode").val(webReauest.obj);
    }

    // 하위 코등 등록
    function onInsert() {
        // 등록 검증
        if(!validation.inputObj('upperCodePop', '상위 코드를 선택해 주세요.', 7, 7)) return;
        if(!validation.inputObj('popCode', '코드는 필수 등록 항목입니다.', 7, 7)) return;

        var codeNmArr = $("#popupForm input:text[name='codeNm']");

        if(!validation.inputStr($(codeNmArr[0]).val(), '기본 코드명은 필수 등록 항목입니다.', $(codeNmArr[0]), 2, 100)) return;

        if(!validation.radioFromName("popupForm", "useAt", "사용여부는 필수 항목입니다.") ) return;

        ajax.json("/sys/code/insertCodeAjax.do", onInsertReturn, null, "popupForm");

        return;
    }

    function onInsertReturn(webReauest){

        if(webReauest != null){

            if(webReauest.returnCode == "R001000"){
                alert('하위코드 등록 처리 완료  하였습니다.');
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
            if(!validation.inputObj('upperCode', '상위 코드를 선택해 주세요.', 7, 7)) return;
        }
        if(!validation.inputObj('code', '코드는 필수 등록 항목입니다.', 7, 7)) return;

        var codeNmArr = $("#mainForm input:text[name='codeNm']");

        if(!validation.inputStr($(codeNmArr[0]).val(), '기본 코드명은 필수 등록 항목입니다.', $(codeNmArr[0]), 2, 100)) return;

        if(!validation.radioFromName("mainForm", "useAt", "사용여부는 필수 항목입니다.") ) return;

        ajax.json("/sys/code/updateCodeAjax.do", onUpdateReturn, null, "mainForm");

        return;
    }

    function onUpdateReturn(webReauest){

        if(webReauest != null){

            if(webReauest.returnCode == "R001000"){
                alert('코드 저장 완료하였습니다.');
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
        if(confirm('코드를 삭제 하시겠습니까?')){
            if(!validation.inputObj('code', '코드는 필수 등록 항목입니다.', 7, 7)) return;
            ajax.json("/sys/code/deleteCodeAjax.do", onDeleteReturn, null, "mainForm");
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

	        ajax.jsonToJson("/sys/code/changeCodeOrderAjax.do", onSaveOrderReturn, JSON.stringify(jsonObj) ) ;
        }
    }

    function onSaveOrderReturn(webReauest){

        if(webReauest != null){

            if(webReauest.returnCode == "R001000"){
                alert('코드 순서를 변경하였습니다.');
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