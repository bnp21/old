<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/WEB-INF/views/common/include/admin_header.jsp" %>
</head>
<body class="body-striped">

<!-- 헤더 시작 -->
<header id="header">
    <!-- 상단 메뉴 시작 -->
    <%@ include file="/WEB-INF/views/common/include/admin_top_menu.jsp" %>
    <!-- 상단 메뉴 끝 -->
</header>
<!-- 헤더 끝 -->

<!-- BEGIN BASE-->
<div id="base">
<!-- BEGIN SIDEBAR-->
    <%@ include file="/WEB-INF/views/common/include/admin_side_menu.jsp" %>
<!-- END SIDEBAR -->

<!-- BEGIN CONTENT-->
<div id="content">
    <decorator:body />
</div><!--end #content-->
<!-- END CONTENT -->

</div><!--end #base-->
<!-- END BASE -->

<!-- BEGIN JAVASCRIPT -->
<!--[if lte IE 8]>
<script src="/resources/admin/js/libs/excanvas-modified/excanvas.min.js"></script>
<![endif]-->
<script src="/resources/admin/js/libs/jquery/jquery-1.11.0.min.js"></script>
<script src="/resources/admin/js/libs/jquery/jquery-migrate-1.2.1.min.js"></script>
<script src="/resources/admin/js/libs/jquery-ui/jquery-ui-1.10.3.custom.min.js"></script>
<script src="/resources/admin/js/core/BootstrapFixed.js"></script>
<script src="/resources/admin/js/libs/bootstrap/bootstrap.min.js"></script>
<script src="/resources/admin/js/libs/spin.js/spin.min.js"></script>
<script src="/resources/admin/js/libs/moment/moment.min.js"></script>
<script src="/resources/admin/js/libs/flot/jquery.flot.min.js"></script>
<script src="/resources/admin/js/libs/flot/jquery.flot.time.min.js"></script>
<script src="/resources/admin/js/libs/flot/jquery.flot.resize.min.js"></script>
<script src="/resources/admin/js/libs/flot/jquery.flot.orderBars.js"></script>
<script src="/resources/admin/js/libs/flot/jquery.flot.pie.js"></script>
<script src="/resources/admin/js/libs/jquery-knob/jquery.knob.js"></script>
<script src="/resources/admin/js/libs/sparkline/jquery.sparkline.min.js"></script>
<script src="/resources/admin/js/libs/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/resources/admin/js/libs/fullcalendar/fullcalendar.min.js"></script>
<script src="/resources/admin/js/core/demo/DemoCharts.js"></script>
<script src="/resources/admin/js/core/App.js"></script>
<script src="/resources/admin/js/core/demo/Demo.js"></script>
<!-- END JAVASCRIPT -->
<script type="text/javascript">
    $(document).ready(function(){
        var nowUrl = location.pathname;

        $(".main-menu li a").each(function(){
            if( nowUrl.indexOf($(this).attr("href")) >= 0 ){
                if( $(this).parent("li").parent("ul").html() != "" ) {
                    $(this).addClass("active");
                    $(this).parent("li").parent("ul").parent("li").addClass("active expanded");
                }
            }
        });

    });
</script>
<decorator:getProperty property="page.local_script"></decorator:getProperty>

</body>
</html>
