<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <form name="mainForm" id="mainForm" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

            <div class="sub_visual recruit_visual">
                <div class="sub_visual_nav">
                    <h2>인재채용</h2>
                    <div class="sub_visual_nav_prev">
                        <a href="javascript:linkBBS(4,0, 'BM0000000002');" title="이전메뉴로 이동">
                            <span>투자정보</span>
                            <img src="/resources/service/env/images/common/sub_visual_nav_prev.png" alt="sub_visual_nav_prev">
                        </a>
                    </div>
                    <div class="sub_visual_nav_next">
                        <a href="javascript:link(1,0);" title="다음메뉴로 이동">
                            <img src="/resources/service/env/images/common/sub_visual_nav_next.png" alt="sub_visual_nav_next">
                            <span>회사소개</span>
                        </a>
                    </div>
                </div>
                <!--
                <div class="sub_visual_m">
                    <h2>인재채용</h2>
                    <div class="location">
                        <a href="javascript:;" class="loccation_tit" title="하위메뉴열기">채용정보</a>
                        <div class="drop_box">
                            <ul>
                                <li><a href="javascript:;" title="페이지 이동">인사제도</a></li>
                                <li class="active"><a href="javascript:;" title="페이지 이동">채용정보</a></li>
                            </ul>
                        </div>
                    </div>
                </div> -->

                <div class="sub_visual_menu">
                    <div class="home"></div>
                </div>
            </div>

            <div class="contents cont_recruit">
                <div class="contents_inner">
                    <div class="icon" data-aos="fade-up">
                        <img src="/resources/service/env/images/recruit/recruit_tit_icon.png" alt="타이틀 아이콘">
                    </div>
                    <h3 class="title" data-aos="fade-up" data-aos-offset="200">채용정보</h3>
                    <div class="tit_line"></div>
                    <div class="recruit_contents sub_contents" data-aos="fade-up" data-aos-duration="700">

                    <jsp:include page="/WEB-INF/view/env/sub/inc/recruitTab.jsp" />

                        <div class="job_intro">
                            <section class="section1">
                                <div class="s_title_img" data-aos="fade-up" data-aos-offset="400"><img src="/resources/service/env/images/recruit/job_intro_tit.png" alt="Job Introduction"></div>
                                <h3 data-aos="fade-up" data-aos-offset="400">대표 직무 소개</h3>
                                <p data-aos="fade-up" data-aos-offset="400">명확한 업무분담, 분야별 효율적인 업무수행</p>
                            </section>
                            <section class="section2">
                                <div class="job_intro_box job_intro_box01" data-aos="fade-up" data-aos-offset="400">
                                    <div class="img"><img src="/resources/service/env/images/recruit/job_intro_img01.jpg" alt="환경 직무소개 이미지"></div>
                                    <div class="txt">
                                        <div class="tit">환경</div>
                                        <ul>
                                            <li>유입수 적정처리를 위한 공정별 처리 시설 운전</li>
                                            <li>처리장 공정별 수질분석 및 방류수역 하천수 수질분석</li>
                                            <li>처리효율 증대를 위한 운전조건 개선</li>
                                            <li>기타 공정업무</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="job_intro_box job_intro_box02" data-aos="fade-up" data-aos-offset="400">
                                    <div class="img"><img src="/resources/service/env/images/recruit/job_intro_img02.jpg" alt="기계 직무소개 이미지"></div>
                                    <div class="txt">
                                        <div class="tit">기계</div>
                                        <ul>
                                            <li>각종 기계 수선 및 유지보수 업무</li>
                                            <li>처리시설 기계분야 개선 및 보완업무</li>
                                            <li>기타 기계업무</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="job_intro_box job_intro_box03" data-aos="fade-up" data-aos-offset="400">
                                    <div class="img"><img src="/resources/service/env/images/recruit/job_intro_img03.jpg" alt="전기 직무소개 이미지"></div>
                                    <div class="txt">
                                        <div class="tit">전기</div>
                                        <ul>
                                            <li>수배전 설비 유지보수 업무</li>
                                            <li>처리시설 전기분야 개선 및 보완업무</li>
                                            <li>중앙제어실 및 계장설비 유지관리</li>
                                            <li>기타 전기업무</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="job_intro_box job_intro_box04" data-aos="fade-up" data-aos-offset="400">
                                    <div class="img"><img src="/resources/service/env/images/recruit/job_intro_img04.jpg" alt="관리 직무소개 이미지"></div>
                                    <div class="txt">
                                        <div class="tit">관리</div>
                                        <ul>
                                            <li>예산/회계 업무</li>
                                            <li>계약, 물품구매, 자산관리 업무</li>
                                            <li>기타 일반관리업무</li>
                                        </ul>
                                    </div>
                                </div>
                            </section>
                        </div>

                    </div>
                </div>
            </div>

</form>

            <script>currentPageNum(5,1);</script>
