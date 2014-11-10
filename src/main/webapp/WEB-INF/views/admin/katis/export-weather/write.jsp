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
        <li class="active">농수산식품 수출기상도</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 농수산식품 수출기상도 </h3> <h4><small>농수산식품 수출기상도를 수정할 수 있습니다.</small></h4>
    </div>
    <div class="section-body">
        <!-- START DATATABLE 1 -->
        <div class="row">
            <div class="col-lg-12">
                <form class="form-horizontal form-banded form-bordered" role="form" id="shoppingForm" method="POST" action="/admin/katis/export-weather/insertExportWeather">
                <input type="hidden" id="pkYear" name="pkYear" value="${exportWeatherList[0].pkYear}"/>
                <input type="hidden" id="pkMonth" name="pkMonth" value="${exportWeatherList[0].pkMonth}"/>
                <input type="hidden" id="pkWeek" name="pkWeek" value="${exportWeatherList[0].pkWeek}"/>
                <div class="box box-outlined">
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-md-2">
                                <label class="control-label">호수</label>
                            </div>
                            <div class="col-md-5">
                                <input type="text" style="width:80%" class="form-control" name="booknum" id="booknum" value="${exportWeatherList[0].booknum}"/>
                            </div>
                            <div class="col-md-2" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">노출여부</label>
                            </div>
                            <div class="col-md-4">
                                <input type="radio" value="Y" name="viewYn" <c:if test="${exportWeatherList[0].viewYn == 'Y'}">checked</c:if> > 노출
                                <input type="radio" value="N" name="viewYn" <c:if test="${exportWeatherList[0].viewYn == 'N'}">checked</c:if>> 미노출
                            </div>
                        </div>
                    </div>
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">기간</label>
                            </div>
                            <div class="col-md-2">
                                <div class='input-group date' id='demo-date-start'>
                                    <input type="text" class="form-control" name="startdate" id="startdate" value="${exportWeatherList[0].startdate}"/>
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                </div>
                            </div>
                            <div class="col-md-1" style="width:1%;">
                                ~
                            </div>
                            <div class="col-md-2">
                                <div class='input-group date' id='demo-date-end'>
                                    <input type="text" class="form-control" name="enddate" id="enddate" value="${exportWeatherList[0].enddate}"/>
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                </div>
                            </div>

                            <div class="col-md-1" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">제목 일자</label>
                            </div>
                            <div class="col-md-3">
                                <input type="text" style="width:80%" class="form-control" name="titledate" id="titledate" value="${exportWeatherList[0].titledate}"/>
                            </div>

                            <div class="col-md-1" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">발행일</label>
                            </div>
                            <div class="col-md-3">
                                <input type="text" style="width:80%" class="form-control" name="publishdate" id="publishdate" value="${exportWeatherList[0].publishdate}"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box box-outlined">
                    <div class="box-head">
                        <header><h4 class="text-light"><i class="fa fa-pencil fa-fw"></i> <strong>국가별 수출기상도</strong></h4></header>
                    </div>
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-md-1" >
                                <label class="control-label">일본</label>
                                <input type="hidden" name="nation1itemName"id="nation1itemName" value="${exportWeatherNation[0].itemName}">
                            </div>
                            <div class="col-md-3">
                                <label class="control-label">상승품목</label>
                                <input type="text" class="form-control" name="nation1UpItem" id="nation1UpItem" value="${exportWeatherNation[0].upItem}" ><br/>
                                <label class="control-label">하락품목</label>
                                <input type="text" class="form-control" name="nation1DownItem" id="nation1DownItem" value="${exportWeatherNation[0].downItem}" ><br/>
                                <label class="control-label">해외동향</label>
                                <textarea name="nation1Memo1" id="nation1Memo1" class="form-control" rows="3">${exportWeatherNation[0].memo1}</textarea><br/>
                                <label class="control-label">단신</label>
                                <textarea name="nation1Memo2" id="nation1Memo2" class="form-control" rows="3">${exportWeatherNation[0].memo2}</textarea>
                            </div>
                            <div class="col-md-1" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">중국</label>
                                <input type="hidden" name="nation2itemName"id="nation2itemName" value="${exportWeatherNation[1].itemName}">
                            </div>
                            <div class="col-md-3">
                                <label class="control-label">상승품목</label>
                                <input type="text" class="form-control" name="nation2UpItem" id="nation2UpItem" value="${exportWeatherNation[1].upItem}" ><br/>
                                <label class="control-label">하락품목</label>
                                <input type="text" class="form-control" name="nation2DownItem" id="nation2DownItem" value="${exportWeatherNation[1].downItem}" ><br/>
                                <label class="control-label">해외동향</label>
                                <textarea name="nation2Memo1" id="nation2Memo1" class="form-control" rows="3">${exportWeatherNation[1].memo1}</textarea><br/>
                                <label class="control-label">단신</label>
                                <textarea name="nation2Memo2" id="nation2Memo2" class="form-control" rows="3">${exportWeatherNation[1].memo2}</textarea>
                            </div>
                            <div class="col-md-1" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">미국</label>
                                <input type="hidden" name="nation3itemName"id="nation3itemName" value="${exportWeatherNation[2].itemName}">
                            </div>
                            <div class="col-md-3">
                                <label class="control-label">상승품목</label>
                                <input type="text" class="form-control" name="nation3UpItem" id="nation3UpItem" value="${exportWeatherNation[2].upItem}" ><br/>
                                <label class="control-label">하락품목</label>
                                <input type="text" class="form-control" name="nation3DownItem" id="nation3DownItem" value="${exportWeatherNation[2].downItem}" ><br/>
                                <label class="control-label">해외동향</label>
                                <textarea name="nation3Memo1" id="nation3Memo1" class="form-control" rows="3">${exportWeatherNation[2].memo1}</textarea><br/>
                                <label class="control-label">단신</label>
                                <textarea name="nation3Memo2" id="nation3Memo2" class="form-control" rows="3">${exportWeatherNation[2].memo2}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1" >
                                <label class="control-label">홍콩</label>
                                <input type="hidden" name="nation4itemName"id="nation4itemName" value="${exportWeatherNation[3].itemName}">
                            </div>
                            <div class="col-md-3">
                                <label class="control-label">상승품목</label>
                                <input type="text" class="form-control" name="nation4UpItem" id="nation4UpItem" value="${exportWeatherNation[3].upItem}" ><br/>
                                <label class="control-label">하락품목</label>
                                <input type="text" class="form-control" name="nation4DownItem" id="nation4DownItem" value="${exportWeatherNation[3].downItem}" ><br/>
                                <label class="control-label">해외동향</label>
                                <textarea name="nation4Memo1" id="nation4Memo1" class="form-control" rows="3">${exportWeatherNation[3].memo1}</textarea><br/>
                                <label class="control-label">단신</label>
                                <textarea name="nation4Memo2" id="nation4Memo2" class="form-control" rows="3">${exportWeatherNation[3].memo2}</textarea>
                            </div>
                            <div class="col-md-1" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">아세안</label>
                                <input type="hidden" name="nation5itemName"id="nation5itemName" value="${exportWeatherNation[4].itemName}">
                            </div>
                            <div class="col-md-3">
                                <label class="control-label">상승품목</label>
                                <input type="text" class="form-control" name="nation5UpItem" id="nation5UpItem" value="${exportWeatherNation[4].upItem}" ><br/>
                                <label class="control-label">하락품목</label>
                                <input type="text" class="form-control" name="nation5DownItem" id="nation5DownItem" value="${exportWeatherNation[4].downItem}" ><br/>
                                <label class="control-label">해외동향</label>
                                <textarea name="nation5Memo1" id="nation5Memo1" class="form-control" rows="3">${exportWeatherNation[4].memo1}</textarea><br/>
                                <label class="control-label">단신</label>
                                <textarea name="nation5Memo2" id="nation5Memo2" class="form-control" rows="3">${exportWeatherNation[4].memo2}</textarea>
                            </div>
                            <div class="col-md-1" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">EU</label>
                                <input type="hidden" name="nation6itemName"id="nation6itemName" value="${exportWeatherNation[5].itemName}">
                            </div>
                            <div class="col-md-3">
                                <label class="control-label">상승품목</label>
                                <input type="text" class="form-control" name="nation6UpItem" id="nation6UpItem" value="${exportWeatherNation[5].upItem}" ><br/>
                                <label class="control-label">하락품목</label>
                                <input type="text" class="form-control" name="nation6DownItem" id="nation6DownItem" value="${exportWeatherNation[5].downItem}" ><br/>
                                <label class="control-label">해외동향</label>
                                <textarea name="nation6Memo1" id="nation6Memo1" class="form-control" rows="3">${exportWeatherNation[5].memo1}</textarea><br/>
                                <label class="control-label">단신</label>
                                <textarea name="nation6Memo2" id="nation6Memo2" class="form-control" rows="3">${exportWeatherNation[5].memo2}</textarea>
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
            if( $("#booknum").val() == "" ){
                alert("호수를 입력해주세요.");
                $("#booknum").focus();
                return false;
            }
            $("#shoppingForm").submit();
        }
    </script>
</content>