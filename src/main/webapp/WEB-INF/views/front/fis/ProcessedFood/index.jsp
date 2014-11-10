<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="contents">
<div id="warp" class="warp05">
<!-- header -->
<div class="header" class="header05">
    <section>
        <div class="header_box05">
            <h1 class="h_title"> 주요 가공식품 주간 가격동향 </h1>
            <div class="h_day">
                <span class="today">${processedFood.referenceDateFrom} ~ ${processedFood.referenceDateTo} 기준</span></div>
            <div class="h_explain">
                <ul>
                    <li><div class="tag_t tag_grf"> * 전월동기대비 </div></li>
                    <li class="h_tag_r">
                        <div class="tag"><img src="/resources/front/img/bg/sub_05_arrow_u_s.png" width="16" height="19" alt="상승"></div>
                        <div class="tag_t tag_rf"> 상승 </div>
                    </li>
                    <li class="h_tag_b">
                        <div class="tag"><img src="/resources/front/img/bg/sub_05_arrow_d_s.png" width="16" height="19" alt="하락"></div>
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
    <div class="contents_box05">
        <ul>
            <c:set var="listCnt" value="1" />
            <c:set var="itemCnt" value="1" />
            <c:set var="listBeforeCode" value="" />
            <c:set var="listCode" value="" />
            <c:forEach items="${processedFoodsList}" var="list">
            <c:set var="listCode" value="${list.itemCode}" />
            <c:if test="${listCode != listBeforeCode}">
            <li class="li_0${listCnt}">
                <div class="ta_top">
                    <div class="ap_img">
                        <img src="/resources/front/img/price/sub_05_list_${list.itemNum}.png" width="255" height="133" alt="${list.itemName}">
                    </div>
                    <div class="menu <c:if test="${listCnt > 3}">menu${listCnt}</c:if>">
                        <span>${list.itemName}</span><br>(${list.unit})
                    </div>
                </div>
                <div class="ta_bottom <c:if test="${listCnt > 3}">ta_bottom1</c:if>">
            </c:if>
                    <div class="<c:choose><c:when test="${itemCnt%2 == 1}">left</c:when><c:when test="${itemCnt%2 == 0}">right</c:when></c:choose><c:if test="${itemCnt%2 == 1 && listCnt > 3 && listCnt != 6 }"> left1</c:if><c:if test="${itemCnt%2 == 1 && listCnt == 6 }"> left6</c:if><c:if test="${itemCnt%2 == 0 && listCnt == 6 }"> right6</c:if>">
                        <div class="title <c:if test="${listCnt > 3}">title title1</c:if>">
                            <span>${list.productName}</span>
                        </div>
                        <div class="price">
                            <fmt:formatNumber value="${list.weeklyPrice}" type="number"></fmt:formatNumber> 원
                        </div>
                        <div class="<c:choose><c:when test="${list.weeklyFluctuation == '상승'}">up_p</c:when><c:when test="${list.weeklyFluctuation == '하락'}">down_p</c:when><c:when test="${list.weeklyFluctuation == '변동없음'}">equal_p</c:when></c:choose>">
                            <span>${list.lastMonthPrice}%</span>
                        </div>
                    </div>
            <c:if test="${listCode == listBeforeCode}">
                </div>
            </li>
            <c:set var="listCnt" value="${listCnt+1}" />
            </c:if>
            <c:set var="itemCnt" value="${itemCnt+1}" />
            <c:set var="listBeforeCode" value="${list.itemCode}" />
            </c:forEach>
        </ul>
    </div>
</section>
</div>
<!-- //contents -->
<!-- footer -->
<div id="footer" class="footer_05">
    <section>
        <div class="footer_logo"><a href="http://www.at.or.kr" target="_blank"><img src="/resources/front/img/common/footer_logo.png" width="150" height="22" alt="로고"></a></div>
        <div class="footer_etc"> 자세한 내용은 <a href="#" onclick="javascript:outLinkAction('${menuList[0].footerurl}','${menuList[0].id}');"><img style="margin-top:4px;" src="/resources/front/img/common/footer_logo_fis.png" width="183" height="34" alt="AT FIS 로고"></a>클릭하세요 </div>
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