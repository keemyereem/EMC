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
                                    <li class=""><a href="/env/sub.do?MENUID=statement_financial_position&MENUNO=4">재무상태표</a></li>
                                    <li class="on"><a href="/env/sub.do?MENUID=income_statement&MENUNO=4">손익계산서</a></li>
                                </ul>
                            </div>
                            
                            <div class="tb_box">
                                <p>(단위: 백만원)</p>
                                <div class="tb_row row_head">
                                    <div>과목</div>
                                    <div>2020*</div>
                                    <div>2021</div>
                                </div>

                                <div class="tb_row row_body">
                                    <div><b>매출액</b></div>
                                    <div>-</div>
                                    <div>423,273</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>매출원가</b></div>
                                    <div>-</div>
                                    <div>358,514</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>매출총이익</b></div>
                                    <div>-</div>
                                    <div>64,759</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>판매비와관리비</b></div>
                                    <div>493</div>
                                    <div>35,725</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>영업이익</b></div>
                                    <div>(493)</div>
                                    <div>29,034</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>기타수익</b></div>
                                    <div>-</div>
                                    <div>470</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>기타비용</b></div>
                                    <div>-</div>
                                    <div>3,473</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>금융수익</b></div>
                                    <div>50</div>
                                    <div>1,051</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>금융비용</b></div>
                                    <div>1,031</div>
                                    <div>19,699</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>관계기업등투자손익</b></div>
                                    <div>-</div>
                                    <div>1,767</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>법인세비용차감전순이익</b></div>
                                    <div>(1,474)</div>
                                    <div>9,150</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>법인세비용</b></div>
                                    <div>-</div>
                                    <div>19,951</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>당기순이익</b></div>
                                    <div>(1,474)</div>
                                    <div>(10,801)</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>기타포괄이익</b></div>
                                    <div>-</div>
                                    <div>(256)</div>
                                </div>
                                <div class="tb_row row_body">
                                    <div><b>총포괄이익</b></div>
                                    <div>(1,474)</div>
                                    <div>(11,057)</div>
                                </div>
                                <p>※ K-IFRS 연결손익계산서 기준<br>* 당사 연결손익 미포함 (회계상 취득일: 2020년 12월 31일)</p>
                            </div>
                        </div>
                    </div>
                </div>
             </div>
             
            <script>currentPageNum(4,1);</script>