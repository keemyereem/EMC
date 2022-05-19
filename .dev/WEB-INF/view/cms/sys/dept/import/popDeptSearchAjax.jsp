<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.CommonUtils"%>
<%@ page import="java.util.Arrays"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>

<form name="mainPopForm" id="mainPopForm" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" id="currentPageNo" name="currentPageNo" value="1" >
    <input type="hidden" id="deptCodeAddrArr" name="deptCodeAddrArr" >
    
                <div class="popup small">
                        <div class="titleWrap">
                            <p class="title">부서조회</p>
                            <a href="javascript:popClose('${webResult.params.openId }');" class="close"><span>닫기</span></a>
                        </div>
                        <div class="contWrap">
                            <div class="searchWrap">
                                <div class="searchInWrap type2">
                                    <div class="boxWrap paddingR10">
                                        <div class="box width100">
                                            <div class="title">부서명</div>
                                            <div class="inBlock width100">                                                
                                                <input type="text" name="searchKeyword" id="searchKeyword" placeholder="부서명을 입력하세요.">
                                            </div>
                                        </div>                                        
                                    </div>
                                    <div class="btnWrap">
                                        <a href="javascript:onSearch('');" class="btn search">검색</a>
                                        <a href="javascript:onSearch('reset');" class="btn do">초기화</a>
                                    </div>
                                </div>
                            </div>
                            <table class="col" id="listTable" >
                                <caption></caption>
                                <colgroup>
                                    <col style="width: 15%;">
                                    <col style="width: 20%;">
                                    <col>                                    
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>부서코드</th>
                                        <th>부서명</th>                                                                                
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>  
                            <div id="paging" class="paging marginT40"></div>
                                              
                        </div>
                    </div>
                    
</form>



<script>

    $(document).ready(function () {
        onMovePage(1);
    });

    function onMovePage(pageNo){
        // 사이트 리스트의 내용을 가지고 온다.
        $("#currentPageNo").val(pageNo) ;
        
        var deptCodeAddr = $("input:hidden[name=deptCode]") ;
        var str = "" ;
        for(i = 0 ; i < deptCodeAddr.length ; i++){            
            if( i > 0 ){
                str += "/";
            }
            str += $(deptCodeAddr[i]).val();
        }
        //console.log(str)
        $("#deptCodeAddrArr").val(str);
        
        ajax.tableList("<c:url value="/sys/dept/import/popDeptListAjax.do" />", "listTable", null, null, "mainPopForm");
    }
    
    
    // 페이징 설정
    function onSetPageHtml(pageHtml){
       $("#paging").html(pageHtml);
    }
    // 담당자 검색
    function onSearch(type){
        // 사이트 리스트의 내용을 가지고 온다.
        $("#currentPageNo").val(1) ;
        
        if( type == "reset" ){ // 검색 초기화
            $("#searchKeyword").val("");            
        }
        
        var deptCodeAddr = $("input:hidden[name=deptCode]") ;
        var str = "" ;
        for(i = 0 ; i < deptCodeAddr.length ; i++){            
            if( i > 0 ){
                str += "/";
            }
            str += $(deptCodeAddr[i]).val();
        }
        //console.log(str)
        $("#deptCodeAddrArr").val(str);
        
        ajax.tableList("<c:url value="/sys/dept/import/popDeptListAjax.do" />", "listTable", null, null, "mainPopForm");
    }
    
    
    function onSetSearchText(currentPageNo, totalRecordCount, totalPageCount){

        if(totalRecordCount > 0){
            $("#textTotalRecordCount").html(totalRecordCount);
            $("#textCurrentPageNo").html(currentPageNo);
            $("#textTotalPageCount").html(totalPageCount);
        } else {
            $("#textTotalRecordCount").html(0);
            $("#textCurrentPageNo").html('');
            $("#textTotalPageCount").html('');
        }

    }
    
</script>

