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
        <li><a href="/admin/ ">홈</a></li>
        <li><a href="/admin/">유통정보</a></li>
        <li class="active">알뜰 장보기</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 알뜰 장보기 </h3> <h4><small>알뜰 장보기 데이터를 추가하거나 수정할 수 있습니다.</small></h4>
    </div>
    <div class="section-body">
        <!-- START DATATABLE 1 -->
        <div class="row">
            <div class="col-lg-12">
                <form class="form-horizontal form-banded form-bordered" role="form" id="shoppingForm" method="POST" action="/admin/kamis/weekly_shopping/insertWeeklyShopping">
                <input type="hidden" id="groupCode" name="groupCode" value="${weeklyShoppingList[0].groupCode}"/>
                <div class="box box-outlined">
                    <div class="box-head">
                        <header><h4 class="text-light"><i class="fa fa-pencil fa-fw"></i> <strong>이번주 동향</strong></h4></header>
                    </div>
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">호수번호</label>
                            </div>
                            <div class="col-md-6">
                                <div class='input-group date' id='demo-date-booknum'>
                                    <input type="text" class="form-control" name="booknum" id="booknum" value="${weeklyShoppingList[0].booknum}">
                                </div>
                            </div>
                            <div class="col-md-1" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">발행일</label>
                            </div>
                            <div class="col-md-6">
                                <div class='input-group date' id='demo-date-publish'>
                                    <input type="text" class="form-control" name="publishdate" id="publishdate" value="${weeklyShoppingList[0].publishdate}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">이번주 동향일</label>
                            </div>
                            <div class="col-md-6">
                                <div class='input-group date' id='demo-date-start'>
                                    <input type="text" class="form-control" name="weekstartdate" id="weekstartdate" value="${weeklyShoppingList[0].startDate}"/>
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                </div>
                            </div>
                            <div class="col-md-2" style="width:1%;">
                                ~
                            </div>
                            <div class="col-md-6">
                                <div class='input-group date' id='demo-date-end'>
                                    <input type="text" class="form-control" name="weekenddate" id="weekenddate" value="${weeklyShoppingList[0].endDate}"/>
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-1 col-md-2 col-sm-3">
                                <label class="control-label">상승제품1</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4">
                                <select name="type1ItemCode" id="type1ItemCode" class="form-control">
                                    <option value="">선택</option>
                                    <c:forEach items="${itemList}" var="item">
                                        <option value="${item.itemCode}" <c:if test="${weeklyShoppingList[0].itemCode==item.itemCode}">selected</c:if> >${item.name}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label">지난주 가격</label>
                                <input type="text" class="form-control" name="type1lastWeekPrice" id="type1lastWeekPrice" value="${weeklyShoppingList[0].lastWeekPrice}">
                                <label class="control-label">이번주 가격</label>
                                <input type="text" class="form-control" name="type1WeekPrice" id="type1WeekPrice" value="${weeklyShoppingList[0].weekPrice}">
                                <label class="control-label">상승폭</label>
                                <input type="text" class="form-control" name="type1Rate" id="type1Rate" value="${weeklyShoppingList[0].rate}">
                                <label class="control-label">메모</label>
                                <textarea name="type1Memo" id="type1Memo" class="form-control" rows="3">${weeklyShoppingList[0].memo}</textarea>
                            </div>
                            <div class="col-lg-1 col-md-2 col-sm-3" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">상승제품2</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4">
                                <select name="type2ItemCode" id="type2ItemCode" class="form-control">
                                    <option value="">선택</option>
                                    <c:forEach items="${itemList}" var="item">
                                        <option value="${item.itemCode}" <c:if test="${weeklyShoppingList[1].itemCode==item.itemCode}">selected</c:if>>${item.name}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label">지난주 가격</label>
                                <input type="text" class="form-control" name="type2lastWeekPrice" id="type2lastWeekPrice" value="${weeklyShoppingList[1].lastWeekPrice}">
                                <label class="control-label">이번주 가격</label>
                                <input type="text" class="form-control" name="type2WeekPrice" id="type2WeekPrice" value="${weeklyShoppingList[1].weekPrice}">
                                <label class="control-label">상승폭</label>
                                <input type="text" class="form-control" name="type2Rate" id="type2Rate" value="${weeklyShoppingList[1].rate}">
                                <label class="control-label">메모</label>
                                <textarea name="type2Memo" id="type2Memo" class="form-control" rows="3">${weeklyShoppingList[1].memo}</textarea>
                            </div>
                            <div class="col-lg-1 col-md-2 col-sm-3" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">하락제품1</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4">
                                <select name="type3ItemCode" id="type3ItemCode" class="form-control">
                                    <option value="">선택</option>
                                    <c:forEach items="${itemList}" var="item">
                                        <option value="${item.itemCode}" <c:if test="${weeklyShoppingList[2].itemCode==item.itemCode}">selected</c:if>>${item.name}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label">지난주 가격</label>
                                <input type="text" class="form-control" name="type3lastWeekPrice" id="type3lastWeekPrice" value="${weeklyShoppingList[2].lastWeekPrice}">
                                <label class="control-label">이번주 가격</label>
                                <input type="text" class="form-control" name="type3WeekPrice" id="type3WeekPrice" value="${weeklyShoppingList[2].weekPrice}">
                                <label class="control-label">하락폭</label>
                                <input type="text" class="form-control" name="type3Rate" id="type3Rate" value="${weeklyShoppingList[2].rate}">
                                <label class="control-label">메모</label>
                                <textarea name="type3Memo" id="type3Memo" class="form-control" rows="3">${weeklyShoppingList[2].memo}</textarea>
                            </div>
                            <div class="col-lg-1 col-md-2 col-sm-3" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">하락제품2</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4">
                                <select name="type4ItemCode" id="type4ItemCode" class="form-control">
                                    <option value="">선택</option>
                                    <c:forEach items="${itemList}" var="item">
                                        <option value="${item.itemCode}" <c:if test="${weeklyShoppingList[3].itemCode==item.itemCode}">selected</c:if>>${item.name}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label">지난주 가격</label>
                                <input type="text" class="form-control" name="type4lastWeekPrice" id="type4lastWeekPrice" value="${weeklyShoppingList[3].lastWeekPrice}">
                                <label class="control-label">이번주 가격</label>
                                <input type="text" class="form-control" name="type4WeekPrice" id="type4WeekPrice" value="${weeklyShoppingList[3].lastWeekPrice}">
                                <label class="control-label">하락폭</label>
                                <input type="text" class="form-control" name="type4Rate" id="type4Rate" value="${weeklyShoppingList[3].rate}">
                                <label class="control-label">메모</label>
                                <textarea name="type4Memo" id="type4Memo" class="form-control" rows="3">${weeklyShoppingList[3].memo}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box box-outlined">
                    <div class="box-head">
                        <header><h4 class="text-light"><i class="fa fa-pencil fa-fw"></i> <strong>다음주 전망</strong></h4></header>
                    </div>
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-lg-1 col-md-2 col-sm-3">
                                <label class="control-label">다음주 동향일</label>
                            </div>
                            <div class="col-md-6">
                                <div class='input-group date' id='demo-date-start2'>
                                    <input type="text" class="form-control" name="nextweekstartdate" id="nextweekstartdate" value="${weeklyShoppingList[4].startDate}"/>
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                </div>
                            </div>
                            <div class="col-sm-5" style="width:1%;">
                                ~
                            </div>
                            <div class="col-md-6">
                                <div class='input-group date' id='demo-date-end2'>
                                    <input type="text" class="form-control" name="nextweekenddate" id="nextweekenddate" value="${weeklyShoppingList[4].endDate}"/>
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-1 col-md-2 col-sm-3" >
                                <label class="control-label">약보합1</label>
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-4">
                                <select name="type5ItemCode" id="type5ItemCode" class="form-control">
                                    <option value="">선택</option>
                                    <c:forEach items="${itemList}" var="item">
                                        <option value="${item.itemCode}" <c:if test="${weeklyShoppingList[4].itemCode==item.itemCode}">selected</c:if>>${item.name}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label">메모</label>
                                <textarea name="type5Memo" id="type5Memo" class="form-control" rows="3">${weeklyShoppingList[4].memo}</textarea>
                            </div>
                            <div class="col-lg-1 col-md-2 col-sm-3"  style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">약보합2</label>
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-4">
                                <select name="type6ItemCode" id="type6ItemCode" class="form-control">
                                    <option value="">선택</option>
                                    <c:forEach items="${itemList}" var="item">
                                        <option value="${item.itemCode}" <c:if test="${weeklyShoppingList[5].itemCode==item.itemCode}">selected</c:if> >${item.name}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label">메모</label>
                                <textarea name="type6Memo" id="type6Memo" class="form-control" rows="3">${weeklyShoppingList[5].memo}</textarea>
                            </div>
                            <div class="col-lg-1 col-md-2 col-sm-3"  style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">하락</label>
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-4">
                                <select name="type7ItemCode" id="type7ItemCode" class="form-control">
                                    <option value="">선택</option>
                                    <c:forEach items="${itemList}" var="item">
                                        <option value="${item.itemCode}" <c:if test="${weeklyShoppingList[6].itemCode==item.itemCode}">selected</c:if> >${item.name}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label">메모</label>
                                <textarea name="type7Memo" id="type7Memo" class="form-control" rows="3">${weeklyShoppingList[6].memo}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-1 col-md-2 col-sm-3"  style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">보합1</label>
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-4">
                                <select name="type8ItemCode" id="type8ItemCode" class="form-control">
                                    <option value="">선택</option>
                                    <c:forEach items="${itemList}" var="item">
                                        <option value="${item.itemCode}" <c:if test="${weeklyShoppingList[7].itemCode==item.itemCode}">selected</c:if> >${item.name}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label">메모</label>
                                <textarea name="type8Memo" id="type8Memo" class="form-control" rows="3">${weeklyShoppingList[7].memo}</textarea>
                            </div>
                            <div class="col-lg-1 col-md-2 col-sm-3"  style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">보합2</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4">
                                <select name="type9ItemCode" id="type9ItemCode" class="form-control">
                                    <option value="">선택</option>
                                    <c:forEach items="${itemList}" var="item">
                                        <option value="${item.itemCode}" <c:if test="${weeklyShoppingList[8].itemCode==item.itemCode}">selected</c:if> >${item.name}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label">메모</label>
                                <textarea name="type9Memo" id="type9Memo" class="form-control" rows="3">${weeklyShoppingList[8].memo}</textarea>
                            </div>
                            <div class="col-lg-1 col-md-2 col-sm-3"  style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">상승</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4">
                                <select name="type10ItemCode" id="type10ItemCode" class="form-control">
                                    <option value="">선택</option>
                                    <c:forEach items="${itemList}" var="item">
                                        <option value="${item.itemCode}" <c:if test="${weeklyShoppingList[9].itemCode==item.itemCode}">selected</c:if> >${item.name}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label">메모</label>
                                <textarea name="type10Memo" id="type10Memo" class="form-control" rows="3">${weeklyShoppingList[9].memo}</textarea>
                            </div>
                            <div class="col-lg-1 col-md-2 col-sm-3"  style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">강보합</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4">
                                <select name="type11ItemCode" id="type11ItemCode" class="form-control">
                                    <option value="">선택</option>
                                    <c:forEach items="${itemList}" var="item">
                                        <option value="${item.itemCode}" <c:if test="${weeklyShoppingList[10].itemCode==item.itemCode}">selected</c:if> >${item.name}</option>
                                    </c:forEach>
                                </select>
                                <label class="control-label">메모</label>
                                <textarea name="type11Memo" id="type11Memo" class="form-control" rows="3">${weeklyShoppingList[10].memo}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
                <div class="form-footer col-lg-offset-1 col-md-offset-2 col-sm-offset-3">
                    <button type="button" onclick='saveContent();' class="btn btn-primary">등록</button>
                    <button type="button" onclick='loadContent();' class="btn btn-default">Reset</button>
                </div>
            </div><!--end .col-lg-12 -->
        </div>
        <!-- END DATATABLE 1 -->
    </div>
</section>

<content tag="local_script">
    <link type="text/css" rel="stylesheet" href="/resources/admin/css/theme-default/libs/bootstrap-datetimepicker/bootstrap-datetimepicker.css?1400398165" />
    <script src="/resources/admin/js/libs/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
    <script src="/resources/admin/js/core/demo/DemoFormComponents.js"></script>
    <script type="text/javascript">
        function saveContent(){
            if( $("#weekstartdate").val() == "" ){
                alert("이번주 동향일 시작을 등록해주세요.");
                $("#weekstartdate").focus();
                return false;
            }
            if( $("#weekenddate").val() == "" ){
                alert("이번주 동향일 종료을 등록해주세요.");
                $("#weekenddate").focus();
                return false;
            }
            if( $("#type1ItemCode").val() == "" ){
                alert("상승제품1 품목을 등록해주세요.");
                $("#type1ItemCode").focus();
                return false;
            }
            if( $("#type1lastWeekPrice").val() == "" ){
                alert("상승제품1 지난주 가격을 등록해주세요.");
                $("#type1lastWeekPrice").focus();
                return false;
            }
            if( $("#type1WeekPrice").val() == "" ){
                alert("상승제품1 이번주 가격을 등록해주세요.");
                $("#type1WeekPrice").focus();
                return false;
            }
            if( $("#type1Rate").val() == "" ){
                alert("상승제품1 상승폭을 등록해주세요.");
                $("#type1Rate").focus();
                return false;
            }
            if( $("#type1Memo").val() == "" ){
                alert("상승제품1 메모를 등록해주세요.");
                $("#type1Memo").focus();
                return false;
            }
            if( $("#type2ItemCode").val() == "" ){
                alert("상승제품2 품목을 등록해주세요.");
                $("#type2ItemCode").focus();
                return false;
            }
            if( $("#type2lastWeekPrice").val() == "" ){
                alert("상승제품2 지난주 가격을 등록해주세요.");
                $("#type2lastWeekPrice").focus();
                return false;
            }
            if( $("#type2WeekPrice").val() == "" ){
                alert("상승제품2 이번주 가격을 등록해주세요.");
                $("#type2WeekPrice").focus();
                return false;
            }
            if( $("#type2Rate").val() == "" ){
                alert("상승제품2 상승폭을 등록해주세요.");
                $("#type2Rate").focus();
                return false;
            }
            if( $("#type2Memo").val() == "" ){
                alert("상승제품2 메모를 등록해주세요.");
                $("#type2Memo").focus();
                return false;
            }
            if( $("#type3ItemCode").val() == "" ){
                alert("하락제품1 품목을 등록해주세요.");
                $("#type3ItemCode").focus();
                return false;
            }
            if( $("#type3lastWeekPrice").val() == "" ){
                alert("하락제품1 지난주 가격을 등록해주세요.");
                $("#type3lastWeekPrice").focus();
                return false;
            }
            if( $("#type3WeekPrice").val() == "" ){
                alert("하락제품1 이번주 가격을 등록해주세요.");
                $("#type3WeekPrice").focus();
                return false;
            }
            if( $("#type3Rate").val() == "" ){
                alert("하락제품1 하락폭을 등록해주세요.");
                $("#type3Rate").focus();
                return false;
            }
            if( $("#type3Memo").val() == "" ){
                alert("하락제품1 메모를 등록해주세요.");
                $("#type3Memo").focus();
                return false;
            }
            if( $("#type4ItemCode").val() == "" ){
                alert("하락제품2 품목을 등록해주세요.");
                $("#type4ItemCode").focus();
                return false;
            }
            if( $("#type4lastWeekPrice").val() == "" ){
                alert("하락제품2 지난주 가격을 등록해주세요.");
                $("#type4lastWeekPrice").focus();
                return false;
            }
            if( $("#type4WeekPrice").val() == "" ){
                alert("하락제품2 이번주 가격을 등록해주세요.");
                $("#type4WeekPrice").focus();
                return false;
            }
            if( $("#type4Rate").val() == "" ){
                alert("하락제품2 하락폭을 등록해주세요.");
                $("#type4Rate").focus();
                return false;
            }
            if( $("#type4Memo").val() == "" ){
                alert("하락제품2 메모를 등록해주세요.");
                $("#type4Memo").focus();
                return false;
            }
            if( $("#type5ItemCode").val() == "" ){
                alert("약보합1 품목을 등록해주세요.");
                $("#type5ItemCode").focus();
                return false;
            }
            if( $("#type5Memo").val() == "" ){
                alert("약보합1 메모를 등록해주세요.");
                $("#type5Memo").focus();
                return false;
            }
            if( $("#type6ItemCode").val() == "" ){
                alert("약보합2 품목을 등록해주세요.");
                $("#type6ItemCode").focus();
                return false;
            }
            if( $("#type6Memo").val() == "" ){
                alert("약보합2 메모를 등록해주세요.");
                $("#type6Memo").focus();
                return false;
            }
            if( $("#type7ItemCode").val() == "" ){
                alert("하락 품목을 등록해주세요.");
                $("#type7ItemCode").focus();
                return false;
            }
            if( $("#type7Memo").val() == "" ){
                alert("하락 메모를 등록해주세요.");
                $("#type7Memo").focus();
                return false;
            }
            if( $("#type8ItemCode").val() == "" ){
                alert("보합1 품목을 등록해주세요.");
                $("#type8ItemCode").focus();
                return false;
            }
            if( $("#type8Memo").val() == "" ){
                alert("보합1 메모를 등록해주세요.");
                $("#type8Memo").focus();
                return false;
            }
            if( $("#type9ItemCode").val() == "" ){
                alert("보합2 품목을 등록해주세요.");
                $("#type9ItemCode").focus();
                return false;
            }
            if( $("#type9Memo").val() == "" ){
                alert("보합2 메모를 등록해주세요.");
                $("#type9Memo").focus();
                return false;
            }
            if( $("#type10ItemCode").val() == "" ){
                alert("상승 품목을 등록해주세요.");
                $("#type10ItemCode").focus();
                return false;
            }
            if( $("#type10Memo").val() == "" ){
                alert("상승 메모를 등록해주세요.");
                $("#type10Memo").focus();
                return false;
            }
            if( $("#type11ItemCode").val() == "" ){
                alert("강보합 품목을 등록해주세요.");
                $("#type11ItemCode").focus();
                return false;
            }
            if( $("#type11Memo").val() == "" ){
                alert("강보합 메모를 등록해주세요.");
                $("#type11Memo").focus();
                return false;
            }

            $("#shoppingForm").submit();
        }
    </script>
</content>