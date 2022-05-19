<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

			<div class="sub_visual invest_visual">
                <div class="sub_visual_nav">
                    <h2>투자정보</h2>
                    <div class="sub_visual_nav_prev">
                        <a href="javascript:link(3,0);" title="이전메뉴로 이동">
                            <span>지속가능경영</span>
                            <img src="/resources/service/env/images/common/sub_visual_nav_prev.png" alt="sub_visual_nav_prev">
                        </a>
                    </div>
                    <div class="sub_visual_nav_next">
                        <a href="javascript:link(5,0);" title="다음메뉴로 이동">
                            <img src="/resources/service/env/images/common/sub_visual_nav_next.png" alt="sub_visual_nav_next">
                            <span>인재채용</span>
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
			
			<div class="contents cont_invest fc_info">
                <div class="contents_inner">
                    <div class="icon" data-aos="fade-up">
                        <img src="/resources/service/env/images/invest/disclosure_tit_icon.png" alt="타이틀 아이콘">
                    </div>
                    <h3 class="title" data-aos="fade-up" data-aos-offset="200">재무정보</h3>
                    <div class="tit_line"></div>

                    <div class="sub_contents sub_con">
                        <div class="inner">
                            <div class="tb_top">
                                <ul class="nav_btn" data-aos="fade-up" data-aos-duration="600" data-aos-offset="200">
                                    <li class="on"><a href="/sub.do?MENUID=statement_financial_position&MENUNO=4">재무상태표</a></li>
                                    <li class=""><a href="/sub.do?MENUID=income_statement&MENUNO=4">손익계산서</a></li>
                                </ul>
                            </div>
                            
                            <div class="tb_box">
                                <p>(단위: 백만원)</p>
                                <div class="tb_row row_head">
                                    <div>과목</div>
                                    <div>2020</div>
                                    <div>2021</div>
                                </div>
                            <!-- ASSET -->
                                <div class="tb_row row_body">
                                    <div><b>유동자산</b></div>
                                    <div><b>171,376</b></div>
                                    <div><b>165,882</b></div>
                                </div>
                                <div class="tb_row row_body">
                                    <div>당좌자산</div>
                                    <div>169,918</div>
                                    <div>1,507</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div>재고자산</div>
                                    <div>1,458</div>
                                    <div>164,375</div>
                                </div>
                            <!-- ASSET -->
                                <div class="tb_row row_body">
                                    <div><b>비유동자산</b></div>
                                    <div><b>1,008,516</b></div>
                                    <div><b>1,133,615</b></div>
                                </div>
                                <div class="tb_row row_body">
                                    <div>투자자산</div>
                                    <div>257,086</div>
                                    <div>11,968</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div>유형자산</div>
                                    <div>87,809</div>
                                    <div>119,126</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div>무형 및 기타 비유동자산</div>
                                    <div>663,621</div>
                                    <div>1,002,521</div>
                                </div>
                            <!-- SUM -->
                                <div class="tb_row row_body cell_sum">
                                    <div><b>자산총계</b></div>
                                    <div><b>1,179,892</b></div>
                                    <div><b>1,299,497</b></div>
                                </div>

                                <div class="tb_row row_body">
                                    <div>유동부채</div>
                                    <div>270,091</div>
                                    <div>103,127</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div>비유동부채</div>
                                    <div>554,710</div>
                                    <div>763,522</div>
                                </div>
                            <!-- SUM -->
                                <div class="tb_row row_body cell_sum">
                                    <div><b>부채총계</b></div>
                                    <div><b>824,801</b></div>
                                    <div><b>866,649</b></div>
                                </div>

                                <div class="tb_row row_body">
                                    <div>자본금</div>
                                    <div>46</div>
                                    <div>7,128</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div>자본잉여금</div>
                                    <div>355,314</div>
                                    <div>437,621</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div>기타포괄손익누계액</div>
                                    <div>-</div>
                                    <div>(59)</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div>이익잉여금</div>
                                    <div>(1,475)</div>
                                    <div>(11,842)</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div>비지배지분</div>
                                    <div>1,206</div>
                                    <div>-</div>
                                </div>
                            <!-- SUM -->
                                <div class="tb_row row_body cell_sum">
                                    <div><b>자본총계</b></div>
                                    <div><b>355,091</b></div>
                                    <div><b>432,848</b></div>
                                </div>
                                <div class="tb_row row_body cell_sum">
                                    <div><b>부채와 자본총계</b></div>
                                    <div><b>1,179,892</b></div>
                                    <div><b>1,299,497</b></div>
                                </div>
                                <p>※ K-IFRS 연결재무상태표 기준</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <script>currentPageNum(4,1);</script>