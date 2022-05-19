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
                    <div class="hiring_process">
                        <section class="section1">
                            <div class="s_title_img" data-aos="fade-up" data-aos-offset="400">
                                <img src="/resources/service/env/images/recruit/hiring_process_tit.png" alt="Hiring process">
                                <img src="/resources/service/env/images/recruit/hiring_process_tit_m.png" alt="Hiring process">
                            </div>
                            <h3 data-aos="fade-up" data-aos-offset="400">채용프로세스</h3>
                            <p data-aos="fade-up" data-aos-offset="400">환경시설관리주식회사의 신규임용은 수시채용이며,<br> 온라인을 통해 상시 지원 가능합니다.</p>
                        </section>
                        <section class="section2">
                            <ul data-aos="fade-up" data-aos-offset="400">
                                <li class="process01">
                                    <div class="tit">01 서류모집</div>
                                    <div class="cont">
                                        <div class="icon"><img src="/resources/service/env/images/recruit/recruit_process_icon01.png" alt="01.서류모집 아이콘"></div>
                                        <ul class="txt">
                                            <li>채용 사이트 및</li>
                                            <li>담당자 Email 지원 접수</li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="process02">
                                    <div class="tit">02 서류전형</div>
                                    <div class="cont">
                                        <div class="icon"><img src="/resources/service/env/images/recruit/recruit_process_icon02.png" alt="01.서류모집 아이콘"></div>
                                        <ul class="txt">
                                            <li>지원자격 및 자기소개서</li>
                                            <li>기반 심층평가 진행</li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="process03">
                                    <div class="tit">03 인성검사</div>
                                    <div class="cont">
                                        <div class="icon"><img src="/resources/service/env/images/recruit/recruit_process_icon03.png" alt="01.서류모집 아이콘"></div>
                                        <ul class="txt">
                                            <li>SKCT기반 인성검사 시행</li>
                                            <li>지원자의 종합 정보 분석을<br>통한 역량 진단</li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="process04">
                                    <div class="tit">04 면접</div>
                                    <div class="cont">
                                        <div class="icon"><img src="/resources/service/env/images/recruit/recruit_process_icon04.png" alt="01.서류모집 아이콘"></div>
                                        <ul class="txt">
                                            <li>직무에 따라 다양한<br class="br_pc">형태의 면접 시행</li>
                                        </ul>
                                    </div>
                                </li>                                
                                <li class="process05">
                                    <div class="tit">05 최종합격</div>
                                    <div class="cont">
                                        <div class="icon"><img src="/resources/service/env/images/recruit/recruit_process_icon05.png" alt="01.서류모집 아이콘"></div>
                                        <ul class="txt">
                                            <li>최종입사</li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </section>
                    </div>

        </div>

     </div>

     </div>

    <script>currentPageNum(5,1);</script>
