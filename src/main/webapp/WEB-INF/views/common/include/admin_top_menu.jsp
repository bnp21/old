<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-default" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <a class="btn btn-transparent btn-equal btn-menu" href="javascript:void(0);"><i class="fa fa-bars fa-lg"></i></a>
        <div class="navbar-brand">
            <!--<a class="main-brand" href="../../html/dashboards/dashboard.html"> -->
            <a class="main-brand" href="/index">
                <h3 class="text-light text-white"><span>관리자<strong>시스템</strong> </span><i class="fa fa-rocket fa-fw"></i></h3>
            </a>
        </div><!--end .navbar-brand -->
        <a class="btn btn-transparent btn-equal navbar-toggle" data-toggle="collapse" data-target="#header-navbar-collapse"><i class="fa fa-wrench fa-lg"></i></a>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="header-navbar-collapse">
        <ul class="nav navbar-nav">
            <!-- <li><a href="../../html/dashboards/dashboard.html"><i class="fa fa-home fa-lg"></i></a></li> -->
            <li><a href="/index"><i class="fa fa-home fa-lg"></i></a></li>
        </ul><!--end .nav -->
        <ul class="nav navbar-nav navbar-right">
            <li><span class="navbar-devider"></span></li>
            <li class="dropdown">
                <a href="javascript:void(0);" class="navbar-profile dropdown-toggle text-bold" data-toggle="dropdown"> <i class="fa fa-fw fa-angle-down"></i></a>
                <ul class="dropdown-menu animation-slide">
                    <li class="divider"></li>
                    <li><a href="/account/logout"><i class="fa fa-fw fa-power-off text-danger"></i> 로그 아웃</a></li>
                </ul><!--end .dropdown-menu -->
            </li><!--end .dropdown -->
        </ul><!--end .nav -->
    </div><!--end #header-navbar-collapse -->
</nav>