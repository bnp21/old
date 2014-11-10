<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- contents -->
<div id="contents" class="main_contents">
<section>
<div class="contents_box_main">
<div id="slides">
    <div class="roll_left prev"> <a href="#" class="prev"><img src="/resources/front/img/common/main_left_arrow_off.png" onMouseOver="this.src='/resources/front/img/common/main_left_arrow_on.png';" onMouseOut="this.src='/resources/front/img/common/main_left_arrow_off.png';" width="15" height="25" alt="왼쪽 롤링"></a> </div>
    <div class="top slides_container">
        <c:choose>
            <c:when test="${mainList[0].paramType != null}">
                <div class="sub_con1 slideItem">
                    <ul class="sub_con_ul">
                        <c:set var="listCnt" value="1" />
                        <c:forEach items="${mainList}" var="mainList">
                            <div class="sub_con">
                                <ul class="sub_con_ul">
                                    <li class="sub_con_li con0${listCnt}" id="dev_menu${mainList.menuId}">
                                        <c:if test="${mainList.autodataYn=='N'}">
                                            <a href="#" <c:if test="${mainList.outlinkYn!='Y'}"> onclick="javascript:linkAction('${mainList.url}');" </c:if> <c:if test="${mainList.outlinkYn=='Y'}"> onclick="javascript:outLinkAction('${mainList.url}','${mainList.menuId}');" </c:if> >
                                                <img src='/resources/front/upload/${mainList.thumbnailName}' width='100%' alt='${mainList.menuname}'>
                                            </a>
                                        </c:if>
                                    </li>
                                </ul>
                            </div>
                            <c:set var="listCnt" value="${listCnt+1}" />
                        </c:forEach>
                    </ul>
                </div>
            </c:when>
            <c:otherwise>
                <div class="slideItem">
                    <!-- 첫번째 페이지 리스트 -->
                    <div class="main_con" id="dev_menu${mainList[0].menuId}">
                        <c:if test="${mainList[0].autodataYn=='N'}">
                            <a href="#" <c:if test="${mainList[0].outlinkYn!='Y'}"> onclick="javascript:linkAction('${mainList[0].url}');" </c:if> <c:if test="${mainList[0].outlinkYn=='Y'}"> onclick="javascript:outLinkAction('${mainList[0].url}','${mainList[0].menuId}');" </c:if> >
                                <img src='/resources/front/upload/${mainList[0].thumbnailName}' width='100%' alt='${mainList[0].menuname}'>
                            </a>
                        </c:if>
                    </div>
                    <!-- 첫번째 페이지 리스트 여기서부터 시작함-->
                    <c:set var="listCnt" value="1" />
                    <c:forEach items="${mainList}" var="mainList" begin="1" end="9" step="1">
                        <div class="sub_con">
                            <ul class="sub_con_ul">
                                    <%--c:if test="${mainList.id > 1 && mainList.id < 10 }"--%>
                                <li class="sub_con_li con0${listCnt}" id="dev_menu${mainList.menuId}" >
                                    <c:if test="${mainList.autodataYn=='N'}">
                                        <a href="#" <c:if test="${mainList.outlinkYn!='Y'}"> onclick="javascript:linkAction('${mainList.url}');" </c:if> <c:if test="${mainList.outlinkYn=='Y'}"> onclick="javascript:outLinkAction('${mainList.url}','${mainList.menuId}');" </c:if> >
                                            <img src='/resources/front/upload/${mainList.thumbnailName}' width='100%' alt='${mainList.menuname}'>
                                        </a>
                                    </c:if>
                                </li>
                                <c:set var="listCnt" value="${listCnt+1}" />
                                    <%--/c:if--%>
                            </ul>
                        </div>
                    </c:forEach>
                    <!-- //첫번째 페이지 리스트 -->
                </div>
                <!-- 두번째 페이지 리스트 -->
                <div class="sub_con1 slideItem" style="display:none;">
                    <ul class="sub_con_ul">
                        <c:set var="listCnt" value="1" />
                        <c:forEach items="${mainList}" var="mainList" begin="9" end="${mainListSize}" step="1">
                            <div class="sub_con">
                                <ul class="sub_con_ul">
                                        <%--c:if test="${mainList.id > 9}"--%>
                                    <li class="sub_con_li con0${listCnt}" id="dev_menu${mainList.menuId}">
                                        <c:if test="${mainList.autodataYn=='N'}">
                                            <a href="#" <c:if test="${mainList.outlinkYn!='Y'}"> onclick="javascript:linkAction('${mainList.url}');" </c:if> <c:if test="${mainList.outlinkYn=='Y'}"> onclick="javascript:outLinkAction('${mainList.url}','${mainList.menuId}');" </c:if> >
                                                <img src='/resources/front/upload/${mainList.thumbnailName}' width='100%' alt='${mainList.menuname}'>
                                            </a>
                                        </c:if>
                                    </li>
                                    <c:set var="listCnt" value="${listCnt+1}" />
                                        <%--/c:if--%>
                                </ul>
                            </div>
                        </c:forEach>
                    </ul>
                </div>
                <!-- //두번째 페이지 리스트 -->
            </c:otherwise>
        </c:choose>
    </div>
    <div class="roll_right"> <a href="#" class="next"><img src="/resources/front/img/common/main_right_arrow_off.png" onMouseOver="this.src='/resources/front/img/common/main_right_arrow_on.png';" onMouseOut="this.src='/resources/front/img/common/main_right_arrow_off.png';" width="15" height="25" alt="오른쪽 롤링"></a> </div>
</div>
<div class="board">
    <div class="b_tab">
        <div class="b_tab_01">
            <a href="javascript:;" onclick="changeTab('0');"><img src="/resources/front/img/btn/btn_main_tab_01_on.png" width="190" height="36" alt="at센터 최근소식"></a>
        </div>
        <div class="b_tab_02">
            <a href="javascript:;" onclick="changeTab('1');"><img src="/resources/front/img/btn/btn_main_tab_02_off.png" width="190" height="36" alt="유통교육원 최근소식"></a>
        </div>
        <div class="b_tab_03">
            <a href="javascript:;" onclick="changeTab('2');"><img src="/resources/front/img/btn/btn_main_tab_03_off.png" width="190" height="36" alt="at 참조마당"></a>
        </div>
        <div class="b_tab_04">
            <a href="javascript:;" onclick="changeTab('3');"><img src="/resources/front/img/btn/btn_main_tab_04_off.png" width="190" height="36" alt="at 알림마당"></a>
        </div>
        <div class="more">
            <a href="#" onclick="outLinkFootAction('http://atcenter.at.or.kr/ac/event/acko321000/list.action','21')"><img src="/resources/front/img/btn/btn_more.png" width="51" height="10" alt="더보기"></a>
        </div>
    </div>
    <div class="board_main board_01">
        <table>
            <colgroup>
                <col width="7%">
                <col width="auto">
                <col width="10.6%">
                <col width="20%">
                <col width="20%">
                <col width="12%">
            </colgroup>
            <thead>
            <tr>
                <th><img src="/resources/front/img/text/main_table_01.png" width="23" height="12" alt="구분"></th>
                <th><img src="/resources/front/img/text/main_table_02.png" width="32" height="12" alt="행사명"></th>
                <th><img src="/resources/front/img/text/main_table_03.png" width="43" height="12" alt="행사장소"></th>
                <th><img src="/resources/front/img/text/main_table_04.png" width="22" height="12" alt="주최"></th>
                <th><img src="/resources/front/img/text/main_table_05.png" width="44" height="12" alt="행사기간"></th>
                <th><img src="/resources/front/img/text/main_table_06.png" width="32" height="12" alt="연락처"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${atnewsList}" var="list">
                <tr>
                    <td>
                        <c:if test="${list.type=='1'}">
                            <img src="/resources/front/img/common/main_board_t_02.png" width="53" height="18" alt="행사">
                        </c:if>
                        <c:if test="${list.type=='2'}">
                            <img src="/resources/front/img/common/main_board_t_03.png" width="53" height="18" alt="행사">
                        </c:if>
                        <c:if test="${list.type=='3'}">
                            <img src="/resources/front/img/common/main_board_t_04.png" width="53" height="18" alt="행사">
                        </c:if>
                        <c:if test="${list.type=='4'}">
                            <img src="/resources/front/img/common/main_board_t_01.png" width="53" height="18" alt="행사">
                        </c:if>
                    </td>
                    <td class="left"><a href="#" onclick="outLinkFootAction('http://atcenter.at.or.kr/ac/event/acko321000/view.action?eventId=${list.eventId}','21')"><span>${list.eventNm}</span></a> </td>
                    <td>${list.conduct}</td>
                    <td>${list.host}</td>
                    <td>${list.startYear}.${list.startMonth}.${list.startDay} ~ ${list.stopYear}.${list.stopMonth}.${list.stopDay}</td>
                    <td>${list.inquiry}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="board_main board_02" style="display:none;">
        <table>
            <colgroup>
                <col width="7.1%">
                <col width="39.8%">
                <col width="9.9%">
                <col width="auto">
                <col width="6.6%">
                <col width="7.1%">
                <col width="auto">
            </colgroup>
            <thead>
            <tr>
                <th><img src="/resources/front/img/text/main_table_01_02.png" width="45" height="14" alt="교육과정"></th>
                <th><img src="/resources/front/img/text/main_table_02_02.png" width="56" height="14" alt="교육과정명"></th>
                <th><img src="/resources/front/img/text/main_table_03_02.png" width="46" height="13" alt="기간구분"></th>
                <th><img src="/resources/front/img/text/main_table_04_02.png" width="46" height="13" alt="가수"></th>
                <th><img src="/resources/front/img/text/main_table_05_02.png" width="23" height="13" alt="인원"></th>
                <th><img src="/resources/front/img/text/main_table_06_02.png" width="21" height="13" alt="연락처"></th>
                <th><img src="/resources/front/img/text/main_table_07_02.png" width="46" height="14" alt="진행상황"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${educationList}" var="list">
                <tr>
                    <td>
                        <c:if test="${list.cateCode=='식품'}">
                            <img src="/resources/front/img/common/main_board_t_05.png" width="53" height="18" alt="행사"
                        </c:if>
                        <c:if test="${list.cateCode=='유통'}">
                            <img src="/resources/front/img/common/main_board_t_06.png" width="53" height="18" alt="행사"
                        </c:if>
                    </td>
                    <td class="left">
                        <a href="#" onclick="outLinkFootAction('http://edu.at.or.kr/req/deko322000/view.action?eduCode=${list.educationCode}&eduNum=${list.gisu}&year=2014&bigGroupCode=','22')">
                            <span>${list.educationName}</span>
                        </a>
                    </td>
                    <td>${list.course}</td>
                    <td>${list.startDate} ~ ${list.endDate}</td>
                    <td>${list.gisu}</td>
                    <td>${list.personnel}</td>
                    <td class="stat_01">${list.progress}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="board_main board_03" style="display:none;"><img src="/resources/front/img/main/main_email.jpg" alt="메일보내기" usemap="#Map">
        <map name="Map">
            <!--
            <area shape="rect" coords="127,117,263,134" href="/download/hwp">
             <area shape="rect" coords="127,117,263,134" href="#" onclick="outLinkFootAction2('/makegarden/','23')"> -->
             <area shape="rect" coords="614,149,796,171" href="#" onclick="outLinkFootAction2('/makegarden/','23')">
        </map>
    </div>
    <div class="board_main board_04" style="display:none;">
        <table>
            <colgroup>
                <col width="7.1%">
                <col width="auto">
                <col width="10%">
                <col width="6.6%">
                <col width="8.1%">
                <col width="10%">
            </colgroup>
            <thead>
            <tr>
                <th><img src="/resources/front/img/text/main_notice_01.png" alt="번호"></th>
                <th><img src="/resources/front/img/text/main_notice_02.png" alt="제목"></th>
                <th><img src="/resources/front/img/text/main_notice_04.png" alt="이름"></th>
                <th><img src="/resources/front/img/text/main_notice_05.png" alt="파일"></th>
                <th><img src="/resources/front/img/text/main_notice_06.png" alt="조회수"></th>
                <th><img src="/resources/front/img/text/main_notice_07.png" alt="게시일"></th>
            </tr>
            </thead>
            <tbody id="noticeList">
            </tbody>
        </table>
        <div class="table_pagenation" id="paging">

        </div>
    </div>
</div>
</div>
</section>
</div>
<!-- //contents -->
<!-- footer -->
<div id="footer" class="footer_main">
    <section>
        <div class="footer_logo"><a href="http://www.at.or.kr/" target="_blank"><img src="/resources/front/img/common/footer_logo_g.png" alt="at 한국농수산식품유통공사 로고"></a></div>
        <div class="footer_text">
            <div class="f_top">
                <ul>
                    <li><a href="http://www.at.or.kr/html/member/at_acount_2.html" onclick="javascript:window.open('http://www.at.or.kr/html/member/at_acount_2.html','개인정보처리방침','width=865px,height=680px,scrollbars=yes');return false;" target="_blank"><span><strong>개인정보처리방침</strong></span></a></li>
                    <li><a href="http://www.at.or.kr/privacy/apko372000/intro.action" target="_blank"><span>개인정보침해신고센터</span></a></li>
                    <li><a href="http://www.at.or.kr/html/member/at_acount_5.html" onclick="javascript:window.open('http://www.at.or.kr/html/member/at_acount_5.html','전자우편주소수집거부','width=865px,height=680px,scrollbars=yes');return false;" target="_blank"><span>전자우편주소수집거부</span></a></li>
                    <li><a href="http://www.at.or.kr/contents/apko316110/view.action" target="_blank"><span>찾아오시는길</span></a></li>
                </ul>
            </div>
            <div class="f_bottom"> [137-787] 서울특별시 서초구 강남대로 27, (양재동, aT센터) | 일반안내 : 02-6300-1114<br>
                전시장임대 " 02-6300-1912, 회의실임대 " 02-6300-1900, 사무실임대 : 02-6300-1468, 예식홀임대 : 02-6300-2300<br>
                COPYRIGHTⓒ 2010 BY Korea Agro-Fisheries & Food Trade Corp. ALL RIGHTS RESERVED. </div>
        </div>
        <div class="footer_etc">
            <div class="e_top">
                <select id="familyLink">
                    <option value="">-- Family Site --</option>
                    <option value="http://www.foodbiz.or.kr/">농수산식품기업지원센터</option>
                    <option value="http://www.kati.net/">aTKati</option>
                    <option value="http://www.agrotrade.net/">Agro Trade</option>
                    <option value="http://atcenter.at.or.kr">aTCenter</option>
                    <option value="http://whimori.at.or.kr">Whimori</option>
                    <option value="http://forestproduct.at.or.kr">Korea Forest Products</option>
                    <option value="http://atess.at.or.kr/">수출지원시스템</option>
                    <option value="http://global.at.or.kr/">aT수출업체종합지원시스템</option>
                    <option value="http://www.kamis.co.kr/">aTKAMIS</option>
                    <option value="http://yfmc.at.or.kr">aT회훼공판장</option>
                    <option value="http://edu.at.or.kr">aT농식품유통교육원</option>
                    <option value="http://www.eat.co.kr/attach/cyber/index.htm">농수산물사이버거래소</option>
                    <option value="http://www.atbid.co.kr/">비축농산물 전자입찰시스템</option>
                    <option value="http://www.atfis.or.kr">식품산업통계정보</option>
                    <option value="http://www.eSingSing.com">싱싱장터</option>
                </select>
                <img src="/resources/front/img/btn/btn_go.png" alt="바로가기" onclick="outLinkAction2($('#familyLink').val())" style="cursor:pointer"></div>
            <div class="e_top">
                <select id="relatedLink">
                    <option value="">--- 유관기관 ---</option>
                    <option value="http://www.maf.go.kr/">농림축산식품부</option>
                    <option value="http://www.naqs.go.kr/">국립농산물품질관리원</option>
                    <option value="http://www.naas.go.kr/">농촌진흥청 국립농업과학원</option>
                    <option value="http://www.qia.go.kr/">농림수산검역검사본부</option>
                    <option value="http://www.seed.go.kr/">국립종자원</option>
                    <option value="http://www.kma.go.kr/">기상청</option>
                    <option value="http://www.ipet.re.kr/">농림수산식품기술기획평가원</option>
                    <option value="http://www.epis.or.kr/">농림수산식품교육문화정보원</option>
                    <option value="http://www.ati.go.kr/">농수산식품연수원</option>
                    <option value="http://www.rda.go.kr/">농촌진흥청</option>
                    <option value="http://www.nonghyup.com/">농협</option>
                    <option value="http://www.forest.go.kr">산림청</option>
                    <option value="http://www.suhyup.co.kr/">수협</option>
                    <option value="http://www.ekr.or.kr">한국농어촌공사</option>
                    <option value="http://www.af.ac.kr/">한국농수산대학</option>
                    <option value="http://www.krei.re.kr/">한국농촌경제연구원</option>
                    <option value="http://www.kfri.re.kr/">한국식품연구원</option>
                    <option value="http://www.sonosa.or.kr/">남북교류협력지원협회</option>
                </select>
                <img src="/resources/front/img/btn/btn_go.png" alt="바로가기" onclick="outLinkAction2($('#relatedLink').val())" style="cursor:pointer"> </div>
            <%--<div class="e_bottom"> <a href="http://www.kats.go.kr/htm/business_06/ea_04_01.asp"><img src="/resources/front/img/common/main_footer_icon01.png" alt=""></a> <a href="http://www.eprivacy.or.kr"><img src="/resources/front/img/common/main_footer_icon02.png" alt=""></a><a href="http://www.eprivacy.or.kr/"><img src="/resources/front/img/common/main_footer_icon03.png" alt=""></a> </div>--%>
        </div>
    </section>
</div>
<!-- //footer -->

<content tag="local_script">
<style type="text/css" media="screen">
    .slides_container {
        width:920px;
        display:none;
    }

    .slides_container .slideItem {
        width:920px;
        height:804px;
        display:block;
    }
</style>
<script type="text/javascript" src="/resources/front/js/jquery.number.min.js"></script>
<script type="text/javascript" src="/resources/front/js/common.js"></script>
<script src="/resources/front/js/slides.min.jquery.js"></script>
<script src="/resources/front/js/menuHtml.js"></script>
<script type="text/javascript">
    function changeTab(type){
        $(".board_main").hide();
        $(".board_main:eq("+type+")").show();
        $(".b_tab_01").find("img").attr("src", $(".b_tab_01").find("img").attr("src").replace("_on.", "_off."));
        $(".b_tab_02").find("img").attr("src", $(".b_tab_02").find("img").attr("src").replace("_on.", "_off."));
        $(".b_tab_03").find("img").attr("src", $(".b_tab_03").find("img").attr("src").replace("_on.", "_off."));
        $(".b_tab_04").find("img").attr("src", $(".b_tab_04").find("img").attr("src").replace("_on.", "_off."));
        $(".b_tab_0" + parseInt(parseInt(type, 10) + 1, 10)).find("img").attr("src", $(".b_tab_0" + parseInt(parseInt(type, 10) + 1, 10)).find("img").attr("src").replace("_off.", "_on."));

        if ( type=="2" || type=="3"){
            $(".more").hide();
        }else{
            $(".more").show();
        }
        if( type == "0") {
            //$(".b_tab .more").find("a").attr("href","http://atcenter.at.or.kr/ac/event/acko321000/list.action");
            $(".b_tab .more").find("a").attr("onclick","outLinkFootAction('http://atcenter.at.or.kr/ac/event/acko321000/list.action','21')");
        }else if(type == "1"){
            //$(".b_tab .more").find("a").attr("href","http://edu.at.or.kr/req/deko322000/yearEduList.action");
            $(".b_tab .more").find("a").attr("onclick","outLinkFootAction('http://edu.at.or.kr/req/deko322000/yearEduList.action','22')");
        }
    }

    $(document).ready(function() {
        //선택된 카테고리
        var nowUrl = location.pathname+location.search;
        nowUrl = nowUrl.replace("/","");
        $(".gnb li").removeClass("on");
        if( nowUrl != "" ){
            $(".gnb li:eq("+(nowUrl-1)+")").addClass("on");
        }

        //알림마당
        noticeList('1');

        if( $(".main_con").length > 0 ) {
            var bigMenuHtml = menuHtml[menuIdHtml('big')];
            if (bigMenuHtml.indexOf("main_10") >= 0) bigMenuHtml = bigMenuHtml.replace(/small_title/g, '');
            if ($.trim($(".main_con").html()) == ""){
                $.get("/getMainData/" + menuIdHtml('big'), {time : new Date().getTime() }, function (data, status) {
                    if( data.length > 0 ) {
                        htmlBody2 = menuHtmlData(data, menuIdHtml('big'), bigMenuHtml);
                        if (htmlBody2.indexOf("main_02") >= 0) htmlBody2 = htmlBody2.replace(/weather_chart_arrow_s_up.png/g, 'weather_chart_arrow_up.png').replace(/weather_chart_arrow_s_down.png/g, 'weather_chart_arrow_down.png');
                        $(".main_con").html(htmlBody2);
                    }else{
                        $(".main_con").html(bigMenuHtml);
                    }
                });
            }
        }
        $(".sub_con_li").each(function(){
            if( $.trim($(this).html()) == "") {
                var htmlAreaIndex = $(".sub_con_li").index(this);
                var menuid = menuIdHtml(htmlAreaIndex);
                /*$(this).html(menuHtml[menuid]);*/
                var htmlBody = menuHtml[menuid];
                var htmlBody2 = "";
                $.get("/getMainData/" + menuid, {time : new Date().getTime() }, function (data, status) {
                    if( data.length > 0 ) {

                        htmlBody2 = menuHtmlData(data, menuid, htmlBody);
                        $(".sub_con_li:eq(" + htmlAreaIndex + ")").html(htmlBody2);
                    }else{
                        $(".sub_con_li:eq(" + htmlAreaIndex + ")").html(htmlBody);
                    }
                });
            }
        });

        if( $(".sub_con_li").length > 9 ) {
            $('#slides').slides({
                preload: true,
                play: 7000,
                pause: 2500,
                hoverPause: true
            });
            $("#slides .pagination").hide();
        }
    });

    function noticeList(page){
        var dataSize = 0; //데이터 총 갯수
        var pageSize = 5; //페이지 사이즈
        var pageBlockSize = 10;     //페이지 블럭 사이즈
        var noticeHtml = "";
        $.get("/getNoticeData/"+page+"/"+pageSize, {time : new Date().getTime() }, function (data, status) {
            $.each(data, function(i) {
                if( i == 0 ) dataSize = data[0].totalCount;
                var fileLink = "";
                if( data[i].fileSeq != null && data[i].fileSeq != 0 ){
                    fileLink = "<a href='javascript:;' onclick=\"downFile('"+data[i].fileSeq+"');\" class='download'><img src='/resources/front/img/common/btn_download.jpg' alt='다운'></a>";
                }

                noticeHtml += "<tr>"+
                        "<td>"+(dataSize-data[i].listNum+1)+"</td>"+
                        "<td class='left'><a href='javascript:;' onclick=\"outLinkFootAction3('"+data[i].seq+"');\" ><span>"+data[i].title+"</span></a></td>"+
                        "<td>"+data[i].accountId+"</td>"+
                        "<td>"+fileLink+"</td>"+
                        "<td>"+data[i].viewcnt+"</td>"+
                        "<td class='stat_01'>"+(data[i].regdate).substring(0,10).replace(/-/g,".")+"</td>"+
                        "</tr>";
            });
            $("#noticeList").html(noticeHtml);
            //페이징
            var tempPage = Math.floor(parseInt(page,10)/pageBlockSize);

            if( ( parseInt(page,10) % pageBlockSize ) == 0 ) tempPage = tempPage - 1;
            var firstPage = 0;          //첫 페이지
            if( dataSize > 0 ) firstPage = 1;
            var lastPage = 0;          //마지막 페이지
            if( (dataSize%pageSize) > 0 ) lastPage = Math.floor(dataSize/pageSize) + 1;
            else lastPage = Math.floor(dataSize/pageSize);
            var totalPageBlock = 0;     //전체 페이지 블럭 수
            if( (pageBlockSize%dataSize) != 0 ) totalPageBlock = Math.floor(dataSize/pageBlockSize) + 1;
            else totalPageBlock = Math.floor(dataSize/pageBlockSize);
            var prevPage = 0;       //이전페이지
            if( parseInt((parseInt(page,10)-1),10) == 0 ) prevPage = 1;
            else prevPage = parseInt(parseInt(page,10) - 1,10);
            var nextPage = 0;       //다음페이지
            if( parseInt((parseInt(page,10)+1),10) > lastPage ) nextPage = lastPage;
            else nextPage = parseInt((parseInt(page,10)+1),10);
            var loopFirst = 0;
            if( prevPage <= 0 ) loopFirst =1;
            else loopFirst =(parseInt(tempPage,10) * pageBlockSize)+1;
            var loopLast = 0;
            if( nextPage <= 0 ) loopLast = 1;
            else loopLast = (parseInt(tempPage,10)+1) * pageBlockSize;
            if( loopLast > lastPage ) loopLast = lastPage;
            var loopHtml = "";
            for( var i=loopFirst; i<=loopLast; i++){
                if( i == loopFirst) loopHtml += "<span style='padding-top:2px;cursor:pointer;' onclick=\"noticeList('"+i+"')\">"+i+"</span>";
                else loopHtml += "<span style='cursor:pointer;' onclick=\"noticeList('"+i+"')\">"+i+"</span>";
            }
            $("#paging").html(
                            "<span class='arrow'><a href='javascript:;' onclick=\"noticeList('"+firstPage+"')\"><strong>&lt;&lt;</strong></a></span>"+
                            "<span class='arrow'><a href='javascript:;' onclick=\"noticeList('"+prevPage+"')\"><strong>&lt;</strong></a></span>"+
                            loopHtml+
                            "<span class='arrow'><a href='javascript:;' onclick=\"noticeList('"+nextPage+"')\"><strong>&gt;</strong></a></span>"+
                            "<span class='arrow'><a href='javascript:;' onclick=\"noticeList('"+lastPage+"')\"><strong>&gt;&gt;</strong></a></span>"
            )
        });
    }

    function downFile(fileSeq){
        location.href = "/notice/filedown/"+fileSeq;
    }


    function menuIdHtml(type) {
        if (type == "big") {
            return $(".main_con").attr("id").replace("dev_menu", "");
        }else{
            return $(".sub_con_li:eq("+type+")").attr("id").replace("dev_menu", "");
        }
    }

    function linkAction(linktype){
        //alert('aa==>'+linktype);
        /********* 통계정보 입력 Start **********/
            //메뉴아이디 ==> 웹메인:91, 모바일메인:92, 나머지는 메뉴아이디:1~16
            //화면구분  ==> 메인:A,모바일메인:B,생생정보:C,원본:D
        $.get("/insertStatistics/" + linktype+"/"+"C", {time : new Date().getTime() }, function (data, status) {
            //alert(data);
            if(data>0) {

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

    function outLinkFootAction(linktype,menuId){
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

    //창조마당만
    function outLinkFootAction2(linktype,menuId){
        /********* 통계정보 입력 Start **********/
            //메뉴아이디 ==> 웹메인:91, 모바일메인:92, 나머지는 메뉴아이디:1~16
            //화면구분  ==> 메인:A,모바일메인:B,생생정보:C,원본:D
        $.get("/insertFootUrlStatistics/" + menuId+"/"+"C", {time : new Date().getTime() }, function (data, status) {
            if(data>0){

            }
        });

        location.href = linktype;

        /********* 통계정보 입력 End **********/
    }

    //알림마당만
    function outLinkFootAction3(seq){

        var menuId="24";
        var linktype="/notice/view/"+seq;
        /********* 통계정보 입력 Start **********/
            //메뉴아이디 ==> 웹메인:91, 모바일메인:92, 나머지는 메뉴아이디:1~16
            //화면구분  ==> 메인:A,모바일메인:B,생생정보:C,원본:D
        $.get("/insertFootUrlStatistics/" + menuId+"/"+"C", {time : new Date().getTime() }, function (data, status) {
            if(data>0){

            }
        });

        location.href = linktype;

        /********* 통계정보 입력 End **********/
    }

    function outLinkAction2(linktype){
        window.open(linktype,"","");
    }
</script>
</content>