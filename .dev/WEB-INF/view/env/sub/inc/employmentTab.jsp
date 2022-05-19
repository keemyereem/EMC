<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <c:set var="tabIndex">${empty webResult.params.tabIndex ? '1' : webResult.params.tabIndex}</c:set>

                        <div class="tab_list">
                            <ul class="nav_btn" data-aos="fade-up" data-aos-duration="600" data-aos-offset="200">
                                <li class="${tabIndex eq '1' ? 'on' : ''}"><a href="javascript:fn_moveTab(1);">채용공고</a></li>
                                <li class="${tabIndex eq '2' ? 'on' : ''}"><a href="javascript:fn_moveTab(2);">채용 프로세스</a></li>
                                <li class="${tabIndex eq '3' ? 'on' : ''}"><a href="javascript:fn_moveTab(3);">직무 소개</a></li>
                                <li class="${tabIndex eq '4' ? 'on' : ''}"><a href="javascript:fn_moveTab(4);">채용 FAQ</a></li>
                            </ul>
                        </div>

                        <input type="hidden" id="tabIndex" name="tabIndex" value="${tabIndex}" />