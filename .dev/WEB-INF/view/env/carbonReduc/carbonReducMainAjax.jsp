<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.WebResult"%>
<%@ page import="kr.co.idasystem.framework.cmm.util.PropertieUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="code" uri="/WEB-INF/tlds/codeUtils.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
				<section class="section1 on">
                    <div class="tit_area">
                        <h2 class="title" data-aos="zoom-out" data-aos-duration="500">탄소저감 area</h2>
                        <p class="sub_con" data-aos="fade-up" data-aos-delay="500"><span>탄소 발자국 줄이기 캠페인</span>에 <br class="br_pc">글로벌 환경전문 기업 EMC가 앞장섭니다.</p>     
                    </div>
                    
                    <div class="count2">  
                        <div class="level">
                            <div class="carbon_number">
                                <div class="carbon_number_inner">
                                    <p class="tit_pc"><c:out value="${retMap.sj}" /></p>
                                    <p class="tit_mob">탄소저감 목표달성률</p>
                                    <p><span class="mov_num1"><c:out value="${retMap.carbonPercentage}" /></span> %</p>
                                    <p><span class="carbon_date"><c:out value="${retMap.date}" /></span> 기준</p>
                                </div>
                            </div>
                            <div class="carbon_chart"></div>
                        </div>
                        <div class="text-circle">
                            <img src="/resources/service/env/images/main/text_circle_w.png" alt="">
                            <img src="/resources/service/env/images/main/text_circle_g.png" alt="">
                        </div>
                        <!-- <svg class="text-circle" viewBox="0 0 100 100">
                            <defs>
                                <path id="path" d="M 50, 50 m -37, 0 a 37,37 0 1,1 74,0 a 37,37 0 1,1 -74,0"/>
                            </defs>
                            <text>
                            <textPath xlink:href="#path">Green EMC · Green EMC · Green EMC · Green EMC ·</textPath>
                            </text>
                        </svg> -->
                    </div> 

                    <div class="count">
                        <p><span>EMC 에너지 생산량 및 CO&#8322; 감축량</span></p>
                        <div class="count_trigger">
                            <div>
                                <p><img src="/resources/service/env/images/main/bg_clip01.png" alt="bg_clip01"></p>
                                <p>총 감축량</p>
                            </div>
                            <div>
                                <p><span class="mov_num2"></span>그루</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="count3">
                        <div class="tree">
                            <img src="/resources/service/env/images/main/sec1_tree1_on.png" data-animated="/resources/service/env/images/main/sec1_tree1.gif" data-static="/resources/service/env/images/main/sec1_tree1_on.png" alt="tree">
                            <ul class="tree_counts">
                                <li>
                                    <div class="tc_img" data-aos="fade-up" data-aos-delay="0"><img src="/resources/service/env/images/main/tree_count01.png" alt="tree_count01"></div>
                                    <h1 data-aos="fade-up" data-aos-delay="300">태양광 발전</h1>
                                    <p class="count" data-aos="fade-up" data-aos-delay="500" data-aos-duration="800">
                                        <span class="tc" data-count="732901"></span>그루
                                    </p>
                                    <div class="line">
                                        <svg>
                                            <polyline class="rect" points="227,30 196, 0, 0, 0" fill="none" stroke="#000" stroke-width="1"></polyline>
                                        </svg>
                                        <img src="/resources/service/env/images/main/sec1_dot.png" alt="dot">
                                    </div>
                                    
                                </li>
                                <li>
                                    <div class="tc_img" data-aos="fade-up" data-aos-delay="0"><img src="/resources/service/env/images/main/tree_count02.png" alt="tree_count02"></div>
                                    <h1 data-aos="fade-up" data-aos-delay="300">소화가스 발전</h1>
                                    <p class="count" data-aos="fade-up" data-aos-delay="500" data-aos-duration="800">
                                        <span class="tc" data-count="312442"></span>그루
                                    </p>
                                    <div class="line">
                                        <svg>
                                            <polyline class="rect" points="0,30 30,0 227,0" fill="none" stroke="#000" stroke-width="1"></polyline>
                                        </svg>
                                        <img src="/resources/service/env/images/main/sec1_dot.png" alt="dot">
                                    </div>
                                </li>
                                <li>
                                    <div class="tc_img" data-aos="fade-up" data-aos-delay="0"><img src="/resources/service/env/images/main/tree_count03.png" alt="tree_count03"></div>
                                    <h1 data-aos="fade-up" data-aos-delay="300">소화조 재생가스</h1>
                                    <p class="count" data-aos="fade-up" data-aos-delay="500" data-aos-duration="800">
                                        <span class="tc" data-count="624256"></span>그루
                                    </p>
                                    <div class="line">
                                        <svg>
                                            <polyline class="rect" points="227,30 196,0 0,0" fill="none" stroke="#000" stroke-width="1"></polyline>
                                        </svg>
                                        <img src="/resources/service/env/images/main/sec1_dot.png" alt="dot">
                                    </div>
                                </li>
                                <li>
                                    <div class="tc_img" data-aos="fade-up" data-aos-delay="0"><img src="/resources/service/env/images/main/tree_count04.png" alt="tree_count04"></div>
                                    <h1 data-aos="fade-up" data-aos-delay="300">스팀 생산</h1>
                                    <p class="count" data-aos="fade-up" data-aos-delay="500" data-aos-duration="800">
                                        <span class="tc" data-count="4649890"></span>그루
                                    </p>
                                    <div class="line">
                                        <svg>
                                            <polyline class="rect" points="0,30 30,0 227,0" fill="none" stroke="#000" stroke-width="1"></polyline>
                                        </svg>
                                        <img src="/resources/service/env/images/main/sec1_dot.png" alt="dot">
                                    </div>
                                </li>
                                <li>
                                    <div class="tc_img" data-aos="fade-up" data-aos-delay="0"><img src="/resources/service/env/images/main/tree_count05.png" alt="tree_count05"></div>
                                    <h1 data-aos="fade-up" data-aos-delay="300">기타 발전</h1>
                                    <p class="count" data-aos="fade-up" data-aos-delay="500" data-aos-duration="800">
                                        <span class="tc" data-count="85742"></span>그루
                                    </p>
                                    <div class="line">
                                        <svg>
                                            <polyline class="rect" points="227,30 196,0 0,0" fill="none" stroke="#000" stroke-width="1"></polyline>
                                        </svg>
                                        <img src="/resources/service/env/images/main/sec1_dot.png" alt="dot">
                                    </div>
                                </li>
                                <li>
                                    <div class="tc_img" data-aos="fade-up" data-aos-offset="100" data-aos-duration="800"><img src="/resources/service/env/images/main/tree_count06.png" alt="tree_count06"></div>
                                    <h1 data-aos="fade-up" data-aos-offset="100" data-aos-duration="800">총 감축량</h1>
                                    <p class="count" data-aos="fade-up" data-aos-offset="100" data-aos-duration="800"><span></span>그루</p>
                                </li>
                            </ul>
                        </div>
                        
                    </div>
			</section>
