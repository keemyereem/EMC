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
		    <h2 class="title">탄소저감 area</h2>
		    <p class="sub_con"><span>탄소 발자국 줄이기 캠페인</span>에<br>글로벌 환경전문 기업 EMC가 앞장섭니다.</p>     
		</div>
		
		<div class="count">
		    <p><span>EMC 에너지 생산량 및 CO&#8322; 감축량</span></p>
		    <div class="count_trigger">
		        <div>
		            <p><img src="/resources/service/env/images/main/bg_clip01.png" alt="bg_clip01"></p>
		            <p>총 감축량</p>
		        </div>
		        <div>
		            <p><span class="mov_num2">
		            	<c:if test="${!empty(retMap.totalCurrentPine) }">
		            	<fmt:formatNumber value="${retMap.totalCurrentPine }" pattern="#,###" /> 
		            	</c:if>
		            </span>그루</p>
		        </div>
		    </div>
		</div>
		<div class="count2">  
		    <div class="level">
		        <div class="carbon_number">
		            <div class="carbon_number_inner">
		                <p>${retMap.sj}</p>
		                <p><span class="mov_num1">${retMap.totalPersent}%</span></p>
		               <p><span class="carbon_date">${retMap.date}</span> 기준</p>
		            </div>
		        </div>
		        <div class="carbon_chart"></div>
		    </div>
		    <svg class="text-circle" viewBox="0 0 100 100">
		        <defs>
		            <path id="path" d="M 50, 50 m -37, 0 a 37,37 0 1,1 74,0 a 37,37 0 1,1 -74,0"/>
		        </defs>
		        <text>
		        <textPath xlink:href="#path">Green EMC · Green EMC · Green EMC · Green EMC ·</textPath>
		        </text>
		    </svg>
		</div> 
		
		<div class="count3"> 작업예정
		    <!-- 
		   <div class="inner">
		       <div class="tree">
		           <img src="../images/pc/sec1_tree1_on.png" alt="">
		           <img src="../images/pc/sec1_tree1.gif" alt="">
		       </div>
		       <div class="sec1_box01">
		           <img src="../images/pc/sec1_dot.png" alt="" class="dot01">
		           <svg class="line01">
		               <polyline class="rect" points="227,30 196,0 0,0" fill="none" stroke="#000" stroke-width="1"></polyline>
		           </svg>
		           <span class="hl01"></span>
		           <img src="../images/pc/sec1_txt01.png" alt="" class="txt01">
		           <img src="../images/pc/sec1_icon01.png" alt="" class="icon01" style="animation-name: outrotate; animation-duration: 0.7s;">
		           <span class="mov_num4">732,901</span>
		       </div>
		       <script>
		           $('.sec1_box01').mouseenter(function(){
		               $(this).find('.icon01').stop().css({
		                   "animation-name":"onrotate",
		                   "animation-duration":".7s",
		                   "animation-count":'1'
		               });
		           });
		           $('.sec1_box01').mouseleave(function(){
		               $(this).find('.icon01').stop().css({
		                   "animation-name":"outrotate",
		                   "animation-duration":".7s",
		                   "animation-count":'1'
		               });
		           });
		       </script>
		       <div class="sec1_box02">
		           <img src="../images/pc/sec1_dot.png" alt="" class="dot02">
		           <svg class="line02">
		               <polyline class="rect" points="227,30 196,0 0,0" fill="none" stroke="#000" stroke-width="1"></polyline>
		           </svg>
		           <img src="../images/pc/sec1_txt02.png" alt="" class="txt02">
		       </div>
		       <div class="sec1_box03">
		           <img src="../images/pc/sec1_dot.png" alt="" class="dot03">
		           <svg class="line03">
		               <polyline class="rect" points="227,30 196,0 0,0" fill="none" stroke="#000" stroke-width="1"></polyline>
		           </svg>
		           <img src="../images/pc/sec1_txt03.png" alt="" class="txt03">
		       </div>
		       <div class="sec1_box04">
		           <img src="../images/pc/sec1_dot.png" alt="" class="dot04">
		           <svg class="line04">
		               <polyline class="rect" points="0,30 30,0 227,0" fill="none" stroke="#000" stroke-width="1"></polyline>
		           </svg>
		           <img src="../images/pc/sec1_txt04.png" alt="" class="txt04">
		       </div>
		       <div class="sec1_box05">
		           <img src="../images/pc/sec1_dot.png" alt="" class="dot05">
		           <svg class="line05">
		               <polyline class="rect" points="0,30 30,0 227,0" fill="none" stroke="#000" stroke-width="1"></polyline>
		           </svg>
		           <img src="../images/pc/sec1_txt05.png" alt="" class="txt05">
		       </div>
		       
		       <img src="../images/pc/sec1_txt06.png" alt="" class="txt06">
		
		   </div> -->
		    </div>
	        
	
	</section>
