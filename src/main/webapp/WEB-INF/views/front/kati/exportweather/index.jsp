<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fnc" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="contents">
<div id="warp" class="warp04">
<!-- header -->
<div class="header">
    <section>
        <div class="header_box04">
            <div class="h_day">
                <span class="f_today">농수산식품 수출기상도 ${exportWeatherList[0].booknum}호</span>
                <span class="today">|&nbsp; 발행일 : ${exportWeatherList[0].publishdate} </span>
                <%--
                <span class="today">|&nbsp; 조사기간 : ${exportWeatherList[0].startdate}~${exportWeatherList[0].enddate} </span>
                --%>
            </div>
            <h1 class="h_title">${exportWeatherList[0].titledate}까지 농수산식품 수출 전년 동기 대비</h1><c:set value="${exportWeatherList[0].totAmtper}" var="totAmtper"></c:set><fmt:parseNumber value="${totAmtper}" var="totAmtperNum"></fmt:parseNumber>
            <div class="h_title_s"><fmt:formatNumber value="${exportWeatherList[0].totAmtper}" pattern="#,##0.#"></fmt:formatNumber>%<c:choose><c:when test="${totAmtperNum > 0}">증가</c:when><c:when test="${totAmtperNum < 0}">감소</c:when></c:choose>!
                <c:choose>
                    <c:when test="${fnc:length(exportWeatherList[0].totAmt) > 9}">
                        <c:set var="totAmt" value="${exportWeatherList[0].totAmt/100000000}" />
                        <fmt:formatNumber value="${totAmt}" pattern="#,##0.#"></fmt:formatNumber>억$
                    </c:when>
                    <c:otherwise>
                        <c:set var="totAmt" value="${exportWeatherList[0].totAmt/1000000}" />
                        <fmt:formatNumber value="${totAmt}" pattern="#,##0.#"></fmt:formatNumber>백만$
                    </c:otherwise>
                </c:choose></div>
        </div>
    </section>
</div>
<!-- //header -->
<!-- contents -->
<div class="contents">
<section>
<div class="contents_box04">
<div class="con_title"> 부류별 수출이슈 </div>
<div class="issue_main">
    <ul class="isuue_ul">
        <li>
            <c:set value="${exportWeatherList[1].totAmtper}" var="totAmtper1"></c:set><fmt:parseNumber value="${totAmtper1}" var="totAmtper1Num" pattern="#,##0.#"></fmt:parseNumber>
            <div class="i_percent <c:if test="${totAmtper1Num < 0}">i_percent1</c:if>">
                <div class="right">
                    <span class="top"> <fmt:formatNumber value="${exportWeatherList[1].totAmtper}" pattern="#,##0.#"></fmt:formatNumber>% </span>
                    <span class="bottom"> <fmt:formatNumber value="${exportWeatherList[1].totAmt/1000000}" pattern="#,##0.#"></fmt:formatNumber>백만$ </span>
                </div>
            </div>
            <div class="i_img${exportWeatherList[1].totAmtperNum}">
                <div class="i_img_front1">
                    <span>신선식품</span>
                </div>
            </div>
            <div class="l_graph">
                <ul class="I_gr_u">
                    <li class="first">
                        <div class="stick_list">
                            <div class="s_box">
                                <div class="stick" style="height:<fmt:formatNumber value="${exportWeatherMonthList[0].curAmt3/exportWeatherMonthList[0].maxCurAmt*100}" pattern="##0"></fmt:formatNumber>%;">
                                    <div class="num"><fmt:formatNumber value="${exportWeatherMonthList[0].curAmt3/10}" pattern="#,##0.#"></fmt:formatNumber></div>
                                </div>
                            </div>
                            <div class="day"> '${exportWeatherMonthList[0].curAmtDate3} </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="s_box">
                                <div class="stick" style="height:<fmt:formatNumber value="${exportWeatherMonthList[0].curAmt2/exportWeatherMonthList[0].maxCurAmt*100}" pattern="##0"></fmt:formatNumber>%;">
                                    <div class="num"><fmt:formatNumber value="${exportWeatherMonthList[0].curAmt2/10}" pattern="#,##0.#"></fmt:formatNumber></div>
                                </div>
                            </div>
                            <div class="day">${exportWeatherMonthList[0].curAmtDate2}</div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="s_box">
                                <div class="stick" style="height:<fmt:formatNumber value="${exportWeatherMonthList[0].curAmt1/exportWeatherMonthList[0].maxCurAmt*100}" pattern="##0"></fmt:formatNumber>%;">
                                    <div class="num"><fmt:formatNumber value="${exportWeatherMonthList[0].curAmt1/10}" pattern="#,##0.#"></fmt:formatNumber></div>
                                </div>
                            </div>
                            <div class="day">${exportWeatherMonthList[0].curAmtDate1}</div>
                        </div>
                    </li>
                </ul>
                <div class="f_note"> * 그래프 : 수출추이(백만$) </div>
            </div>
            <div class="i_text">
                <div class="top">
                    <c:set var="listCnt" value="1" />
                    <c:forEach items="${exportWeatherItemList1Up}" var="list">
                        <c:if test="${listCnt>1}">,</c:if>
                        ${list.itemName}
                    <c:set var="listCnt" value="${listCnt+1}" />
                    </c:forEach>
                </div>
                <div class="bottom">
                    <c:set var="listCnt" value="1" />
                    <c:forEach items="${exportWeatherItemList1Down}" var="list">
                        <c:if test="${listCnt>1}">,</c:if>
                        ${list.itemName}
                        <c:set var="listCnt" value="${listCnt+1}" />
                    </c:forEach>
                </div>
            </div>
        </li>
        <li>
            <c:set value="${exportWeatherList[2].totAmtper}" var="totAmtper2"></c:set><fmt:parseNumber value="${totAmtper2}" var="totAmtper2Num"></fmt:parseNumber>
            <div class="i_percent <c:if test="${totAmtper2Num < 0}">i_percent1</c:if>">
                <div class="right">
                    <span class="top"> <fmt:formatNumber value="${exportWeatherList[2].totAmtper}" pattern="#,##0.#"></fmt:formatNumber>% </span>
                    <span class="bottom"> <fmt:formatNumber value="${exportWeatherList[2].totAmt/1000000}" pattern="#,##0.#"></fmt:formatNumber>백만$ </span>
                </div>
            </div>
            <div class="i_img${exportWeatherList[2].totAmtperNum}">
                <div class="i_img_front2">
                    <span>가공식품</span>
                </div>
            </div>
            <div class="l_graph">
                <ul class="I_gr_u">
                    <li class="first">
                        <div class="stick_list">
                            <div class="s_box">
                                <div class="stick" style="height:<fmt:formatNumber value="${exportWeatherMonthList[1].curAmt3/exportWeatherMonthList[1].maxCurAmt*100}" pattern="##0"></fmt:formatNumber>%;">
                                    <div class="num"><fmt:formatNumber value="${exportWeatherMonthList[1].curAmt3/10}" pattern="#,##0.#"></fmt:formatNumber></div>
                                </div>
                            </div>
                            <div class="day"> '${exportWeatherMonthList[1].curAmtDate3} </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="s_box">
                                <div class="stick" style="height:<fmt:formatNumber value="${exportWeatherMonthList[1].curAmt2/exportWeatherMonthList[1].maxCurAmt*100}" pattern="##0"></fmt:formatNumber>%;">
                                    <div class="num"><fmt:formatNumber value="${exportWeatherMonthList[1].curAmt2/10}" pattern="#,##0.#"></fmt:formatNumber></div>
                                </div>
                            </div>
                            <div class="day">${exportWeatherMonthList[1].curAmtDate2}</div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="s_box">
                                <div class="stick" style="height:<fmt:formatNumber value="${exportWeatherMonthList[1].curAmt1/exportWeatherMonthList[1].maxCurAmt*100}" pattern="##0"></fmt:formatNumber>%;">
                                    <div class="num"><fmt:formatNumber value="${exportWeatherMonthList[1].curAmt1/10}" pattern="#,##0.#"></fmt:formatNumber></div>
                                </div>
                            </div>
                            <div class="day">${exportWeatherMonthList[1].curAmtDate1}</div>
                        </div>
                    </li>
                </ul>
                <div class="f_note"> * 그래프 : 수출추이(백만$) </div>
            </div>
            <div class="i_text">
                <div class="top">
                    <c:set var="listCnt" value="1" />
                    <c:forEach items="${exportWeatherItemList2Up}" var="list">
                        <c:if test="${listCnt>1}">,</c:if>
                        ${list.itemName}
                        <c:set var="listCnt" value="${listCnt+1}" />
                    </c:forEach>
                </div>
                <div class="bottom">
                    <c:set var="listCnt" value="1" />
                    <c:forEach items="${exportWeatherItemList2Down}" var="list">
                        <c:if test="${listCnt>1}">,</c:if>
                        ${list.itemName}
                        <c:set var="listCnt" value="${listCnt+1}" />
                    </c:forEach>
                </div>
            </div>
        </li>
        <li>
            <c:set value="${exportWeatherList[3].totAmtper}" var="totAmtper3"></c:set><fmt:parseNumber value="${totAmtper3}" var="totAmtper3Num"></fmt:parseNumber>
            <div class="i_percent <c:if test="${totAmtper3Num < 0}">i_percent1</c:if>">
                <div class="right">
                    <span class="top"> <fmt:formatNumber value="${exportWeatherList[3].totAmtper}" pattern="#,##0.#"></fmt:formatNumber>% </span>
                    <span class="bottom"> <fmt:formatNumber value="${exportWeatherList[3].totAmt/1000000}" pattern="#,##0.#"></fmt:formatNumber>백만$ </span>
                </div>
            </div>
            <div class="i_img${exportWeatherList[3].totAmtperNum}">
                <div class="i_img_front3">
                    <span>수산식품</span>
                </div>
            </div>
            <div class="l_graph">
                <ul class="I_gr_u">
                    <li class="first">
                        <div class="stick_list">
                            <div class="s_box">
                                <div class="stick" style="height:<fmt:formatNumber value="${exportWeatherMonthList[2].curAmt3/exportWeatherMonthList[2].maxCurAmt*100}" pattern="##0"></fmt:formatNumber>%;">
                                    <div class="num"><fmt:formatNumber value="${exportWeatherMonthList[2].curAmt3/10}" pattern="#,##0.#"></fmt:formatNumber></div>
                                </div>
                            </div>
                            <div class="day"> '${exportWeatherMonthList[2].curAmtDate3} </div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="s_box">
                                <div class="stick" style="height:<fmt:formatNumber value="${exportWeatherMonthList[2].curAmt2/exportWeatherMonthList[2].maxCurAmt*100}" pattern="##0"></fmt:formatNumber>%;">
                                    <div class="num"><fmt:formatNumber value="${exportWeatherMonthList[2].curAmt2/10}" pattern="#,##0.#"></fmt:formatNumber></div>
                                </div>
                            </div>
                            <div class="day">${exportWeatherMonthList[2].curAmtDate2}</div>
                        </div>
                    </li>
                    <li>
                        <div class="stick_list">
                            <div class="s_box">
                                <div class="stick" style="height:<fmt:formatNumber value="${exportWeatherMonthList[2].curAmt1/exportWeatherMonthList[2].maxCurAmt*100}" pattern="##0"></fmt:formatNumber>%;">
                                    <div class="num"><fmt:formatNumber value="${exportWeatherMonthList[2].curAmt1/10}" pattern="#,##0.#"></fmt:formatNumber></div>
                                </div>
                            </div>
                            <div class="day">${exportWeatherMonthList[2].curAmtDate1}</div>
                        </div>
                    </li>
                </ul>
                <div class="f_note"> * 그래프 : 수출추이(백만$) </div>
            </div>
            <div class="i_text">
                <div class="top">
                    <c:set var="listCnt" value="1" />
                    <c:forEach items="${exportWeatherItemList3Up}" var="list">
                        <c:if test="${listCnt>1}">,</c:if>
                        ${list.itemName}
                        <c:set var="listCnt" value="${listCnt+1}" />
                    </c:forEach>
                </div>
                <div class="bottom">
                    <c:set var="listCnt" value="1" />
                    <c:forEach items="${exportWeatherItemList3Down}" var="list">
                        <c:if test="${listCnt>1}">,</c:if>
                        ${list.itemName}
                        <c:set var="listCnt" value="${listCnt+1}" />
                    </c:forEach>
                </div>
            </div>
        </li>
    </ul>
</div>
<div class="con_title"> 주요 국가별 이슈 </div>
<div class="issue_main1">
    <ul>
        <c:set var="listCnt" value="1" />
        <c:forEach items="${exportWeatherNation}" var="list">
            <li class="<c:if test="${listCnt>3}">sub</c:if> ${list.itemCode}">
                <div class="top">
                    <div class="nation">
                        <img src="/resources/front/img/flag/flag_${list.itemCode}.png" width="75" height="51" alt="${list.itemName}">
                        <span>${list.itemName}</span>
                    </div>
                    <div class="whether">
                        <img src="/resources/front/img/bg/sub_04_m_icon_0${list.totAmtperNum}.png" width="93" height="77">
                    </div>
                </div>
                <div class="middle">
                    <div class="m_top"> ${list.upItem} </div>
                    <div class="m_bottom"> ${list.downItem} </div>
                </div>
                <div class="bottom">
                    <div class="trend_t trend_t1">
                        <div class="left"> 단신 </div>
                        <div class="right"> ${list.memo2} </div>
                    </div>
                </div>
            </li>
        <c:set var="listCnt" value="${listCnt+1}" />
        </c:forEach>
    </ul>
</div>
<div class="icon_intro">
    <ul>
        <li>
            <div class="icon"><img src="/resources/front/img/bg/sub_04_s_icon_01.png" width="50" height="53" alt=""></div>
            <div class="text">15%이상</div>
        </li>
        <li>
            <div class="icon"><img src="/resources/front/img/bg/sub_04_s_icon_02.png" width="50" height="53" alt=""></div>
            <div class="text">5~15%</div>
        </li>
        <li>
            <div class="icon"><img src="/resources/front/img/bg/sub_04_s_icon_03.png" width="50" height="53" alt=""></div>
            <div class="text">0~5%</div>
        </li>
        <li>
            <div class="icon"><img src="/resources/front/img/bg/sub_04_s_icon_04.png" width="50" height="53" alt=""></div>
            <div class="text">0~△5%</div>
        </li>
        <li>
            <div class="icon"><img src="/resources/front/img/bg/sub_04_s_icon_05.png" width="50" height="53" alt=""></div>
            <div class="text">△5~△15%</div>
        </li>
        <li>
            <div class="icon"><img src="/resources/front/img/bg/sub_04_s_icon_06.png" width="50" height="53" alt=""></div>
            <div class="text">△15%이하</div>
        </li>
    </ul>
</div>
<div class="i_f_note"> * &lt;농식품 수출기상도&gt;는 격주로 발행됩니다 (문의처 : 수출기획팀 061-931-0816) </div>
</div>
</section>
</div>
<!-- //contents -->
<!-- footer -->
<div id="footer" class="footer_04">
    <section>
        <div class="footer_logo"><a href="http://www.at.or.kr" target="_blank"><img src="/resources/front/img/common/footer_logo.png" width="150" height="22" alt="로고"></a></div>
        <div class="footer_etc"> 자세한 내용은 <a href="#" onclick="javascript:outLinkAction('${menuList[0].footerurl}','${menuList[0].id}');"><img style="margin-top:4px;" src="/resources/front/img/common/footer_logo_kati2.png" width="83" height="36" alt="AT taki 로고"></a>클릭하세요 </div>
    </section>
</div>
<!-- //footer -->
</div>
</div>

<script type="text/javascript">

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