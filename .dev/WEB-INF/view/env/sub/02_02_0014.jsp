<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>			
<script>
        $(document).ready( function() {
            rndEvent.init();
        });
    </script>	
			
			<div class="sub_visual business_visual">
                <div class="sub_visual_nav">
                    <h2>사업소개</h2>
                    <div class="sub_visual_nav_prev">
                        <a href="javascript:link(1,0);" title="이전메뉴로 이동">
                            <span>회사소개</span>
                            <img src="/resources/service/env/images/common/sub_visual_nav_prev.png" alt="sub_visual_nav_prev">
                        </a>
                    </div>
                    <div class="sub_visual_nav_next">
                        <a href="javascript:link(3,0);" title="다음메뉴로 이동">
                            <img src="/resources/service/env/images/common/sub_visual_nav_next.png" alt="sub_visual_nav_next">
                            <span>지속가능경영</span>
                        </a>
                    </div>
                </div> 
                <div class="sub_visual_menu">
                    <div class="home"></div>
                    
                </div>
            </div>
            <div class="contents cont_business">
                <div class="contents_inner">
                    <div class="icon" data-aos="fade-up">
                        <img src="/resources/service/env/images/business/businessIntro_tit_icon.png" alt="타이틀 아이콘">
                    </div>
                    <h3 class="title" data-aos="fade-up" data-aos-offset="200">에너지</h3>
                    <div class="tit_line"></div>

                    <div class="sub_contents green_contents">
                        <div class="inner">
                            <p class="sub_con">
                                폐기물은 안전하게 소각 처리하고 <br class="br_m">폐열은 발전 및 온수공급에 활용하여<br>
                                <b>폐기물을 에너지화</b>하고 있습니다. 
                            </p>
                            <div class="top">
                                <ul class="tab_list" data-aos="fade-up" data-aos-duration="600" data-aos-offset="200" data-aos-delay="700">
                                    <li class=""><a href="/sub.do?MENUID=02_02_0011&MENUNO=2">개요</a></li>
                                    <li class=""><a href="/sub.do?MENUID=02_02_0012&MENUNO=2">소각</a></li>
                                    <li class=""><a href="/sub.do?MENUID=02_02_0013&MENUNO=2">폐열회수</a></li>
                                    <li class="on focus"><a href="/sub.do?MENUID=02_02_0014&MENUNO=2">폐열발전</a></li>
                                </ul>
                            </div>

                            <div class="energy_wrap" data-aos="fade-up" data-aos-offset="400">
                                <p class="s_tit">폐열보일러에서 생산된 증기를 <br class="br_m">전기에너지로 전환하여 <br class="br_pc">자체 활용 및 <br class="br_m">판매하고 있습니다.</p>
                                <div class="img">
                                    <div class="tag">폐열발전</div>
                                    <img src="/resources/service/env/images/business/energy04_img01.png" alt="energy04_img01">
                                </div>
                                <div class="desc">
                                    <h4><span>총 전기생산능력</span>4.08 MW</h4>
                                    <div class="waste_heat_sheet">
                                        <ul>
                                            <li>
                                                <span class="desc_tit">경인환경에너지주식회사</span>
                                                1.13 MW
                                            </li>
                                        </ul>
                                        <ul>
                                            <li>
                                                <span class="desc_tit">경기환경에너지주식회사</span>
                                                2.95 MW
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="circulation_bg"></div>
                </div>
            </div>
        
        <script>currentPageNum(2,4);</script>