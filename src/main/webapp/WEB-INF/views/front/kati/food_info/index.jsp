<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="contents">
    <div class="warp warp18">
        <!-- header -->
        <div class="header">
            <section>
                <div class="header_box18">
                    <h1 class="h_title">Global Food Info</h1>
                    <ul class="tab_menu">
                        <li class="gf_select">
                            <a href="#tab_01">${foodInfo.tab1Title}</a>
                        </li>
                        <li>
                            <a href="#tab_02">${foodInfo.tab2Title}</a>
                        </li>
                        <li>
                            <a href="#tab_03">${foodInfo.tab3Title}</a>
                        </li>
                    </ul>
                </div>
            </section>
        </div>
        <!-- //header -->
        <!-- contents -->
        <div class="contents" style="line-height:0;">
            <section>
                <div class="contents_box18">
                    <div id="tab_01" class="tab_content"><img src="/resources/front/upload/food-info/${foodInfo.tab1Img}" alt=""></div>
                    <div id="tab_02" class="tab_content" style="display:none"><img src="/resources/front/upload/food-info/${foodInfo.tab2Img}" alt=""></div>
                    <div id="tab_03" class="tab_content" style="display:none"><img src="/resources/front/upload/food-info/${foodInfo.tab3Img}" alt=""></div>
                </div>
            </section>
        </div>
        <!-- //contents -->
        <!-- footer -->
        <div id="footer" class="footer_18">
            <section>
                <div class="footer_logo"><img src="/resources/front/img/common/footer_logo.png" width="150" height="22" alt="로고"></div>
                <div class="footer_etc"> 더 많은 항목은
                    <!-- http://www.kati.net/mag/selectMagBookView.do?menuCode=200&bbsid=1&articleseq=97819&pageIndex=1&searchCondition=&searchKeyword -->
                    <a href="#" onclick="javascript:outLinkAction('${menuList[0].footerurl}','${menuList[0].id}');"><img style="margin-top:4px;" src="/resources/front/img/common/footer_logo_kati3.png" width="82" height="36" alt="AT taki 로고"></a>
                    클릭하세요 </div>
            </section>
        </div>
        <!-- //footer -->
    </div>
</div>
<!-- //contents -->
</div>
<content tag="local_script">
    <script type="text/javascript">
        $(function() {
            $(".tab_menu a").click(function(event) {
                event.preventDefault();
                $(this).parent().addClass("gf_select");
                $(this).parent().siblings().removeClass("gf_select");
                var tab = $(this).attr("href");
                $(".tab_content").not(tab).hide();
                $(tab).fadeIn();
            });
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