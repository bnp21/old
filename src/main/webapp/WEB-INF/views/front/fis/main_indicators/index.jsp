<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="contents">
<div id="warp" class="warp17">
    <!-- header -->
    <div class="header">
        <section>
            <div class="header_box17">
                <h1 class="h_title">국내외 식품산업 주요지표</h1>
                <ul class="tab_menu">
                    <li style="margin-right:2px;"><a href="javascript:;" onclick="changeTab('1');"><img src="/resources/front/upload/main-indicators/${mainIndicatorsList[0].imgTab1Off}" ></a></li>
                    <li style="margin-right:2px;"><a href="javascript:;" onclick="changeTab('2');"><img src="/resources/front/upload/main-indicators/${mainIndicatorsList[0].imgTab2Off}" ></a></li>
                    <li><a href="javascript:;" onclick="changeTab('3');"><img src="/resources/front/upload/main-indicators/${mainIndicatorsList[0].imgTab3Off}" ></a></li>
                </ul>
            </div>
        </section>
    </div>
    <!-- //header -->
    <!-- contents -->
    <div class="contents" style="line-height:0;">
        <section>
            <div class="contents_box17">
                <div class="tab_img_01 dev_contentsTab">
                    <c:if test="${mainIndicatorsList[0].contentsTab1!=' '}"><img src="/resources/front/upload/main-indicators/${mainIndicatorsList[0].contentsTab1}" ></c:if>
                </div>
                <div class="tab_img_02 dev_contentsTab" style="display:none">
                    <c:if test="${mainIndicatorsList[0].contentsTab2!=' '}"><img src="/resources/front/upload/main-indicators/${mainIndicatorsList[0].contentsTab2}" ></c:if>
                </div>
                <div class="tab_img_03 dev_contentsTab" style="display:none">
                    <c:if test="${mainIndicatorsList[0].contents1Tab3!=' '}"><img src="/resources/front/upload/main-indicators/${mainIndicatorsList[0].contents1Tab3}" ></c:if>
                    <c:if test="${mainIndicatorsList[0].contents2Tab3!=' '}"><img src="/resources/front/upload/main-indicators/${mainIndicatorsList[0].contents2Tab3}" ></c:if>
                </div>
            </div>
        </section>
    </div>
    <!-- //contents -->
    <!-- footer -->
    <div id="footer" class="tab_01">
        <section>
            <div class="footer_logo"><img src="/resources/front/img/common/footer_logo.png" width="150" height="22" alt="로고"></div>
            <div class="footer_etc"> 더 많은 항목은 <a href="#" onclick="javascript:outLinkAction('${menuList[0].footerurl}','${menuList[0].id}');"><img style="margin-top:4px;" src="/resources/front/img/common/footer_logo_fis.png" width="183" height="34" alt="AT FIS 로고"></a>클릭하세요 </div>
        </section>
    </div>
    <!-- //footer -->
</div>
</div>
<content tag="local_script">
    <script type="text/javascript">
        $(document).ready(function(){
            $(".tab_menu li:eq(0)").find("img").attr("src",$(".tab_menu li:eq(0)").find("img").attr("src").replace("_off.","_on."));
        });
        function changeTab(type) {
            $(".tab_menu li").each(function(){
                $(this).find("img").attr("src",$(this).find("img").attr("src").replace("_on.","_off."));
            });
            $(".tab_menu li:eq("+(type-1)+")").find("img").attr("src",$(".tab_menu li:eq("+(type-1)+")").find("img").attr("src").replace("_off.","_on."));
            $(".dev_contentsTab").hide();
            $(".dev_contentsTab:eq("+(type-1)+")").show();
            var className = $("#footer").attr("class");
            $("#footer").removeClass(className);
            $("#footer").addClass("tab_0" + type);
        }

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