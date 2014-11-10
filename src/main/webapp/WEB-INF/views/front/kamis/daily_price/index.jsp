<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="contents">
    <div class="warp">
<!-- header -->
<div class="header header02">
    <section>
        <div class="header_box02">
            <h1 class="h_title"> 농수축산물<br><!--농축수산물을 농수축산물로 수정 10.23일 -->
                소매가격 일일동향 </h1>
            <div class="h_day">
                <span class="today"><fmt:parseDate value="${dailyPriceList[0].pkDate}" pattern="yyyyMMdd" var="nowdate" /><fmt:formatDate value="${nowdate}" pattern="yyyy-MM-dd"/></span>
                기준 </div>
            <div class="h_explain">
                <ul>
                    <li><div class="tag_t tag_grf"> 전일대비 </div></li>
                    <li class="h_tag_r">
                        <div class="tag"> <img src="/resources/front/img/etc/tag_01.png" width="25" height="40" alt="상승 태그"> </div>
                        <div class="tag_t tag_rf"> 상승 </div>
                    </li>
                    <li class="h_tag_g">
                        <div class="tag"> <img src="/resources/front/img/etc/tag_02.png" width="25" height="40" alt="보합 태그"> </div>
                        <div class="tag_t tag_gf"> 보합 </div>
                    </li>
                    <li class="h_tag_b">
                        <div class="tag"> <img src="/resources/front/img/etc/tag_03.png" width="25" height="40" alt="하락 태그"> </div>
                        <div class="tag_t tag_bf"> 하락 </div>
                    </li>
                </ul>
            </div>
        </div>
    </section>
</div>
<!-- //header -->
<!-- contents -->
<div class="contents">
    <section>
        <div class="contents_box02">
            <ul class="retail_p">
                <c:forEach items="${dailyPriceList}" var="list">
                <li>
                    <div class="r_p_img_bg">
                        <img src="/resources/front/img/bg/sub_02_circle_bg.png" alt="">
                    </div>
                    <div class="r_p_img"> <img src="/resources/front/img/price/sub_02_p_${list.itemCode}.jpg" width="149" height="149" alt="${list.itemName}"> </div>
                    <c:set value="${list.avgPrice}" var="avgPrice"></c:set><fmt:parseNumber value="${avgPrice}" var="avgPriceNum"></fmt:parseNumber>
                    <c:set value="${list.prevAvgPrice}" var="prevAvgPrice"></c:set><fmt:parseNumber value="${prevAvgPrice}" var="prevAvgPriceNum"></fmt:parseNumber>
                    <c:set value="${avgPriceNum-prevAvgPriceNum}" var="flucPrice"></c:set><fmt:parseNumber value="${flucPrice}" var="flucPriceNum"></fmt:parseNumber>
                    <div class="r_p_text <c:choose><c:when test="${flucPriceNum > 0}">tag_r</c:when><c:when test="${flucPriceNum < 0}">tag_b</c:when><c:otherwise>tag_g</c:otherwise></c:choose>">
                        <div class="r_p_t_01">
                            <h2>${list.itemName}</h2>
                            <span>(${list.unit})</span>
                        </div>
                        <div class="r_p_t_02 <c:choose><c:when test="${flucPriceNum > 0}">tag_rf</c:when><c:when test="${flucPriceNum < 0}">tag_bf</c:when><c:otherwise>tag_gf</c:otherwise></c:choose>"> 오늘 : <fmt:formatNumber value="${list.avgPrice}" type="number"></fmt:formatNumber>원 </div>
                        <div class="r_p_t_03">
                            <div class="left">
                                <c:choose>
                                    <c:when test="${flucPriceNum < 0}">
                                        등락 : ${(flucPriceNum)*-1}원
                                    </c:when>
                                    <c:otherwise>
                                        등락 : ${flucPriceNum}원
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="right">
                                <c:choose>
                                    <c:when test="${flucPriceNum > 0}">
                                        <img src="/resources/front/img/etc/up_arrow_r.png" width="19" height="21" alt="상승">
                                    </c:when>
                                    <c:when test="${flucPriceNum < 0}">
                                        <img src="/resources/front/img/etc/down_arrow_b.png" width="19" height="21" alt="하락">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/resources/front/img/etc/center_arrow_r.png" width="19" height="21" alt="보합">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </li>
                </c:forEach>
            </ul>
        </div>
    </section>
</div>
<!-- //contents -->
<!-- footer -->
<div id="footer">
    <section>
        <div class="footer_logo"><a href="http://www.at.or.kr" target="_blank"><img src="/resources/front/img/common/footer_logo.png" width="150" height="22" alt="로고"></a></div>
        <div class="footer_etc"> 자세한 내용은 <a href="#" onclick="javascript:outLinkAction('${menuList[0].footerurl}','${menuList[0].id}');"><img style="margin-top:4px;" src="/resources/front/img/common/footer_logo_kamis.png" width="86" height="39" alt="AT KAMIS 로고"></a>클릭하세요 </div>
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