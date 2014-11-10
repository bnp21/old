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
        <li><a href="/admin/">시스템 관리</a></li>
        <li class="active">품목 리스트</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 품목 리스트 </h3> <h4><small> 품목 리스트를 조회할 수 있습니다.</small></h4>
    </div>
    <div class="section-body">
        <!-- START DATATABLE 1 -->
        <div class="row">
            <div class="col-lg-12">
                <div class="box">
                    <div class="box-body">
                        <form:form class="form-horizontal" id="listForm"   method="POST"  name="listForm" modelAttribute="paramNotice">
                            <input type="hidden" id="mode" name="mode" />
                            <table class="table table-bordered table-hover no-margin">
                                <thead>
                                <tr>
                                    <th style="width:15%">그룹코드</th>
                                    <th style="width:15%">그룹명</th>
                                    <th style="width:15%">품번코드</th>
                                    <th >품명</th>
                                    <th style="width:15%" class="text-right1">사용여부</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${item_list}" var="list">
                                    <tr>
                                        <td>${list.groupCode}</td>
                                        <td>${list.name}</td>
                                        <td>${list.id}</td>
                                        <td>${list.name}</td>
                                        <td>${list.useYn}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </form:form>
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