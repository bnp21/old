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
        <li><a href="/admin/">식품정보</a></li>
        <li class="active">국내외 식품산업 주요지표</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 국내외 식품산업 주요지표 <button type="button" class="btn btn-rounded btn-info"  data-toggle="modal" data-target="#simpleModal">변경</button></h3> <h4><small>대표이미지와 링크를 변경하시려면 '변경' 버튼을 클릭해주세요.</br>국내외 식품산업 주요지표 데이터를 추가하거나 수정할 수 있습니다.</small></h4>
    </div>    <!-- START DATATABLE 1 -->
    <div class="modal fade" id="simpleModal" tabindex="-1" role="dialog" aria-labelledby="simpleModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="formModalLabel">기본정보 변경</h4>
                </div>
                <form:form class="form-horizontal" role="form" enctype="multipart/form-data"  action="/admin/fis/mainIndicators/mainSave" method="POST" id="indicatorsForm" name="indicatorsForm">
                    <input type="hidden" name="delFile" id="delFile"/>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label for="title" class="control-label">제목</label>
                            </div>
                            <div class="col-sm-9">
                                <input type="text" name="title" id="title" class="form-control" value="${menuList[0].title}" placeholder="화면에 표시될 TEXT를 입력해주세요.">
                            </div>
                        </div>
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
                                ※ 기본 상세 URL : mainIndicators/
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
                    <!-- <div class="text-right" style="padding-bottom:10px;"><a href="/admin/fis/mainIndicators/write/0"><button type="button" class="btn btn-success"><i class="fa fa-money"></i>  데이터 추가</button></a></div> -->
                    <table class="table table-bordered table-hover no-margin">
                        <thead>
                        <tr>
                            <th width="20%">1번탭 이미지</th>
                            <th width="20%">2번탭 이미지</th>
                            <th width="20%">3번탭 이미지</th>
                            <th width="10%">등록일</th>
                            <th width="10%">수정일</th>
                            <th width="10%">관리</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${mainIndicatorsList}" var="list">
                            <tr>
                                <td><img src="/resources/front/upload/main-indicators/${list.imgTab1On}" height="20px"></td>
                                <td><img src="/resources/front/upload/main-indicators/${list.imgTab2On}" height="20px"></td>
                                <td><img src="/resources/front/upload/main-indicators/${list.imgTab3On}" height="20px"></td>
                                <td>${list.createdate}</td>
                                <td>${list.updatedate}</td>
                                <td><a href="/admin/fis/mainIndicators/write/${list.seq}">[수정]</a>
                                    <!-- / <a href="javascript:;" onclick="delAction('${list.seq}')">[삭제]</a>  -->
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
    <script style="text/javascript">
        <!--
        function delAction(delNum){
            if( confirm("정말 삭제하시겠습니까?") ) {
                location.href = "/admin/fis/mainIndicators/del/" + delNum;
            }
        }

        function checkSave(){
            if( $("#fileName").html == "" && $("#file").val() == "" ){
                alert("메인이미지 파일을 등록해주세요.");
                return false;
            }
            $("#indicatorsForm").submit();
        }
        //-->
    </script>
</content>