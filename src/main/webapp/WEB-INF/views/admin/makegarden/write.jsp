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
        <li class="active">창조마당 관리</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 창조마당 관리 </h3> <h4><small>창조마당의 답변을 등록/수정할 수 있습니다.</small></h4>
    </div>
    <div class="section-body">
        <!-- START DATATABLE 1 -->
        <div class="row">
            <div class="col-lg-12">
                <form class="form-horizontal form-banded form-bordered" role="form" id="makeGardenForm" method="POST" action="/admin/makegarden/insertMakeGarden" enctype="multipart/form-data">
                    <input type="hidden" name="seq" id="seq" value="${makeGardenView.seq}"/>
                    <input type="hidden" name="title" id="title" value="${makeGardenView.title}"/>
                    <input type="hidden" name="name" id="name" value="${makeGardenView.name}"/>
                    <input type="hidden" name="phone" id="phone" value="${makeGardenView.phone}"/>
                    <input type="hidden" name="email" id="email" value="${makeGardenView.email}"/>
                    <input type="hidden" name="addr" id="addr" value="${makeGardenView.addr}"/>
                    <input type="hidden" name="memo" id="memo" value="${makeGardenView.memo}"/>
                    <input type="hidden" name="createdate" id="createdate" value="${makeGardenView.createdate}"/>
                    <div class="box box-outlined">
                        <div class="box-body no-padding">
                            <div class="form-group">
                                <div class="col-md-1">
                                    <label class="control-label">제목</label>
                                </div>
                                <div class="col-md-12">
                                    ${makeGardenView.title}
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-1">
                                    <label class="control-label">성명</label>
                                </div>
                                <div class="col-md-5">
                                    ${makeGardenView.name}
                                </div>
                                <div class="col-md-1" style="background:none repeat scroll 0 0 #f2f2f2;">
                                    <label class="control-label">휴대전화번호</label>
                                </div>
                                <div class= col-md-5">
                                    ${makeGardenView.phone}
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-1">
                                    <label class="control-label">E-mail</label>
                                </div>
                                <div class="col-md-5">
                                    ${makeGardenView.email}
                                </div>
                                <div class="col-md-1" style="background:none repeat scroll 0 0 #f2f2f2;">
                                    <label class="control-label">주소</label>
                                </div>
                                <div class= col-md-5">
                                    ${makeGardenView.addr}
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-2">
                                    <label class="control-label">주요건의사항 및 창조적아이디어</label>
                                </div>
                                <div class="col-md-12">
                                    ${makeGardenView.memo}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box box-outlined">
                        <div class="box-body no-padding">
                            <div class="form-group">
                                <div class="col-md-1">
                                    <label class="control-label">답변</label>
                                </div>
                                <div class="col-md-12">
                                    <textarea id="replyMemo" name="replyMemo" style="width:90%;height:200px;">${makeGardenView.replyMemo}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-1">
                                    <label class="control-label">담당부서</label>
                                </div>
                                <div class="col-md-12">
                                    <input id="replyDept" name="replyDept" type="text" style="width:197px;" maxlength="80" value="${makeGardenView.replyDept}">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-1">
                                    <label class="control-label">연락처</label>
                                </div>
                                <div class="col-md-12">
                                    <input id="replyPhone" name="replyPhone" type="text" style="width:197px;" maxlength="80" value="${makeGardenView.replyPhone}">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-1">
                                    <label class="control-label">담당자</label>
                                </div>
                                <div class="col-md-12">
                                    <input id="replyName" name="replyName" type="text" style="width:197px;" maxlength="80" value="${makeGardenView.replyName}">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-1">
                                    <label class="control-label">E-mail</label>
                                </div>
                                <div class="col-md-12">
                                    <input id="replyEmail" name="replyEmail" type="text" style="width:197px;" maxlength="80" value="${makeGardenView.replyEmail}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-footer col-lg-offset-1 col-md-offset-2 col-sm-offset-3">
                        <button type="button" onclick='saveReply();' class="btn btn-primary">등록</button>
                        <button type="button" onclick='resetForm();' class="btn btn-default">Reset</button>
                    </div>
                </form>
            </div><!--end .col-lg-12 -->
        </div>
        <!-- END DATATABLE 1 -->
    </div>
</section>

<content tag="local_script">
    <script type="text/javascript">
        function saveReply(){
            if( $("#replyMemo").val()=="" ){
                alert("답변을 입력해주세요.");
                $("#replyMemo").focus();
                return false;
            }
            if( $("#replyDept").val()=="" ){
                alert("담당부서를 입력해주세요.");
                $("#replyDept").focus();
                return false;
            }
            if( $("#replyPhone").val()=="" ){
                alert("연락처를 입력해주세요.");
                $("#replyPhone").focus();
                return false;
            }
            if( $("#replyName").val()=="" ){
                alert("담당자명을 입력해주세요.");
                $("#replyName").focus();
                return false;
            }
            if( $("#replyEmail").val()=="" ){
                alert("E-mail을 입력해주세요.");
                $("#replyEmail").focus();
                return false;
            }
            $("#makeGardenForm").submit();
        }

        function resetForm(){
            $("#makeGardenForm").reset();
        }
    </script>
</content>