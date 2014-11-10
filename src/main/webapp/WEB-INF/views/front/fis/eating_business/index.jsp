<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="contents">
<div id="warp" class="warp09">
<!-- header -->
<div class="header">
    <section>
        <div class="header_box09">
            <div class="h_day"> <span class="f_today">외식창업 한 번 해볼까.</span> </div>
            <h1 class="h_title">${eatingBusinessCommentList[0].title}</h1>
        </div>
    </section>
</div>
<!-- //header -->
<!-- contents -->
<div class="contents">
<section>
<div class="contents_box09">
<div class="b_we">
    <div class="value">
        <div class="l_n"> ${eatingBusinessList1[0].lastRate}<span>(${eatingBusinessList1[0].lastDate})</span> </div>
        <div class="arrow">
            <c:choose>
                <c:when test="${eatingBusinessList1[0].lastRate < eatingBusinessList1[0].nowRate}"><img src="/resources/front/img/bg/sub_09_b_up.png" width="32" height="28" alt="상승"></c:when>
                <c:when test="${eatingBusinessList1[0].lastRate > eatingBusinessList1[0].nowRate}"><img src="/resources/front/img/bg/sub_09_b_down.png" width="32" height="28" alt="하락"></c:when>
            </c:choose>
        </div>
        <div class="r_n">${eatingBusinessList1[0].nowRate}<span>(${eatingBusinessList1[0].nowDate})</span> </div>
    </div>
    <div class="img">
        <c:choose>
            <c:when test="${eatingBusinessList1[0].nowRate/10 == 0}">
                <c:set var="iconNum" value="${fn:substring(eatingBusinessList1[0].nowRate, 0, 1)}" />
            </c:when>
            <c:otherwise>
                <c:set var="iconNum" value="${fn:substring(eatingBusinessList1[0].nowRate, 0, 1) + 1}" />
            </c:otherwise>
        </c:choose>
        <img src="/resources/front/img/bg/sub_09_b_icon_${iconNum-5}.png" width="101" height="100" >
    </div>
</div>
<div class="l_graph">
    <div class="num_ul">
        <ul>
            <li>120</li>
            <li>110</li>
            <li>100</li>
            <li>90</li>
            <li>80</li>
            <li>70</li>
            <li>60</li>
            <li>50</li>
        </ul>
    </div>
    <ul class="I_gr_u">
        <c:set var="listCnt" value="0" />
        <c:forEach items="${eatingBusinessList2}" var="list">
        <li class="<c:choose><c:when test="${listCnt == 0}">first</c:when><c:when test="${listCnt == 8}">now</c:when><c:when test="${listCnt == 9}">future</c:when></c:choose>">
            <div class="stick_list">
                <div class="s_box">
                    <div class="stick" style="height:${eatingBusinessList2[listCnt].nowRate - 42}%;">
                        <div class="num">${eatingBusinessList2[listCnt].nowRate}</div>
                    </div>
                </div>
                <div class="day"> ${eatingBusinessList2[listCnt].nowDate} </div>
            </div>
        </li>
        <c:set var="listCnt" value="${listCnt+1}" />
        </c:forEach>
        <%--<li>
            <div class="stick_list">
                <div class="s_box">
                    <div class="stick" style="height:${eatingBusinessList2[1].nowRate - 50}%;">
                        <div class="num">${eatingBusinessList2[1].nowRate}</div>
                    </div>
                </div>
                <div class="day">${eatingBusinessList2[1].nowDate}</div>
            </div>
        </li>
        <li>
            <div class="stick_list">
                <div class="s_box">
                    <div class="stick" style="height:${eatingBusinessList2[2].nowRate - 50}%;">
                        <div class="num">${eatingBusinessList2[2].nowRate}</div>
                    </div>
                </div>
                <div class="day">${eatingBusinessList2[2].nowDate}</div>
            </div>
        </li>
        <li>
            <div class="stick_list">
                <div class="s_box">
                    <div class="stick" style="height:${eatingBusinessList2[3].nowRate - 50}%;">
                        <div class="num">${eatingBusinessList2[3].nowRate}</div>
                    </div>
                </div>
                <div class="day">${eatingBusinessList2[3].nowDate}</div>
            </div>
        </li>
        <li>
            <div class="stick_list">
                <div class="s_box">
                    <div class="stick" style="height:60%;">
                        <div class="num">68.84</div>
                    </div>
                </div>
                <div class="day">4/4</div>
            </div>
        </li>
        <li>
            <div class="stick_list">
                <div class="s_box">
                    <div class="stick" style="height:50%;">
                        <div class="num">70.84</div>
                    </div>
                </div>
                <div class="day">'13 1/4</div>
            </div>
        </li>
        <li>
            <div class="stick_list">
                <div class="s_box">
                    <div class="stick" style="height:40%;">
                        <div class="num">73.48</div>
                    </div>
                </div>
                <div class="day">2/4</div>
            </div>
        </li>
        <li>
            <div class="stick_list">
                <div class="s_box">
                    <div class="stick" style="height:30%;">
                        <div class="num">72.44</div>
                    </div>
                </div>
                <div class="day">3/4</div>
            </div>
        </li>
        <li class="now">
            <div class="stick_list">
                <div class="s_box">
                    <div class="stick" style="height:20%;">
                        <div class="num">73.09</div>
                    </div>
                </div>
                <div class="day">4/4</div>
            </div>
        </li>
        <li class="future">
            <div class="stick_list">
                <div class="s_box">
                    <div class="stick" style="height:10%;">
                        <div class="num">79.18</div>
                    </div>
                </div>
                <div class="day">'14 1/4</div>
            </div>
        </li>--%>
    </ul>
    <div class="gr_t">
        <div class="now_num"> <img src="/resources/front/img/bg/sub_09_o_bg.png" width="25" height="15" alt="">현재외식업경기지수 </div>
        <div class="future_num"> <img src="/resources/front/img/bg/sub_09_s_bg.png" width="25" height="15" alt="">미래외식업경기지수 </div>
    </div>
</div>
<div class="news">
    <div class="n_title"> ${eatingBusinessCommentList[0].memo1Title}</div>
    <div id="memo1" style="height:34px"> <span>${eatingBusinessCommentList[0].memo1}</span> </div>
</div>
<div class="we_ul">
    <ul>
        <li><img src="/resources/front/img/bg/sub_09_s_icon_1.png" width="24" height="28" alt=""><span>50~60</span></li>
        <li><img src="/resources/front/img/bg/sub_09_s_icon_2.png" width="24" height="28" alt=""><span>60~70</span></li>
        <li><img src="/resources/front/img/bg/sub_09_s_icon_3.png" width="24" height="28" alt=""><span>70~80</span></li>
        <li><img src="/resources/front/img/bg/sub_09_s_icon_4.png" width="24" height="28" alt=""><span>80~90</span></li>
        <li><img src="/resources/front/img/bg/sub_09_s_icon_5.png" width="24" height="28" alt=""><span>90~100</span></li>
        <li><img src="/resources/front/img/bg/sub_09_s_icon_6.png" width="24" height="28" alt=""><span>100~110</span></li>
        <li><img src="/resources/front/img/bg/sub_09_s_icon_7.png" width="24" height="28" alt=""><span>110~120</span></li>
        <li><img src="/resources/front/img/bg/sub_09_s_icon_8.png" width="24" height="28" alt=""><span>120~130</span></li>
        <li><img src="/resources/front/img/bg/sub_09_s_icon_9.png" width="24" height="28" alt=""><span>130~140</span></li>
        <li><img src="/resources/front/img/bg/sub_09_s_icon_10.png" width="24" height="28" alt=""><span>140~150</span></li>
    </ul>
</div>
<ul class="ms_memo">
    <li class="m_we m_first">
        <div class="title"> <span>${eatingBusinessList3[0].foodType}</span> </div>
        <div class="value">
            <div class="l_n"> ${eatingBusinessList3[0].lastRate}<span>(${eatingBusinessList3[0].lastDate})</span> </div>
            <div class="arrow">
                <c:choose>
                    <c:when test="${eatingBusinessList3[0].lastRate < eatingBusinessList3[0].nowRate}"><img src="/resources/front/img/bg/sub_09_m_up.png" width="25" height="22" alt="상승"></c:when>
                    <c:when test="${eatingBusinessList3[0].lastRate > eatingBusinessList3[0].nowRate}"><img src="/resources/front/img/bg/sub_09_m_down.png" width="25" height="22" alt="하락"></c:when>
                </c:choose>
            </div>
            <div class="r_n">${eatingBusinessList3[0].nowRate}<span>(${eatingBusinessList3[0].nowDate})</span> </div>
        </div>
        <div class="img">
            <c:choose>
                <c:when test="${eatingBusinessList3[0].nowRate/10 == 0}">
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[0].nowRate, 0, 1)}" />
                </c:when>
                <c:otherwise>
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[0].nowRate, 0, 1) + 1}" />
                </c:otherwise>
            </c:choose>
            <img src="/resources/front/img/bg/sub_09_m_icon_${iconNum-5}.png" width="61" height="64">
         </div>
    </li>
    <li class="m_we">
        <div class="title"> <span>${eatingBusinessList3[1].foodType}</span> </div>
        <div class="value">
            <div class="l_n"> ${eatingBusinessList3[1].lastRate}<span>(${eatingBusinessList3[1].lastDate})</span> </div>
            <div class="arrow">
                <c:choose>
                    <c:when test="${eatingBusinessList3[1].lastRate < eatingBusinessList3[1].nowRate}"><img src="/resources/front/img/bg/sub_09_m_up.png" width="25" height="22" alt="상승"></c:when>
                    <c:when test="${eatingBusinessList3[1].lastRate > eatingBusinessList3[1].nowRate}"><img src="/resources/front/img/bg/sub_09_m_down.png" width="25" height="22" alt="하락"></c:when>
                </c:choose>
            </div>
            <div class="r_n">${eatingBusinessList3[1].nowRate}<span>(${eatingBusinessList3[1].nowDate})</span> </div>
        </div>
        <div class="img">
            <c:choose>
                <c:when test="${eatingBusinessList3[1].nowRate/10 == 0}">
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[1].nowRate, 0, 1)}" />
                </c:when>
                <c:otherwise>
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[1].nowRate, 0, 1) + 1}" />
                </c:otherwise>
            </c:choose>
            <img src="/resources/front/img/bg/sub_09_m_icon_${iconNum-5}.png" width="61" height="64"> </div>
    </li>
    <li class="m_we">
        <div class="title"> <span>${eatingBusinessList3[2].foodType}</span> </div>
        <div class="value">
            <div class="l_n"> ${eatingBusinessList3[2].lastRate}<span>(${eatingBusinessList3[2].lastDate})</span> </div>
            <div class="arrow">
                <c:choose>
                    <c:when test="${eatingBusinessList3[2].lastRate < eatingBusinessList3[0].nowRate}"><img src="/resources/front/img/bg/sub_09_m_up.png" width="25" height="22" alt="상승"></c:when>
                    <c:when test="${eatingBusinessList3[2].lastRate > eatingBusinessList3[0].nowRate}"><img src="/resources/front/img/bg/sub_09_m_down.png" width="25" height="22" alt="하락"></c:when>
                </c:choose>
            </div>
            <div class="r_n">${eatingBusinessList3[2].nowRate}<span>(${eatingBusinessList3[2].nowDate})</span> </div>
        </div>
        <div class="img">
            <c:choose>
                <c:when test="${eatingBusinessList3[2].nowRate/10 == 0}">
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[2].nowRate, 0, 1)}" />
                </c:when>
                <c:otherwise>
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[2].nowRate, 0, 1) + 1}" />
                </c:otherwise>
            </c:choose>
            <img src="/resources/front/img/bg/sub_09_m_icon_${iconNum-5}.png" width="61" height="64"> </div>
    </li>
    <li class="s_we s_first">
        <div class="title"> <span>${eatingBusinessList3[3].foodType}</span> </div>
        <div class="value">
            <div class="l_n">${eatingBusinessList3[3].lastRate}<span>(${eatingBusinessList3[3].lastDate})</span> </div>
            <div class="arrow">
                <c:choose>
                    <c:when test="${eatingBusinessList3[3].lastRate < eatingBusinessList3[3].nowRate}"><img src="/resources/front/img/bg/sub_09_s_up.png" width="19" height="17" alt="하락"></c:when>
                    <c:when test="${eatingBusinessList3[3].lastRate > eatingBusinessList3[3].nowRate}"><img src="/resources/front/img/bg/sub_09_s_down.png" width="19" height="17" alt="하락"></c:when>
                </c:choose>
            </div>
            <div class="r_n">${eatingBusinessList3[3].nowRate}<span>(${eatingBusinessList3[3].nowDate})</span> </div>
        </div>
        <div class="img">
            <c:choose>
                <c:when test="${eatingBusinessList3[3].nowRate/10 == 0}">
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[3].nowRate, 0, 1)}" />
                </c:when>
                <c:otherwise>
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[3].nowRate, 0, 1) + 1}" />
                </c:otherwise>
            </c:choose>
            <img src="/resources/front/img/bg/sub_09_m_icon_${iconNum-5}.png" width="61" height="64"> </div>
    </li>
    <li class="s_we">
        <div class="title"> <span>${eatingBusinessList3[4].foodType}</span> </div>
        <div class="value">
            <div class="l_n">${eatingBusinessList3[4].lastRate}<span>(${eatingBusinessList3[4].lastDate})</span> </div>
            <div class="arrow">
                <c:choose>
                    <c:when test="${eatingBusinessList3[4].lastRate < eatingBusinessList3[4].nowRate}"><img src="/resources/front/img/bg/sub_09_s_up.png" width="19" height="17" alt="하락"></c:when>
                    <c:when test="${eatingBusinessList3[4].lastRate > eatingBusinessList3[4].nowRate}"><img src="/resources/front/img/bg/sub_09_s_down.png" width="19" height="17" alt="하락"></c:when>
                </c:choose>
            </div>
            <div class="r_n">${eatingBusinessList3[4].nowRate}<span>(${eatingBusinessList3[4].nowDate})</span> </div>
        </div>
        <div class="img">
            <c:choose>
                <c:when test="${eatingBusinessList3[4].nowRate/10 == 0}">
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[4].nowRate, 0, 1)}" />
                </c:when>
                <c:otherwise>
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[4].nowRate, 0, 1) + 1}" />
                </c:otherwise>
            </c:choose>
            <img src="/resources/front/img/bg/sub_09_m_icon_${iconNum-5}.png" width="61" height="64"> </div>
    </li>
    <li class="s_we">
        <div class="title"> <span>${eatingBusinessList3[5].foodType}</span> </div>
        <div class="value">
            <div class="l_n">${eatingBusinessList3[5].lastRate}<span>(${eatingBusinessList3[5].lastDate})</span> </div>
            <div class="arrow">
                <c:choose>
                    <c:when test="${eatingBusinessList3[5].lastRate < eatingBusinessList3[5].nowRate}"><img src="/resources/front/img/bg/sub_09_s_up.png" width="19" height="17" alt="하락"></c:when>
                    <c:when test="${eatingBusinessList3[5].lastRate > eatingBusinessList3[5].nowRate}"><img src="/resources/front/img/bg/sub_09_s_down.png" width="19" height="17" alt="하락"></c:when>
                </c:choose>
            </div>
            <div class="r_n">${eatingBusinessList3[5].nowRate}<span>(${eatingBusinessList3[5].nowDate})</span> </div>
        </div>
        <div class="img">
            <c:choose>
                <c:when test="${eatingBusinessList3[5].nowRate/10 == 0}">
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[5].nowRate, 0, 1)}" />
                </c:when>
                <c:otherwise>
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[5].nowRate, 0, 1) + 1}" />
                </c:otherwise>
            </c:choose>
            <img src="/resources/front/img/bg/sub_09_m_icon_${iconNum-5}.png" width="61" height="64"> </div>
    </li>
    <li class="s_we">
        <div class="title long"> <span>${eatingBusinessList3[6].foodType}</span> </div>
        <div class="value">
            <div class="l_n">${eatingBusinessList3[6].lastRate}<span>(${eatingBusinessList3[6].lastDate})</span> </div>
            <div class="arrow">
                <c:choose>
                    <c:when test="${eatingBusinessList3[6].lastRate < eatingBusinessList3[6].nowRate}"><img src="/resources/front/img/bg/sub_09_s_up.png" width="19" height="17" alt="하락"></c:when>
                    <c:when test="${eatingBusinessList3[6].lastRate > eatingBusinessList3[6].nowRate}"><img src="/resources/front/img/bg/sub_09_s_down.png" width="19" height="17" alt="하락"></c:when>
                </c:choose>
            </div>
            <div class="r_n">${eatingBusinessList3[6].nowRate}<span>(${eatingBusinessList3[6].nowDate})</span> </div>
        </div>
        <div class="img">
            <c:choose>
                <c:when test="${eatingBusinessList3[6].nowRate/10 == 0}">
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[6].nowRate, 0, 1)}" />
                </c:when>
                <c:otherwise>
                    <c:set var="iconNum" value="${fn:substring(eatingBusinessList3[6].nowRate, 0, 1) + 1}" />
                </c:otherwise>
            </c:choose>
            <img src="/resources/front/img/bg/sub_09_m_icon_${iconNum-5}.png" width="61" height="64"> </div>
    </li>
</ul>
<div class="news">
    <div class="n_title"> ${eatingBusinessCommentList[0].memo2Title}</div>
    <div id="memo2" style="height:34px"> <span>${eatingBusinessCommentList[0].memo2}</span> </div>
</div>
<div class="krbi">
    <div class="title"> 외식업경기지수(KRBI) <span>전년 동분기 대비 매출의 긍가, 감소 사업체수를 고려하여 외식업에 대한 경기수준을 측정하는 지표임. 5~150사이의 값을 가지며 모든 사업체가 전년 동분기 대비 매출의 증감이 없는 경우는 지수가 100이고, 100미만 경우 사업체수가 증가 사업체수보다 많다는 의미임</span> </div>
    <div class="g_t">
        <div class="f_t"> 산출식 : KRBI = </div>
        <div class="c_t">
            <div class="top"> (증가x05-감소x0.5) </div>
            <div class="bottom"> 전체응답사업체수 </div>
        </div>
        <div class="s_t"> x100+100 </div>
    </div>
</div>
</div>
</section>
</div>
<!-- //contents -->
<!-- footer -->
<div id="footer" class="footer_09">
    <section>
        <div class="footer_logo"><a href="http://www.at.or.kr" target="_blank"><img src="/resources/front/img/common/footer_logo.png" width="150" height="22" alt="로고"></a></div>
        <div class="footer_etc"> 자세한 내용은 <a href="#" onclick="javascript:outLinkAction('${menuList[0].footerurl}','${menuList[0].id}');"><img style="margin-top:4px;" src="/resources/front/img/common/footer_logo_fis.png" width="183" height="34" alt="AT FIS 식품산업통꼐정보"></a>클릭하세요 </div>
    </section>
</div>
<!-- //footer -->
</div>
</div>

<content tag="local_script">
    <script type="text/javascript" src="/resources/front/js/jquery.dotdotdot.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#memo1").dotdotdot();
            $("#memo2").dotdotdot();
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