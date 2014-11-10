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
        <li class="active">농축수산물 소매가격 일일동향</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 농축수산물 소매가격 일일동향 </h3> <h4><small>농축수산물 소매가격 일일동향 노출 데이터를 선택할 수 있습니다.</small></h4>
    </div>
    <div class="section-body">
        <!-- START DATATABLE 1 -->
        <div class="row">
            <div class="col-lg-12">
                <form class="form-horizontal form-banded form-bordered" role="form" id="priceForm" method="POST" action="/admin/kamis/daily_price/insertDailyPrice">
                <input type="hidden" name="pkDate" id="pkDate" value="${dailyPriceList[0].pkDate}">
                <div class="box box-outlined">
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-md-2">
                                <label class="control-label">기준일</label>
                            </div>
                            <div class="col-md-12">
                                ${dailyPriceList[0].pkDate}
                            </div>
                        </div>
                     </div>
                </div>
                <div class="box box-outlined">
                    <div class="box-body no-padding">
                        <c:forEach items="${dailyPriceList}" var="list">
                            <input type="hidden" name="productId_${list.productId}" id="productId_${list.productId}" value="${list.productId}">
                            <div class="form-group">
                                <div class="col-lg-2 col-md-2 col-sm-3">
                                    <label class="control-label">${list.itemName}</label>
                                </div>
                                <div class="col-md-2" style="float:left">
                                    <input type="radio" class="dev_radio" name="viewYn_${list.productId}" value="Y" <c:if test="${list.viewYn == 'Y'}">checked</c:if> > 노출
                                    <input type="radio" name="viewYn_${list.productId}" value="N" <c:if test="${list.viewYn == 'N'}">checked</c:if>> 미노출
                                </div>
                            </div>
                        </c:forEach>
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
            if( $(".dev_radio:checked").length  != 10 ){
                alert("노출상품이 10개 선택되어야 합니다. 현재 "+$(".dev_radio:checked").length+"개 선택되었습니다.");
                return false;
            }
            $("#priceForm").submit();
        }
    </script>
</content>