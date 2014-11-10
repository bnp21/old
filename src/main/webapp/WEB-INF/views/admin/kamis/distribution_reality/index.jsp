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
        <li class="active">주요 농산물 유통실태</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 주요 농산물 유통실태 <button type="button" class="btn btn-rounded btn-info"  data-toggle="modal" data-target="#simpleModal">변경</button></h3> <h4><small>대표이미지와 링크를 변경하시려면 '변경' 버튼을 클릭해주세요.<br/>주요 농산물 유통실태 데이터를 추가하거나 수정할 수 있습니다.</small></h4>
    </div>
    <div class="modal fade" id="simpleModal" tabindex="-1" role="dialog" aria-labelledby="simpleModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="formModalLabel">기본정보 변경</h4>
                </div>
                <form:form class="form-horizontal" role="form" enctype="multipart/form-data"  action="/admin/kamis/distribution_reality/mainSave" method="POST" id="realityForm" name="realityForm">
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
                                ※ 기본 상세 URL : distributionReality/
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
    <div class="section-body">
        <!-- START HORIZONTAL FORM -->
        <div class="row">
            <div class="col-lg-12">
                <div class="box table-bordered">
                    <div class="box-body">
                        <form:form class="form-horizontal" id="searchForm"   method="GET"  name="searchForm" modelAttribute="paramDistributionReality">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <label for="title" class="control-label">제목</label>
                                    </div>
                                    <div class="col-lg-10 col-md-8 col-sm-6">
                                        <input type="text" name="title" id="title" class="form-control" value="${distributionReality.title}" placeholder="검색어를 입력하세요.">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-body text-right">
                            <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i>  조회</button>
                        </form:form><!--폼 위치수정함 -->
                            <button type="button" class="btn btn-success" onclick="insertAction();"><i class="fa fa-money"></i>  데이터 추가</button>
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
                            <th width="5%" rowspan="2">연도</th>
                            <th width="*%" rowspan="2">제목</th>
                            <th width="8%" rowspan="2">유통 비용율</th>
                            <th width="20%" colspan="3">비용별</th>
                            <th width="20%" colspan="3">단계별</th>
                            <th width="8%" rowspan="2">등록일</th>
                            <th width="8%" rowspan="2">수정일</th>
                            <th width="8%" rowspan="2">관리</th>
                        </tr>
                        <tr>
                            <th>직접비</th>
                            <th>간접비</th>
                            <th>이윤</th>
                            <th>출하단계</th>
                            <th>도매단계</th>
                            <th>소매단계</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${distributionRealityList}" var="list">
                            <tr>
                                <td>${list.year}</td>
                                <td><h5>${list.title}</h5></td>
                                <td>${list.distribution}%</td>
                                <td>${list.costDirectly}%</td>
                                <td>${list.costIndirect}%</td>
                                <td>${list.costProfit}%</td>
                                <td>${list.stageShipment}%</td>
                                <td>${list.stageWholesale}%</td>
                                <td>${list.stageRetail}%</td>
                                <td>${list.createdate}</td>
                                <td>${list.updatedate}</td>
                                <td><a href="/admin/kamis/distribution_reality/write/${list.seq}">[수정]</a> / <a href="javascript:;" onclick="checkDel('${list.seq}');">[삭제]</a></td>
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
                location.href = "/admin/kamis/distribution_reality/delDistributionReality/"+delSeq;
            }
        }

        function checkSave(){
            if( $("#fileName").html == "" && $("#file").val() == "" ){
                alert("메인이미지 파일을 등록해주세요.");
                return false;
            }
            $("#realityForm").submit();
        }

        function insertAction(){
            location.href = "/admin/kamis/distribution_reality/write/0";
        }
    </script>
</content>