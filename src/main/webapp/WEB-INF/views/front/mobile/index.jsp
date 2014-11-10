<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="warp" class="mobile_warp">
<!-- header -->
<div id="header" class="mobile_header">
    <section>
        <div class="menu_btn">
            <a href="/mobile/" class="menu_home"><img src="/resources/front/img/mobile/menu_home.png" width="100%" alt="홈버튼"></a>
            <a class="menu_open"><img src="/resources/front/img/mobile/menu_btn_off.png" width="100%" alt="메뉴버튼"  onmouseover="divOpen();"></a> </div>
        <div class="logo_bg"> <a href="/mobile/"><img src="/resources/front/img/mobile/main_logo.jpg" width="100%" alt="aT 간편정보"></a> </div>
        <nav>
            <ul>
                <li> <a href="/mobile/1">수출정보</a> </li>
                <li> <a href="/mobile/2">유통정보</a> </li>
                <li> <a href="/mobile/3">식품정보</a> </li>
                <li> <a href="/mobile/4">aT사업</a> </li>
            </ul>
        </nav>
    </section>
</div>
<div id="aside" style="display:none;">
    <aside class="aside">
        <h2 class="blind">확장형 우측메뉴</h2>
        <ul class="menu_list">
            <li>
                <div class="b_title"> 수출정보 </div>
                <ul class="b_list">
                    <c:forEach items="${mainList}" var="mainList">
                        <%--c:if test="${mainList.autodataYn=='N'}"--%>
                            <c:if test="${mainList.type=='1'}">
                                <li>
                                    <a href="#" <c:if test="${mainList.outlinkYn!='Y'}"> onclick="javascript:linkAction('${mainList.url}');" </c:if> <c:if test="${mainList.outlinkYn=='Y'}"> onclick="javascript:outLinkAction('${mainList.url}','${mainList.menuId}');" </c:if> >
                                            ${mainList.menuname} <span class="b_img"><img src="/resources/front/img/mobile/arrow.png" width="100%" alt=""></span>
                                    </a>
                                </li>
                            </c:if>
                        <%--/c:if--%>
                    </c:forEach>
                </ul>
            </li>
            <li>
                <div class="b_title"> 유통정보 </div>
                <ul class="b_list">
                    <c:forEach items="${mainList}" var="mainList">
                        <c:if test="${mainList.type=='2'}">
                            <li>
                                <a href="#" <c:if test="${mainList.outlinkYn!='Y'}"> onclick="javascript:linkAction('${mainList.url}');" </c:if> <c:if test="${mainList.outlinkYn=='Y'}"> onclick="javascript:outLinkAction('${mainList.url}','${mainList.menuId}');" </c:if> >
                                        ${mainList.menuname} <span class="b_img"><img src="/resources/front/img/mobile/arrow.png" width="100%" alt=""></span>
                                </a>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </li>
            <li>
                <div class="b_title"> 식품정보 </div>
                <ul class="b_list">
                    <c:forEach items="${mainList}" var="mainList">
                        <c:if test="${mainList.type=='3'}">
                            <li>
                                <a href="#" <c:if test="${mainList.outlinkYn!='Y'}"> onclick="javascript:linkAction('${mainList.url}');" </c:if> <c:if test="${mainList.outlinkYn=='Y'}"> onclick="javascript:outLinkAction('${mainList.url}','${mainList.menuId}');" </c:if> >
                                        ${mainList.menuname} <span class="b_img"><img src="/resources/front/img/mobile/arrow.png" width="100%" alt=""></span>
                                </a>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </li>
            <li>
                <div class="b_title"> aT사업 </div>
                <ul class="b_list">
                    <c:forEach items="${mainList}" var="mainList">
                        <c:if test="${mainList.type=='4'}">
                            <li>
                                <a href="#" <c:if test="${mainList.outlinkYn!='Y'}"> onclick="javascript:linkAction('${mainList.url}');" </c:if> <c:if test="${mainList.outlinkYn=='Y'}"> onclick="javascript:outLinkAction('${mainList.url}','${mainList.menuId}');" </c:if> >
                                        ${mainList.menuname} <span class="b_img"><img src="/resources/front/img/mobile/arrow.png" width="100%" alt=""></span>
                                </a>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </li>
        </ul>
    </aside>
</div>
<!-- //header -->
<!-- contents -->
<div id="contents" class="mobile_contents">
<section>
<div class="group_01" onmouseout="divClose();" ontouched="divClose();">
    <c:forEach items="${mainList}" var="mainList">
        <div class="dev_menuList" id="dev_menu${mainList.menuId}">
            <c:if test="${mainList.autodataYn=='N'}">
                <!--img src='/resources/front/upload/${mainList.thumbnailName}' width='100%' alt='${mainList.menuname}'-->
                <a href="#" <c:if test="${mainList.outlinkYn!='Y'}"> onclick="javascript:linkAction('${mainList.url}');" </c:if> <c:if test="${mainList.outlinkYn=='Y'}"> onclick="javascript:outLinkAction('${mainList.url}','${mainList.menuId}');" </c:if> >
                    <img src='/resources/front/upload/${mainList.thumbnailName}' width='100%' alt='${mainList.menuname}'>
                </a>
            </c:if>
        </div>
    </c:forEach>
</div>
<!-- //aT 사업 -->
</section>
</div>
<!-- //contents -->
<!-- footer -->
<div id="footer" class="mobile_footer">
    <section>
        <div class="footer_link">
            <span class="fl_01"> <a href="http://www.at.or.kr/">한국농수산식품유통공사 홈</a> </span>
            <span class="bar"> | </span>
            <span class="fl_02"> <a href="http://www.at.or.kr/html/member/at_acount_2.html">개인정보처리 방침</a> </span>
            <span class="bar"> | </span>
            <span class="fl_03"> <a href="http://www.at.or.kr/contents/apko316110/view.action">찾아오시는 길</a> </span>
        </div>
        <div class="footer_btn">
            <span><a href="/mobile/goPC" target="_blank"><img src="/resources/front/img/mobile/btn_footer_pc.jpg" width="100%" alt="PC버전으로"></a></span>
            <span><a href="#"><img src="/resources/front/img/mobile/btn_footer_top.jpg" width="100%" alt="TOP으로"></a></span>
        </div>
        <div class="address"> address (137-787) 서울특별시 서초구 강남대로 27 aT센터<br>
            TEL <a href="tel:02-6300-1467">02 6300 1467</a> </div>
        <div class="copyright"> COPYRIGHT&copy;2014 by Korea Agro-Fisheries &amp; Food Trade Corporation ALL RIGHTS RESERVED. </div>
    </section>
</div>
<!-- //footer -->
</div>

<content tag="local_script">
    <script type="text/javascript" src="/resources/front/js/jquery.number.min.js"></script>
    <script type="text/javascript" src="/resources/front/js/slide_list.js"></script>
    <script type="text/javascript" src="/resources/front/js/common.js"></script>
    <script src="/resources/front/js/menuHtml.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $(".dev_menuList").each(function(){
                if( $.trim($(this).html()) == "") {
                    var htmlAreaIndex = $(".dev_menuList").index(this);
                    var menuid = menuIdHtml(htmlAreaIndex);
                    /*$(this).html(menuHtml[menuid]);*/
                    var htmlBody = menuHtml[menuid];
                    var htmlBody2 = "";
                    $.get("/getMainData/" + menuid, function (data, status) {
                        if( data.length > 0 ) {
                            htmlBody2 = menuHtmlData(data, menuid, htmlBody);
                            $(".dev_menuList:eq(" + htmlAreaIndex + ")").html(htmlBody2);
                        }else{
                            $(".dev_menuList:eq(" + htmlAreaIndex + ")").html(htmlBody);
                        }
                    });
                }
            });
        });

        function menuIdHtml(type) {
            return $(".dev_menuList:eq("+type+")").attr("id").replace("dev_menu", "");
        }

        function divClose() {
            $(".aside").hide();
        }

        function divOpen() {
            $(".aside").show();
        }

        function linkAction(linktype){

            /********* 통계정보 입력 Start **********/
                //메뉴아이디 ==> 웹메인:91, 모바일메인:92, 나머지는 메뉴아이디:1~16
                //화면구분  ==> 메인:A,모바일메인:B,생생정보:C,원본:D
            $.get("/insertStatistics/" + linktype+"/"+"C", {time : new Date().getTime() }, function (data, status) {
                if(data>0){

                }
            });

            location.href = linktype;

            /********* 통계정보 입력 End **********/
        }

        function outLinkAction(linktype,menuId){

            /********* 통계정보 입력 Start **********/
                //메뉴아이디 ==> 웹메인:91, 모바일메인:92, 나머지는 메뉴아이디:1~16
                //화면구분  ==> 메인:A,모바일메인:B,생생정보:C,원본:D
            $.get("/insertStatistics/" + menuId+"/"+"D", {time : new Date().getTime() }, function (data, status) {
                if(data>0){
                    window.open(linktype,"","");
                }
            });
            /********* 통계정보 입력 End **********/
        }

    </script>
</content>