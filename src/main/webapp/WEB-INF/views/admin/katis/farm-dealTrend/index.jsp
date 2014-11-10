<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 14. 6. 26
  Time: 오후 02:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<section>
    <ol class="breadcrumb">
        <li><a href="/admin/">홈</a></li>
        <li><a href="/admin/">수출정보</a></li>
        <li class="active">주요 농산물 일일거래동향</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 주요 농산물 일일거래동향 <button type="button" class="btn btn-rounded btn-info"  data-toggle="modal" data-target="#simpleModal">변경</button></h3>
        <h4><small>주요 농산물 일일거래동향를 수정할 수 있습니다.<br/>상세페이지 하단 링크를 변경하시려면 '변경' 버튼을 클릭해주세요.</small></h4>
    </div>
    <div class="modal fade" id="simpleModal" tabindex="-1" role="dialog" aria-labelledby="simpleModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="formModalLabel">기본정보 변경</h4>
                </div>
                <form:form class="form-horizontal" role="form" enctype="multipart/form-data"  action="/admin/katis/farm-dealTrend/mainSave" method="POST" id="farmDealTrendForm" name="farmDealTrendForm">
                    <input type="hidden" name="id" id="id" value="1">
                    <input type="hidden" name="delFile" id="delFile"/>
                    <div class="modal-body">
                            <%--<div class="form-group">
                                <div class="col-sm-3">
                                    <label for="title" class="control-label">제목</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="text" name="title" id="title" class="form-control" value="${list[0].title}" placeholder="화면에 표시될 TEXT를 입력해주세요.">
                                </div>
                            </div>--%>
                            <%--<div class="form-group">
                                <div class="col-sm-3">
                                    <label for="file" class="control-label">메인이미지</label>
                                </div>
                                <div class="col-sm-9">
                                    <span id="fileName">${list[0].fileName} <span id="delImg" onclick="checkDel();">X</span></span>
                                    <input type="file" name="file" id="file">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label for="url" class="control-label">Link URL</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="text" name="url" id="url" class="form-control" value="${list[0].url}">
                                    ※ 기본 상세 URL : exportweather/
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label for="file" class="control-label">메인 외부/내부링크 구분</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="radio" name="outlinkYn" value="Y" <c:if test="${menuList[0].outlinkYn == 'Y'}">checked</c:if> > 외부링크
                                    <input type="radio" name="outlinkYn" value="N" <c:if test="${menuList[0].outlinkYn != 'Y'}">checked</c:if>> 내부링크
                                </div>
                            </div>--%>
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label for="footerurl" class="control-label">FOOTER URL</label>
                            </div>
                            <div class="col-sm-9">
                                <input type="text" name="footerurl" id="footerurl" class="form-control" value="${menuList[0].footerurl}">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" onclick="checkSave();">저장</button>
                    </div>
                </form:form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    <div class="section-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="box box-outlined">
                    <div class="box-head">
                        <header><h4 class="text-light"><i class="fa fa-pencil fa-fw"></i> 엑셀  <strong>업로드</strong></h4></header>
                    </div>
                    <div class="box-body no-padding">
                       <form:form commandName="farmDealTrend" class="form-horizontal form-banded form-bordered" enctype="multipart/form-data"  action="/admin/katis/farm-dealTrend/excelUpload" method="POST">

                            <div class="form-group">
                                <div class="col-md-2">
                                    <label class="control-label">파일 선택</label>
                                </div>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <form:input type="file" path="file" style="margin-top: 5px;" />
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="text-left"><a href="#"><button type="submit" class="btn btn-success">업로드</button></a> &nbsp; <a href="/download/excel/01"> ex.주요농산물일일거래동향.xlsx</a></div>
                                </div>
                            </div>
                        </form:form>
                    </div><!--end .box-body -->
                </div><!--end .box -->
            </div><!--end .col-lg-12 -->
        </div><!--end .row -->
        <!-- END BASIC FORM INPUTS -->
        <!-- START DATATABLE 1 -->
        <div class="row">
            <div class="col-lg-12">
                <div class="box">
                    <div class="box-body">
                        <!--
                        <div class="text-right" style="padding-bottom:10px;"><a href="/admin/katis/farm-dealTrend"><button type="button" class="btn btn-success">조회</button></a></div>
                        <input type="hidden" id="mode" name="mode" />
                        -->
                        <table class="table table-bordered table-hover no-margin">
                            <thead>
                            <tr>
                                <th rowspan="2" style="width:3%">기준일자</th>
                                <th rowspan="2" style="width:10%">품명</th>
                                <th colspan="2" >금액</th>
                                <th rowspan="2" style="width:15%">위험도</th>
                                <th rowspan="2" style="width:15%">업로드일자</th>
                                <th rowspan="2" style="width:15%">작성자</th>
                                <th rowspan="2" style="width:13%">등록일</th>
                            </tr>
                            <tr>
                                <th style="width:7%">기준일 금액</th>
                                <th style="width:7%">1년전 금액</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${farmDealTrendList}" var="list">
                                <tr>
                                    <c:if test="${list.itemCode=='A01'}">
                                        <td rowspan="5" class="dev_date"> ${list.standardDate}</td>
                                    </c:if>
                                    <td>${list.itemName}</td>
                                    <td style="text-align:right">${list.standardPrice}</td>
                                    <td style="text-align:right">${list.yearPrice}</td>
                                    <td>${list.danger}</td>
                                    <td>${list.updatedate}</td>
                                    <td>${list.updateid}</td>
                                    <td>${list.createdate}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div><!--end .box-body -->
                </div><!--end .box -->
            </div><!--end .col-lg-12 -->
        </div>
        <!-- END DATATABLE 1 -->
        <!-- commend layer-->
        <div class="modal fade" id="commendModal" tabindex="-1" role="dialog" aria-labelledby="commendModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="formCommendModalLabel">해석 입력</h4>
                    </div>
                    <form:form class="form-horizontal" role="form">
                        <input type="hidden" name="referenceDate" id="referenceDate">
                        <input type="hidden" name="mode" id="mode">
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="col-lg-11 col-md-10 col-sm-9">
                                    <textarea id="ckeditor" name="contents" class="form-control control-12-rows" placeholder="Enter text ..." >
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="commendReset();">취소</button>
                            <button type="button" class="btn btn-primary" onclick="commendSave();">저장</button>
                        </div>
                    </form:form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->

        </div>
    </div>
</section>

<content tag="local_script">
    <script src="/resources/admin/js/libs/jquery/jquery-1.11.0.min.js"></script>
    <script src="/resources/admin/js/core/BootstrapFixed.js"></script>
    <script src="/resources/admin/js/libs/ckeditor/ckeditor.js"></script>
    <script src="/resources/admin/js/libs/ckeditor/adapters/jquery.js"></script>
    <script src="/resources/admin/js/core/demo/DemoFormEditors.js"></script>
    <script src="/resources/admin/js/core/demo/Demo.js"></script>
    <script>
        $(document).ready(function(){
            $(".dev_btnmody").click(function(){
                var indexId = $(this).parents("tr").find(".dev_date").html();
                $("#referenceDate").val(indexId);
                $.get("/admin/fis/commendView?referenceDate="+indexId, function(data, status){
                    if( data.length > 0 ) {
                        $.each(data, function (i) {
                            $("#ckeditor").val(data[i].comments);
                        });
                        $("#referenceDate").val("mody");
                    }else{
                        $("#referenceDate").val("ins");
                    }
                })
            });
        });

        function commendReset(){
            $("#referenceDate").val("");
            $("#ckeditor").val("");
        }

        function commendSave(){
            $.get("/admin/fis/commendSave?mode="+$("#mode").val()+"&referenceDate="+indexId+"&comments="+$("#ckeditor").val(), function(data, status){
                if( data.length > 0 ) {
                    $.each(data, function (i) {
                        $("#ckeditor").val(data[i].comments);
                    });
                }
            })
        }

        function checkSave(){
            $("#farmDealTrendForm").submit();
        }
    </script>
</content>