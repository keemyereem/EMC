<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!-- page select form -->
<div class="paging marginT40">
    <ui:pagination paginationInfo="${paginationInfo}"  type="image" jsFunction="onMovePagr"  />
</div>
<script >
/*
  currentPageNo : 현재 선택된 페이지
  totalRecordCount : 전체 컨텐츠 수
  pageSize : 한 페이지당 보여직는 컨텐츠 수
  pageBlockSize recordCountPerPage : 노출될 페이지의 수


 */
function onMakePaging(currentPageNo, totalRecordCount, pageSize, pageBlockSize){
    var randerStr = "";

    var firstPageLabel = "<a href=\"#\"  onclick=\"{0}({1});return false; \" class=\"first\">첫페이지</a>";
    var previousPageLabel = "<a href=\"#\"  onclick=\"{0}({1});return false; \" class=\"prev\" >이전페이지</a>";
    var currentPageLabel = "<a ><strong>{0}</strong></a>";
    var otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); \">{2}</a>";
    var nextPageLabel = "<a href=\"#\" onclick=\"{0}({1}); \"  class=\"next\">다음페이지</a>";
    var lastPageLabel = "<a href=\"#\" onclick=\"{0}({1}); \" class=\"last\">마지막 페이지</a>";

    var firstNoLabel = "<a href=\"#\" class=\"first\">첫페이지</a>";
    var previousNoLabel = "<a href=\"#\" class=\"prev\">이전 블럭</a>";
    var nextNoLabel = "<a href=\"#\" class=\"next\">다음 블럭</a>";
    var lastNoLabel = "<a href=\"#\" class=\"last\">마지막 페이지</a>";

    var point = "";
    var trim = "";

    if(pageSize != undefined && pageSize != null){
        pageSize = 10 ;
    }
    if(recordCountPerPage != undefined && recordCountPerPage != null){
        recordCountPerPage = 10 ;
    }

    int firstPageNo = 1;
    int firstPageNoOnPageList = ((currentPageNo - 1) / pageSize ) * pageSize + 1;
    int totalPageCount = ((totalRecordCount - 1) / recordCountPerPage) + 1;
    int lastPageNoOnPageList = firstPageNoOnPageList + pageSize - 1;
    if (lastPageNoOnPageList > getTotalPageCount()) {
        lastPageNoOnPageList = getTotalPageCount();
    }
    int lastPageNo = totalPageCount;




    if(firstPageNoOnPageList > pageSize) {


    }

}

</script>
<a href="#a;" class="first">첫 페이지</a> <a href="#a;" class="prev">이전 페이지</a> <a href="#a;"><strong>1</strong></a> <a href="#a;">2</a> <a href="#a;">3</a> <a href="#a;">4</a> <a href="#a;">5</a> <a href="#a;">6</a> <a href="#a;">7</a> <a href="#a;">8</a> <a href="#a;">9</a> <a href="#a;" class="next">다음 페이지</a> <a href="#a;" class="last">마지막 페이지</a>