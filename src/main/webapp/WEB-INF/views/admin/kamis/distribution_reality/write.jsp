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
        <li><a href="/admin/">유통정보</a></li>
        <li class="active">주요 농산물 유통실태 </li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 주요 농산물 유통실태 </h3> <h4><small>주요 농산물 유통실태 데이터를 추가하거나 수정할 수 있습니다.</small></h4>
    </div>
    <div class="section-body">
        <!-- START DATATABLE 1 -->
        <div class="row">
            <div class="col-lg-12">
                <form class="form-horizontal form-banded form-bordered" role="form" id="distributionRealityViewForm" method="POST" action="/admin/kamis/distribution_reality/insertDistributionReality" enctype="multipart/form-data">
                <input type="hidden" id="seq" name="seq" value="${distributionRealityView.seq}"/>
                <input type="hidden" id="delImg" name="delImg" />
                <div class="box box-outlined">
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-md-2">
                                <label class="control-label">제목</label>
                            </div>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="title" id="title" value="${distributionRealityView.title}">
                            </div>
                            <div class="col-md-1" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">연도</label>
                            </div>
                            <div class= col-md-1">
                                <input type="text" class="form-control" name="year" id="year" value="${distributionRealityView.year}" maxlength="4">
                            </div>
                        </div>
                     </div>
                </div>
                <%-- 숨겨놓음 - 등록로직안됨
                <div style="text-align:right;padding-bottom:10px;"><button type="button" onclick='addItem();' class="btn btn-primary">품목추가</button></div>
                <div class="box box-outlined" id="itemAddArea">
                    <input type="hidden" name="itemSeq" value="${distributionRealityItemList[0].seq}"/>
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-md-2">
                                <label class="control-label">조사품목명</label>
                            </div>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="imgTitle" value="${distributionRealityItemList[0].title}">
                            </div>
                            <div class="col-md-1" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">이미지파일</label>
                            </div>
                            <div class= col-md-6">
                                <c:if test="${distributionRealityItemList[listCnt].fileImg != ' ' && distributionRealityItemList[0].fileImg != null}"><span id="dev_imgFile">${distributionRealityItemList[0].fileImg} <span onclick="imgDel(this,'${distributionRealityItemList[0].seq}');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" class="form-control" name="file" value="${distributionRealityItemList[0].fileImg}">
                            </div>
                            <div class="col-md-1"><span onclick="imgRowDel(this,'${distributionRealityItemList[0].seq}');" style="cursor:pointer;">X</span></div>
                        </div>
                    </div>
                    <c:set var="listCnt" value="0" />
                    <c:forEach items="${distributionRealityItemList}" var="itemList">
                        <c:if test="${listCnt > 0}">
                            <input type="hidden" name="itemSeq" value="${distributionRealityItemList[listCnt].seq}"/>
                            <div class="box-body no-padding">
                                <div class="form-group">
                                    <div class="col-md-2">
                                        <label class="control-label">조사품목명</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" name="imgTitle" value="${distributionRealityItemList[listCnt].title}">
                                    </div>
                                    <div class="col-md-1" style="background:none repeat scroll 0 0 #f2f2f2;">
                                        <label class="control-label">이미지파일</label>
                                    </div>
                                    <div class= col-md-6">
                                        <c:if test="${distributionRealityItemList[listCnt].fileImg != ' ' && distributionRealityItemList[listCnt].fileImg != null}"><span id="dev_imgFile">${distributionRealityItemList[listCnt].fileImg} <span onclick="imgDel(this,'${distributionRealityItemList[listCnt].seq}');" style="cursor:pointer;">X</span></span></c:if>
                                        <input type="file" class="form-control" name="file" value="${distributionRealityItemList[listCnt].fileImg}">
                                    </div>
                                    <div class="col-md-1"><span onclick="imgRowDel(this,'${distributionRealityItemList[listCnt].seq}');" style="cursor:pointer;">X</span></div>
                                </div>
                            </div>
                        </c:if>
                        <c:set var="listCnt" value="${listCnt+1}" />
                    </c:forEach>
                </div>
                --%>
                <div class="box box-outlined">
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-lg-2 col-md-2 col-sm-3">
                                <label class="control-label">유통 비용율</label>
                            </div>
                            <div class="col-md-2" style="float:left">
                                <input type="text" class="form-control" name="distribution" id="distribution" value="${distributionRealityView.distribution}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2 col-md-2 col-sm-3" >
                                <label class="control-label">비용별 > 직접비</label>
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-4">
                                <input type="text" class="form-control" name="costDirectly" id="costDirectly" value="${distributionRealityView.costDirectly}">
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-3"  style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">비용별 > 간접비</label>
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-4">
                                <input type="text" class="form-control" name="costIndirect" id="costIndirect" value="${distributionRealityView.costIndirect}">
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-3"  style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">비용별 > 이윤</label>
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-4">
                                <input type="text" class="form-control" name="costProfit" id="costProfit" value="${distributionRealityView.costProfit}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2 col-md-2 col-sm-3" >
                                <label class="control-label">단계별 > 출하단계</label>
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-4">
                                <input type="text" class="form-control" name="stageShipment" id="stageShipment" value="${distributionRealityView.stageShipment}">
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-3"  style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">단계별 > 도매단계</label>
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-4">
                                <input type="text" class="form-control" name="stageWholesale" id="stageWholesale" value="${distributionRealityView.stageWholesale}">
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-3"  style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">단계별 > 소매단계</label>
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-4">
                                <input type="text" class="form-control" name="stageRetail" id="stageRetail" value="${distributionRealityView.stageRetail}">
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
            if( $("#title").val() == "" ){
                alert("제목을 입력해주세요.");
                $("#title").focus();
                return false;
            }
            if( $("#year").val() == "" ){
                alert("연도를 입력해주세요.");
                $("#year").focus();
                return false;
            }
            if( $("#distribution").val() == "" ){
                alert("유통 비용율을 입력해주세요.");
                $("#distribution").focus();
                return false;
            }
            if( $("#costDirectly").val() == "" ){
                alert("비용별>직접비를 입력해주세요.");
                $("#costDirectly").focus();
                return false;
            }
            if( $("#costIndirect").val() == "" ){
                alert("비용별>간접비를 입력해주세요.");
                $("#costIndirect").focus();
                return false;
            }
            if( $("#costProfit").val() == "" ){
                alert("비용별>이윤을 입력해주세요.");
                $("#costProfit").focus();
                return false;
            }
            if( $("#stageShipment").val() == "" ){
                alert("단계별>출하단계를 입력해주세요.");
                $("#stageShipment").focus();
                return false;
            }
            if( $("#stageWholesale").val() == "" ){
                alert("단계별>도매단계를 입력해주세요.");
                $("#stageWholesale").focus();
                return false;
            }
            if( $("#stageRetail").val() == "" ){
                alert("단계별>소매단계를 입력해주세요.");
                $("#stageRetail").focus();
                return false;
            }

            $("#distributionRealityViewForm").submit();
        }
        var itemAddHtml = "<input type='hidden' name='itemSeq' value=''/><div class='box-body no-padding'><div class='form-group'><div class='col-md-2'><label class='control-label'>조사품목명</label></div>"+
                "<div class='col-md-6'>"+
                    "<input type='text' class='form-control' name='imgTitle' value=''>"+
                "</div>"+
                "<div class='col-md-1' style='background:none repeat scroll 0 0 #f2f2f2;'>"+
                    "<label class='control-label'>이미지파일</label>"+
                "</div>"+
                "<div class= col-md-6'>"+
                    "<input type='file' class='form-control' name='file' value=''>"+
                "</div></div></div>";
        function addItem(){
            $("#itemAddArea").append(itemAddHtml);
        }

        function imgDel(obj, objVal) {
            $(obj).parent("span").html("");
            $("#delImg").val($("#delImg").val()+","+objVal);
        }

        function imgRowDel(obj, objVal) {
            $(obj).parent("div").parent("div").html("");
            $("#delImg").val($("#delImg").val()+","+objVal);
        }
    </script>
</content>