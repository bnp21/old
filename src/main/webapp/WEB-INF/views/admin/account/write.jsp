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
        <li><a href="/">시스템 관리</a></li>
        <li class="active">사용자 관리</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i>사용자 추가</h3>
    </div>
    <div class="section-body">

    <div class="row">
    <div class="col-lg-12">
    <div class="box box-outlined">
    <div class="box-head">
        <header><h4 class="text-light"><i class="fa fa-pencil fa-fw"></i> 계정을 <strong>추가</strong> 합니다</h4></header>
    </div>
    <div class="box-body no-padding">
    <form class="form-horizontal form-banded form-bordered" action="/admin/account/insertAccount" accept-charset="utf-8" method="post" id="accountForm" name="accountForm">
        <input type="hidden" name="id" id="id" value="${accountView.id}">
    <div class="form-group">
        <div class="col-md-2">
            <label class="control-label">아이디</label>
        </div>
        <div class="col-md-10">
            <input type="text" class="form-control" id="email" name="email" value="${accountView.email}">
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-2">
            <label class="control-label">이름</label>
        </div>
        <div class="col-md-10">
            <input type="text" class="form-control" id="name" name="name" value="${accountView.name}">
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-2">
            <label class="control-label">패스워드</label>
        </div>
        <div class="col-md-10">
            <input type="password" class="form-control" id="password" name="password" value="${accountView.password}">
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-2">
            <label class="control-label">권한</label>
        </div>
        <div class="col-md-10">
            <select name="authority" id="authority" class="form-control">
                <option value="" <c:if test="${accountView.authority == ''}">selected</c:if> >권한없음</option>
                <c:forEach items="${authList}" var="list">
                    <option value="${list.authId}" <c:if test="${list.authId==accountView.authority}">selected</c:if> >${list.name}</option>
                </c:forEach>
            </select> &nbsp;
            <select name="authority2" id="authority2" class="form-control">
                <option value="" <c:if test="${accountView.authority2 == ''}">selected</c:if> >권한없음</option>
                <c:forEach items="${authList}" var="list">
                    <option value="${list.authId}" <c:if test="${list.authId==accountView.authority2}">selected</c:if> >${list.name}</option>
                </c:forEach>
            </select> &nbsp;
            <select name="authority3" id="authority3" class="form-control">
                <option value="" <c:if test="${accountView.authority3 == ''}">selected</c:if> >권한없음</option>
                <c:forEach items="${authList}" var="list">
                    <option value="${list.authId}" <c:if test="${list.authId==accountView.authority3}">selected</c:if> >${list.name}</option>
                </c:forEach>
            </select> &nbsp;
            <select name="authority4" id="authority4" class="form-control">
                <option value="" <c:if test="${accountView.authority4 == ''}">selected</c:if> >권한없음</option>
                <c:forEach items="${authList}" var="list">
                    <option value="${list.authId}" <c:if test="${list.authId==accountView.authority4}">selected</c:if> >${list.name}</option>
                </c:forEach>
            </select> &nbsp;
            <select name="authority5" id="authority5" class="form-control">
                <option value="" <c:if test="${accountView.authority5 == ''}">selected</c:if> >권한없음</option>
                <c:forEach items="${authList}" var="list">
                    <option value="${list.authId}" <c:if test="${list.authId==accountView.authority5}">selected</c:if> >${list.name}</option>
                </c:forEach>
            </select> &nbsp;
        </div>
    </div>
    </form>
    </div><!--end .box-body -->
        <div class="box-body text-right">
            <button type="button" class="btn btn-primary" onclick="checkSave();"><i class="fa fa-check-circle"></i>  저장</button>
            <a href="/admin/account"><button type="button" class="btn btn-danger"><i class="fa fa-ban"></i>  취소</button></a>

        </div>
    </div><!--end .box -->
    </div><!--end .col-lg-12 -->
    </div><!--end .row -->
    <!-- END BASIC FORM INPUTS -->


    </div><!--end .section-body -->
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
            $("#id").focus();
        });

        function checkSave(){
            if( $("#email").val() == "" ){
                alert("아이디를 입력해주세요");
                $("#email").focus();
                return false;
            }
            if( $("#name").val() == "" ){
                alert("이름을 입력해주세요");
                $("#name").focus();
                return false;
            }
            if( $("#password").val() == "" ){
                alert("비밀번호를 입력해주세요");
                $("#password").focus();
                return false;
            }
            if( $("#authority").val() == "" ){
                alert("권한을 선택해주세요");
                $("#authority").focus();
                return false;
            }
            $("#accountForm").submit();
        }
    </script>
</content>