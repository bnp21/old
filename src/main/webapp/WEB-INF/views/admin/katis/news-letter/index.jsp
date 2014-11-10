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
        <li class="active">뉴스 레터</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 뉴스 레터 <button type="button" class="btn btn-rounded btn-info"  data-toggle="modal" data-target="#simpleModal">변경</button> </h3>
        <h4><small>링크를 변경하시려면 '변경' 버튼을 클릭해주세요. </small></h4>
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
                            <%--
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label for="file" class="control-label">외부/내부링크 구분</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="radio" name="outlinkYn" value="Y" <c:if test="${menuList[0].outlinkYn == 'Y'}">checked</c:if> > 외부링크

                                    <input type="radio" name="outlinkYn" value="N" <c:if test="${list[0].outlinkYn != 'Y'}">checked</c:if>> 내부링크
                                </div>
                            </div>
                            --%>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" onclick="checkSave();">저장</button>
                    </div>
                </form:form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>
</section>

<content tag="local_script">
    <script>
        function checkSave(){

            if( $("#url").val() == "" ){
                alert("링크주소를 입력하세요.");
                return false;
            }
            $("#newsLetterForm").submit();
        }

    </script>
</content>