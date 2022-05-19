<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<%@ taglib prefix="file" uri="/WEB-INF/tlds/fileLib.tld"%>

<form name="mainForm" id="mainForm" method="post">
    <input type="hidden" name="<c:out value='${_csrf.parameterName}' />" value="<c:out value='${_csrf.token}' />" />
    <input type="hidden" id="bbsNo" name="bbsNo" value="<c:out value='${webResult.params.bbsNo}' />" />
    <input type="hidden" id="nttNo" name="nttNo" />

    <input type="hidden" id="MENUNO" name="MENUNO" value="<c:out value='${webResult.params.MENUNO}' />" />
    <input type="hidden" id="MENUID" name="MENUID" value="<c:out value='${webResult.params.MENUID}' />" />

            <div class="sub_visual sustain_visual">
                <div class="sub_visual_nav">
                    <h2>지속가능경영</h2>
                    <div class="sub_visual_nav_prev">
                        <a href="javascript:link(2,0);" title="이전메뉴로 이동">
                            <span>사업소개</span>
                            <img src="/resources/service/env/images/common/sub_visual_nav_prev.png" alt="sub_visual_nav_prev">
                        </a>
                    </div>
                    <div class="sub_visual_nav_next">
                        <a href="javascript:linkBBS(4,0, 'BM0000000002');" title="다음메뉴로 이동">
                            <img src="/resources/service/env/images/common/sub_visual_nav_next.png" alt="sub_visual_nav_next">
                            <span>투자정보</span>
                        </a>
                    </div>
                </div>

                <!--
                <div class="sub_visual_m">
                    <h2>지속가능경영</h2>
                    <div class="location">
                        <a href="javascript:;" class="loccation_tit" title="하위메뉴열기">사회공헌</a>
                        <div class="drop_box">
                            <ul>
                                <li><a href="javascript:;" title="페이지 이동">윤리경영</a></li>
                                <li><a href="javascript:;" title="페이지 이동">안전보건</a></li>
                                <li><a href="javascript:;" title="페이지 이동">공정거래 자율준수 프로그램</a></li>
                                <li><a href="javascript:;" title="페이지 이동">탄소저감</a></li>
                                <li class="active"><a href="javascript:;" title="페이지 이동">사회공헌</a></li>
                            </ul>
                        </div>
                    </div>
                </div> -->

                <div class="sub_visual_menu">
                    <div class="home"></div>

                </div>
            </div>

            <jsp:include page="/WEB-INF/view/cms/cmm/include/listSrarch.jsp" />

            <div class="contents cont_sustain">
                <div class="contents_inner">
                    <div class="icon" data-aos="fade-up">
                        <img src="/resources/service/env/images/sustain/sustain_tit_icon.png" alt="타이틀 아이콘">
                    </div>

                    <h3 class="title" data-aos="fade-up" data-aos-offset="200"><c:out value='${bbsMstDtl.bbsNm}' /></h3>

                    <div class="sub_contents SC_sub_con">
                        <div class="inner">

                        <section class="section1" data-aos="fade-up" data-aos-offset="500">
                            <div class="sc_desc">
                                <p><img src="/resources/service/env/images/sustain/SC_story_tit.png" alt="SC_story_tit"></p>
                                <h3 class="title">이야기의 출발</h3>
                                <p>
                                    환경시설관리주식회사는 독거노인 및 소년∙소녀가장 등 취약계층의 든든한 친구가 되고자 <br>
                                    “깨끗함”과 “따뜻함”을 모티브로 한 ‘이불빨래’와 ‘단열캡(일명 뾱뾱이)’ 활동을 시작 하였습니다.<br>
                                    행복과 따뜻한 기운이 전국적으로 확대되기를 바라는 마음으로 매일 매일 ‘해피바이러스 이야기’를 써나가고 있습니다.<br>
                                    환경시설관리주식회사의 임직원들은 환경을 보호하는 기업의 일원으로서 국가와 사회에 기여한다는 <br>
                                    자부심을 다른 어떤 기업에서도 느낄 수 없는 소중한 가치로 삼으며, 다양한 사회공헌활동에 모두 적극적으로 참여하고 있습니다.
                                </p>
                            </div>
                            <div class="sc_obj">
                                <p><span>Mission</span>나눔을 통해 지역사회와 함께 성장하는 ‘착한기업’</p>
                                <div>
                                    <div>
                                        <p>착한기업 선언</p>
                                        <p>환경시설관리주식회사 임직원 일동</p>
                                    </div>
                                    <ul class="sc_obj_box">
                                        <li>
                                            <div class="sc_obj_box_inner">
                                                <div>01<span>하나</span></div>
                                                <div>
                                                    임직원 자발적 참여로<br>
                                                    진정성이 담긴 실질적이고<br>
                                                    실용적인 나눔 활동을 한다.
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="sc_obj_box_inner">
                                                <div>02<span>둘</span></div>
                                                <div>
                                                    사업장 소재의<br>
                                                    지역사회에 집중한다.
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="sc_obj_box_inner">
                                                <div>03<span>셋</span></div>
                                                <div>
                                                    지역인재 중심의 채용으로<br>
                                                    지역사회의 경제활성화에<br>
                                                    기여한다.
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="sc_obj_box_inner">
                                                <div>04<span>넷</span></div>
                                                <div>
                                                    윤리적인 가치관을 기반으로<br>
                                                    국가와 지역사회의<br>
                                                    법규와 관습을 준수한다.
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </section>

                        <section class="section2" data-aos="fade-up" data-aos-offset="500">
                            <div class="sc_desc">
                                <p><img src="/resources/service/env/images/sustain/SC_major_tit.png" alt="SC_major_tit"></p>
                                <h3 class="title">주요활동</h3>
                            </div>
                            <div class="sc_obj">
                                <ul>
                                    <li>
                                        <p><img src="/resources/service/env/images/sustain/SC_act1.png" alt="SC_act1"></p>
                                        <p>
                                            <span>'두레' 이불빨래</span>
                                            독거노인, 소년∙소녀 가장 등<br>
                                            취약계층을 위해 부피가 큰<br>
                                            이불빨래를 날씨 좋은 봄 여름철<br>
                                            찾아가 직접 해결해드립니다.
                                        </p>
                                    </li>
                                    <li>
                                        <p><img src="/resources/service/env/images/sustain/SC_act2.png" alt="SC_act2"></p>
                                        <p>
                                            <span>‘온정’ 단열에어캡</span>
                                            추운 동절기 독거노인의 주거지<br>
                                            방한을 위한 ‘단열 에어캡‘ 설치를<br>
                                            통해 ‘온정(溫情)’을 나눕니다.
                                        </p>
                                    </li>
                                    <li>
                                        <p><img src="/resources/service/env/images/sustain/SC_act3.png" alt="SC_act3"></p>
                                        <p>
                                            <span>'워터' 하천정화</span>
                                            환경시설관리주식회사가<br>
                                            운영∙관리하는 하수처리장 인근<br>
                                            방류 하천 및 생태공원을 깨끗한<br>
                                            시민의 쉼터로 가꾸는 하천정화<br>
                                            활동을 정기적으로 진행합니다.
                                        </p>
                                    </li>
                                    <li>
                                        <p><img src="/resources/service/env/images/sustain/SC_act4.png" alt="SC_act4"></p>
                                        <p>
                                            <span>'푸드' 급식나눔</span>
                                            지역사회 복지관을 찾아 어르신들의<br>
                                            식사를 정성스럽게 대접하는 급식<br>
                                            나눔 활동을 진행합니다.
                                        </p>
                                    </li>
                                    <li>
                                        <p><img src="/resources/service/env/images/sustain/SC_act5.png" alt="SC_act5"></p>
                                        <p>
                                            <span>‘소소대심(小小大心)’ 캠페인</span>
                                            매달 임직원들의 자발적인 급여끝전모으기를 통해 적은 금액이지만 큰 마음을 전달하는 ‘소소대심 캠페인’을 진행합니다.<br>
                                            임직원이 기부한 금액만큼 회사에서 후원하는 매칭 그랜트를 통해 연말 취약계층의 마음에 따뜻함을 전합니다.
                                        </p>
                                    </li>

                                </ul>
                            </div>
                        </section>

                            <section class="section3">
                                <div class="sc_desc" data-aos="fade-up" data-aos-offset="300">
                                    <p><img src="/resources/service/env/images/sustain/SC_news_tit.png" alt="SC_news_tit"></p>
                                    <h3 class="title">소식</h3>
                                </div>
			                    <div class="irsearch_contents">
			                        <div class="inner">

		                            <div class="search">
		                                <div class="input_row input_search">
		                                    <input type="text" id="searchText" name="searchText" placeholder="검색어를 입력해 주세요." value="<c:out value='${webResult.params.searchText}' />" />
		                                    <a href="javascript:fn_search();"><img src="/resources/service/env/images/common/icon_inp_search.png" alt="검색"></a>
		                                </div>
		                            </div>

				                            <div class="news_list">
				                                <ul id="ul-list">
				                                    <%@ include file="/WEB-INF/view/cms/bbs/data/import/bbsDataListAjax.jsp" %>
				                                </ul>
				                                <div id="btn-more" class="btn_more">
				                                    <a href="javascript:onViewMore();">
				                                        <div class="icon"><i></i><i></i></div>
				                                        <span id="moreListSpan"></span>
				                                    </a>
				                               </div>
				                            </div>

			                        </div>
			                    </div>
			                </section>

			            </div>
			        </div>

                </div>
            </div>
    <input type="text" style="display:none;"/>
</form>

<script>

    currentPageNum(3,4);

    $("#searchText").on("keyup",function(key){
        if(key.keyCode==13) {
            fn_search();
        }
    });

    function fn_search() {

        $("#pageSize").val(6);
        $("#currentPageNo").val(1);

        onMakeNewMoreList();

    }

    function onMakeNewMoreList() {

        $("#ul-list").html("");

        ajax.moreList("<c:url value="/bbs/data/import/bbsDataListAjax.do" />", "ul-list", fn_viewMoreResult);
    }

   function onViewMore() {

	   let pageSize = $("#pageSize").val();
	   let currentPageNo = parseInt($("#currentPageNo").val());

	   currentPageNo = currentPageNo + 1;

	   $("#currentPageNo").val(currentPageNo) ;

       onMakeMoreList();
   }

   function onMakeMoreList() {
       ajax.moreList("<c:url value="/bbs/data/import/bbsDataListAjax.do" />", "ul-list", fn_viewMoreResult);
   }

   function fn_viewMoreResult() {

       let totalCnt = $('#valTotalRecordCount').val();
       let showCnt = $('#ul-list > li').size();

       $("#moreListSpan").html("more list (" + showCnt + " / " + totalCnt + ")");

       if (showCnt >= totalCnt || totalCnt  == 0 || totalCnt == "0") {
           $("#btn-more").css("display", "none");
       } else {
           $("#btn-more").css("display", "block");
       }

   }

   function onView(nttNo) {
       $("#nttNo").val(nttNo) ;
       util.fnPostSend('<c:url value="/bbs/data/bbsDataView.do" />') ;
   }

   $(document).ready(function () {
       fn_viewMoreResult();

       const prevViewNttNo = "<c:out value='${webResult.params.nttNo}' />";
       if (prevViewNttNo != "" && $("#bbs-data-" + prevViewNttNo).length == 1) {
    	   var offset = $("#bbs-data-" + prevViewNttNo).offset();
    	   $("html").animate({scrollTop : offset.top - 400}, 400);
       }
   });
</script>