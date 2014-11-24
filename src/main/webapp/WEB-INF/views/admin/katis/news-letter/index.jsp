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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<section>
    <ol class="breadcrumb">
        <li><a href="/admin/">홈</a></li>
        <li><a href="/admin/">수출정보</a></li>
        <li class="active">뉴스 레터</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 뉴스 레터 </h3> <h4><small>뉴스 레터 리스트 화면입니다.</small></h4>
    </div>
    <%--
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 뉴스 레터 <button type="button" class="btn btn-rounded btn-info"  data-toggle="modal" data-target="#simpleModal">변경</button> </h3>
        <h4><small>링크를 변경하시려면 '변경' 버튼을 클릭해주세요.</small></h4>
    </div>
    <div class="modal fade" id="simpleModal" tabindex="-1" role="dialog" aria-labelledby="simpleModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="formModalLabel">기본정보 변경</h4>
                </div>
                <form:form class="form-horizontal" role="form" enctype="multipart/form-data"  action="/admin/katis/news-letter/mainSave" method="POST" id="newsLetterForm" name="newsLetterForm">
                    <div class="modal-body">
                            <!--
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label for="title" class="control-label">제목</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="text" name="title" id="title" class="form-control" value="${menuList[0].title}" placeholder="화면에 표시될 TEXT를 입력해주세요.">
                                </div>
                            </div>
                            -->
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label for="url" class="control-label">Link URL</label>
                            </div>
                            <div class="col-sm-9">
                                <input type="text" name="url" id="url" class="form-control" value="${menuList[0].url}">
                                <input type="hidden" name="outlinkYn" value="Y" >
                            </div>
                        </div>
                            <!--
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label for="file" class="control-label">외부/내부링크 구분</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="radio" name="outlinkYn" value="Y" <c:if test="${menuList[0].outlinkYn == 'Y'}">checked</c:if> > 외부링크

                                    <input type="radio" name="outlinkYn" value="N" <c:if test="${list[0].outlinkYn != 'Y'}">checked</c:if>> 내부링크
                                </div>
                            </div>
                            -->

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" onclick="checkSave();">저장</button>
                    </div>
                </form:form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
    --%>
    <div class="section-body">
        <!-- START DATATABLE 1 -->
        <div class="row">
            <!-- START HORIZONTAL BORDERED & BANDED FORM -->
            <div class="col-lg-12">
                <div class="box">
                    <div class="box-body">
                        <table class="table table-bordered table-hover no-margin">
                            <thead>
                            <tr>
                                <th style="width:20%">기간</th>
                                <th>제목</th>
                                <th style="width:10%">노출여부</th>
                                <th style="width:15%">등록일</th>
                                <th style="width:15%">관리</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${newsLetterList}" var="list">
                                <tr>
                                    <td>${fn:substring(list.pkDate, 0, 4)}년 ${fn:substring(list.pkDate, 4, 6)}월 ${fn:substring(list.pkDate, 6, 8)}일</td>
                                    <td><h5>${list.title}</h5></td>
                                    <td><c:choose><c:when test="${list.viewYn == 'Y'}">노출</c:when><c:otherwise>미노출</c:otherwise></c:choose></td>
                                    <td>${list.createdate}</td>
                                    <td><button type="button" class="btn btn-support2" onclick="modyAction('${list.pkDate}');"><i class="fa fa-cut"></i>  데이터 수정</button></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div><!--end .box-body -->
                </div><!--end .box -->
            </div><!--end .col-lg-12 -->

            <!-- END DATATABLE 1 -->
        </div>
    </div>
</section>

<content tag="local_script">
    <script style="text/javascript">
        <!--
        function modyAction(loadDate){
            location.href = "/admin/katis/news-letter/write/"+loadDate;
        }

        function checkSave(){
            $("#newsLetterForm").submit();
        }
        //-->
    </script>
</content>