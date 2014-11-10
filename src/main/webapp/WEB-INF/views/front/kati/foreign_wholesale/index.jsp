<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="contents">
<div id="warp" class="warp13">
    <!-- header -->
    <div class="header">
        <section>
            <div class="header_box13">
                <h1 class="h_title">해외 농산물 도매 가격</h1>
                <div class="h_title_s">미국시장 & 일본시장</div>
            </div>
        </section>
    </div>
    <!-- //header -->
    <!-- contents -->
    <div class="contents">
        <section>
            <div class="contents_box13">
                <div class="table_title">
                    <div class="t_flag_a">
                        미국 (뉴욕시장)
                    </div>
                    <div class="table_summary">
                        ※ <fmt:parseDate value="${foreignWholesaleUSList[0].saleDate}" pattern="yyyyMMdd" var="saleDateUS"/>
                        <fmt:formatDate value="${saleDateUS}" pattern="yyyy년 MM월 dd일"/>
                        자 조사가격 <span>|</span> 단위 : US $
                    </div>
                </div>
                <div class="table_market">
                    <table>
                        <colgroup>
                            <col width="22.5%">
                            <col width="auto">
                            <col width="22.2%">
                            <col width="17.3%">
                            <col width="17%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th><span>품목별</span></th>
                            <th><span>산지</span></th>
                            <th><span>단위</span></th>
                            <th><span>최고(달러)</span></th>
                            <th>최저(달러)</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="tempUSItemName" value=""></c:set>
                        <c:forEach items="${foreignWholesaleUSList}" var="list">
                        <c:if test="${tempUSItemName != list.itemName}">
                        <tr>
                            <td class="doble"><img src="/resources/front/img/price/sub_13_list1_${list.itemCode}.png" width="27" height="27" alt="${list.itemName}">${list.itemName}</td>
                            <td>${list.placeName}</td>
                            <td>${list.unit}</td>
                            <td class="red">${list.firstItem}</td>
                            <td class="blue">${list.poorItem}</td>
                        </tr>
                        </c:if>
                        <c:set var="tempUSItemName" value="${list.itemName}"></c:set>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="table_title1">
                    <div class="t_flag_a">
                        일본 (오다시장)
                    </div>
                    <div class="table_summary">
                        ※ <fmt:parseDate value="${foreignWholesaleJPList[0].saleDate}" pattern="yyyyMMdd" var="saleDateJP"/>
                        <fmt:formatDate value="${saleDateJP}" pattern="yyyy년 MM월 dd일"/>자 조사가격 <span>|</span> 단위 : ￥
                    </div>
                </div>
                <div class="table_market1">
                <table>
                <colgroup>
                    <col width="22.5%">
                    <col width="auto">
                    <col width="14.8%">
                    <col width="14.5%">
                    <col width="15.2%">
                    <col width="14.5%">
                </colgroup>
                <thead>
                <tr>
                    <th><span>품목별</span></th>
                    <th><span>산지</span></th>
                    <th><span>단위(KG)</span></th>
                    <th><span>상품(엔)</span></th>
                    <th><span>중품(엔)</span></th>
                    <th>하품(엔)</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="tempJPItemName" value=""></c:set>
                <c:forEach items="${foreignWholesaleJPList}" var="list">
                <c:if test="${pJPItemName != list.itemName}">
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_${list.itemCode}.png" width="27" height="27" alt="${list.itemName}">${list.itemName}</td>
                    <td>${list.placeName}</td>
                    <td>${list.unit}</td>
                    <td class="red">${list.firstItem}</td>
                    <td class="green">${list.mediumItem}</td>
                    <td class="blue">${list.poorItem}</td>
                </tr>
                </c:if>
                <c:set var="tempJPItemName" value="${list.itemName}"></c:set>
                </c:forEach>
                <%--<tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_02.png" width="27" height="27" alt="당근">당근</td>
                    <td>지바</td>
                    <td>10KG</td>
                    <td class="red">1,566.00</td>
                    <td class="green">1,404.00</td>
                    <td class="blue">1,080.00</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_03.png" width="27" height="27" alt="배추">배추</td>
                    <td>나가노</td>
                    <td>15KG</td>
                    <td class="red">1,944.00</td>
                    <td class="green">1,404.00</td>
                    <td class="blue">864</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_04.png" width="27" height="27" alt="양배추">양배추</td>
                    <td>이바라키</td>
                    <td>10KG</td>
                    <td class="red">918</td>
                    <td class="green">540</td>
                    <td class="blue">432</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_05.png" width="27" height="27" alt="시금치">시금치</td>
                    <td>이와테</td>
                    <td>0.17KG</td>
                    <td class="red">130</td>
                    <td class="green">97</td>
                    <td class="blue">86</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_06.png" width="27" height="27" alt="파">파</td>
                    <td>이바라키</td>
                    <td>5KG</td>
                    <td class="red">2,376.00</td>
                    <td class="green">1,944.00</td>
                    <td class="blue">1,728.00</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_07.png" width="27" height="27" alt="샐러리">샐러리</td>
                    <td>홋카이도</td>
                    <td>10KG</td>
                    <td class="red">0</td>
                    <td class="green">3,564.00</td>
                    <td class="blue">0</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_08.png" width="27" height="27" alt="양상추">양상추</td>
                    <td>군마</td>
                    <td>8KG</td>
                    <td class="red">1,296.00</td>
                    <td class="green">1,296.00</td>
                    <td class="blue">1,080.00</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_09.png" width="27" height="27" alt="오이">오이</td>
                    <td>아키타</td>
                    <td>5KG</td>
                    <td class="red">2,160.00</td>
                    <td class="green">1,296.00</td>
                    <td class="blue">1,296.00</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_10.png" width="27" height="27" alt="가지">가지</td>
                    <td>이바라키</td>
                    <td>4KG</td>
                    <td class="red">1,512.00</td>
                    <td class="green">1,080.00</td>
                    <td class="blue">972</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_11.png" width="27" height="27" alt="토마토">토마토</td>
                    <td>홋카이도</td>
                    <td>4KG</td>
                    <td class="red">1,728.00</td>
                    <td class="green">1,620.00</td>
                    <td class="blue">1,512.00</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_12.png" width="27" height="27" alt="미니토마토">미니토마토</td>
                    <td>아이치</td>
                    <td>0.2KG</td>
                    <td class="red">130</td>
                    <td class="green">108</td>
                    <td class="blue">97</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_13.png" width="27" height="27" alt="피망">피망</td>
                    <td>이와테</td>
                    <td>0.15KG</td>
                    <td class="red">76</td>
                    <td class="green">65</td>
                    <td class="blue">65</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_14.png" width="27" height="27" alt="표고버섯">표고버섯</td>
                    <td>이와테</td>
                    <td>0.1KG</td>
                    <td class="red">0</td>
                    <td class="green">140</td>
                    <td class="blue">0</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_15.png" width="27" height="27" alt="양파">양파</td>
                    <td>효고</td>
                    <td>20KG</td>
                    <td class="red">2,916.00</td>
                    <td class="green">0</td>
                    <td class="blue">2,700.00</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_16.png" width="27" height="27" alt="마늘">마늘</td>
                    <td>아오모리</td>
                    <td>KG</td>
                    <td class="red">1,620.00</td>
                    <td class="green">1,296.00</td>
                    <td class="blue">1,188.00</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_17.png" width="27" height="27" alt="생강">생강</td>
                    <td>고치</td>
                    <td>4KG</td>
                    <td class="red">2,592.00</td>
                    <td class="green">2,160.00</td>
                    <td class="blue">1,944.00</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_18.png" width="27" height="27" alt="고구마">고구마</td>
                    <td>이바라키</td>
                    <td>5KG</td>
                    <td class="red">1,404.00</td>
                    <td class="green">1,080.00</td>
                    <td class="blue">1,080.00</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_19.png" width="27" height="27" alt="감자">감자</td>
                    <td>시즈오카</td>
                    <td>10KG</td>
                    <td class="red">2,160.00</td>
                    <td class="green">1,836.00</td>
                    <td class="blue">1,620.00</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_20.png" width="27" height="27" alt="사과">사과</td>
                    <td>아오모리</td>
                    <td>10KG</td>
                    <td class="red">0</td>
                    <td class="green">4,536.00</td>
                    <td class="blue">0</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_21.png" width="27" height="27" alt="멜론">멜론</td>
                    <td>지바</td>
                    <td>8KG</td>
                    <td class="red">0</td>
                    <td class="green">5,832.00</td>
                    <td class="blue">0</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_22.png" width="27" height="27" alt="포도">포도</td>
                    <td>도치기</td>
                    <td>0.3KG</td>
                    <td class="red">540</td>
                    <td class="green">0</td>
                    <td class="blue">524</td>
                </tr>
                <tr>
                    <td class="doble"><img src="/resources/front/img/price/sub_13_list2_23.png" width="27" height="27" alt="밀감">밀감</td>
                    <td>사가</td>
                    <td>5KG</td>
                    <td class="red">0</td>
                    <td class="green">5,184.00</td>
                    <td class="blue">0</td>
                </tr>--%>
                </tbody>
                </table>
                </div>
            </div>
        </section>
    </div>
    <!-- //contents -->
    <!-- footer -->
    <div id="footer" class="footer_13">
        <section>
            <div class="footer_logo"><a href="http://www.at.or.kr" target="_blank"><img src="/resources/front/img/common/footer_logo.png" width="150" height="22" alt="로고"></a></div>
            <div class="footer_etc"> 자세한 내용은 <a href="#" onclick="javascript:outLinkAction('${menuList[0].footerurl}','${menuList[0].id}');"><img style="margin-top:4px;" src="/resources/front/img/common/footer_logo_kati1.png" width="82" height="36" alt="AT taki 로고"></a>클릭하세요 </div>
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