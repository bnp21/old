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
        <li><a href="/admin/">홈</a></li>
        <li><a href="/admin/">유통정보</a></li>
        <li class="active">농축수산물 소매가격 일일동향</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 농축수산물 소매가격 일일동향 <button type="button" class="btn btn-rounded btn-info"  data-toggle="modal" data-target="#simpleModal">변경</button></h3> <h4><small>농축수산물 소매가격 일일동향 노출 데이터를 선택할 수 있습니다.</small></h4>
    </div>
    <div class="modal fade" id="simpleModal" tabindex="-1" role="dialog" aria-labelledby="simpleModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="formModalLabel">기본정보 변경</h4>
                </div>
                <form:form class="form-horizontal" role="form" enctype="multipart/form-data"  action="/admin/kamis/daily_price/mainSave" method="POST" id="dailyPriceForm" name="dailyPriceForm">
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
    <!-- START DATATABLE 1 -->
    <div class="row">
        <!-- START HORIZONTAL BORDERED & BANDED FORM -->
        <div class="col-lg-12">
            <div class="box">

                <div class="box-body">
                    <table class="table table-bordered table-hover no-margin">
                        <thead>
                        <tr>
                            <th width="12%">기준일</th>
                            <th width="15%">등록일</th>
                            <th width="15%">수정일</th>
                            <th width="15%">관리</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${dailyPriceList}" var="list">
                            <tr>
                                <td>${list.pkDate}</td>
                                <td>${list.createdate}</td>
                                <td>${list.updatedate}</td>
                                <td><a href="/admin/kamis/daily_price/write/${list.pkDate}">[수정]</a> / <a href="javascript:;" onclick="checkDel('${list.pkDate}');">[삭제]</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div><!--end .box-body -->
            </div><!--end .box -->
        </div><!--end .col-lg-12 -->
        <!-- END DATATABLE 1 -->
    </div>
</section>

<content tag="local_script">
    <script type="text/javascript">
        function checkDel(delSeq){
            if( confirm("정말 삭제하시겠습니까?") ){
                location.href = "/admin/kamis/daily_price/delDailyPrice/"+delSeq;
            }
        }

        function checkSave(){

            $("#dailyPriceForm").submit();
        }
    </script>
</content>