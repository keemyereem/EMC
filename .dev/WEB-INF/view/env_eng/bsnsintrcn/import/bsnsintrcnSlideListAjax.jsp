<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="file" uri="/WEB-INF/tlds/fileLib.tld"%>
										
									 
	                                    <c:if test="${webResult.params.searchClCode eq 'A012003' or webResult.params.searchClCode eq 'A012009'}">
	                                    <%// 첫번재 카테고리 만 %>
                                    
										<div class="swiper_2depth_tabs" data-aos="fade" data-aos-duration="700" data-aos-offset="600">
                                            <c:forEach var="item" items="${listBsnsintrcnCategory}" varStatus="i" >
                                            	<c:set var="ctgryNm" value="${item.ctgryNm }" />
                                            	<c:if test="${locale eq 'en'}"><c:set var="ctgryNm" value="${item.ctgryEngNm }" /></c:if>
                                            	                                            
                                            <p class="<c:if test="${i.count eq webResult.params.slide_no }">on</c:if>"><a href="javascript:fnSubCategoryList('<c:out value="${item.ctgryNo }" />','<c:out value="${i.count}" />');"><c:out value="${ctgryNm }" /></a></p>
                                            
                                            </c:forEach>
                                        </div>
                                        </c:if>
                                        
                                      	<c:choose>
                                    		<c:when test="${webResult.params.searchClCode eq 'A012003' or webResult.params.searchClCode eq 'A012009'}">
                                    		<%// 첫번재 카테고리 만 %>
                                    
										<c:forEach var="cateItem" items="${listBsnsintrcnCategory}" varStatus="j" >										
										<c:set var="divNo" value="${j.count}" />
										
										<div class="swiper1_box swiper1_box0<c:out value="${divNo}" />" style="display: <c:if test="${divNo ne webResult.params.slide_no }">none;</c:if>">
                                            <div class="swiper swiper1_0<c:out value="${divNo}" />" data-aos="fade-left" data-aos-duration="700" data-aos-offset="500">
                                                
                                                <div class="swiper-wrapper">
                                                    
                                                    <!-- list start -->
                                                    <c:forEach var="item" items="${webResult.listPage.listMap}" varStatus="i" >
                                                    
							                        <div class="swiper-slide">
							                            <div class="onm_slide_img">
							                                <file:imageView id="thumbFileId" fileId="${item.thumbFileId}" title="썸네일" />
							                            </div>
							                            <div class="onm_slide_text_box">
							                                <h3><c:out value="${item.bsnsNm}" /></h3>
							                                <div>
							                                    <dl><dt>시설용량</dt><dd><fmt:formatNumber value='${item.cpcty}' />㎥/d</dd></dl>
							                                    <dl><dt>처리공법</dt><dd><c:out value="${item.msrc}" /></dd></dl>
							                                </div>
							                            </div>
							                        </div>
                                                                       
                                                    </c:forEach>
                                                    <!-- list start end-->
                                                     
                                                </div>
                                            </div>
                                        </div>
                                        
                                        </c:forEach>
                                        
                                        </c:when>
                                        <c:otherwise>
                                        	
                                        	<!-- list start -->
                                            <c:forEach var="item" items="${webResult.listPage.listMap}" varStatus="i" >                                                    
						                        <div class="swiper-slide">
						                            <div class="onm_slide_img">
						                                <file:imageView id="thumbFileId" fileId="${item.thumbFileId}" title="썸네일" tagClass="mCS_img_loaded"/>
						                            </div>
						                            <div class="onm_slide_text_box">
						                                <h3><c:out value="${item.bsnsNm}" /></h3>
						                                <div>
						                                    <dl><dt>시설용량</dt><dd><fmt:formatNumber value='${item.cpcty}' />㎥/d</dd></dl>
						                                    <dl><dt>처리공법</dt><dd><c:out value="${item.msrc}" /></dd></dl>
						                                </div>
						                            </div>
						                        </div>
			                                  </c:forEach>
                                             <!-- list start end--> 
                                       </c:otherwise>
                                      </c:choose>      
                                             

                                      