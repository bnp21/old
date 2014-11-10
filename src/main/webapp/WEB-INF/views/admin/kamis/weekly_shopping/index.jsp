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
    <li class="active">알뜰 장보기</li>
</ol>
<div class="section-header">
    <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 알뜰 장보기 <button type="button" class="btn btn-rounded btn-info"  data-toggle="modal" data-target="#simpleModal">변경</button></h3>
    <h4><small>알뜰 장보기 데이터를 추가하거나 수정할 수 있습니다.<br/>상세페이지 하단 링크를 변경하시려면 '변경' 버튼을 클릭해주세요.</small></h4>
</div>
    <div class="modal fade" id="simpleModal" tabindex="-1" role="dialog" aria-labelledby="simpleModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="formModalLabel">기본정보 변경</h4>
                </div>
                <form:form class="form-horizontal" role="form" enctype="multipart/form-data"  action="/admin/kamis/weekly_shopping/mainSave" method="POST" id="weklyShoppingForm" name="weklyShoppingForm">
                    <input type="hidden" name="id" id="id" value="1">
                    <input type="hidden" name="delFile" id="delFile"/>
                    <div class="modal-body">
                            <%--<div class="form-group">
                                <div class="col-sm-3">
                                    <label for="title" class="control-label">제목</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="text" name="title" id="title" class="form-control" value="${list[0].title}" placeholder="화면에 표시될 TEXT를 입력해주세요.">
                                </div>
                            </div>--%>
                            <%--<div class="form-group">
                                <div class="col-sm-3">
                                    <label for="file" class="control-label">메인이미지</label>
                                </div>
                                <div class="col-sm-9">
                                    <span id="fileName">${list[0].fileName} <span id="delImg" onclick="checkDel();">X</span></span>
                                    <input type="file" name="file" id="file">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label for="url" class="control-label">Link URL</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="text" name="url" id="url" class="form-control" value="${list[0].url}">
                                    ※ 기본 상세 URL : exportweather/
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3">
                                    <label for="file" class="control-label">메인 외부/내부링크 구분</label>
                                </div>
                                <div class="col-sm-9">
                                    <input type="radio" name="outlinkYn" value="Y" <c:if test="${menuList[0].outlinkYn == 'Y'}">checked</c:if> > 외부링크
                                    <input type="radio" name="outlinkYn" value="N" <c:if test="${menuList[0].outlinkYn != 'Y'}">checked</c:if>> 내부링크
                                </div>
                            </div>--%>
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
                    <form:form class="form-horizontal" id="searchForm"   method="GET"  name="searchForm" modelAttribute="paramWeeklyShopping">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="col-lg-2 col-md-4 col-sm-6">
                                        <label for="groupCode" class="control-label">날짜</label>
                                    </div>
                                    <div class="col-lg-10 col-md-8 col-sm-6">
                                        <select name="groupCode" id="groupCode" class="form-control">
                                            <c:forEach items="${weeklyShoppingDayList}" var="dayList">
                                            <option value="${dayList.groupCode}" <c:if test="${dayList.groupCode==weeklyShopping.groupCode}">selected</c:if>>
                                                <fmt:parseDate value="${dayList.startDate}" pattern ="yyyy-MM-dd" var="startdate"> </fmt:parseDate>
                                                <fmt:formatDate value="${startdate}" pattern="yyyy월 MM월 dd일"></fmt:formatDate> ~
                                                <fmt:parseDate value="${dayList.endDate}" pattern ="yyyy-MM-dd" var="enddate"> </fmt:parseDate>
                                                <fmt:formatDate value="${enddate}" pattern="yyyy월 MM월 dd일"></fmt:formatDate></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div class="box-body text-right">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i>  조회</button>
                    </form:form><!--폼 위치수정함 -->
                        <button type="button" class="btn btn-success" onclick="insertAction();"><i class="fa fa-money"></i>  데이터 추가</button>
                        <button type="button" class="btn btn-support2" onclick="modyAction();"><i class="fa fa-cut"></i>  데이터 수정</button>
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
                    ${weeklyShopping.startDate} ~${weeklyShopping.endDate} 의 결과입니다.
                    <table class="table table-bordered table-hover no-margin">
                    <thead>
                        <tr>
                            <th style="width:16%">기간</th>
                            <th>품명</th>
                            <th>단위</th>
                            <th>지난주</th>
                            <th>이번주</th>
                            <th>변동폭 및 전망</th>
                            <th>설명</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${weeklyShoppingList}" var="list">
                            <tr>
                                <td><h5>
                                    <c:choose>
                                        <c:when test="${list.type == '1' || list.type == '2' || list.type == '3' || list.type == '4'}"><button type="button" class="btn btn-support2 btn-xs">이번주동향</button></c:when>
                                        <c:otherwise><button type="button" class="btn btn-support1 btn-xs">다음주전망</button></c:otherwise>
                                    </c:choose>
                                    <fmt:parseDate value="${list.startDate}" pattern ="yyyy-MM-dd" var="startdate"> </fmt:parseDate>
                                    <fmt:formatDate value="${startdate}" pattern="MM.dd"></fmt:formatDate> ~
                                    <fmt:parseDate value="${list.endDate}" pattern ="yyyy-MM-dd" var="enddate"> </fmt:parseDate>
                                    <fmt:formatDate value="${enddate}" pattern="MM.dd"></fmt:formatDate>
                                </h5></td>
                                <td><h5>${list.itemName}</h5></td>
                                <td><h5>${list.unit}</h5></td>
                                <td><c:if test="${list.lastWeekPrice != null}"><h5><fmt:formatNumber value="${list.lastWeekPrice}" type="number"/>원</h5></c:if></td>
                                <td><c:if test="${list.weekPrice != null}"><h5><fmt:formatNumber value="${list.weekPrice}" type="number"/>원</h5></c:if></td>
                                <td><h5><c:if test="${list.rate != null}">${list.rate}% </c:if><span class="label label-danger">${list.fluctuationType}</span></h5></td>
                                <td><small>${list.memo}</small></td>
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
        function insertAction(){
            location.href = "/admin/kamis/weekly_shopping/write/"+0;
        }

        function modyAction(){
            location.href = "/admin/kamis/weekly_shopping/write/"+$("#groupCode").val();
        }

    function checkSave(){
            $("#weklyShoppingForm").submit();
        }
    //-->
</script>
</content>