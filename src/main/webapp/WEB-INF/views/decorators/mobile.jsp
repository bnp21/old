<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible' />
    <meta name="language" content="ko" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0 minimal-ui" />
    <title>AT센터</title>
    <link rel="stylesheet" type="text/css" href="/resources/front/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/resources/front/css/style.css" />
    <script type="text/javascript" src="/resources/front/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="/resources/front/js/jquery-1.10.3-ui.js"></script>
    <decorator:getProperty property="page.local_script"></decorator:getProperty>
</head>
<body>
<div id="mobile_main">
    <decorator:body />
</div>
</body>
</html>