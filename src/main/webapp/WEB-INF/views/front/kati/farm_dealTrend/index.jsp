<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="contents">
<div id="warp" class="warp14">
    <!-- header -->
    <div class="header">
        <section>
            <div class="header_box14">
                <h1 class="h_title">주요 농산물 일일 거래동향</h1>
                <div class="h_day"> <span class="today"><fmt:parseDate value="${farmDealTrendList[0].standardDate}" pattern="yyyyMMdd" var="nowdate" /><fmt:formatDate value="${nowdate}" pattern="yyyy.MM.dd"/> </span> </div>
            </div>
        </section>
    </div>
    <!-- //header -->
    <!-- contents -->
    <div class="contents">
    <section>
    <div class="contents_box14">
    <ul>
    <li class="all_list">
        <div class="list_top">
            <div class="price">
                <div class="price_title pt_0${farmDealTrendList[0].danger}"> 배추 </div>
                <div class="price_img"> <img src="/resources/front/img/price/sub_14_p_01.png" width="130" height="103" alt="배추"> </div>
            </div>
            <div class="status st_${farmDealTrendList[0].danger}"> ${farmDealTrendList[0].dangerName} </div>
            <div class="graph">
                <div class="g_img"> <img src="/resources/front/img/bg/sub_14_dg_0${farmDealTrendList[0].danger}.png" width="119" height="63" alt="${farmDealTrendList[0].dangerName}"> </div>
                <ul>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_01.png" width="6" height="6" alt="안정"> <span>안정</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_02.png" width="6" height="6" alt="주의"> <span>주의</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_03.png" width="6" height="6" alt="경계"> <span>경계</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_04.png" width="6" height="6" alt="심각"> <span>심각</span> </li>
                </ul>
            </div>
        </div>
        <div class="list_bottom">
            <div class="summary"> 단위:원/10kg </div>
            <div class="today">
                <div class="l_text"> 오늘 </div>
                <div class="r_text">
                    <c:if test="${farmDealTrendList[0].standardPrice=='0'}">
                        -
                    </c:if>
                    <c:if test="${farmDealTrendList[0].standardPrice!='0'}">
                        <fmt:formatNumber value="${ farmDealTrendList[0].standardPrice}" type="number"></fmt:formatNumber>
                    </c:if>
                </div>
            </div>
            <div class="year">
                <div class="l_text"> 1년전 </div>
                <div class="r_text">
                    <c:if test="${farmDealTrendList[0].yearPrice=='0'}">
                        -
                    </c:if>
                    <c:if test="${farmDealTrendList[0].yearPrice!='0'}">
                        <fmt:formatNumber value="${ farmDealTrendList[0].yearPrice}" type="number"></fmt:formatNumber>
                    </c:if>
                </div>
            </div>
            <div class="l_graph">
                <div class="lg_title"> 최근 가격 (일별) </div>
                <ul>
                    <li>
                        <div class="stick_list">
                            <div class="num"><fmt:formatNumber value="${farmDealTrendItemList1[4].standardPrice}" type="number"></fmt:formatNumber></div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList1[4].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList1[4].standardDate} </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList1[3].avgPrice}px;"></div>
                            </div>
                            <div class="day"></div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> <fmt:formatNumber value="${farmDealTrendItemList1[2].standardPrice}" type="number"></fmt:formatNumber> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList1[2].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList1[2].standardDate} </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList1[1].avgPrice}px;"></div>
                            </div>
                            <div class="day"> </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num num2"> <fmt:formatNumber value="${farmDealTrendItemList1[0].standardPrice}" type="number"></fmt:formatNumber> </div>
                            <div class="s_box">
                                <div class="stick stick2" style="height:${farmDealTrendItemList1[0].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList1[0].standardDate} </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </li>
    <li class="all_list">
        <div class="list_top">
            <div class="price">
                <div class="price_title  pt_0${farmDealTrendList[1].danger}"> 무 </div>
                <div class="price_img"> <img src="/resources/front/img/price/sub_14_p_02.png" width="130" height="103" alt="무"> </div>
            </div>
            <div class="status st_${farmDealTrendList[1].danger}"> ${farmDealTrendList[1].dangerName} </div>
            <div class="graph">
                <div class="g_img"> <img src="/resources/front/img/bg/sub_14_dg_0${farmDealTrendList[1].danger}.png" width="119" height="63" alt="${farmDealTrendList[1].dangerName}"> </div>
                <ul>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_01.png" width="6" height="6" alt="안정"> <span>안정</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_02.png" width="6" height="6" alt="주의"> <span>주의</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_03.png" width="6" height="6" alt="경계"> <span>경계</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_04.png" width="6" height="6" alt="심각"> <span>심각</span> </li>
                </ul>
            </div>
        </div>
        <div class="list_bottom">
            <div class="summary"> 단위:원/18kg </div>
            <div class="today">
                <div class="l_text"> 오늘 </div>
                <div class="r_text">
                    <c:if test="${farmDealTrendList[1].standardPrice=='0'}">
                        -
                    </c:if>
                    <c:if test="${farmDealTrendList[1].standardPrice!='0'}">
                        <fmt:formatNumber value="${ farmDealTrendList[1].standardPrice}" type="number"></fmt:formatNumber>
                    </c:if>
                </div>
            </div>
            <div class="year">
                <div class="l_text"> 1년전 </div>
                <div class="r_text">
                    <c:if test="${farmDealTrendList[1].yearPrice=='0'}">
                        -
                    </c:if>
                    <c:if test="${farmDealTrendList[1].yearPrice!='0'}">
                        <fmt:formatNumber value="${ farmDealTrendList[1].yearPrice}" type="number"></fmt:formatNumber>
                    </c:if>
                </div>
            </div>
            <div class="l_graph">
                <div class="lg_title"> 최근 가격 (일별) </div>
                <ul>
                    <li>
                        <div class="stick_list">
                            <div class="num"><fmt:formatNumber value="${farmDealTrendItemList2[4].standardPrice}" type="number"></fmt:formatNumber></div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList2[4].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList2[4].standardDate} </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList2[3].avgPrice}px;"></div>
                            </div>
                            <div class="day"></div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> <fmt:formatNumber value="${farmDealTrendItemList2[2].standardPrice}" type="number"></fmt:formatNumber> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList2[2].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList2[2].standardDate} </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList2[1].avgPrice}px;"></div>
                            </div>
                            <div class="day"> </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num num2"> <fmt:formatNumber value="${farmDealTrendItemList2[0].standardPrice}" type="number"></fmt:formatNumber> </div>
                            <div class="s_box">
                                <div class="stick stick2" style="height:${farmDealTrendItemList2[0].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList2[0].standardDate} </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </li>
    <li class="all_list">
        <div class="list_top">
            <div class="price">
                <div class="price_title pt_0${farmDealTrendList[2].danger}"> 건고추 </div>
                <div class="price_img"> <img src="/resources/front/img/price/sub_14_p_03.png" width="130" height="103" alt="건고추"> </div>
            </div>
            <div class="status st_${farmDealTrendList[2].danger}"> ${farmDealTrendList[2].dangerName} </div>
            <div class="graph">
                <div class="g_img"> <img src="/resources/front/img/bg/sub_14_dg_0${farmDealTrendList[2].danger}.png" width="119" height="63" alt="${farmDealTrendList[2].dangerName}"> </div>
                <ul>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_01.png" width="6" height="6" alt="안정"> <span>안정</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_02.png" width="6" height="6" alt="주의"> <span>주의</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_03.png" width="6" height="6" alt="경계"> <span>경계</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_04.png" width="6" height="6" alt="심각"> <span>심각</span> </li>
                </ul>
            </div>
        </div>
        <div class="list_bottom">
            <div class="summary"> 단위:원/600g </div>
            <div class="today">
                <div class="l_text"> 오늘 </div>
                <div class="r_text">
                    <c:if test="${farmDealTrendList[2].standardPrice=='0'}">
                        -
                    </c:if>
                    <c:if test="${farmDealTrendList[2].standardPrice!='0'}">
                        <fmt:formatNumber value="${ farmDealTrendList[2].standardPrice}" type="number"></fmt:formatNumber>
                    </c:if>
                </div>
            </div>
            <div class="year">
                <div class="l_text"> 1년전 </div>
                <div class="r_text">
                    <c:if test="${farmDealTrendList[2].yearPrice=='0'}">
                        -
                    </c:if>
                    <c:if test="${farmDealTrendList[2].yearPrice!='0'}">
                        <fmt:formatNumber value="${ farmDealTrendList[2].yearPrice}" type="number"></fmt:formatNumber>
                    </c:if>
                </div>
            </div>
            <div class="l_graph">
                <div class="lg_title"> 최근 가격 (일별) </div>
                <ul>
                    <li>
                        <div class="stick_list">
                            <div class="num"><fmt:formatNumber value="${farmDealTrendItemList3[4].standardPrice}" type="number"></fmt:formatNumber></div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList3[4].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList3[4].standardDate} </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList3[3].avgPrice}px;"></div>
                            </div>
                            <div class="day"></div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> <fmt:formatNumber value="${farmDealTrendItemList3[2].standardPrice}" type="number"></fmt:formatNumber> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList3[2].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList3[2].standardDate} </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList3[1].avgPrice}px;"></div>
                            </div>
                            <div class="day"> </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num num2"> <fmt:formatNumber value="${farmDealTrendItemList3[0].standardPrice}" type="number"></fmt:formatNumber> </div>
                            <div class="s_box">
                                <div class="stick stick2" style="height:${farmDealTrendItemList3[0].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList3[0].standardDate} </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </li>
    <li class="all_list">
        <div class="list_top">
            <div class="price">
                <div class="price_title  pt_0${farmDealTrendList[3].danger}"> 마늘 </div>
                <div class="price_img"> <img src="/resources/front/img/price/sub_14_p_04.png" width="130" height="103" alt="마늘"> </div>
            </div>
            <div class="status st_${farmDealTrendList[3].danger}"> ${farmDealTrendList[3].dangerName} </div>
            <div class="graph">
                <div class="g_img"> <img src="/resources/front/img/bg/sub_14_dg_0${farmDealTrendList[3].danger}.png" width="119" height="63" alt="${farmDealTrendList[3].dangerName}"> </div>
                <ul>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_01.png" width="6" height="6" alt="안정"> <span>안정</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_02.png" width="6" height="6" alt="주의"> <span>주의</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_03.png" width="6" height="6" alt="경계"> <span>경계</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_04.png" width="6" height="6" alt="심각"> <span>심각</span> </li>
                </ul>
            </div>
        </div>
        <div class="list_bottom">
            <div class="summary"> 단위:원/kg </div>
            <div class="today">
                <div class="l_text"> 오늘 </div>
                <div class="r_text">
                    <c:if test="${farmDealTrendList[3].standardPrice=='0'}">
                        -
                    </c:if>
                    <c:if test="${farmDealTrendList[3].standardPrice!='0'}">
                        <fmt:formatNumber value="${ farmDealTrendList[3].standardPrice}" type="number"></fmt:formatNumber>
                    </c:if>
                </div>
            </div>
            <div class="year">
                <div class="l_text"> 1년전 </div>
                <div class="r_text">
                    <c:if test="${farmDealTrendList[3].yearPrice=='0'}">
                        -
                    </c:if>
                    <c:if test="${farmDealTrendList[3].yearPrice!='0'}">
                        <fmt:formatNumber value="${ farmDealTrendList[3].yearPrice}" type="number"></fmt:formatNumber>
                    </c:if>
                </div>
            </div>
            <div class="l_graph">
                <div class="lg_title"> 최근 가격 (일별) </div>
                <ul>
                    <li>
                        <div class="stick_list">
                            <div class="num"><fmt:formatNumber value="${farmDealTrendItemList4[4].standardPrice}" type="number"></fmt:formatNumber></div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList4[4].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList4[4].standardDate} </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList4[3].avgPrice}px;"></div>
                            </div>
                            <div class="day"></div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> <fmt:formatNumber value="${farmDealTrendItemList4[2].standardPrice}" type="number"></fmt:formatNumber> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList4[2].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList4[2].standardDate} </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList4[1].avgPrice}px;"></div>
                            </div>
                            <div class="day"> </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num num2"> <fmt:formatNumber value="${farmDealTrendItemList4[0].standardPrice}" type="number"></fmt:formatNumber> </div>
                            <div class="s_box">
                                <div class="stick stick2" style="height:${farmDealTrendItemList4[0].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList4[0].standardDate} </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </li>
    <li class="all_list">
        <div class="list_top">
            <div class="price">
                <div class="price_title pt_0${farmDealTrendList[4].danger}"> 양파 </div>
                <div class="price_img"> <img src="/resources/front/img/price/sub_14_p_05.png" width="130" height="103" alt="양파"> </div>
            </div>
            <div class="status st_${farmDealTrendList[4].danger}"> ${farmDealTrendList[4].dangerName} </div>
            <div class="graph">
                <div class="g_img"> <img src="/resources/front/img/bg/sub_14_dg_0${farmDealTrendList[4].danger}.png" width="119" height="63" alt="${farmDealTrendList[4].dangerName}"> </div>
                <ul>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_01.png" width="6" height="6" alt="안정"> <span>안정</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_02.png" width="6" height="6" alt="주의"> <span>주의</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_03.png" width="6" height="6" alt="경계"> <span>경계</span> </li>
                    <li> <img src="/resources/front/img/bg/sub_14_dot_04.png" width="6" height="6" alt="심각"> <span>심각</span> </li>
                </ul>
            </div>
        </div>
        <div class="list_bottom">
            <div class="summary"> 단위:원/kg </div>
            <div class="today">
                <div class="l_text"> 오늘 </div>
                <div class="r_text">
                    <c:if test="${farmDealTrendList[4].standardPrice=='0'}">
                        -
                    </c:if>
                    <c:if test="${farmDealTrendList[4].standardPrice!='0'}">
                        <fmt:formatNumber value="${ farmDealTrendList[4].standardPrice}" type="number"></fmt:formatNumber>
                    </c:if>
                </div>
            </div>
            <div class="year">
                <div class="l_text"> 1년전 </div>
                <div class="r_text">
                    <c:if test="${farmDealTrendList[4].yearPrice=='0'}">
                        -
                    </c:if>
                    <c:if test="${farmDealTrendList[4].yearPrice!='0'}">
                        <fmt:formatNumber value="${ farmDealTrendList[4].yearPrice}" type="number"></fmt:formatNumber>
                    </c:if>
                </div>
            </div>
            <div class="l_graph">
                <div class="lg_title"> 최근 가격 (일별) </div>
                <ul>
                    <li>
                        <div class="stick_list">
                            <div class="num"><fmt:formatNumber value="${farmDealTrendItemList5[4].standardPrice}" type="number"></fmt:formatNumber></div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList5[4].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList5[4].standardDate} </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList5[3].avgPrice}px;"></div>
                            </div>
                            <div class="day"></div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> <fmt:formatNumber value="${farmDealTrendItemList5[2].standardPrice}" type="number"></fmt:formatNumber> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList5[2].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList5[2].standardDate} </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num"> </div>
                            <div class="s_box">
                                <div class="stick" style="height:${farmDealTrendItemList5[1].avgPrice}px;"></div>
                            </div>
                            <div class="day"> </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="num num2"> <fmt:formatNumber value="${farmDealTrendItemList5[0].standardPrice}" type="number"></fmt:formatNumber> </div>
                            <div class="s_box">
                                <div class="stick stick2" style="height:${farmDealTrendItemList5[0].avgPrice}px;"></div>
                            </div>
                            <div class="day"> ${farmDealTrendItemList5[0].standardDate} </div>
                        </div>
                    </li>
                </ul>
            </div>

        </div>

    </li>
    </ul>
    <div class="contents_box14_text">
        <p>
           - 배추, 무, 양파는 서울시가락동도매시장 상품 일별 평균경락가격<br>
           - 건고추, 마늘은 aT KAMIS 일별 상품 도매가격(건고추는 화건, 마늘은 난지형 마늘 기준)
        </p>
    </div>
    </div>

    </section>

    </div>
    <!-- //contents -->
    <!-- footer -->
    <!-- footer -->
    <div id="footer" class="footer_14">
        <section>
            <div class="footer_logo"><a href="http://www.at.or.kr" target="_blank"><img src="/resources/front/img/common/footer_logo.png" width="150" height="22" alt="로고"></a></div>
            <div class="footer_etc"> 자세한 내용은 <a href="#" onclick="javascript:outLinkAction('${menuList[0].footerurl}','${menuList[0].id}');"><img style="margin-top:5px;" src="/resources/front/img/common/footer_logo_kamis2.png" width="82" height="36" alt="AT kati 로고"></a>클릭하세요 </div>
        </section>
    </div>
    <!-- //footer -->
</div>
</div>
<content tag="local_script">
    <script type="text/javascript">
        $(document).ready(function(){
            $(".stick").each(function(){
                var thisHeight = $(this).css("height");
                $(this).css("height","0px");
                $(this).animate({
                    height: thisHeight,
                    opacity: 1
                }, 2000 );
            });
        })

        function outLinkAction(linktype,menuId){
            /********* 통계정보 입력 Start **********/
                //메뉴아이디 ==> 웹메인:91, 모바일메인:92, 나머지는 메뉴아이디:1~16
                //화면구분  ==> 메인:A,모바일메인:B,생생정보:C,원본:D
            $.get("/insertFootUrlStatistics/" + menuId+"/"+"D", {time : new Date().getTime() }, function (data, status) {
                if(data>0){
                    window.open(linktype,"","");
                }
            });
            /********* 통계정보 입력 End **********/
        }

    </script>
</content>