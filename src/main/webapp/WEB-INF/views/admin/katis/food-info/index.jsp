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
        <li class="active">Global Food Info</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> Global Food Info <button type="button" class="btn btn-rounded btn-info"  data-toggle="modal" data-target="#simpleModal">변경</button> </h3>
        <h4><small>Global Food Info를 추가하거나 수정할 수 있습니다.<br/>대표이미지와 링크를 변경하시려면 '변경' 버튼을 클릭해주세요. </small></h4>
    </div>
    <div class="modal fade" id="simpleModal" tabindex="-1" role="dialog" aria-labelledby="simpleModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="formModalLabel">기본정보 변경</h4>
                </div>
                <form:form class="form-horizontal" role="form" enctype="multipart/form-data"  action="/admin/katis/food-info/mainSave" method="POST" id="foodInfoForm" name="foodInfoForm">
                    <input type="hidden" name="id" id="id" value="1">
                    <input type="hidden" name="delFile" id="delFile"/>
                    <div class="modal-body">
                        <%--<div class="form-group">
                            <div class="col-sm-3">
                                <label for="title" class="control-label">제목</label>
                            </div>
                            <div class="col-sm-9">
                                <input type="text" name="title" id="title" class="form-control" value="${menuList[0].title}" placeholder="화면에 표시될 TEXT를 입력해주세요.">
                            </div>
                        </div>--%>
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label for="file" class="control-label">메인이미지</label>
                            </div>
                            <div class="col-sm-9">
                                <span id="fileName">${menuList[0].fileName} <span id="delImg" onclick="checkDel();">X</span></span>
                                <input type="file" name="file" id="file">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label for="url" class="control-label">Link URL</label>
                            </div>
                            <div class="col-sm-9">
                                <input type="text" name="url" id="url" class="form-control" value="${menuList[0].url}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label for="file" class="control-label">외부/내부링크 구분</label>
                            </div>
                            <div class="col-sm-9">
                                <input type="radio" name="outlinkYn" value="Y" <c:if test="${menuList[0].outlinkYn == 'Y'}">checked</c:if> > 외부링크
                                <input type="radio" name="outlinkYn" value="N" <c:if test="${menuList[0].outlinkYn != 'Y'}">checked</c:if>> 내부링크
                            </div>
                        </div>
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
    <div class="row">
        <!-- START HORIZONTAL BORDERED & BANDED FORM -->
        <div class="col-lg-12">
            <div class="box">
                <div class="box-body">
                    <!--
                    <div class="text-right" style="padding-bottom:10px;">
                        <a href="/admin/katis/food-info/write/0"><button type="button" class="btn btn-success"><i class="fa fa-money"></i>  데이터 추가</button></a>
                    </div>
                    -->
                    <table class="table table-bordered table-hover no-margin">
                        <thead>
                        <tr>
                            <th width="20%">1번탭 제목</th>
                            <th width="20%">2번탭 제목</th>
                            <th width="20%">3번탭 제목</th>
                            <th width="10%">등록일</th>
                            <th width="10%">수정일</th>
                            <th width="10%">관리</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${foodInfoList}" var="list">
                            <tr>
                                <td>${list.tab1Title}</td>
                                <td>${list.tab2Title}</td>
                                <td>${list.tab3Title}</td>
                                <td>${list.createdate}</td>
                                <td>${list.updatedate}</td>
                                <td><a href="/admin/katis/food-info/write/${list.seq}">[수정]</a> <!-- / <a href="javascript:;" onclick="delAction('${list.seq}')">[삭제]</a> --></td>
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
    <script>
        function checkSave(){
            if( $("#fileName").html == "" && $("#file").val() == "" ){
                alert("메인이미지 파일을 등록해주세요.");
                return false;
            }
            $("#foodInfoForm").submit();
        }

        function checkDel(){
            $("#fileName").html("");
            $("#delFile").val("Y");
        }

        function delAction(delNum){
            if( confirm("정말 삭제하시겠습니까?") ) {
                location.href = "/admin/katis/food-info/del/" + delNum;
            }
        }
    </script>
</content>