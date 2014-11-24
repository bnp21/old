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
    <li class="active">데이터 다운로드</li>
</ol>
<div class="section-header">
    <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 데이터 다운로드 </h3> <h4><small>자세한 통계자료를 엑셀 파일로 다운로드 할 수 있습니다.</small></h4>
</div>

<div class="section-body">
    <!-- START HORIZONTAL FORM -->
    <div class="row">
        <div class="col-lg-12">
            <div class="box table-bordered">
                <div class="box-body">
                    <form id="searchForm" name="searchForm" action="/admin/statistics4/index" method="post">
                        <input type="hidden" name="excelYn" id="excelYn" value="N"/>
                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <label class="control-label">1. 데이터 종류를 선택하세요.</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="radio" value="0" name="searchViewGbn" <c:if test="${statistics.searchViewGbn == '0' || statistics.searchViewGbn == null }">checked</c:if> > 메인
                                        &nbsp;<input type="radio" value="1" name="searchViewGbn" <c:if test="${statistics.searchViewGbn == '1'}">checked</c:if>> 모바일 메인
                                        &nbsp;<input type="radio" value="2" name="searchViewGbn" <c:if test="${statistics.searchViewGbn == '2'}">checked</c:if>> 생생정보
                                        &nbsp;<input type="radio" value="3" name="searchViewGbn" <c:if test="${statistics.searchViewGbn == '3'}">checked</c:if>> 원본
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2" style="height:20px;">

                        </div>

                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <label class="control-label">2. 옵션을 선택하세요.</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="radio" value="0" name="searchCntGbn" <c:if test="${statistics.searchCntGbn == '0' || statistics.searchCntGbn == null }">checked</c:if> > 전체
                                        &nbsp;<input type="radio" value="1" name="searchCntGbn" <c:if test="${statistics.searchCntGbn == '1'}">checked</c:if>> 방문자수
                                        &nbsp;<input type="radio" value="2" name="searchCntGbn" <c:if test="${statistics.searchCntGbn == '2'}">checked</c:if>> 방문횟수
                                        &nbsp;<input type="radio" value="3" name="searchCntGbn" <c:if test="${statistics.searchCntGbn == '3'}">checked</c:if>> 페이지뷰
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2" style="height:20px;">

                        </div>

                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <label class="control-label">3. 기간을 지정하세요.</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group">
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
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2" style="height:20px;">

                        </div>

                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <label class="control-label">4. 해당 기간을 선택하시고 '엑셀 다운로드'를 클릭하세요.</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="radio" value="0" id="searchDateGbn" name="searchDateGbn" <c:if test="${statistics.searchDateGbn == '0'}">checked</c:if> > 일 간
                                        &nbsp;<input type="radio" value="1" name="searchDateGbn" <c:if test="${statistics.searchDateGbn == '1'}">checked</c:if>> 월 간
                                        &nbsp;<input type="radio" value="2" name="searchDateGbn" <c:if test="${statistics.searchDateGbn == '2'}">checked</c:if>> 년 간
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button type="button" class="btn btn-success" onclick="excelDownload();"><i class="fa fa-money"></i>  엑셀 다운로드</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-10" style="height:20px;">

                        </div>
                        <div class="row">
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <p>
                                            ① 일간은 최근 3개월까지 가능합니다.<br>
                                            ② 월간은 최근 36개월까지 가능합니다.<br>
                                            ③ 년간은 최근 5년까지 가능합니다.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-10" style="height:20px;">

                        </div>

                    </form><!--폼 위치수정함 -->
                </div><!--end .box-body -->

                </div>
            </div><!--end .box -->
        </div><!--end .col-lg-12 -->
    </div><!--end .row -->
    <!-- END HORIZONTAL FORM -->




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

        function excelDownload() {

            if ( $("input:radio[name='searchViewGbn']").is(":checked") == false ) {
                alert("데이터종류를 선택하세요.");
                $("#searchViewGbn").focus();
                return false;
            }

            if ( $("input:radio[name='searchCntGbn']").is(":checked") == false ) {
                alert("옵션을 선택하세요.");
                $("#searchCntGbn").focus();
                return false;
            }

            if ($("#startDate").val() == "") {
                alert("시작일자를 선택하세요.");
                $("#startDate").focus();
                return false;
            }

            if ($("#endDate").val() == "") {
                alert("종료일자를 선택하세요.");
                $("#endDate").focus();
                return false;
            }

            if ($("#startDate").val() > $("#endDate").val()) {
                alert("시작일자가 종료일자보다 큽니다.");
                $("#searchDateGbn").focus();
                return false;
            }

            if ( $("input:radio[name='searchDateGbn']").is(":checked") == false ) {
                alert("해당기간을 선택하세요.");
                $("#searchDateGbn").focus();
                return false;
            }

            var startDate = $("#startDate").val();
            var endDate = $("#endDate").val();

            var startDateArray = startDate.split("-");
            var endDateArray = endDate.split("-");

            var startDateObj = new Date(startDateArray[0], Number(startDateArray[1]) - 1, startDateArray[2]);
            var endDateObj = new Date(endDateArray[0], Number(endDateArray[1]) - 1, endDateArray[2]);

            var betweenDay = (endDateObj.getTime() - startDateObj.getTime()) / 1000 / 60 / 60 / 24;

            //alert(betweenDay);
            //alert($(':radio[name="searchDateGbn"]:checked').val());

            if ($(':radio[name="searchDateGbn"]:checked').val() == 0) {

                if (betweenDay > 92) {
                    alert("일간은 최근 3개월까지 가능합니다.");
                    $("#endDateObj").focus();
                    return false;
                }

            }else if( $(':radio[name="searchDateGbn"]:checked').val() == 1){
                if (betweenDay > 365*3) {
                    alert("월간은 최근 36개월까지 가능합니다.");
                    $("#endDateObj").focus();
                    return false;
                }
            }else{

                if (betweenDay > 365*5) {
                    alert("년간은 최근 5년까지 가능합니다.");
                    $("#endDateObj").focus();
                    return false;
                }

            }

            $("#excelYn").val("Y");

            $("#searchForm").submit();
        }

    </script>
</content>