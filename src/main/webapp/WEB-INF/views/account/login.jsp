<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>관리자 로그인 화면</title>

    <!-- BEGIN META -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="your,keywords">
    <meta name="description" content="Short explanation about this website">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- END META -->

    <!-- BEGIN STYLESHEETS -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,300,400,600,700,800' rel='stylesheet' type='text/css'/>
    <link type="text/css" rel="stylesheet" href="/resources/admin//css/theme-default/bootstrap.css?1400695306" />
    <link type="text/css" rel="stylesheet" href="/resources/admin//css/theme-default/boostbox.css?1401297311" />
    <link type="text/css" rel="stylesheet" href="/resources/admin//css/theme-default/boostbox_responsive.css?1400695309" />
    <link type="text/css" rel="stylesheet" href="/resources/admin//css/theme-default/font-awesome.min.css?1400333030" />
    <!-- END STYLESHEETS -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/resources/admin//js/libs/utils/html5shiv.js?1400333019"></script>
    <script type="text/javascript" src="/resources/admin//js/libs/utils/respond.min.js?1400333017"></script>
    <![endif]-->
</head>
<body class="body-dark">
<!-- START LOGIN BOX -->
<div class="box-type-login">
    <div class="box text-center">
        <div class="box-head">
            <h2 class="text-light text-white"> <strong>인포그래픽</strong> 관리자 시스템<i class="fa fa-rocket fa-fw"></i></h2>
            <h4 class="text-light text-inverse-alt">Infographic Management System</h4>
        </div>
        <div class="box-body box-centered style-inverse">
            <h2 class="text-light">계정을 입력하세요.</h2>
            <br/>
            <form:form id="authentication" class="form-content login-form" method="POST" action="/account/actionLogin" modelAttribute="account">
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input class="form-control" id="email" name="email" type="text" placeholder="아이디를 입력하세요." value="admin" maxlength="40">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input class="form-control" id="password" name="password" type="password" placeholder="패스워드를 입력하세요." value="1234" maxlength="100">
                    </div>
                </div>
                <div class="row">

                    <div class="col-xs-6 text-left">
                        <div data-toggle="buttons">
                            <label class="btn checkbox-inline btn-checkbox-primary-inverse">
                                <input type="checkbox" value="default-inverse1">
                             </label>
                         </div>
                     </div>

                    <div class="col-xs-6 text-right">
                        <button class="btn btn-primary" type="submit"><i class="fa fa-key"></i> 로그인</button>
                    </div>
                </div>
            </form:form>
        </div><!--end .box-body -->
        <div class="box-footer force-padding text-white">
            <c:if test="${msg != null}">
                <h4 class="rs title-box fc-orange">${msg}</h4>
            </c:if>
        </div>
    </div>
</div>
<!-- END LOGIN BOX -->

<!-- BEGIN JAVASCRIPT -->
<script src="/resources/admin//js/libs/jquery/jquery-1.11.0.min.js"></script>
<script src="/resources/admin//js/libs/jquery/jquery-migrate-1.2.1.min.js"></script>
<script src="/resources/admin//js/core/BootstrapFixed.js"></script>
<script src="/resources/admin//js/libs/bootstrap/bootstrap.min.js"></script>
<script src="/resources/admin//js/libs/spin.js/spin.min.js"></script>
<script src="/resources/admin//js/libs/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/resources/admin//js/core/App.js"></script>
<script src="/resources/admin//js/core/demo/Demo.js"></script>
<!-- END JAVASCRIPT -->
<script>
    $(document).ready(function() {
        $("#email").focus();
    });
</script>
</body>
</html>