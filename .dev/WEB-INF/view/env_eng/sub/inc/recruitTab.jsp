<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <c:set var="tabIndex">${empty webResult.params.tabIndex ? '1' : webResult.params.tabIndex}</c:set>

                        <div class="tab_list">
                            <ul class="nav_btn" data-aos="fade-up" data-aos-duration="600" data-aos-offset="200">
                                <li class="${tabIndex eq '1' ? 'on' : ''}"><a href="javascript:fn_moveTab(1, '', '5', 'BM0000000004');">채용공고</a></li>
                                <li class="${tabIndex eq '2' ? 'on' : ''}"><a href="javascript:fn_moveTab(2, 'recruit_process', '5', '');">채용 프로세스</a></li>
                                <li class="${tabIndex eq '3' ? 'on' : ''}"><a href="javascript:fn_moveTab(3, 'recruit_intro', '5', '');">직무 소개</a></li>
                                <li class="${tabIndex eq '4' ? 'on' : ''}"><a href="javascript:fn_moveTab(4, 'recruit_faq', '5', '');">채용 FAQ</a></li>
                            </ul>
                        </div>

                        <input type="hidden" id="bbsNo" name="bbsNo" value="<c:out value="${not empty webResult.params.bbsNo ? webResult.params.bbsNo : bbsMstDtl.bbsNo}" />" />
                        <input type="hidden" id="tabIndex" name="tabIndex" value="<c:out value='${tabIndex}' />" />
                        <input type="hidden" id="MENUNO" name="MENUNO" value="<c:out value='${webResult.params.MENUNO}' />" />
                        <input type="hidden" id="MENUID" name="MENUID" value="<c:out value='${webResult.params.MENUID}' />" />

<script>
// MENUID=ethical_management&MENUNO=3
	function fn_moveTab(tabIndex, menuId, menuNo, bbsNo) {

		$("#tabIndex").val(tabIndex);
		$("#MENUID").val(menuId);
		$("#MENUNO").val(menuNo);
		$("#bbsNo").val(bbsNo);

		let moveUrl = '<c:url value="/en/sub.do" />';

		if (tabIndex == "1") {
			moveUrl = '<c:url value="/en/bbs/data/bbsDataList.do" />';
		}

		util.fnPostSend(moveUrl) ;
	}
</script>