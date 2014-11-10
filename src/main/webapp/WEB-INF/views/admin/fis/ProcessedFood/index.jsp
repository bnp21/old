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
        <li><a href="/admin/">식품정보</a></li>
        <li class="active">주요 가공식품 주간 가격동향</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 주요 가공식품 주간 가격동향 <button type="button" class="btn btn-rounded btn-info"  data-toggle="modal" data-target="#simpleModal">변경</button></h3>
    </div>
    <div class="modal fade" id="simpleModal" tabindex="-1" role="dialog" aria-labelledby="simpleModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="formModalLabel">기본정보 변경</h4>
                </div>
                <form:form class="form-horizontal" role="form" enctype="multipart/form-data"  action="/admin/fis/ProcessedFood/mainSave" method="POST" id="ProcessedFoodForm" name="ProcessedFoodForm">
                    <input type="hidden" name="delFile" id="delFile"/>
                    <div class="modal-body">
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
                        <form:form commandName="processedFood" class="form-horizontal form-banded form-bordered" enctype="multipart/form-data"  action="/admin/fis/ProcessedFood/excelUpload" method="POST">
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
                                    <div class="text-left"><a href="#"><button type="submit" class="btn btn-success">업로드</button></a>  &nbsp; <a href="/download/excel/02"> ex.주요가공식품주간가격동향.xlsx</a></div>
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
                        <%--<div class="text-right" style="padding-bottom:10px;"><a href="/admin/fis/grain-marketCondition"><button type="button" class="btn btn-success">조회</button></a></div>--%>
                            <table class="table table-bordered table-hover no-margin">
                                <thead>
                                <tr>
                                    <th rowspan="2" style="width:3%">기준일자</th>
                                    <th rowspan="2" style="width:10%">품명</th>
                                    <th rowspan="2" style="width:10%">대표제품</th>
                                    <th colspan="3" >금액</th>
                                    <th rowspan="2" style="width:15%">업로드일자</th>
                                    <th rowspan="2" style="width:15%">작성자</th>
                                    <th rowspan="2" style="width:13%">등록일</th>
                                </tr>
                                <tr>
                                    <th style="width:7%">금주가격</th>
                                    <th style="width:7%">전월대비</th>
                                    <th style="width:7%">전원대비 증감</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="listCnt" value="1" />
                                <c:forEach items="${processedFoodList}" var="list">
                                    <tr>
                                        <c:if test="${listCnt == 1 || listCnt%12 == 1}">
                                            <td rowspan="12" class="dev_date"> ${list.referenceDateFrom} ~ ${list.referenceDateTo}
                                                <br>
                                                    <a href="javascript:delAction('${list.referenceDateFrom}','${list.referenceDateTo}');"><span class="label label-success">삭제</span></a>
                                                </br>
                                            </td>
                                        </c:if>
                                        <td>${list.itemName} (${list.unit})</td>
                                        <td style="text-align:right">${list.productName}</td>
                                        <td style="text-align:right">${list.weeklyPrice}</td>
                                        <td style="text-align:right">${list.lastMonthPrice}</td>
                                        <td style="text-align:right">${list.weeklyFluctuation}</td>
                                        <td>${list.updatedate}</td>
                                        <td>${list.updateid}</td>
                                        <td>${list.createdate}</td>
                                    </tr>
                                <c:set var="listCnt" value="${listCnt+1}" />
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
        var indexId = "";
        $(document).ready(function(){
            $(".dev_btnmody").click(function(){
                indexId = $(this).parents("tr").find(".dev_date").html();
                $("#referenceDate").val(indexId);
                $.get("/admin/fis/commendView?referenceDate="+indexId, function(data, status){

                    if( data.comments != "" ) {
                        $("#ckeditor").val(data.comments);
                        $("#mode").val("mody");
                    }else{
                        $("#mode").val("ins");
                    }
                })
            });
        });

        function commendReset(){
            $("#referenceDate").val("");
            $("#ckeditor").val("");
            indexId = "";
        }

        function commendSave(){
            $.get("/admin/fis/commendSave?mode="+$("#mode").val()+"&referenceDate="+indexId+"&comments="+$("#ckeditor").val(), function(data, status){
                if( data.length > 0 ) {
                    $.each(data, function (i) {
                        $("#ckeditor").val(data.comments);
                    });
                }
                location.href="/admin/fis/grain-marketCondition";
            })
        }

        function checkSave(){
            $("#ProcessedFoodForm").submit();
        }

        function delAction(fromDate,toDate) {
            if( confirm("정말 삭제하시겠습니까?") ){
                location.href = "/admin/fis/ProcessedFood/del/"+fromDate+"/"+toDate;
            }
        }
    </script>
</content>