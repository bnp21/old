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
    <li><a href="/">통계</a></li>
    <li class="active">생생정보 조회수</li>
</ol>
<div class="section-header">
    <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 생생정보 조회수 </h3> <h4><small>'aT생생정보' 생생정보 방문자 수와 페이지뷰를 알 수 있습니다.</small></h4>
</div>

<div class="section-body">
    <!-- START HORIZONTAL FORM -->
    <div class="row">
        <div class="col-lg-12">
            <div class="box table-bordered">
                <div class="box-body">
                    <form id="searchForm" name="searchForm" action="/admin/statistics2/index" method="post">
                        <input type="hidden" name="searchDateGbn" id="searchDateGbn" value="${statistics.searchDateGbn}"/>
                        <input type="hidden" name="excelYn" id="excelYn" value="N"/>
                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <div class="col-md-1">
                                        <label class="control-label">간편조회</label>
                                    </div>
                                    <div class="col-md-6">
                                        &nbsp;&nbsp;&nbsp;
                                        <button type="button" class="btn btn-success" onclick="search(0)">일 간</button>&nbsp;
                                        <!--
                                        <button type="button" class="btn btn-success" onclick="search(1)">주 간</button>&nbsp;
                                        -->
                                        <button type="button" class="btn btn-success" onclick="search(2)">월 간</button>&nbsp;
                                        <button type="button" class="btn btn-success" onclick="search(3)">년 간</button>&nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2" style="height:10%;">

                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <div class="col-md-1">
                                        <label class="control-label">일자지정</label>
                                    </div>
                                    <div class="col-md-3">
                                        <div class='input-group date' id='demo-date-start'>
                                            <input type="text" class="form-control" name="startDate" id="startDate" value="${statistics.startDate}"/>
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        </div>
                                    </div>
                                    <div class="col-md-1" style="width:1%;">
                                        ~
                                    </div>
                                    <div class="col-md-3">
                                        <div class='input-group date' id='demo-date-end'>
                                            <input type="text" class="form-control" name="endDate" id="endDate" value="${statistics.endDate}"/>
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        </div>
                                    </div>

                                    <div class="col-md-1">
                                        <button type="button" onclick="search()" class="btn btn-primary"><i class="fa fa-search"></i> 조회</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form><!--폼 위치수정함 -->
                </div><!--end .box-body -->

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
                    <div class="text-right">
                        <button type="button" class="btn btn-success" onclick="excelDownload();"><i class="fa fa-money"></i>  엑셀 다운로드</button>
                    </div>
                    <table class="table table-bordered table-hover no-margin">
                        <thead>
                        <tr align="center">
                            <th align="center">No.</th>
                            <th align="center">생생정보명</th>
                            <th align="center">방문자수(명)</th>
                            <th align="center">방문횟수(회)</th>
                            <th align="center">페이지뷰(회)</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="totVisitantCnt" value="0" />
                        <c:set var="totVisitCnt" value="0" />
                        <c:set var="totPageCnt" value="0" />
                        <c:forEach items="${statisticsList}" var="list">
                            <tr>
                                <td align="center">${list.seq}</td>
                                <td>${list.menuNm}</td>
                                <td align="right">${list.visitantCnt}</td>
                                <td align="right">${list.visitCnt}</td>
                                <td align="right">${list.pageCnt}</td>
                            </tr>
                            <c:set var="totVisitantCnt" value="${totVisitantCnt + list.visitantCnt}" />
                            <c:set var="totVisitCnt" value="${totVisitCnt + list.visitCnt}" />
                            <c:set var="totPageCnt" value="${totPageCnt + list.pageCnt}" />
                        </c:forEach>
                        <tr>
                            <td align="center" colspan="2">합 계</td>
                            <td align="right">${totVisitantCnt}</td>
                            <td align="right">${totVisitCnt}</td>
                            <td align="right">${totPageCnt}</td>
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
    <script src="/resources/admin/js/libs/blueimp-file-upload/vendor/jquery.ui.widget.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/vendor/tmpl.min.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/vendor/load-image.min.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/vendor/jquery.blueimp-gallery.min.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.iframe-transport.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload-process.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload-image.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload-audio.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload-video.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload-validate.js"></script>
    <script src="/resources/admin/js/libs/blueimp-file-upload/jquery.fileupload-ui.js"></script>
    <link type="text/css" rel="stylesheet" href="/resources/admin/css/theme-default/libs/bootstrap-datetimepicker/bootstrap-datetimepicker.css?1400398165" />
    <script src="/resources/admin/js/libs/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
    <script src="/resources/admin/js/core/demo/DemoFormComponents.js"></script>
    <script src="/resources/admin/js/core/demo/DemoFormComponents.js"></script>
    <script>
        $(document).ready(function() {
            $("#startDate").focus();
        });

        function search(gbn){
            $("#searchDateGbn").val(gbn);
            $("#excelYn").val("N");

            $("#searchForm").submit();
        }

        function excelDownload(){
            $("#excelYn").val("Y");

            $("#searchForm").submit();
        }

    </script>
</content>