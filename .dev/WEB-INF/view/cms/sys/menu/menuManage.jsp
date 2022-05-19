<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.PropertieUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<link rel="stylesheet" href="/resources/service/cms/js/jstree/themes/default/style.min.css" />
<script type="text/javascript" src="/resources/service/cms/js/jstree/jstree.min.js"></script>

<p class="subTitle">사이트 등록</p>
<form name="mainForm" id="mainForm" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" name="siteCode" id="siteCode" value="${param.siteCode }" />
    <input type="hidden" name="menuCode" id="menuCode" />
    <div class="flex">
        <div class="width15 treeMenuWrap">
            <p class="subTitle">메뉴 목록</p>
            <div class="">
                <div id="menuTree" class="demo jstree jstree-1 jstree-default"></div>
            </div>
            <div class="menuBtnWrap">
                <a href="#a;" class="open">+</a> <a href="#a;" class="close">-</a>
            </div>
            <div class="marginT20">
                <a href="javascript:popOpen('excelUpload');" class="btn large do">엑셀일괄등록</a>
            </div>
        </div>
        <div class="width85" id="noSelectMenu">
            <div class="wrap">
                <p class="subTitle">메뉴 상세</p>
                <div class="noData">
                                            메뉴가 선택되지 않았습니다.<br> 좌측 목록에서 메뉴를 선택하세요.
                </div>
            </div>
        </div>
        <div class="width85" id="selectMenu" >

        </div>
    </div>
</form>
<!-- 하위메뉴 등록 -->
<form name="writeForm" id="writeForm" >
    <input type="hidden" name="siteCode" value="${param.siteCode }" />
    <input type="hidden" name="upperMenuCode" />

    <div class="popupWrap" id="subMenuRegister">

    </div>
</form>

<script>
    $(document).ready(function() {
        // 트리를 초기화 한다.
        fnSetJstree(null);
    });

    //트리를 만든다.
    function fnSetJstree(nodeId) {

        var inData = $('#mainForm').serialize();
        console.log(inData) ;
        $('#menuTree').on("select_node.jstree", function(e, data) {
            // 노드 선택 할경우 이벤트 발생
            $('#menuTree').jstree('open_node', data.node.id);
            fnSetCode(data.node);
        }).on("move_node.jstree", function(evt, data) {
            // 이동 후 처리
        }).on('loaded.jstree', function() {
            // load완료 후 처리
            if (nodeId != null) {
                $('#menuTree').jstree('select_node', nodeId);
            } else {
                // $('#menuTree').jstree('select_node', 'C000000');
            }
        }).jstree({
            'core' : {
            'multiple' : false,
            'data' : {
                "url" : '<c:out value="/sys/menu/menuTreeListAjax.do" />',
                "data" : inData,
                "dataType" : "json",
                contentType: false,
                processData: false,
                cache: false,
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
                            "label" : "하위 메뉴 추가",
                            "_class" : "",
                            "action" : function(obj) {
                                // 선택된 코드를 상위 코드로 변경 한다.
                                onMenuWritePopOpen();

                            }
                        },
                        "delte" : {
                            "separator_before" : false,
                            "separator_after" : true,
                            "label" : "메뉴 삭제",
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

    // 선택한 값의 내용을 가지고 와서 View화면에 보여 준다.
    function fnSetCode(node) {
        console.log(node.id.substring(3,7)) ;
        // 최상위 메뉴인지 확인
        if(node.id.substring(3,7) == '0000'){
            // 메뉴 선택 메세지
            $("#noSelectMenu").show();
            $("#selectMenu").html('');
            $("#selectMenu").hide();
        } else {
            $("#noSelectMenu").hide();
            $("#selectMenu").show();
            $("#menuCode").val(node.id);

            var data = new Object();
            data.menuCode = node.id;

            ajax.jsonToHtml("/sys/menu/menuViewAjax.do", JSON.stringify(data), "selectMenu");



        }
        /*
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

            newNode = $("#menuTree").jstree(true).get_node(newNode.parent);
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
         */
    }

    // 하위 메뉴 등록 팝업
    function onMenuWritePopOpen() {
        var selNode = $('#menuTree').jstree('get_selected', true)[0];
        $("#writeForm input[name='upperMenuCode']").val(selNode.id);

        var data = new Object();
        data.siteCode = $("#writeForm input[name='siteCode']").val();
        data.upperMenuCode = $("#writeForm input[name='upperMenuCode']").val();
        console.log(data)
        ajax.jsonToLayerHtml("/sys/menu/menuWriteAjax.do", JSON.stringify(data), "subMenuRegister")

    }

    // 삭제
    function onDelete(){
        /*
        if(confirm('코드를 삭제 하시겠습니까?')){
            if(!validation.inputObj('code', '코드는 필수 등록 항목입니다.', 7, 7)) return;
            ajax.json("/sys/code/deleteCodeAjax.do", onDeleteReturn, null, "mainForm");
        }
        return;
        */
    }
    // 삭제 반환 함수
    function onDeleteReturn(webReauest){
        /*
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
        */
    }

    /** 신규 등록 후 처리 함수 */
    function onInsertReturn(webReauest){

        if(webReauest != null){
            if(!webReauest.isError){
                popClose('subMenuRegister');
                $("#subMenuRegister").html();
                $("#writeForm input[name='upperMenuCode']").val('');

                alert('하위메듀 등록 처리 완료  하였습니다.');
                var selNode = $('#menuTree').jstree('get_selected', true)[0];

                // 트리 다시 로딩
                $('#menuTree').jstree('destroy');
                fnSetJstree(selNode.id);

            } else {
                alert(webReauest.alertMessage);
            }
        } else {
            util.alert('<spring:message code="cmm.login.fail.system" />');
        }
    }
</script>

