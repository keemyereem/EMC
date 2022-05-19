<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.PropertieUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>

<p class="subTitle">담당자 목록</p>

<form name="mainForm" id="mainForm" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" id="currentPageNo" name="currentPageNo" value="${param.currentPageNo eq null ? '1' : param.currentPageNo }" >
    <input type="hidden" id="mngrId" name="mngrId" value="" >
    
    <div class="searchWrap">
	    <div class="searchInWrap type2">
	        <div class="boxWrap paddingR10">
	            <div class="box width50">
	                <div class="title">부서</div>
	                <div class="inBlock width100">
	                   <code:selectBox id="searchDeptCode" name="searchDeptCode" title="부서" defultCode="C002001" listCodeVo="${webResult.obj }" />	                   
	                </div>
	            </div>
	            <div class="box width50">
	                <div class="title">담당자</div>
	                <div class="inBlock width100">
	                    <input type="text" id="searchMgr" name="searchMgr" value="${param.searchMgr }" placeholder="이름 또는 ID">
	                </div>
	            </div>
	        </div>
	        <div class="boxWrap paddingR10 marginT5">
	            <div class="box width25">
	                <div class="title">사용여부</div>
	                <code:selectBox id="searchUseYN" name="searchUseYN" title="사용여부" upperCode="C010000" defultCode="C002001" value="${param.searchUseYN }" valueType="aditValueOne"/>
	                
	            </div>
	            <div class="box width25">
	                <div class="title">계정상태</div>	                
	                <code:selectBox id="searchStat" name="searchStat" title="사용여부" upperCode="A011000" defultCode="C002001" value="${param.searchStat }" />
	            </div>
	            <div class="box width50">
	                <div class="title">검색사유 <span class="required">*</span></div>
	                <div class="inBlock width100">
	                    <input type="text" id="searchReason" name="searchReason" value="" placeholder="검색사유를 입력하세요">
	                </div>
	            </div>
	        </div>
	        <div class="btnWrap">
	            <a href="javascript:onSearch('');" class="btn search">검색</a>
	            <a href="javascript:onSearch('reset');" class="btn do">초기화</a>
	        </div>
	    </div>
	</div>

	<div class="helpTxt type2 marginT5">※ 담당자정보를 조회하시려면 <strong>검색사유</strong>를 꼭 입력하셔야 합니다.</div>

    <jsp:include page="/WEB-INF/view/cms/cmm/include/listSrarch.jsp"></jsp:include>

	<table class="col" id="listTable">
		<caption></caption>
		<colgroup>
			<col style="width: 5%;">
            <col style="width: 5%;">
            <col style="width: 15%;">
            <col style="width: 15%;">
            <col style="width: 15%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col style="width: 10%;">
            <col style="width: 15%;">
		</colgroup>
		<thead>
			<tr>
				<th>
                    <div class="chkWrap none">
                        <input type="checkbox" name="chkAll" id="chkAll">
                        <label for="chkAll">전체선택</label>
                    </div>
                </th>
                <th>번호</th>
                <th>담당자ID</th>
                <th>담당자명</th>
                <th>부서</th>
                <th>직급</th>
                <th>사용여부</th>
                <th>계정상태</th>
                <th>최종접속일시</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>
</form>
<div id="paging" class="paging marginT40"></div>



                <div class="btnWrap right marginT40">
                    <a href="javascript:popOpen('assignPermissions');" class="btn large do">일괄권한지정</a>
                    <a href="javascript:popOpen('excelSave');" class="btn large do">엑셀저장</a>
                    <a href="javascript:util.fnPostSend('<c:url value="/sys/mngr/mngrWrite.do" />')" class="btn large do">담당자등록</a>
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

                 <!-- 권한 지정 -->
                 <div class="popupWrap" id="assignPermissions">
                    <div class="popup">
                        <div class="titleWrap">
                            <p class="title">권한 지정</p>
                            <a href="javascript:popClose('assignPermissions');" class="close"><span>닫기</span></a>
                        </div>
                        <div class="contWrap">
                            <div class="helpTxt">※ 지정하고자 하는 권한을 선택한 후 저장버튼을 클릭하세요.</div>
                            <table class="col">
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 5%;">
                                    <col>
                                    <col style="width: 20%;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>
                                            <div class="chkWrap none">
                                                <input type="checkbox" name="assignChkAll" id="assignChkAll">
                                                <label for="assignChkAll"></label>
                                            </div>
                                        </th>
                                        <th>권한명</th>
                                        <th>지정 권한 메뉴 목록</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="chkWrap none">
                                                <input type="checkbox" name="assignChk" id="assignChk">
                                                <label for="assignChk"></label>
                                            </div>
                                        </td>
                                        <td>권한 1</td>
                                        <td>
                                            <div class="inBlock"><a href="javascript:popOpen('assignList');" class="btn small do">보기</a></div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="btnWrap right marginT40">
                                <a href="#a;" class="btn large do">저장</a>
                            </div>                                                    
                        </div>
                    </div>
                </div>

                <!-- 지정 권한 메뉴 목록 -->
                <div class="popupWrap" id="assignList">
                    <div class="popup">
                        <div class="titleWrap">
                            <p class="title">지정 권한 메뉴 목록</p>
                            <a href="javascript:popClose('assignList');" class="close"><span>닫기</span></a>
                        </div>
                        <div class="contWrap">                            
                            <div class="listCountWrap">
                                <div>권한 : 권한1</div>
                                <div class="count">지정 권한 : <strong>2</strong>건</div>
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

                <!-- 엑셀출력 -->
                <div class="popupWrap" id="excelSave">
                    <div class="popup small">
                        <div class="titleWrap">
                            <p class="title">엑셀출력</p>
                            <a href="javascript:popClose('excelSave');" class="close"><span>닫기</span></a>
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
                                    
                                    <tr>
                                        <th>출력사유 <span class="required">*</span></th>
                                        <td>
                                            <textarea name="saveReason" id="saveReason" rows="5" placeholder="출력사유를 입력하세요."></textarea>
                                            <div class="helpTxt">최대 길이에 맞게 입력하세요. (300Byte)</div>
                                        </td>
                                    </tr>                                                                                                      
                                </tbody>
                            </table>    
                            <div class="btnWrap right marginT40">
                                <a href="#a;" class="btn large do">엑셀출력</a>
                            </div>                        
                        </div>
                    </div>
                </div>
                
<script >
	window.onpopstate = function(event) {
	    if(event.state != null){
	        $("#pageSize").val(event.state.pageSize);
	        $("#currentPageNo").val(event.state.currentPageNo);
	        onMakeTableList();
	    }
	}
	
	
	$(document).ready(function () {
	    // 사이트 리스트의 내용을 가지고 온다.
	    onMovePage($("#currentPageNo").val()); // totalRecordCount, pageSize, pageBlockSize, jsFunction
	});
	
	function onMovePage(pageNo){
	   $("#currentPageNo").val(pageNo) ;
	   history.pushState( util.formToJson("mainForm"), null, document.location.href);
	   onMakeTableList();
	}
	
	function onMakeTableList(){
	   ajax.tableList("<c:url value="/sys/mngr/import/mngrListAjax.do" />", "listTable");
	}
	
	// 페이징 설정
	function onSetPageHtml(pageHtml){
	   $("#paging").html(pageHtml);
	}
	
	// 수정화면
	function onModifyForm(mngrId){
	   $("#mngrId").val(mngrId) ;
	   util.fnPostSend('<c:url value="/sys/mngr/mngrModify.do" />') ;
	
	}
	
	// 담당자 검색
    function onSearch(type){
        // 사이트 리스트의 내용을 가지고 온다.
        $("#currentPageNo").val(1) ;
        
        if( type == "reset" ){ // 검색 초기화            
        	$("#searchDeptCode").val("");
            $("#searchMngr").val("");
            $("#searchUseYN").val("");
            $("#searchStat").val("");
            $("#searchReason").val("");            
        }
                
        ajax.tableList("<c:url value="/sys/mngr/import/mngrListAjax.do" />", "listTable");
    }

</script>

