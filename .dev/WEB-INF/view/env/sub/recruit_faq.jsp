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

                <!-- <div class="sub_visual_m">
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

                        <div class="faq" data-aos="fade-up" data-aos-offset="400">
                            <div class="que"><p>입사지원서 안내</p></div>
                            <div class="ans"><p>
                                회사 입사지원에 필요한 서류안내드립니다.<br>

                                문의처 : freshwater@emc-env.com<br>

                                첨부 : 입사지원서, 개인정보 활용수집동의서(입사지원용)
                            </p></div>
                            <div class="que"><p>지원하려면 어떻게 하나요?</p></div>
                            <div class="ans"><p>
                                ① 구인사이트(사람인)에서 직무/지역등을 확인하시어 지원하는 방법과<br>
                                ② 입사지원서, 개인정보 활용수집동의서(입사지원용) 작성하시어 채용담당자에게 송부하는 방법이 있습니다.<br>

                                   수신처 : freshwater@emc-env.com
                            </p></div>
                            <div class="que"><p>채용 전형절차는 어떻게 되나요?</p></div>
                            <div class="ans"><p>
                                현장 : 서류전형 → 1차면접 → 인성검사(SKCT) → 2차면접 → 처우협의 → 합격안내<br><br class="br_m">

                                본사 : 서류전형 → 인성검사(SKCT) → 면접(실무면접) → 면접(임원면접) → 처우협의 → 합격안내
                            </p></div>
                            <div class="que"><p>여러 사업소/현장에 중복으로 지원 가능한가요?</p></div>
                            <div class="ans"><p>
                                아닙니다. 지원서를 중복하여 제출하실수 없으므로, 공고 내용/지역을 꼼꼼하게 확인하시고 지원해 주시기 바랍니다.
                            </p></div>
                            <div class="que"><p>응시회수에 제한이 있습니까?</p></div>
                            <div class="ans"><p>응시회수에 제한이 없으며, 불합격 후 재지원에 따른 불이익도 없습니다.</p></div>
                            <div class="que"><p>보훈대상자/장애인은 가점이 있습니까?</p></div>
                            <div class="ans"><p>보훈대상자, 장애인은 관련 법령에 의거하여 우대하고 있습니다.</p></div>
                            <div class="que"><p>SKCT는 어떤 시험인가요?</p></div>
                            <div class="ans"><p>
                                - SKCT(SK Competency Test)는 SK에서 직무를 수행하기 위해 요구되는 다양한 역량을 종합적인 관점에서 측정하는 종합 역량검사로 2013년 도입되었습니다.<br>
                                SKCT는 크게 3가지 영역으로 구성되어 있습니다.<br>

                                일하는 데 필요한 복합적이고 고차원적인 사고 능력을 측정하는 인지 역량(Critical Thinking),<br>
                                일하면서 부딪치는 문제 상황에서 적절한 판단을 내릴 수 있는지 측정하는 실행 역량(Situational Judgement),<br>
                                그리고 일하는 데 적합한 성격, 가치관, 태도를 갖추고 있는지 측정하는 심층 역량(Work Personality)으로 구성되어 있습니다.<br>
                                <br>
                                ※ 현재는 우리 회사의 경우에는 심층역량(Work Personality)검사만 진행하고 있습니다.<br>
                                <br>
                                SKCT는 해당 직무에 맞는 역량을 보유하고 있는지를 판단하기 위해 직무 별 유형이 다르게 운영되고 있으며 다양한 관점에서
                                지원자를 평가하는 검사로, 거짓으로 응답하고자 자신을 사실과 다르게 포장하는 경우 불합격 조치될 수 있으니 솔직하게
                                응답해 주시기 바랍니다.
                            </p></div>
                        </div>

                    </div>
                </div>
            </div>

</form>

<script>
    currentPageNum(5,1);

    $(document).ready( function() {
        recruitEvent.init();
    });
</script>
