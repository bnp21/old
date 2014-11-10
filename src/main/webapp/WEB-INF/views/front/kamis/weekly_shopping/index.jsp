<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="contents">
<div id="warp" class="warp01">
    <!-- header -->
    <div class="header">
        <section>
            <div class="header_box01">
                <div class="h_summary"> <span>제 ${weeklyShoppingList[0].booknum}호</span> </div>
                <h1 class="h_title"><span class="w_h">주간 알뜰 장보기</span><span class="w_g">물가정보</span></h1>
                <div class="h_day">
                    <span class="today"><!-- 이번주동향에서 다음주전망으로 날짜수정함 10.23일 -->
                        발행일 :  ${weeklyShoppingList[0].publishdate}
                        <%--
                        <fmt:parseDate value="${weeklyShoppingList[4].startDate}" pattern ="yyyy-MM-dd" var="startdate"></fmt:parseDate>
                        <fmt:formatDate value="${startdate}" pattern="yyyy.MM.dd"></fmt:formatDate>
                        ~
                        <fmt:parseDate value="${weeklyShoppingList[4].endDate}" pattern ="yyyy-MM-dd" var="enddate"> </fmt:parseDate>
                        <fmt:formatDate value="${enddate}" pattern="yyyy.MM.dd"></fmt:formatDate>
                        --%>
                    </span>
                </div>
            </div>
        </section>
    </div>
    <!-- //header -->
    <!-- contents -->
    <div class="contents">
        <section>
            <div class="contents_box01">
                <div class="tit_01"> 이번주 동향 ( <fmt:parseDate value="${weeklyShoppingList[0].startDate}" pattern ="yyyy-MM-dd" var="startdate"> </fmt:parseDate>
                    <fmt:formatDate value="${startdate}" pattern="MM.dd"></fmt:formatDate> ~ <fmt:parseDate value="${weeklyShoppingList[0].endDate}" pattern ="yyyy-MM-dd" var="enddate"> </fmt:parseDate>
                    <fmt:formatDate value="${enddate}" pattern="MM.dd"></fmt:formatDate> ) </div>
                <ul class="dev_nowWeek">
                    <li style="display:none;">
                        <div class="trend_t tt_up">
                            <div class="t_title"> ${weeklyShoppingList[0].itemName} <span>(${weeklyShoppingList[0].unit})</span> </div>
                            <div class="t_price"> <span>지난주 : <fmt:formatNumber value="${weeklyShoppingList[0].lastWeekPrice}" type="number"/>원</span> <span>이번주 : <fmt:formatNumber value="${weeklyShoppingList[0].weekPrice}" type="number"/>원</span> </div>
                            <div class="t_percent t_p_up"> ${weeklyShoppingList[0].rate}%<br>
                                상승 </div>
                        </div>
                        <div class="trend_m"> <img src="/resources/front/img/price/sub_01_p_${weeklyShoppingList[0].itemImgName}.jpg" width="195" height="147" alt="${weeklyShoppingList[0].itemName}"> </div>
                        <div class="trend_b"> ${weeklyShoppingList[0].memo} </div>
                    </li>
                    <li style="display:none;">
                        <div class="trend_t tt_up">
                            <div class="t_title"> ${weeklyShoppingList[1].itemName} <span>(${weeklyShoppingList[1].unit})</span> </div>
                            <div class="t_price"> <span>지난주 : <fmt:formatNumber value="${weeklyShoppingList[1].lastWeekPrice}" type="number"/>원</span> <span>이번주 : <fmt:formatNumber value="${weeklyShoppingList[1].weekPrice}" type="number"/>원</span> </div>
                            <div class="t_percent t_p_up"> ${weeklyShoppingList[1].rate}%<br>
                                상승 </div>
                        </div>
                        <div class="trend_m"> <img src="/resources/front/img/price/sub_01_p_${weeklyShoppingList[1].itemImgName}.jpg" width="195" height="147" alt="${weeklyShoppingList[1].itemName}"> </div>
                        <div class="trend_b"> ${weeklyShoppingList[1].memo} </div>
                    </li>
                    <li style="display:none;">
                        <div class="trend_t tt_down">
                            <div class="t_title"> ${weeklyShoppingList[2].itemName} <span>(${weeklyShoppingList[2].unit})</span> </div>
                            <div class="t_price"> <span>지난주 : <fmt:formatNumber value="${weeklyShoppingList[2].lastWeekPrice}" type="number"/>원</span> <span>이번주 : <fmt:formatNumber value="${weeklyShoppingList[2].weekPrice}" type="number"/>원</span> </div>
                            <div class="t_percent t_down"> 하락<br>
                                ${weeklyShoppingList[2].rate}% </div>
                        </div>
                        <div class="trend_m"> <img src="/resources/front/img/price/sub_01_p_${weeklyShoppingList[2].itemImgName}.jpg" width="195" height="147" alt="${weeklyShoppingList[2].itemName}"> </div>
                        <div class="trend_b"> ${weeklyShoppingList[2].memo} </div>
                    </li>
                    <li style="display:none;">
                        <div class="trend_t tt_down">
                            <div class="t_title"> ${weeklyShoppingList[3].itemName} <span>(${weeklyShoppingList[3].unit})</span> </div>
                            <div class="t_price"> <span>지난주 : <fmt:formatNumber value="${weeklyShoppingList[3].lastWeekPrice}" type="number"/>원</span> <span>이번주 : <fmt:formatNumber value="${weeklyShoppingList[3].weekPrice}" type="number"/>원</span> </div>
                            <div class="t_percent t_down"> 하락<br>
                                ${weeklyShoppingList[3].rate}% </div>
                        </div>
                        <div class="trend_m"> <img src="/resources/front/img/price/sub_01_p_${weeklyShoppingList[3].itemImgName}.jpg" width="195" height="147" alt="${weeklyShoppingList[3].itemName}"> </div>
                        <div class="trend_b"> ${weeklyShoppingList[3].memo} </div>
                    </li>
                </ul>
                <div class="tit_02"> <span>다음주 전망 ( <fmt:parseDate value="${weeklyShoppingList[4].startDate}" pattern ="yyyy-MM-dd" var="startdate"> </fmt:parseDate>
                    <fmt:formatDate value="${startdate}" pattern="MM.dd"></fmt:formatDate> ~ <fmt:parseDate value="${weeklyShoppingList[4].endDate}" pattern ="yyyy-MM-dd" var="enddate"> </fmt:parseDate>
                    <fmt:formatDate value="${enddate}" pattern="MM.dd"></fmt:formatDate> )</span> </div>
                <div class="cart">
                    <div class="cart_top">
                        <div class="cart_l_01">
                            <div class="c_top">
                                <div class="c_title"> <span>약보합</span> </div>
                                <div class="c_img"><img src="/resources/front/img/bg/sub_01_t_circle_01.png" width="123" height="113" alt=""></div>
                                <div class="c_img_main"><img src="/resources/front/img/price/sub_01_t_p_${weeklyShoppingList[4].itemImgName}.jpg" width="123" height="113" alt="${weeklyShoppingList[4].itemName}"></div>
                            </div>
                            <div class="c_bottom">
                                <div class="c_b_title">
                                    ${weeklyShoppingList[4].itemName} <span>(${weeklyShoppingList[4].unit})</span>
                                </div>
                                <div class="c_b_text">
                                    ${weeklyShoppingList[4].memo}
                                </div>
                            </div>
                        </div>
                        <div class="cart_l_01">
                            <div class="c_top">
                                <div class="c_title"> <span>약보합</span> </div>
                                <div class="c_img"><img src="/resources/front/img/bg/sub_01_t_circle_01.png" width="123" height="113" alt=""></div>
                                <div class="c_img_main"><img src="/resources/front/img/price/sub_01_t_p_${weeklyShoppingList[5].itemImgName}.jpg" width="123" height="113" alt="${weeklyShoppingList[5].itemName}"></div>
                            </div>
                            <div class="c_bottom">
                                <div class="c_b_title">
                                    ${weeklyShoppingList[5].itemName} <span>(${weeklyShoppingList[5].unit})</span>
                                </div>
                                <div class="c_b_text">
                                    ${weeklyShoppingList[5].memo}
                                </div>
                            </div>
                        </div>
                        <div class="cart_l_02">
                            <div class="c_top">
                                <div class="c_title"> <span>하락</span> </div>
                                <div class="c_img"><img src="/resources/front/img/bg/sub_01_t_circle_02.png" width="123" height="113" alt=""></div>
                                <div class="c_img_main"><img src="/resources/front/img/price/sub_01_t_p_${weeklyShoppingList[6].itemImgName}.jpg" width="123" height="113" alt="${weeklyShoppingList[6].itemName}"></div>
                            </div>
                            <div class="c_bottom">
                                <div class="c_b_title">
                                    ${weeklyShoppingList[6].itemName} <span>(${weeklyShoppingList[6].unit})</span>
                                </div>
                                <div class="c_b_text">
                                    ${weeklyShoppingList[6].memo}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cart_middle">
                        <div class="cart_l_03">
                            <div class="c_top">
                                <div class="c_title"> <span>보합</span> </div>
                                <div class="c_img"><img src="/resources/front/img/bg/sub_01_t_circle_03.png" width="123" height="113" alt=""></div>
                                <div class="c_img_main"><img src="/resources/front/img/price/sub_01_t_p_${weeklyShoppingList[7].itemImgName}.jpg" width="123" height="113" alt="${weeklyShoppingList[7].itemName}"></div>
                            </div>
                            <div class="c_bottom">
                                <div class="c_b_title">
                                    ${weeklyShoppingList[7].itemName} <span>(${weeklyShoppingList[7].unit})</span>
                                </div>
                                <div class="c_b_text">
                                    ${weeklyShoppingList[7].memo}
                                </div>
                            </div>
                        </div>
                        <div class="cart_l_03">
                            <div class="c_top">
                                <div class="c_title"> <span>보합</span> </div>
                                <div class="c_img"><img src="/resources/front/img/bg/sub_01_t_circle_03.png" width="123" height="113" alt=""></div>
                                <div class="c_img_main"><img src="/resources/front/img/price/sub_01_t_p_${weeklyShoppingList[8].itemImgName}.jpg" width="123" height="113" alt="${weeklyShoppingList[8].itemName}"></div>
                            </div>
                            <div class="c_bottom">
                                <div class="c_b_title">
                                    ${weeklyShoppingList[8].itemName} <span>(${weeklyShoppingList[8].unit})</span>
                                </div>
                                <div class="c_b_text">
                                    ${weeklyShoppingList[8].memo}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cart_bottom">
                        <div class="cart_l_04">
                            <div class="c_top">
                                <div class="c_title"> <span>상승</span> </div>
                                <div class="c_img"><img src="/resources/front/img/bg/sub_01_t_circle_04.png" width="123" height="113" alt=""></div>
                                <div class="c_img_main"><img src="/resources/front/img/price/sub_01_t_p_${weeklyShoppingList[9].itemImgName}.jpg" width="123" height="113" alt="${weeklyShoppingList[9].itemName}"></div>
                            </div>
                            <div class="c_bottom">
                                <div class="c_b_title">
                                    ${weeklyShoppingList[9].itemName} <span>(${weeklyShoppingList[9].unit})</span>
                                </div>
                                <div class="c_b_text">
                                    ${weeklyShoppingList[9].memo}
                                </div>
                            </div>
                        </div>
                        <div class="cart_l_05">
                            <div class="c_top">
                                <div class="c_title"> <span>강보합</span> </div>
                                <div class="c_img"><img src="/resources/front/img/bg/sub_01_t_circle_05.png" width="123" height="113" alt=""></div>
                                <div class="c_img_main"><img src="/resources/front/img/price/sub_01_t_p_${weeklyShoppingList[10].itemImgName}.jpg" width="123" height="113" alt="${weeklyShoppingList[10].itemName}"></div>
                            </div>
                            <div class="c_bottom">
                                <div class="c_b_title">
                                    ${weeklyShoppingList[10].itemName} <span>(${weeklyShoppingList[10].unit})</span>
                                </div>
                                <div class="c_b_text">
                                    ${weeklyShoppingList[10].memo}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- //contents -->
    <!-- footer -->
    <div id="footer" class="footer_01">
        <section>
            <div class="footer_logo"><a href="http://www.at.or.kr" target="_blank"><img src="/resources/front/img/common/footer_logo.png" width="150" height="22" alt="로고"></a></div>
            <div class="footer_etc"> 자세한 내용은 <a href="#" onclick="javascript:outLinkAction('${menuList[0].footerurl}','${menuList[0].id}');"><img style="margin-top:5px;" src="/resources/front/img/common/footer_logo_kamis.png" width="86" height="39" alt="AT KAMIS 로고"></a>클릭하세요 </div>
        </section>
    </div>
    <!-- //footer -->
</div>
</div>
<content tag="local_script">
    <script type="text/javascript">
        $(document).ready(function(){
            var lis = $(".dev_nowWeek li").hide();
            var i = 0;
            (function displayImages() {
                lis.eq(i++).fadeIn(300, displayImages);
            })();
        });

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