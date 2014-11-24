<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.info.web.domain.Account" %>
<%

    Account account = (Account)session.getAttribute("account");

    String authId="";
    String authId2="";
    String authId3="";
    String authId4="";
    String authId5="";
    String name="";

    if(account!=null){

        if(account.getAuthority()!=null) {
            authId = (String) account.getAuthority();
        }
        if(account.getAuthority2()!=null) {
            authId2 = (String) account.getAuthority2();
        }
        if(account.getAuthority3()!=null) {
            authId3 = (String) account.getAuthority3();
        }
        if(account.getAuthority4()!=null) {
            authId4 = (String) account.getAuthority4();
        }
        if(account.getAuthority5()!=null) {
            authId5 = (String) account.getAuthority5();
        }

//        System.out.println("authId==>"+authId);
//        System.out.println("authId2==>"+authId2);
//        System.out.println("authId3==>"+authId3);
//        System.out.println("authId4==>"+authId4);
//        System.out.println("authId5==>"+authId5);
    }

%>
<div id="sidebar">
    <div class="sidebar-back"></div>
    <div class="sidebar-content">
        <div class="nav-brand">
            <a class="main-brand" href="/admin">
                <h3 class="text-light text-white"><span>admin<strong> system</strong> </span><i class="fa fa-rocket fa-fw"></i></h3>
            </a>
        </div>

        <!-- BEGIN MENU SEARCH -->
        <!--form class="sidebar-search" role="search">
            <a href="javascript:void(0);"><i class="fa fa-search fa-fw search-icon"></i><i class="fa fa-angle-left fa-fw close-icon"></i></a>
            <div class="form-group">
                <div class="input-group">
                    <input type="text" class="form-control navbar-input" placeholder="Search...">
								<span class="input-group-btn">
									<button class="btn btn-equal" type="button"><i class="fa fa-search"></i></button>
								</span>
                </div>
            </div>
        </form-->
        <!-- END MENU SEARCH -->

        <!-- BEGIN MAIN MENU -->
        <ul class="main-menu">
            <!-- Menu Dashboard -->
            <li>

                <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                        || authId.equals("B1") || authId2.equals("B1") || authId3.equals("B1") || authId4.equals("B1") || authId5.equals("B1") ) { %> <!-- 시스템관리자, 메인전시관리 관리자 일경우만 -->
                <a href="/admin/main">
                    <i class="fa fa-home fa-fw"></i><span class="title">메인 전시 관리</span>
                </a>
                <% } %>

            </li><!--end /menu-item -->
            <!-- Menu UI -->
            <!-- Menu Pages -->
            <li>
                <a href="javascript:void(0);">
                    <i class="fa fa-file fa-fw"></i><span class="title">수출정보</span> <span class="expand-sign">+</span>
                </a>
                <!--start submenu -->
                <ul>

                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B2") || authId2.equals("B2") || authId3.equals("B2") || authId4.equals("B2") || authId5.equals("B2")
                            || authId.equals("C1") || authId2.equals("C1")  || authId3.equals("C1") || authId4.equals("C1") || authId5.equals("C1") ) {
                     %> <!-- 시스템관리자, 수출정보 관리자, 농수산식품 수출기상도 관리자 일경우만-->
                    <li><a href="/admin/katis/export-weather" >농수산식품 수출기상도</a></li>
                    <% } %>
                    <%--<li><a href="#" >뉴스레터 관리</a></li>--%>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                        || authId.equals("B2") || authId2.equals("B2") || authId3.equals("B2") || authId4.equals("B2") || authId5.equals("B2")
                        || authId.equals("C2") || authId2.equals("C2")  || authId3.equals("C2") || authId4.equals("C2") || authId5.equals("C2") ) {
                    %> <!-- 시스템관리자, 수출정보 관리자, 해외 농산물 도매 가격 관리자 일경우만-->
                    <li><a href="/admin/katis/foreign-wholesale" >해외 농산물 도매 가격</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B2") || authId2.equals("B2") || authId3.equals("B2") || authId4.equals("B2") || authId5.equals("B2")
                            || authId.equals("C3") || authId2.equals("C3")  || authId3.equals("C3") || authId4.equals("C3") || authId5.equals("C3") ) {
                    %> <!-- 시스템관리자, 수출정보 관리자, Global Food Info 관리자 일경우만-->
                    <li><a href="/admin/katis/food-info" >Global Food Info</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B2") || authId2.equals("B2") || authId3.equals("B2") || authId4.equals("B2") || authId5.equals("B2")
                            || authId.equals("C4") || authId2.equals("C4")  || authId3.equals("C4") || authId4.equals("C4") || authId5.equals("C4") ) {
                    %> <!-- 시스템관리자, 수출정보 관리자, 뉴스 레터 관리자 일경우만-->
                    <li><a href="/admin/katis/news-letter" >뉴스 레터</a></li>
                    <% } %>

                </ul><!--end /submenu -->
            </li><!--end /menu-item -->
            <!-- Menu Tables -->
            <li>
                <a href="javascript:void(0);">
                    <i class="fa fa-puzzle-piece fa-fw"></i><span class="title">유통정보</span> <span class="expand-sign">+</span>
                </a>
                <!--start submenu -->
                <ul>

                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B3") || authId2.equals("B3") || authId3.equals("B3") || authId4.equals("B3") || authId5.equals("B3")
                            || authId.equals("C5") || authId2.equals("C5")  || authId3.equals("C5") || authId4.equals("C5") || authId5.equals("C5") ) {
                     %> <!-- 시스템관리자, 유통정보 관리자, 주요 농산물 일일거래동향 관리자 일경우만 -->
                    <li><a href="/admin/katis/farm-dealTrend" >주요 농산물 일일거래동향</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B3") || authId2.equals("B3") || authId3.equals("B3") || authId4.equals("B3") || authId5.equals("B3")
                            ||  authId.equals("C6") || authId2.equals("C6")  || authId3.equals("C6") || authId4.equals("C6") || authId5.equals("C6") ) {
                    %> <!-- 시스템관리자, 유통정보 관리자, 농축수산물 소매가격 일일동향 관리자 일경우만 -->
                    <li><a href="/admin/kamis/daily_price" >농축수산물 소매가격 일일동향</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B3") || authId2.equals("B3") || authId3.equals("B3") || authId4.equals("B3") || authId5.equals("B3")
                            || authId.equals("C7") || authId2.equals("C7")  || authId3.equals("C7") || authId4.equals("C7") || authId5.equals("C7") ) {
                    %> <!-- 시스템관리자, 유통정보 관리자, 알뜰 장보기 관리자 일경우만 -->
                    <li><a href="/admin/kamis/weekly_shopping" >알뜰 장보기</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B3") || authId2.equals("B3") || authId3.equals("B3") || authId4.equals("B3") || authId5.equals("B3")
                            || authId.equals("C8") || authId2.equals("C8")  || authId3.equals("C8") || authId4.equals("C8") || authId5.equals("C8") ) {
                    %> <!-- 시스템관리자, 유통정보 관리자, 주요 농산물 유통실태 관리자 일경우만 -->
                    <li><a href="/admin/kamis/distribution_reality" >주요 농산물 유통실태</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B3") || authId2.equals("B3") || authId3.equals("B3") || authId4.equals("B3") || authId5.equals("B3")
                            || authId.equals("C9") || authId2.equals("C9")  || authId3.equals("C9") || authId4.equals("C9") || authId5.equals("C9") ) {
                    %> <!-- 시스템관리자, 유통정보 관리자, 일일곡물시황 관리자 일경우만 -->
                    <li><a href="/admin/fis/grain-marketCondition" >일일곡물시황</a></li>
                    <% } %>

                </ul><!--end /submenu -->
            </li><!--end /menu-item -->
            <li>
                <a href="javascript:void(0);">
                    <i class="fa fa-th fa-fw"></i><span class="title">식품정보</span> <span class="expand-sign">+</span>
                </a>
                <!--start submenu -->
                <ul>

                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B4") || authId2.equals("B4") || authId3.equals("B4") || authId4.equals("B4") || authId5.equals("B4")
                            || authId.equals("D10") || authId2.equals("D10")  || authId3.equals("D10") || authId4.equals("D10") || authId5.equals("D10") ) {
                    %> <!-- 시스템관리자, 식품정보, 국내외 식품산업 주요지표 관리자 일경우만 -->
                    <li><a href="/admin/fis/mainIndicators" >국내외 식품산업 주요지표</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B4") || authId2.equals("B4") || authId3.equals("B4") || authId4.equals("B4") || authId5.equals("B4")
                            || authId.equals("D11") || authId2.equals("D11")  || authId3.equals("D11") || authId4.equals("D11") || authId5.equals("D11") ) {
                    %> <!-- 시스템관리자, 식품정보, 주요 가공식품 주간 가격동향 관리자 일경우만 -->
                    <li><a href="/admin/fis/ProcessedFood" >주요 가공식품 주간 가격동향</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B4") || authId2.equals("B4") || authId3.equals("B4") || authId4.equals("B4") || authId5.equals("B4")
                            || authId.equals("D12") || authId2.equals("D12")  || authId3.equals("D12") || authId4.equals("D12") || authId5.equals("D12") ) {
                    %> <!-- 시스템관리자, 식품정보, 주요 원자재 주간가격동향 관리자 일경우만 -->
                    <li><a href="/admin/fis/InternationalRawMaterial" >주요 원자재 주간가격동향</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B4") || authId2.equals("B4") || authId3.equals("B4") || authId4.equals("B4") || authId5.equals("B4")
                            || authId.equals("D13") || authId2.equals("D13")  || authId3.equals("D13") || authId4.equals("D13") || authId5.equals("D13") ) {
                    %> <!-- 시스템관리자, 식품정보, 한국 외식업 경기지수 관리자 일경우만 -->
                    <li><a href="/admin/fis/eating_business" >한국 외식업 경기지수</a></li>
                    <% } %>

                </ul><!--end /submenu -->
            </li><!--end /menu-item -->
            <li>
                <a href="javascript:void(0);">
                    <i class="fa fa-th fa-fw"></i><span class="title">aT사업</span> <span class="expand-sign">+</span>
                </a>
                <!--start submenu -->
                <ul>

                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B5") || authId2.equals("B5") || authId3.equals("B5") || authId4.equals("B5") || authId5.equals("B5")
                            || authId.equals("D14") || authId2.equals("D14")  || authId3.equals("D14") || authId4.equals("D14") || authId5.equals("D14")  ) {
                     %> <!-- 시스템관리자, aT사업, 화훼 거래시세 관리자 일경우만 -->
                    <li><a href="/admin/flower_volume">화훼 거래시세</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B5") || authId2.equals("B5") || authId3.equals("B5") || authId4.equals("B5") || authId5.equals("B5")
                            || authId.equals("D15") || authId2.equals("D15")  || authId3.equals("D15") || authId4.equals("D15") || authId5.equals("D15")  ) {
                    %> <!-- 시스템관리자, aT사업, 사이버거래소 관리자 일경우만 -->
                    <li><a href="/admin/promotion">사이버거래소</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                            || authId.equals("B5") || authId2.equals("B5") || authId3.equals("B5") || authId4.equals("B5") || authId5.equals("B5")
                            || authId.equals("D16") || authId2.equals("D16")  || authId3.equals("D16") || authId4.equals("D16") || authId5.equals("D16")  ) {
                    %> <!-- 시스템관리자, aT사업, aT 지원사업 종합안내 관리자 일경우만 -->
                    <li><a href="/admin/guidance" >aT 지원사업 종합안내</a></li>
                    <% } %>

                </ul><!--end /submenu -->
            </li><!--end /menu-item -->
            <!-- Menu Forms -->
            <%--<li>
                <a href="javascript:void(0);">
                    <i class="fa fa-list fa-fw"></i><span class="title">화훼 데이터 관리</span> <span class="expand-sign">+</span>
                </a>
                <!--start submenu -->
                <ul>
                    <li><a href="#" >공판장 화훼 시세 관리</a></li>
                    <li><a href="#" >화훼 월간시황 관리</a></li>
                </ul><!--end /submenu -->
            </li><!--end /menu-item -->--%>
            <!-- Menu Charts -->
            <li>

                <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                        || authId.equals("B6") || authId2.equals("B6") || authId3.equals("B6") || authId4.equals("B6") || authId5.equals("B6") ) { %> <!-- 시스템관리자, 알림마당 관리자 일경우만 -->
                <a href="/admin/notice" >
                    <i class="fa fa-bar-chart-o fa-fw"></i><span class="title">알림마당</span>
                </a>
                <% } %>

            </li><!--end /menu-item -->
            <!-- Menu Charts -->
            <!-- Menu Charts -->
            <li>

                <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1")
                        || authId.equals("B7") || authId2.equals("B7") || authId3.equals("B7") || authId4.equals("B7") || authId5.equals("B7") ) { %> <!-- 시스템관리자, 창조마당 관리자 일경우만 -->
                <a href="/admin/makegarden" >
                    <i class="fa fa-bar-chart-o fa-fw"></i><span class="title">창조마당</span>
                </a>
                <% } %>

            </li><!--end /menu-item -->
            <%--<!-- Menu Charts -->
            <li>
                <a href="/admin/promotion" >
                    <i class="fa fa-bar-chart-o fa-fw"></i><span class="title">사이버거래소</span>
                </a>
            </li><!--end /menu-item -->
            <!-- Menu Charts -->
            <li>
                <a href="/admin/guidance" >
                    <i class="fa fa-bar-chart-o fa-fw"></i><span class="title">aT 지원사업 종합안내</span>
                </a>
            </li><!--end /menu-item -->--%>
            <!-- Menu Levels -->
            <li>
                <a href="javascript:void(0);">
                    <i class="fa fa-folder-open fa-fw"></i><span class="title">시스템 관리</span> <span class="expand-sign">+</span>
                </a>
                <!--start submenu -->
                <ul>

                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1") ) { %> <!-- 시스템관리자 일경우만 -->
                    <li><a href="/admin/account"><span class="title">사용자 관리</span></a></li>
                    <% } %>

                    <!--
                    <li><a href="#"><span class="title">권한 관리</span></a></li>

                    <li><a href="/admin/item/index" >품목 리스트</a></li>
                    -->
                </ul><!--end /submenu -->
            </li><!--end /menu-item -->
            <!-- Menu Levels -->
            <li>
                <a href="javascript:void(0);">
                    <i class="fa fa-folder-open fa-fw"></i><span class="title">통계 관리</span> <span class="expand-sign">+</span>
                </a>
                <!--start submenu -->
                <ul>

                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1") ) { %> <!-- 시스템관리자 일경우만 -->
                    <li><a href="/admin/statistics">메인화면 조회수</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1") ) { %> <!-- 시스템관리자 일경우만 -->
                    <li><a href="/admin/statistics2">생생정보 조회수</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1") ) { %> <!-- 시스템관리자 일경우만 -->
                    <li><a href="/admin/statistics3">원본 조회수</a></li>
                    <% } %>
                    <% if( authId.equals("A1") || authId2.equals("A1")  || authId3.equals("A1") || authId4.equals("A1") || authId5.equals("A1") ) { %> <!-- 시스템관리자 일경우만 -->
                        <li><a href="/admin/statistics4">데이터 다운로드</a></li>
                    <% } %>

                    <!--
                    <li><a href="#"><span class="title">권한 관리</span></a></li>

                    <li><a href="/admin/item/index" >품목 리스트</a></li>
                    -->
                </ul><!--end /submenu -->
            </li><!--end /menu-item -->

        </ul><!--end .main-menu -->
        <!-- END MAIN MENU -->

    </div>
</div><!--end #sidebar-->