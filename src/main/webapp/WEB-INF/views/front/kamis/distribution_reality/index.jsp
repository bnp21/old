<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="contents">
<div id="warp" class="warp16">
<!-- header -->
<div class="header">
    <section>
        <div class="header_box16">
            <h1 class="h_title">${distributionRealityList[0].title}</h1>
        </div>
    </section>
</div>
<!-- //header -->
<!-- contents -->
<div class="contents">
<section>
<div class="contents_box16">
<div class="dis">
<ul>

    <li class="clear">
        <div class="dis_t"> 조사품목 현황 </div>
        <ul>
            <c:set var="listCnt" value="1" />
            <c:forEach items="${distributionRealityItem}" var="itemList">
                <li <c:if test="${listCnt==1 || listCnt%5==1}">class="first"</c:if>>
                    <div class="dis_i_b_bg">
                        <img src="/resources/front/img/bg/sub_16_list_bg.png" alt="">
                    </div>
                    <div class="dis_i_b"> <img src="/resources/front/upload/${itemList.fileImg}" width="112" height="112" alt="${itemList.title}"> </div>
                    <div class="dis_i_t"> ${itemList.title} </div>
                </li>
                <c:set var="listCnt" value="${listCnt+1}" />
            </c:forEach>
        </ul>
    </li>

    <li class="clear">
        <div class="dis_t1"> 유통 비용율 </div>
        <div class="dis_pay">
            <ul>
                <li>
                    <div class="pay_per"> ${distributionRealityList[4].distribution}
                        <span>%</span>
                    </div>
                    <div class="pay_year"> ${distributionRealityList[4].year} </div>
                </li>
                <li>
                    <div class="pay_per"> ${distributionRealityList[3].distribution}
                        <span>%</span>
                    </div>
                    <div class="pay_year"> ${distributionRealityList[3].year} </div>
                </li>
                <li>
                    <div class="pay_per"> ${distributionRealityList[2].distribution}
                        <span>%</span>
                    </div>
                    <div class="pay_year"> ${distributionRealityList[2].year} </div>
                </li>
                <li>
                    <div class="pay_per"> ${distributionRealityList[1].distribution}
                        <span>%</span>
                    </div>
                    <div class="pay_year"> ${distributionRealityList[1].year} </div>
                </li>
                <li class="big">
                    <div class="pay_per"> ${distributionRealityList[0].distribution}
                        <span>%</span>
                    </div>
                    <div class="pay_year">
											<span>
											${distributionRealityList[0].year}
											<span>
                    </div>
                </li>
            </ul>
        </div>
    </li>
</ul>
<div class="white_box">
    <div class="red">
        <div class="dis_t"> 비용별
            <span>* 단위 : %</span>
        </div>
        <ul>
            <li class="year">
                <span class="year">${distributionRealityList[0].year}</span>
            </li>
            <li class="circle circle0_r">
                <div class="w_title"> 직접비 </div>
                <div class="w_text"> ${distributionRealityList[0].costDirectly} </div>
            </li>
            <li class="circle circle1_r">
                <div class="w_title"> 간접비 </div>
                <div class="w_text"> ${distributionRealityList[0].costIndirect} </div>
            </li>
            <li class="circle circle2_r">
                <div class="w_title"> 이윤 </div>
                <div class="w_text"> ${distributionRealityList[0].costProfit} </div>
            </li>
        </ul>
        <div class="white_b_t">
            <table>
                <colgroup>
                    <col width="12%;">
                    <col span="3" width="auto">
                </colgroup>
                <thead>
                </thead>
                <tbody>
                <tr>
                    <th>${distributionRealityList[1].year}</th>
                    <td>${distributionRealityList[1].costDirectly}</td>
                    <td>${distributionRealityList[1].costIndirect}</td>
                    <td>${distributionRealityList[1].costProfit}</td>
                </tr>
                <tr>
                    <th>${distributionRealityList[2].year}</th>
                    <td>${distributionRealityList[2].costDirectly}</td>
                    <td>${distributionRealityList[2].costIndirect}</td>
                    <td>${distributionRealityList[2].costProfit}</td>
                </tr>
                <tr>
                    <th>${distributionRealityList[3].year}</th>
                    <td>${distributionRealityList[3].costDirectly}</td>
                    <td>${distributionRealityList[3].costIndirect}</td>
                    <td>${distributionRealityList[3].costProfit}</td>
                </tr>
                <tr class="last">
                    <th>${distributionRealityList[4].year}</th>
                    <td>${distributionRealityList[4].costDirectly}</td>
                    <td>${distributionRealityList[4].costIndirect}</td>
                    <td>${distributionRealityList[4].costProfit}</td>
                </tr>
                </tbody>
            </table>
            <div class="b_t_text">
                <div class="direct">
                    <span class="red">직접비 :</span>
                    <span class="gray">포장비, 하역비, 운송비, 상장수수료, 감모비 등</span>
                </div>
                <div class="direct">
                    <span class="red">간접비 :</span>
                    <span class="gray">임대료, 인건비, 공과금, 감가상각비 등</span>
                </div>
                <div class="direct">
                    <span class="red">이윤 :</span>
                    <span class="gray">상인 이윤</span>
                </div>
            </div>
        </div>
    </div>
    <div class="blue">
        <div class="arrow">
            <img src="/resources/front/img/bg/sub_16_arrow_bg.png" width="341" height="106" alt="">
        </div>
        <div class="dis_t1"> 단계별
            <span>* 단위 : %</span>
        </div>
        <ul>
            <li class="year">
                <span class="year">${distributionRealityList[0].year}</span>
            </li>
            <li class="circle1 circle0_b">
                <div class="w_title"> 출하단계 </div>
                <div class="w_text"> ${distributionRealityList[0].stageShipment} </div>
            </li>
            <li class="circle1 circle1_b">
                <div class="w_title"> 도매단계 </div>
                <div class="w_text"> ${distributionRealityList[0].stageWholesale} </div>
            </li>
            <li class="circle1 circle2_b">
                <div class="w_title"> 소매단계 </div>
                <div class="w_text"> ${distributionRealityList[0].stageRetail} </div>
            </li>
        </ul>
        <div class="white_b_t">
            <table>
                <colgroup>
                    <col width="12%;">
                    <col span="3" width="auto">
                </colgroup>
                <thead>
                </thead>
                <tbody>
                <tr>
                    <th>${distributionRealityList[1].year}</th>
                    <td>${distributionRealityList[1].stageShipment}</td>
                    <td>${distributionRealityList[1].stageWholesale}</td>
                    <td>${distributionRealityList[1].stageRetail}</td>
                </tr>
                <tr>
                    <th>${distributionRealityList[2].year}</th>
                    <td>${distributionRealityList[2].stageShipment}</td>
                    <td>${distributionRealityList[2].stageWholesale}</td>
                    <td>${distributionRealityList[2].stageRetail}</td>
                </tr>
                <tr>
                    <th>${distributionRealityList[3].year}</th>
                    <td>${distributionRealityList[3].stageShipment}</td>
                    <td>${distributionRealityList[3].stageWholesale}</td>
                    <td>${distributionRealityList[3].stageRetail}</td>
                </tr>
                <tr class="last">
                    <th>${distributionRealityList[4].year}</th>
                    <td>${distributionRealityList[4].stageShipment}</td>
                    <td>${distributionRealityList[4].stageWholesale}</td>
                    <td>${distributionRealityList[4].stageRetail}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</div>
</section>
</div>
<!-- //contents -->
<!-- footer -->
<div id="footer" class="footer_16">
    <section>
        <div class="footer_logo"><a href="http://www.at.or.kr" target="_blank"><img src="/resources/front/img/common/footer_logo.png" width="150" height="22" alt="로고"></a></div>
        <div class="footer_etc"> 자세한 내용은 <a href="#" onclick="javascript:outLinkAction('${menuList[0].footerurl}','${menuList[0].id}');"><img style="margin-top:4px;" src="/resources/front/img/common/footer_logo_kamis1.png" width="87" height="39" alt="AT taki 로고"></a>클릭하세요 </div>
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