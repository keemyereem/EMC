<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="file" uri="/WEB-INF/tlds/fileLib.tld"%>


<c:set var="bsnsintrcnCode" value="${retMap.bsnsintrcnCode }" />
<c:set var="ctgryNo" value="${retMap.ctgryNo }" />
<c:set var="ctgryNm" value="${retMap.ctgryCodeNm }" />
<c:if test="${empty(ctgryNm) }"><c:set var="ctgryNm" value="${retMap.ctgryNm }" /></c:if>


						<div class="inner_box swiper-container">
                            <div class="swiper-wrapper inner_slider">
                                 <c:out value="${imgList}" escapeXml="false" />
                                
                            </div>
                            <div class="inner_nav">
                                <div class="arrow prev">이전</div>
                                <div class="counter_slider"></div>
                                <div class="arrow next">다음</div>
                            </div>
                        </div>
                        <div class="txt_box">
                        	<div class="card_lbl"><c:out value="${ctgryNm}" /></div>
                            <div class="card_tit"><c:out value="${retMap.bsnsNm}" /></div>
                            <div class="card_des">
                               <c:out value="${retMap.cn}" />
                            </div>                      
                          <c:choose>
                          <c:when test="${bsnsintrcnCode eq 'A012001' }">
                          	
                          	<c:choose>
                          	<c:when test="${empty(ctgryNo) or ctgryNo eq ''}">
                          	
                          	<!-- 6하수관거BTL -->
                            <table class="card_info card_tb">
                                <thead>
                                    <tr><td colspan="4">관거연장(km)</td></tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <dl>
                                                <dt>하수신설</dt>
                                                <dd>
                                                <c:if test="${empty retMap.swgeNcr}">&nbsp;</c:if>
                                                <fmt:formatNumber value='${retMap.swgeNcr}' />
                                                </dd>
                                            </dl>
                                        </td>
                                        <td>
                                            <dl>
                                                <dt>하수기존</dt>
                                                <dd>
                                                <c:if test="${empty retMap.swgeLegacy}">&nbsp;</c:if>
                                                <fmt:formatNumber value='${retMap.swgeLegacy}' />
                                                </dd>
                                            </dl>
                                        </td>
                                        <td>
                                            <dl>
                                                <dt>우수신설</dt>
                                                <dd>
                                                <c:if test="${empty retMap.exclncNcr}">&nbsp;</c:if>
                                                <fmt:formatNumber value='${retMap.exclncNcr}' />
                                                </dd>
                                            </dl>
                                        </td>
                                        <td>
                                            <dl>
                                                <dt>기존우수</dt>
                                                <dd>
                                                <c:if test="${empty retMap.legacyExclnc}">&nbsp;</c:if>
                                                <fmt:formatNumber value='${retMap.legacyExclnc}' />
                                                </dd>
                                            </dl>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <dl>
                                                <dt>공법</dt>
                                                <dd>
                                                <c:if test="${empty retMap.msrc}">&nbsp;</c:if>
                                                <c:out value="${retMap.msrc}" />
                                                </dd>
                                            </dl>
                                        </td>
                                        <td colspan="2">
                                            <dl>
                                                <dt>등록일</dt>
                                                <dd><fmt:formatDate type="date" pattern="yyyy-MM-dd" value="${retMap.registDe}" /></dd>
                                            </dl>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            
                          	</c:when>
                          	<c:otherwise>
                          	
                          	<!-- 6하수관거BTL 외  -->
                            <ul class="card_info card_class">
                                <li>
			                        <dl>
			                            <dt>용량</dt>
			                            <dd>
			                            <c:if test="${empty retMap.cpcty}">&nbsp;</c:if>
			                            <fmt:formatNumber value='${retMap.cpcty}' />㎥/일
			                            </dd>
			                        </dl>
			                    </li>
			                    <li>
			                        <dl>
			                            <dt>처리공법</dt>
			                            <dd>
			                            <c:if test="${empty retMap.msrc}">&nbsp;</c:if>
			                            <c:out value="${retMap.msrc}" />
			                            </dd>
			                        </dl>
			                    </li>
                                <li>
                                    <dl>
                                        <dt>등록일</dt>
                                        <dd><fmt:formatDate type="date" pattern="yyyy-MM-dd" value="${retMap.registDe}" /></dd>
                                    </dl>
                                </li>
                            </ul>
                            
                          	</c:otherwise>
                          	</c:choose>
                          	  
                          </c:when>
                          <c:otherwise>
                          
                          <!-- 환경 건설 -->
                            <ul class="card_class">
                                <li>
                                    <dl>
                                        <dt>용량</dt>
			                            <dd>
			                            <c:if test="${empty retMap.cpcty}">&nbsp;</c:if>
			                            <fmt:formatNumber value='${retMap.cpcty}' />㎥/일
			                            </dd>
                                    </dl>
                                </li>
                                <c:if test="${!empty(retMap.msrc)}">
                                <li>
                                    <dl>
                                        <dt>공법</dt>
                                        <dd>
                                        <c:if test="${empty retMap.msrc}">&nbsp;</c:if>
                                        <c:out value="${retMap.msrc}" />
                                        </dd>
                                    </dl>
                                </li>
                                </c:if>
                                <li>
                                    <dl>
                                        <dt>공사기간</dt>
                                        <dd>
                                        <c:if test="${empty retMap.constPeriod}">&nbsp;</c:if>
                                        <fmt:formatNumber value='${retMap.constPeriod}' />개월
                                        </dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt>등록일</dt>
                                        <dd><fmt:formatDate type="date" pattern="yyyy-MM-dd" value="${retMap.registDe}" /></dd>
                                    </dl>
                                </li>
                                
                                
                            </ul>
                            
                          </c:otherwise>
                          </c:choose>
                            
                        </div>
                        
                    