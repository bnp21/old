<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="contents">
<div id="warp" class="warp10">
    <!-- header -->
    <div class="header">
        <section>
            <div class="header_box10">
                <h1 class="h_title">일일 곡물시황</h1>
                <div class="h_day">
                    <span class="today">${grain.referenceDate}</span>
                    기준 </div>
            </div>
        </section>
    </div>
    <!-- //header -->
    <!-- contents -->
    <div class="contents">
        <section>
            <div class="contents_box10">
                <div class="pad_w">
                    <ul class="today_p">
                        <c:set var="listCnt" value="1" />
                        <c:forEach items="${grainList}" var="list">
                        <li>
                            <div class="t_p_i t_p_i${listCnt}">
                                <div class="img"></div>
                                <h2>${list.itemName}</h2>
                            </div>
                            <div class="t_p_t">
                                <div class="top"> ${list.netChangePrice} </div>
                                <div class="middle">
                                    <div class="price"> ${list.referenceDatePrice}
                                        <span class="pr_img">
                                        <c:choose>
                                            <c:when test="${list.referenceDateFluctuation == '증가'}">
                                                <img src="/resources/front/img/etc/up_t_arrow_g.png" width="15" height="13" alt="상승">
                                            </c:when>
                                            <c:when test="${list.referenceDateFluctuation == '감소'}">
                                                <img src="/resources/front/img/etc/down_t_arrow_g.png" width="15" height="13" alt="하락">
                                            </c:when>
                                            <c:when test="${list.referenceDateFluctuation == '변동없음'}">
                                                <img src="/resources/front/img/etc/center_T_arrow_g.png" width="15" height="13" alt="동일">
                                            </c:when>
                                        </c:choose>
                                        </span>
                                    </div>
                                </div>
                                <div class="bottom">
                                    <div class="price"> ${list.averagePrice}
                                        <span class="pr_img">
                                            <c:choose>
                                                <c:when test="${list.averageFluctuation == '증가'}">
                                                    <img src="/resources/front/img/etc/up_t_arrow_r.png" width="15" height="13" alt="상승">
                                                </c:when>
                                                <c:when test="${list.averageFluctuation == '감소'}">
                                                    <img src="/resources/front/img/etc/down_t_arrow_r.png" width="15" height="13" alt="하락">
                                                </c:when>
                                                <c:when test="${list.averageFluctuation == '변동없음'}">
                                                    <img src="/resources/front/img/etc/center_T_arrow_g.png" width="15" height="13" alt="동일">
                                                </c:when>
                                            </c:choose>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <c:set var="listCnt" value="${listCnt+1}" />
                        </c:forEach>
                    </ul>
                    <div class="pad_text">
                        <span class="yellow">기준일</span>
                        <span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                        <span class="green">전일대비</span>
                        <span class="bar">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
                        <span class="red">전년 동월평균대비</span>
                        <span class="gray">(단위:US$/톤,%)</span>
                    </div>
                    <c:if test="${grainCommendView.comments != null}">
                    <div class="pad_t">
                        ${grainCommendView.comments}
                    </div>
                    </c:if>
                </div>
            </div>
        </section>
    </div>
    <!-- //contents -->
    <!-- footer -->
    <div id="footer">
        <section>
            <div class="footer_logo"><a href="http://www.at.or.kr" target="_blank"><img src="/resources/front/img/common/footer_logo.png" width="150" height="22" alt="로고"></a></div>
            <div class="footer_etc"><a href="#" onclick="javascript:outLinkAction('${menuList[0].footerurl}','${menuList[0].id}');">자세한 내용은 <img style="margin-top:4px;" src="/resources/front/img/common/footer_logo_fis.png" width="183" height="34" alt="AT FIS 로고">클릭하세요</a></div>
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

            if( $(".pad_t").length <= 0 ){
                $(".pad_w").css("margin-top","80px");
            }
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