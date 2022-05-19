<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="file" uri="/WEB-INF/tlds/fileLib.tld"%>
<script>
    $(document).ready( function() {
        mainEvent.init();

        setTimeout("location.reload()", 11000); // 약 10초후 화면이 새로고침이 됩니다.

    });
</script>
            <div class="contents cont_main">
                <section class="section0">
                    <div class="vis_scroll"></div>
                    <div id="main_visual" class="main_visual">
                        <div class="txt">
                            최상의 서비스를 제공하는 <br>
                            글로벌 환경전문기업을 만들어갑니다.
                        </div>
                        
                        <!-- slide swiper lists -->
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="bg bg01">
                                    <video id="mainvideo01" src="/resources/service/env/videos/077721315_main_xl.mp4" playsinline muted loop autoplay data-keepplaying class="video_bg"></video>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="bg bg02">
                                    <video id="mainvideo02" src="/resources/service/env/videos/160704589_main_xl.mp4" playsinline muted loop autoplay data-keepplaying class="video_bg"></video>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="bg bg03">
                                    <video id="mainvideo03" src="/resources/service/env/videos/140958349_main_xl.mp4" playsinline muted loop autoplay data-keepplaying class="video_bg"></video>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="bg bg04">
                                    <video id="mainvideo03" src="/resources/service/env/videos/098171513_main_xl.mp4" playsinline muted loop autoplay data-keepplaying class="video_bg"></video>
                                </div>
                            </div>
                        </div>
                    </div>  
                    <div class="naviPlay">
                        <span class="naviAuto">
                            <a href="javascript:;" class="autoplay"><img src="/resources/service/env/images/common/icon_pause.png" /></a>
                        </span>
                        <span id="fPrev" class="arrow left swiper-button-prev"><a href="javascript:;"><img src="/resources/service/env/images/common/icon_left.png" alt="이전 슬라이드" /></a></span>
                        <span id="fNext" class="arrow right swiper-button-next"><a href="javascript:;"><img src="/resources/service/env/images/common/icon_right.png" alt="다음 슬라이드" /></a></span>
                        <div class="main_notice">
                            <div class="slide_bar">
                                <div class="swiper-pagination"></div>
                                <span class="playbar playbar1">
                                    <span class="playTime"></span>
                                </span>
                                <span class="playbar playbar2">
                                    <span class="playTime"></span>
                                </span>
                                <span class="playbar playbar3">
                                    <span class="playTime"></span>
                                </span>
                                <span class="playbar playbar4">
                                    <span class="playTime"></span>
                                </span>
                            </div>
                        </div>
                    </div>                      
                </section>
                <%@ include file="/WEB-INF/view/env/carbonReduc/carbonReducMainAjax.jsp" %>
                
                <section class="section2">
                    <div class="tit_area">
                        <h2 class="title" data-aos="zoom-out" data-aos-duration="500">Business area</h2>
                        <p class="sub_con" data-aos="fade-up" data-aos-delay="500">
                            오랜 기간 경험의 바탕과 <b>끊임없는<br class="br_m"> 도전</b>으로<br class="br_pc">
                            <b>환경분야 최고 수준의<br class="br_m"> 기술력</b>을 갖춘 기업이 될 것입니다.
                        </p>
                    </div>  
                    <div class="line"></div>  
                    <ul class="business_list ani-on">
                        <li data-type="parallax" data-speed="20">
                            <div class="img"><img src="/resources/service/env/images/main/main_bus01.png" alt="O&M 이미지"></div>
                            <div class="txt">
                                <dl>
                                    <dt>O&M</dt>
                                    <dd>
                                        환경시설관리주식회사는 대한민국의 환경기초시설 <br class="br_pc">
                                        운영관리 선두주자로서, 국내 최고의 기술인력으로 <br class="br_pc">
                                        하폐수처리시설, 폐기물처리시설 등 전국 <br class="br_pc">
                                        1,300여개 이상의 처리시설을 운영하고 있습니다.
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li data-type="parallax_reverse" data-speed="20">
                            <div class="img"><img src="/resources/service/env/images/main/main_bus02.png" alt="환경건설 이미지"></div>
                            <div class="txt">
                                <dl>
                                    <dt>환경건설</dt>
                                    <dd>
                                        환경시설관리주식회사는 설립이래 20년 이상 축적된 설계, <br class="br_pc">
                                        시공, 운영 경험을 바탕으로 환경시설 신설/개량 사업에 적극 참여, <br class="br_pc">
                                        소중한 공공자산을 지켜나가고 있습니다.
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li data-type="parallax" data-speed="30">
                            <div class="img"><img src="/resources/service/env/images/main/main_bus03.png" alt="에너지 이미지"></div>
                            <div class="txt">
                                <dl>
                                    <dt>에너지</dt>
                                    <dd>
                                        환경시설관리주식회사는 폐기물을 안전하게 소각 처리하고, <br class="br_pc">
                                        처리과정에서 발생되는 열원 등을 발전 및 온수공급에 <br class="br_pc">
                                        활용하여 폐기물을 에너지화하고 있습니다. 
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li data-type="parallax_reverse" data-speed="30">
                            <div class="img"><img src="/resources/service/env/images/main/main_bus04.png" alt="자연순환 이미지"></div>
                            <div class="txt">
                                <dl>
                                    <dt>자연순환</dt>
                                    <dd>
                                        환경시설관리주식회사는 버려지는 폐기물을 <br class="br_pc">
                                        감량화, 자원화, 에너지화 함으로써 자원을 재활용하고 <br class="br_pc">
                                        자연환경을 보호하고 있습니다.
                                    </dd>
                                </dl>
                            </div>
                        </li>
                    </ul>
                </section>
                
                <section class="section3">
                    <div class="tit_area">
                        <h2 class="title" data-aos="zoom-out" data-aos-duration="500">지속가능경영</h2>
                        <p class="sub_con" data-aos="fade-up" data-aos-delay="500">
                            <b>지속 가능한 친환경 경영을<br class="br_m"> </b>을 실천하는 EMC
                        </p>
                    </div> 
                    <div class="sustain_list">
                        <img src="/resources/service/env/images/main/s3_bg01.png" alt="" class="s3_bg01">
                        <img src="/resources/service/env/images/main/s3_bg02.png" alt="" class="s3_bg02">
                        <img src="/resources/service/env/images/main/s3_bg03.png" alt="" class="s3_bg03">
                        <img src="/resources/service/env/images/main/s3_bg04.png" alt="" class="s3_bg04">
                        <img src="/resources/service/env/images/main/s3_bg05.png" alt="" class="s3_bg05">
                        <div class="swiper-container">
                            <ul class="swiper-wrapper">
                                <li class="swiper-slide">
                                    <div>
                                        <div class="sustain_tit">윤리경영</div>
                                        <p class="sustain_sub">
                                            요령을 피우지 않고 멀리 보고 큰 이익을<br class="br_m"> 추구하는 경영으로
                                            투명한 경영활동과<br class="br_m"> 사회적 책임을 다함으로써 이해관계자에게<br class="br_m">
                                            존경받는 기업이 되고자 노력하고 있습니다.                                        
                                        </p>
                                        <a href="javascript:link(3,0);" class="view_more">자세히보기</a> 
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <div>
                                        <div class="sustain_tit">안전보건</div>
                                        <p class="sustain_sub">
                                            안전보건관리를 경영의 최우선 가치로 선정하여<br class="br_m"> 구성원과
                                            이해관계자의 행복을 지키기 위해<br class="br_m"> 체계적인 관리 절차 수립과 관련
                                            규정을 철저히 준수하고<br class="br_m"> 안전한 작업환경을 조성하고 있습니다.                                        
                                        </p>
                                        <a href="javascript:link(3,1);" class="view_more">자세히보기</a> 
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <div>
                                        <div class="sustain_tit">공정거래 자율준수 프로그램</div>
                                        <p class="sustain_sub">
                                            환경시설관리주식회사는 자율준수 프로그램의 실행을<br class="br_m"> 위한
                                            규정과 규칙을 제정하였으며, 구성원들의<br class="br_m"> 자발적인 법규 준수를 통하여
                                            공정거래 자율준수 문화가<br class="br_m"> 기업 내 정착될 수 있도록 노력하고 있습니다.
                                        </p>
                                        <a href="javascript:link(3,2);" class="view_more">자세히보기</a> 
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <div>
                                        <div class="sustain_tit">탄소저감</div>
                                        <p class="sustain_sub">
                                            운영 사업소의 에너지 생산량 기준으로<br class="br_m">
                                            이산화탄소의 감축량을 계산하며,<br class="br_m">
                                            환경을 지키기 위한 emc의 노력은 계속됩니다.                                        
                                        </p>
                                        <a href="javascript:link(3,3);" class="view_more">자세히보기</a> 
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <div>
                                        <div class="sustain_tit">사회공헌</div>
                                        <p class="sustain_sub">
                                            환경을 보호하는 기업의 일원으로서 국가와 사회에<br class="br_m"> 기여한다는
                                            자부심을 다른 어떤 기업에서도 느낄 수 없는<br class="br_m"> 소중한 가치로 삼으며,
                                            다양한 사회 공헌활동에<br class="br_m"> 모두 적극적으로 참여하고 있습니다.                                                                              
                                        </p>
                                        <a href="javascript:linkBBS(3,4, 'BM0000000001');" class="view_more">자세히보기</a> 
                                    </div>
                                </li>
                            </ul>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                </section>
                
                <section class="section4">
                    <div class="tit_area">
                        <h2 class="title" data-aos="zoom-out" data-aos-duration="500">EMC area</h2>
                        <p class="sub_con" data-aos="fade-up" data-aos-delay="500">
                            <b>투명한, 청렴한, 깨끗한<br class="br_m"> 성장</b>을 만들어 갑니다.
                        </p>
                    </div> 
                    <div class="emc_wrap">
                        <div class="news">
                            <div class="top">
                                <h2>NEWS</h2>
                                <a href="<c:url value='/bbs/data/bbsDataList.do?MENUID=invest_news&MENUNO=4&bbsNo=BM0000000002' />"><img src="/resources/service/env/images/common/icon_plus.png" alt="더보기"></a>
                            </div>
                            <div class="thumbnail">
                            	<c:choose>
                                    <c:when test="${not empty newsList}">
                                        <file:imageView id="thumbFileId" fileId="${newsList[0].thumbFileId}" title="썸네일 이미지"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/resources/service/env/images/main/main_news_img.jpg" alt="뉴스 이미지" />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <ul class="news_list">
                                <c:forEach var="item" items="${newsList}" varStatus="i" >
                                <li>
                                    <a href="<c:url value='/bbs/data/bbsDataView.do?MENUID=invest_news&MENUNO=4&bbsNo=${item.bbsNo}&nttNo=${item.nttNo}' />">
                                        <div class="news_list_tit"><c:out value='${item.sj}' /></div>
                                        <div class="news_list_date"><fmt:formatDate type="date" pattern="yyyy.MM.dd" value="${item.registDe}" /></div>
                                        <div class="btn">
                                            <img src="/resources/service/env/images/common/icon_arrow_green.png" alt="더보기" />
                                        </div>
                                    </a>
                                </li>
                            	</c:forEach>
                             
                            </ul>
                        </div>
                        <div class="emc_list">
                            <ul>
                                <li onclick="javascript:link(1,2);">
                                    <div class="emc_list_box">
                                        <div class="emc_tit">경영비전</div>
                                        <div class="emc_sub">
                                            환경시설관리주식회사는 기술 기반의<br>
                                            환경 Solution 전문 기업입니다.                                                                                        
                                        </div>
                                    </div>
                                </li>
                                <li onclick="javascript:link(4,1);">
                                    <div class="emc_list_box">
                                        <div class="emc_tit">재무정보</div>
                                        <div class="emc_sub">
                                            환경시설관리주식회사의<br>
                                            재무정보를 확인하실 수 있습니다.                                            
                                        </div>
                                    </div>
                                </li>
                                <li onclick="linkBBS(5,1, 'BM0000000004');">
                                    <div class="emc_list_box">
                                        <div class="emc_tit">채용정보</div>
                                        <div class="emc_sub">
                                            도전적이고 창의적이며 자신의 일에<br>
                                            자부심을 지닌 인재를 기다립니다
                                        </div>
                                    </div>
                                </li>
                                <li onclick="linkBBS(4,2, 'BM0000000003');">
                                    <div class="emc_list_box">
                                        <div class="emc_tit">공시/공고</div>
                                        <div class="emc_sub">
                                            투명하고 정확하게<br>
                                            공시정보를 공개합니다.                                            
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </section>
            </div>
            
            