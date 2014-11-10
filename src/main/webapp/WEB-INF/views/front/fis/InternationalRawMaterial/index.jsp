<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="contents">
<div id="warp" class="warp06">
    <!-- header -->
    <div class="header">
        <section>
            <div class="header_box06">
                <h1 class="h_title">주요 원자재<br>주간가격동향</h1>
                <div class="h_day">
                    <span class="today">${irm.referenceDateFrom} ~${irm.referenceDateTo}</span>
                </div>
                <div class="h_summary">
                    평균가 :&nbsp;
					<span class="white hs_box">
						<span class="w_box"></span> 금주
					</span>
					<span class="green hs_box">
						<span class="g_box"></span> 전주
					</span>
					<span class="orange hs_box">
						<span class="o_box"></span> 전년
					</span>
                    (단위: US$/ton)
                </div>
            </div>
        </section>
    </div>
    <!-- //header -->
    <!-- contents -->
    <div class="contents">
        <section>
            <div class="contents_box06">
                <ul>
                    <c:set var="listCnt" value="1" />
                    <c:forEach items="${irmList}" var="list">
                    <li class="list_0${listCnt}">
                        <div class="cb_t">
                            <div class="cb_t_a">
                                <img src="/resources/front/img/text/sub_06_0${listCnt}.png" alt="${list.itemName}">
                            </div>
                        </div>
                        <div class="cb_b">
                            <ul class="num">
                                <li class="w_t"><fmt:formatNumber value="${list.weeklyAveragePrice}" pattern="#,##0.#"></fmt:formatNumber></li>
                                <li class="g_t"><fmt:formatNumber value="${list.lastWeeklyAveragePrice}" pattern="#,##0.#"></fmt:formatNumber></li>
                                <li class="o_t"><fmt:formatNumber value="${list.lastYearlyAveragePrice}" pattern="#,##0.#"></fmt:formatNumber></li>
                            </ul>
                        </div>
                    </li>
                    <c:set var="listCnt" value="${listCnt+1}" />
                    </c:forEach>
                </ul>
                <div class="con_summary">
                    ※ 자료 출처 : FIS(식품산업통계정보)
                </div>
            </div>
        </section>
    </div>
    <!-- //contents -->
    <!-- footer -->
    <div id="footer" class="footer_06">
        <section>
            <div class="footer_logo"><a href="http://www.at.or.kr" target="_blank"><img src="/resources/front/img/common/footer_logo.png" width="150" height="22" alt="로고"></a></div>
            <div class="footer_etc"><a href="#" onclick="javascript:outLinkAction('${menuList[0].footerurl}','${menuList[0].id}');">자세한 내용은 <img style="margin-top:5px;" src="/resources/front/img/common/footer_logo_fis.png" width="183" height="34" alt="AT FIS 로고">클릭하세요 </a></div>
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