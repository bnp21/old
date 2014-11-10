<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/views/common/include/font_header.jsp" %>
    <decorator:getProperty property="page.local_script"></decorator:getProperty>
</head>

<body>
<div id="main">
    <div id="warp" class="warp_main">
        <!-- 헤더 시작 -->
        <!-- 상단 메뉴 시작 -->
        <%@ include file="/WEB-INF/views/common/include/front_top_menu.jsp" %>
        <!-- 상단 메뉴 끝 -->
        <!-- 헤더 끝 -->
        <!-- BEGIN CONTENT-->
        <decorator:body />
        <!--end #content-->
        <!-- END CONTENT -->
    </div>
</div>
</body>
</html>