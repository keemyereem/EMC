<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="file" uri="/WEB-INF/tlds/fileLib.tld"%>
 
							
                                    <div class="box_text" data-aos="fade-up" data-aos-duration="700">
                                        <div class="onm_title"><c:out value="${onm_title }" /></div>
                                        <div class="onm_desciption">
                                        <c:if test="${webResult.params.searchClCode eq 'A012003'}">    
                                            EMC는 공공하폐수처리시설 운영실적 1위 업체로써 <br class="br_pc" >
                                            전국 1,041여개 처리시설을 운영하고 있습니다.
                                        </c:if>    
                                        <c:if test="${webResult.params.searchClCode eq 'A012004'}">
                                            EMC는 폐기물처리시설인 <br>
                                            건조, 소각, 바이오,  매립  등과 같은<br>
                                             최다 운영 실적과 기술력을 바탕으로 <br>
                                            전국 폐기물 처리시설 22여개를 운영하고 있습니다.          
                                         </c:if>
                                         <c:if test="${webResult.params.searchClCode eq 'A012005'}">
                                          EMC는 환경기초시설 운영에서 <br>
                                            습득한 Know-how를 민간산업폐수분야에 적용하여 <br>
                                            고객의 Needs를 충족하기 위한 서비스 확대도 <br>
                                            적극적으로 추진하고 있습니다.   
                                         </c:if>
                                         <c:if test="${webResult.params.searchClCode eq 'A012006'}">
                                         EMC는 국내 최대 전자제품 생산업체의 용수를<br>
                                            공급하는 정수시설을 운영하고 있으며,<br>
                                            수처리산업 전분야 1위 달성을 위해 노력하고 있습니다.
                                         
                                         </c:if>
                                         <c:if test="${webResult.params.searchClCode eq 'A012007'}">
                                         EMC는 하수관거정비에 민간의 기술과 창의를 도입하고,<br>
                                            불량하수관거 일제 정비를 통한 하수처리효율향상을 목적으로<br>
                                            ‘05년부터 전국적으로 시행하고 있는 「하수관거 임대형민자사업(BTL)」중<br>
                                            최초 운영 개시 된 ’05진천군 하수관거 정비 임대형 민자사업(BTL) 외<br>
                                            전국 16개소를 운영하고 있습니다.                                                                                      
                                         </c:if>
                                         <c:if test="${webResult.params.searchClCode eq 'A012008'}">
                                         EMC는 국내 환경기초시설 건설부터 종합시운전, <br>
                                            운영에  이르기까지  Non-stop 서비스를 제공할 수 있으며,<br>
                                            다수의 종합시운전 실적을 보유하고 있습니다.                                                                             
                                         </c:if>
                                         
                                         
                                         <c:if test="${webResult.params.searchClCode eq 'A012009'}">
                                         환경시설관리주식회사는<br class="br_pc">
                                            환경기초시설 최다 운영 노하우와 기술력을 바탕으로<br class="br_pc">
                                            공공 하폐수처리시설 설계, 시공 등을 통해<br class="br_pc">
                                            수질환경 보전 및 녹색산업 영역 확장을 위해 힘쓰고 있습니다.                                            
                                         </c:if>
                                         <c:if test="${webResult.params.searchClCode eq 'A012010'}">
                                         환경시설관리주식회사는<br class="br_pc">
                                            환경기초시설 최다 운영 노하우와 기술력을 바탕으로<br class="br_pc"> 
                                            민간 하폐수처리시설 설계, 시공 등을 통해<br class="br_pc">
                                            수질환경 보전 및 녹색산업 영역 확장을 위해 힘쓰고 있습니다.                                          
                                         </c:if>
                                         <c:if test="${webResult.params.searchClCode eq 'A012011'}">
                                         환경시설관리주식회사는<br class="br_pc">
                                            2050 탄소중립을 위한 에너지 순환 체계 구축의 일환으로<br class="br_pc">
                                            유기성 폐자원 바이오가스화시설, 소각시설/여열발전시설,<br class="br_pc">
                                            물 재이용시설 건립사업 등 축척 된 기술력을 바탕으로<br class="br_pc">
                                            사업 진행을 하고 있습니다.                                          
                                         </c:if>
                                            
                                        </div>
                                    </div>
                                    
                                    <c:choose>
                                    <c:when test="${webResult.params.searchClCode eq 'A012003' or webResult.params.searchClCode eq 'A012009'}">
	                                    <%// 첫번재 카테고리 만 %>
	                                    <div class="swiper-container" id="slideList_<c:out value="${section_no}" />">
	                                         
	                                                                       
	                                    </div>
                                    
                                    </c:when>
                                    <c:otherwise>
                                    
	                                    <div class="swiper" data-aos="fade-left" data-aos-duration="700">
	                                        <div class="swiper-wrapper" id="slideList_<c:out value="${section_no}" />">
	                                            
	                                        </div>
	                                    </div>
                                    
                                    </c:otherwise>
                                    </c:choose>
                                                                        
                                    
                                    <div class="onm_box_slider_button" data-aos="fade-up" data-aos-duration="700">                                        
                                        <c:choose>
                                        <c:when test="${section_no ne 1 }">
                                        
                                        <div class="swiper-button-next swiper-button-next0<c:out value="${section_no}" />"></div>
                                        <div class="swiper-button-prev swiper-button-prev0<c:out value="${section_no}" />"></div>
                                        
                                        </c:when>
                                        <c:otherwise>
                                        
                                        <div class="swiper-button-next swiper-button-next01_01"></div>
                                        <div class="swiper-button-prev swiper-button-prev01_01"></div>
                                        
                                        </c:otherwise>
                                        </c:choose>
                                        
                                    </div>
                                
                                
<script>
fnSubCategoryList('<c:out value="${searchCtgryNo}" />','1');

</script>
                                										