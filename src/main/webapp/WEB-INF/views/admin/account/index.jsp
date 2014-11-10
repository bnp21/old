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
    <li><a href="/">시스템</a></li>
    <li class="active">사용자 관리</li>
</ol>
<div class="section-header">
    <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 사용자 관리 </h3> <h4><small>사용자를 추가하거나 삭제할 수 있습니다.</small></h4>
</div>

<div class="section-body">
    <!-- START HORIZONTAL FORM -->
    <div class="row">
        <div class="col-lg-12">
            <div class="box table-bordered">
                <div class="box-body">
                    <form id="searchForm" name="searchForm" action="/admin/account/index" method="post">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <label class="control-label">이름</label>
                                    </div>
                                    <div class="col-lg-10 col-md-8 col-sm-6">
                                        <input type="text" name="name" id="name" class="form-control" value="${paramAccount.name}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <label class="control-label">권한</label>
                                    </div>
                                    <div class="col-lg-10 col-md-8 col-sm-6">
                                        <select name="authority" id="authority" class="form-control">
                                            <option value="">전체</option>
                                            <c:forEach items="${authList}" var="list">
                                                <option value="${list.authId}" <c:if test="${list.authId==paramAccount.authority}">selected</c:if> >${list.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-1 col-md-2 col-sm-3">
                                <label class="control-label">
                                    계정활성화 여부
                                </label>
                            </div>
                            <div class="col-lg-11 col-md-10 col-sm-9">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" id="activation" name="activation" value="ENABLE" <c:if test="${paramAccount.activation == 'ENABLE'}">checked</c:if> > 활성화
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="box-body text-right">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i> 조회</button>
                        </form><!--폼 위치수정함 -->
                            <button type="button" class="btn btn-success" onclick="insertAction();"><i class="fa fa-user"></i>  사용자 추가</button>
                        </div>

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

                    <table class="table table-bordered table-hover no-margin">
                    <thead>
                        <tr>
                            <th>순번</th>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>권한</th>
                            <th>활성화여부</th>
                            <th class="text-center" style="widows: 10;0 px;">수정</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${accountList}" var="list">
                        <tr>
                            <td>${list.id}</td>
                            <td>${list.name}</td>
                            <td>${list.email}</td>
                            <td>${list.authority}</td>
                            <td><span class="label label-success">${list.activation}</span></td>
                            <td class="text-center">
                                <a href="/admin/account/mody/${list.id}"><button type="button" class="btn btn-xs btn-default btn-equal" data-toggle="tooltip" data-placement="top" data-original-title="수정"><i class="fa fa-pencil"></i></button></a>
                                <a href="javascript:insAction('${list.id}');"><button type="button" class="btn btn-xs btn-default btn-equal" style="background-color: greenyellow" data-toggle="tooltip" data-placement="top" data-original-title="활성화"><i class="fa fa-trash-o"></i></button></a>
                                <a href="javascript:delAction('${list.id}');"><button type="button" class="btn btn-xs btn-default btn-equal" data-toggle="tooltip" data-placement="top" data-original-title="비활성화"><i class="fa fa-trash-o"></i></button></a>
                            </td>
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

    <script>
        $(document).ready(function() {
            $("#name").focus();
        });

        function insertAction() {
                location.href = "/admin/account/write";
        }
        function insAction(seq) {
            if( confirm("정말 활성화하시겠습니까?") ){
                location.href = "/admin/account/ins/"+seq;
            }
        }

        function delAction(seq) {
            if( confirm("정말 비활성화하시겠습니까?") ){
                location.href = "/admin/account/del/"+seq;
            }
        }

        function checkSave(){

            $("#searchForm").submit();
        }

    </script>
</content>