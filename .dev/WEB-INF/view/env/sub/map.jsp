<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>			
			
			<div class="sub_visual company_visual">
                <div class="sub_visual_nav">
                    <h2>회사소개</h2>
                    <!-- <div class="sub_visual_nav_prev">
                        <a href="javascript:;" title="이전메뉴로 이동">
                            <span></span>
                            <img src="/resources/service/env/images/common/sub_visual_nav_prev.png" alt="sub_visual_nav_prev">
                        </a>
                    </div> -->
                    <div class="sub_visual_nav_next">
                        <a href="javascript:link(2,0);" title="다음메뉴로 이동">
                            <img src="/resources/service/env/images/common/sub_visual_nav_next.png" alt="sub_visual_nav_next">
                            <span>사업소개</span>
                        </a>
                    </div>
                </div>  
                <div class="sub_visual_m">
                    <h2>투자정보</h2>
                    <div class="location">
                        <a href="javascript:;" class="loccation_tit" title="하위메뉴열기">공고</a>
                        <div class="drop_box">
                            <ul>
                                <li><a href="javascript:;" title="페이지 이동">매출 및 이익추이</a></li>
                                <li><a href="javascript:;" title="페이지 이동">재무재표</a></li>
                                <li><a href="javascript:;" title="페이지 이동">공시정보</a></li>
                                <li class="active"><a href="javascript:;" title="페이지 이동">공고</a></li>
                                <li><a href="javascript:;" title="페이지 이동">주가현황</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="sub_visual_menu">
                    <div class="home"></div>
                    
                </div>
            </div> 
			
			 
            <div class="contents cont_company">
                <div class="contents_inner location">
                    <div class="icon" data-aos="fade-up">
                        <img src="/resources/service/env/images/company/company_tit_icon.png" alt="타이틀 아이콘">
                    </div>
                    <h3 class="title" data-aos="fade-up" data-aos-offset="200">찾아오시는길</h3>
                    <div class="tit_line"></div>
                    <div class="sub_contents">
                        <div class="inner">
                            <div class="direction" data-aos="fade-up">
                                <div class="contact">
                                    <div>
                                        <span><img src="/resources/service/env/images/company/dir_icon01.png" alt="Address 아이콘"></span>
                                        13901 경기도 안양시 만안구 일직로 88 케이타워
                                    </div>
                                    <div>
                                        <span><img src="/resources/service/env/images/company/dir_icon02.png" alt="Tel 아이콘"></span>
                                        031-8091-2000
                                    </div>
                                </div>
                                <div class="trans">
                                    <div>
                                        <span><img src="/resources/service/env/images/company/dir_icon03.png" alt="지하철 아이콘"></span>
                                        <dl>
                                            <dt>지하철 이용 시</dt>
                                            <dd>지하철 1호선(경부선) 광명역에서 하차, <br class="br_pc">
                                                5번 출구에서 도보 12분거리</dd>
                                        </dl>
                                    </div>
                                </div>
                                <div class="trans">
                                    <div>
                                        <span><img src="/resources/service/env/images/company/dir_icon04.png" alt="버스 아이콘"></span>
                                        <dl>
                                            <dt>버스 이용 시</dt>
                                            <dd>일반 : 8-2, 12, 17, 77 &emsp;&emsp;<br class="br_pc">
                                                마을 : 1-1, 88</dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                            <div class="map" data-aos="fade-up">
                                <div class="btn_apply"><a href="mailto:dswd88@emc-env.com">견학 신청하기</a></div>
                                <!-- * 카카오맵 - 지도퍼가기 -->
                                <!-- 1. 지도 노드 -->
                                <div id="daumRoughmapContainer1649659276834" class="root_daum_roughmap root_daum_roughmap_landing" style="width:100%"></div>

                                <!--
                                    2. 설치 스크립트
                                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                -->
                                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

                                <!-- 3. 실행 스크립트 -->
                                <script charset="UTF-8">
                                    new daum.roughmap.Lander({
                                        "timestamp" : "1649659276834",
                                        "key" : "29smw",
                                        "mapHeight" : "640"
                                    }).render();
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                
            <script>currentPageNum(1,4);</script>