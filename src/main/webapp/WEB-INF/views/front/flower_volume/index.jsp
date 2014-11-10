<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="contents">
    <div class="warp warp08">
        <!-- header -->
        <div class="header">
            <section>
                <div class="header_box08">
                    <h1 class="h_title">화훼 거래시세</h1>
                    <h2 class="h_title_s">
                        <span class="text">거래량</span>
                        <span class="num">TOP 5</span>
                    </h2>
                    <div class="h_day">
                        <div class="lately">최근경매시세</div>
                        <div class="today">절화 ${flowerVolumeList1[0].auctionDay} (${flowerVolumeList1[0].dayWeek}) &nbsp;|&nbsp; 난 ${flowerVolumeList2[0].auctionDay} (${flowerVolumeList2[0].dayWeek}) &nbsp;|&nbsp; 관엽 ${flowerVolumeList3[0].auctionDay} (${flowerVolumeList3[0].dayWeek})</div>
                    </div>
                    <div class="h_summary"> 단위 : 속(분), 원/속(분) </div>
                </div>
            </section>
        </div>
        <!-- //header -->
        <!-- contents -->
        <div class="contents">
            <section>
                <div class="contents_box08">
                    <div class="detail_b">
                        <ul>
                            <li>
                                <a href="javascript:;" onclick="changeView('0');">
                                <div class="detail_all detail_b_on">
                                    <div class="d_top">
                                        <span class="d_text">절화</span>
                                        <span class="d_img"><img src="/resources/front/img/etc/sub_08_menu_i01_on.png" width="35" height="66" alt="절화"></span>
                                    </div>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;" onclick="changeView('1');">
                                <div class="detail_all detail_b_off">
                                    <div class="d_top">
                                        <span class="d_text">난</span>
                                        <span class="d_img"><img src="/resources/front/img/etc/sub_08_menu_i02_off.png" width="64" height="84" alt="난"></span>
                                    </div>
                                </div>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:;" onclick="changeView('2');">
                                <div class="detail_all detail_b_off">
                                    <div class="d_top">
                                        <span class="d_text">관엽</span>
                                        <span class="d_img"><img src="/resources/front/img/etc/sub_08_menu_i03_off.png" width="59" height="76" alt="관엽"></span>
                                    </div>
                                </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="detail_s">
                        <ul>
                            <c:set var="listCnt" value="1" />
                            <c:forEach items="${flowerVolumeList1}" var="list">
                            <li class="<c:if test="${listCnt > 1}">s_b_b_etc stair_0${listCnt}</c:if>">
                                <div class="s_b_top">
                                    <div class="s_b_t_i">
                                        <img src="/resources/front/img/price/sub_08_tab${fn:replace(list.itemCode, 'F', '')}.jpg"
                                             <c:choose><c:when test="${listCnt==1}">width="144" height="114"</c:when><c:otherwise>width="132" height="105"</c:otherwise></c:choose> alt="장미">
                                    </div>
                                    <div class="s_b_t_t"> ${list.itemName} </div>
                                </div>
                                <div class="s_b_bottom dev_flowerNumArea">
                                    <ul>
                                        <li>
                                            <span class="s_b_b_t">거래량</span>
                                            <span class="s_b_b_p"><span class="dev1_flowerNum1_${listCnt}"> <fmt:formatNumber value="${list.volume}" type="number"></fmt:formatNumber></span>속</span>
                                        </li>
                                        <li>
                                            <span class="s_b_b_t">최고가</span>
                                            <span class="s_b_b_p"><span class="dev1_flowerNum2_${listCnt}"><fmt:formatNumber value="${list.maxPrice}" type="number"></fmt:formatNumber> </span>원</span>
                                        </li>
                                        <li>
                                            <span class="s_b_b_t">최저가</span>
                                            <span class="s_b_b_p"><span class="dev1_flowerNum3_${listCnt}"><fmt:formatNumber value="${list.minPrice}" type="number"></fmt:formatNumber> </span>원</span>
                                        </li>
                                        <li>
                                            <span class="s_b_b_t">평균가</span>
                                            <span class="s_b_b_p"><span class="dev1_flowerNum4_${listCnt}"><fmt:formatNumber value="${list.avgPrice}" type="number"></fmt:formatNumber> </span>원</span>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <c:set var="listCnt" value="${listCnt+1}" />
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="detail_s" style="display:none">
                        <ul>
                            <c:set var="listCnt" value="1" />
                            <c:forEach items="${flowerVolumeList2}" var="list">
                                <li class="<c:if test="${listCnt > 1}">s_b_b_etc stair_0${listCnt}</c:if>">
                                    <div class="s_b_top">
                                        <div class="s_b_t_i"> <img src="/resources/front/img/price/sub_08_tab${fn:replace(list.itemCode, 'F', '')}.jpg" <c:choose><c:when test="${listCnt==1}">width="144" height="114"</c:when><c:otherwise>width="132" height="105"</c:otherwise></c:choose> alt="장미"> </div>
                                        <div class="s_b_t_t"> ${list.itemName} </div>
                                    </div>
                                    <div class="s_b_bottom">
                                        <ul>
                                            <li>
                                                <span class="s_b_b_t">거래량</span>
                                                <span class="s_b_b_p"><span class="dev2_flowerNum1_${listCnt}"> <fmt:formatNumber value="${list.volume}" type="number"></fmt:formatNumber></span>분</span>
                                            </li>
                                            <li>
                                                <span class="s_b_b_t">최고가</span>
                                                <span class="s_b_b_p"><span class="dev2_flowerNum2_${listCnt}"><fmt:formatNumber value="${list.maxPrice}" type="number"></fmt:formatNumber> </span>원</span>
                                            </li>
                                            <li>
                                                <span class="s_b_b_t">최저가</span>
                                                <span class="s_b_b_p"><span class="dev2_flowerNum3_${listCnt}"><fmt:formatNumber value="${list.minPrice}" type="number"></fmt:formatNumber> </span>원</span>
                                            </li>
                                            <li>
                                                <span class="s_b_b_t">평균가</span>
                                                <span class="s_b_b_p"><span class="dev2_flowerNum4_${listCnt}"><fmt:formatNumber value="${list.avgPrice}" type="number"></fmt:formatNumber> </span>원</span>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            <c:set var="listCnt" value="${listCnt+1}" />
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="detail_s" style="display:none">
                        <ul>
                            <c:set var="listCnt" value="1" />
                            <c:forEach items="${flowerVolumeList3}" var="list">
                                <li class="<c:if test="${listCnt > 1}">s_b_b_etc stair_0${listCnt}</c:if>">
                                    <div class="s_b_top">
                                        <div class="s_b_t_i"> <img src="/resources/front/img/price/sub_08_tab${fn:replace(list.itemCode, 'F', '')}.jpg" <c:choose><c:when test="${listCnt==1}">width="144" height="114"</c:when><c:otherwise>width="132" height="105"</c:otherwise></c:choose> alt="장미"> </div>
                                        <div class="s_b_t_t"> ${list.itemName} </div>
                                    </div>
                                    <div class="s_b_bottom">
                                        <ul>
                                            <li>
                                                <span class="s_b_b_t">거래량</span>
                                                <span class="s_b_b_p"><span class="dev3_flowerNum1_${listCnt}"> <fmt:formatNumber value="${list.volume}" type="number"></fmt:formatNumber></span>분</span>
                                            </li>
                                            <li>
                                                <span class="s_b_b_t">최고가</span>
                                                <span class="s_b_b_p"><span class="dev3_flowerNum2_${listCnt}"><fmt:formatNumber value="${list.maxPrice}" type="number"></fmt:formatNumber> </span>원</span>
                                            </li>
                                            <li>
                                                <span class="s_b_b_t">최저가</span>
                                                <span class="s_b_b_p"><span class="dev3_flowerNum3_${listCnt}"><fmt:formatNumber value="${list.minPrice}" type="number"></fmt:formatNumber> </span>원</span>
                                            </li>
                                            <li>
                                                <span class="s_b_b_t">평균가</span>
                                                <span class="s_b_b_p"><span class="dev3_flowerNum4_${listCnt}"><fmt:formatNumber value="${list.avgPrice}" type="number"></fmt:formatNumber> </span>원</span>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <c:set var="listCnt" value="${listCnt+1}" />
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
        <!-- //contents -->
        <!-- footer -->
        <div id="footer" class="footer_08">
            <section>
                <div class="footer_logo"><a href="http://www.at.or.kr" target="_blank"><img src="/resources/front/img/common/footer_logo.png" width="150" height="22" alt="로고"></a></div>
                <div class="footer_etc"> 자세한 내용은 <a href="#" onclick="javascript:outLinkAction('${menuList[0].footerurl}','${menuList[0].id}');"><img style="margin-top:5px;" src="/resources/front/img/common/footer_logo_flower.png" width="120" height="34" alt="AT 화훼공판장">클릭하세요 </a></div>
            </section>
        </div>
        <!-- //footer -->
    </div>
</div>
<content tag="local_script">
    <script type="text/javascript" src="/resources/front/js/jquery.color.js"></script>
    <script type="text/javascript" src="/resources/front/js/change_color.js"></script>
    <script type="text/javascript">
        function changeView(type){
            $(".detail_s").hide();
            $(".detail_s:eq("+type+")").show();
            $(".detail_all").removeClass("detail_b_on");
            $(".detail_all").addClass("detail_b_off");
            $(".detail_all:eq("+type+")").removeClass("detail_b_off");
            $(".detail_all:eq("+type+")").addClass("detail_b_on");
            $(".d_img").each(function(){
                $(this).find("img").attr("src",$(this).find("img").attr("src").replace("_on.","_off."));
            });
            $(".d_img:eq("+type+")").find("img").attr("src",$(".d_img:eq("+type+")").find("img").attr("src").replace("_off.","_on."));

            ACTIVE_INFO.initialize((parseInt(type,10)+1));
        }

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