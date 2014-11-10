<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 14. 6. 26
  Time: 오후 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<section>
<ol class="breadcrumb">
    <li><a href="/">홈</a></li>
    <li><a href="/">KAMIS 데이터 관리</a></li>
    <li class="active">알뜰장보기 데이터관리</li>
</ol>
<div class="section-header">
    <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 알뜰장보기 데이터관리 </h3> <h4><small>메인 노출유무를 선택할 수 있습니다.</small></h4>
</div>

<div class="section-body">
    <!-- START HORIZONTAL FORM -->
    <div class="row">
        <div class="col-lg-12">
            <div class="box table-bordered">
                <div class="box-body">
                    <form:form class="form-horizontal" id="searchForm"   method="GET"  name="searchForm" modelAttribute="paramAccount">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <label for="name" class="control-label">날짜</label>
                                    </div>
                                    <div class="col-lg-5 col-md-4 col-sm-6">
                                        <div class='input-group control-width-normal' id='demo-date'>
                                            <input type="text" class="form-control"/>
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <label for="select1" class="control-label">품명</label>
                                    </div>
                                    <div class="col-lg-10 col-md-8 col-sm-6">
                                        <input type="text" name="name" id="name" class="form-control" placeholder="검색어를 입력하세요.">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-body text-right">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i>  조회</button>
                            <a href="/admin/account/write"><button type="button" class="btn btn-success"><i class="fa fa-user"></i> 추가</button></a>
                        </div>
                </div><!--end .box-body -->
                    </form:form>
                </div>
            </div><!--end .box -->
        </div><!--end .col-lg-12 -->
    </div><!--end .row -->
    <!-- END HORIZONTAL FORM -->




    <!-- START DATATABLE 1 -->
    <div class="row">
        <!-- START HORIZONTAL BORDERED & BANDED FORM -->
        <div class="col-lg-12">
            <div class="box">

                <div class="box-body">



                    <table class="table table-bordered table-hover no-margin">
                    <thead>
                        <tr>
                            <th style="width:8%">메인 노출여부</th>
                            <th style="width:10%">순번</th>
                            <th>품명</th>
                            <th>오늘</th>
                            <th>어제</th>
                            <th>등락</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary btn-outline btn-rounded">
                                        <input type="radio" name="options" id="option1"><i class="fa fa-bell"></i>
                                    </label>
                                    <label class="btn btn-primary btn-outline btn-rounded">
                                        <input type="radio" name="options" id="option3"><i class="fa fa-bell-o"></i>
                                    </label>
                                </div>
                            </td>
                            <td>122</td>
                            <td>배추</td>
                            <td><h5>1,825원</h5></td>
                            <td><h5>1,925원</h5></td>
                            <td><h5>2.8% <small><span class="label label-danger">등락상승</span></small></h5></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary btn-outline btn-rounded">
                                        <input type="radio" name="options" id="option1"><i class="fa fa-bell"></i>
                                    </label>
                                    <label class="btn btn-primary btn-outline btn-rounded">
                                        <input type="radio" name="options" id="option3"><i class="fa fa-bell-o"></i>
                                    </label>
                                </div>
                            </td>
                            <td>123</td>
                            <td>무</td>
                            <td><h5>1,225원</h5></td>
                            <td><h5>1,225원</h5></td>
                            <td><h5>0.0% <small><span class="label label-warning">변동없음</span></small></h5></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary btn-outline btn-rounded">
                                        <input type="radio" name="options" id="option1"><i class="fa fa-bell"></i>
                                    </label>
                                    <label class="btn btn-primary btn-outline btn-rounded">
                                        <input type="radio" name="options" id="option3"><i class="fa fa-bell-o"></i>
                                    </label>
                                </div>
                            </td>
                            <td>124</td>
                            <td>감자</td>
                            <td><h5>1,925원</h5></td>
                            <td><h5>1,725원</h5></td>
                            <td><h5>2.8% <small><span class="label label-info">등락하락</span></small></h5></td>
                        </tr>
                        </tbody>
                    </table>
                </div><!--end .box-body -->
            </div><!--end .box -->
        </div><!--end .col-lg-12 -->

    <!-- END DATATABLE 1 -->
</div>
</section>

<content tag="local_script">
    <link type="text/css" rel="stylesheet" href="/resources/admin/css/theme-default/libs/bootstrap-datetimepicker/bootstrap-datetimepicker.css?1400398165" />
    <script src="/resources/admin/js/libs/moment/moment.min.js"></script>
    <script src="/resources/admin/js/libs/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
    <script src="/resources/admin/js/core/demo/DemoFormComponents.js"></script>
    <script>
        $(document).ready(function() {
            $("#name").focus();
        });
    </script>
</content>