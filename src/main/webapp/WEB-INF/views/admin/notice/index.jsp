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
        <li class="active">알림마당</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 알림마당 관리 </h3> <h4><small>알림마당을 추가하거나 삭제할 수 있습니다.</small></h4>
    </div>
    <div class="section-body">
        <!-- START DATATABLE 1 -->
        <div class="row">
            <div class="col-lg-12">
                <div class="box">
                    <div class="box-body">
                        <div class="text-right" style="padding-bottom:10px;"><a href="/admin/notice/write/ins/0"><button type="button" class="btn btn-success">글쓰기</button></a></div>
                        <!--form:form class="form-horizontal" id="listForm"   method="POST"  name="listForm" modelAttribute="paramNotice"-->
                            <input type="hidden" id="mode" name="mode" />
                            <table class="table table-bordered table-hover no-margin">
                                <thead>
                                <tr>
                                    <th style="width:10%">순번</th>
                                    <th style="width:*%">제목</th>
                                    <th style="width:15%">아이디</th>
                                    <th style="width:13%">등록일</th>
                                    <th class="text-right1" style="width:6%">관리</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${noticeList}" var="list">
                                    <tr>
                                        <td>${list.seq}</td>
                                        <td>${list.title}</td>
                                        <td>${list.accountId}</td>
                                        <td>${list.regdate}</td>
                                        <td class="text-left">
                                            <a href="/admin/notice/write/mody/${list.seq}"><button type="button" class="btn btn-xs btn-default btn-equal" data-toggle="tooltip" data-placement="top" data-original-title="Edit row"><i class="fa fa-pencil"></i></button></a>
                                            <a href="javascript:delAction('${list.seq}');"><button type="button" class="btn btn-xs btn-default btn-equal" data-toggle="tooltip" data-placement="top" data-original-title="Delete row"><i class="fa fa-trash-o"></i></button></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        <!--/form:form-->
                    </div><!--end .box-body -->
                </div><!--end .box -->
            </div><!--end .col-lg-12 -->
        </div>
        <!-- END DATATABLE 1 -->
    </div>
</section>

<content tag="local_script">
    <script>
        function delAction(seq) {
            if( confirm("정말 삭제하시겠습니까?") ){
                location.href = "/admin/notice/mody/del/"+seq;
            }
        }
    </script>
</content>