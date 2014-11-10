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
        <li><a href="/admin/">식품정보</a></li>
        <li class="active">국내외 식품산업 주요지표</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 국내외 식품산업 주요지표 </h3> <h4><small>국내외 식품산업 주요지표를 추가하거나 수정할 수 있습니다.</small></h4>
    </div>
    <div class="section-body">
        <!-- START DATATABLE 1 -->
        <div class="row">
            <div class="col-lg-12">
                <form class="form-horizontal form-banded form-bordered" role="form" id="mainIndicatorsForm" method="POST" action="/admin/fis/mainIndicators/insertMainIndicators" enctype="multipart/form-data">
                <input type="hidden" id="seq" name="seq" value="${mainIndicatorsList[0].seq}"/>
                <input type="hidden" id="delImg" name="delImg" />
                <div class="box box-outlined">
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">첫번째 탭 ON</label>
                            </div>
                            <div class="col-md-5">
                                <c:if test="${mainIndicatorsList[0].imgTab1On != ' ' && mainIndicatorsList[0].imgTab1On != null}"><span id="dev_imgTab1">${mainIndicatorsList[0].imgTab1On} <span onclick="imgDel('imgTab1On');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" name="file" id="imgTab1On" multiple />
                            </div>
                            <div class="col-md-1" style="background-color: #f2f2f2">
                                <label class="control-label">첫번째 탭 OFF</label>
                            </div>
                            <div class="col-md-5">
                                <c:if test="${mainIndicatorsList[0].imgTab1Off != ' ' && mainIndicatorsList[0].imgTab1Off != null}"><span id="dev_imgTab1Off">${mainIndicatorsList[0].imgTab1Off} <span onclick="imgDel('imgTab1Off');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" name="file" id="imgTab1Off" multiple />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">두번째 탭 ON</label>
                            </div>
                            <div class="col-md-5">
                                <c:if test="${mainIndicatorsList[0].imgTab2On != ' ' && mainIndicatorsList[0].imgTab2On != null}"><span id="dev_imgTab2On">${mainIndicatorsList[0].imgTab2On} <span onclick="imgDel('imgTab2On');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" name="file" id="imgTab2On" multiple />
                            </div>
                            <div class="col-md-1" style="background-color: #f2f2f2">
                                <label class="control-label">두번째 탭 OFF</label>
                            </div>
                            <div class="col-md-5">
                                <c:if test="${mainIndicatorsList[0].imgTab2Off != ' ' && mainIndicatorsList[0].imgTab2Off != null}"><span id="dev_imgTab2Off">${mainIndicatorsList[0].imgTab2Off} <span onclick="imgDel('imgTab2Off');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" name="file" id="imgTab2On" multiple />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">세번째 탭 ON</label>
                            </div>
                            <div class="col-md-5">
                                <c:if test="${mainIndicatorsList[0].imgTab3On != ' ' && mainIndicatorsList[0].imgTab3On != null}"><span id="dev_imgTab3On">${mainIndicatorsList[0].imgTab3On} <span onclick="imgDel('imgTab3On');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" name="file" id="imgTab3On" multiple />
                            </div>
                            <div class="col-md-1" style="background-color: #f2f2f2">
                                <label class="control-label">세번째 탭 OFF</label>
                            </div>
                            <div class="col-md-5">
                                <c:if test="${mainIndicatorsList[0].imgTab3Off != ' ' && mainIndicatorsList[0].imgTab3Off != null}"><span id="dev_imgTab3Off">${mainIndicatorsList[0].imgTab3Off} <span onclick="imgDel('imgTab3Off');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" name="file" id="imgTab3Off" multiple />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">첫번째 탭 내용 이미지</label>
                            </div>
                            <div class="col-md-11">
                                <c:if test="${mainIndicatorsList[0].contentsTab1 != ' ' && mainIndicatorsList[0].contentsTab1 != null}"><span id="dev_contentsTab1">${mainIndicatorsList[0].contentsTab1} <span onclick="imgDel('contentsTab1');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" name="file" id="contentsTab1" multiple />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">두번째 탭 내용 이미지</label>
                            </div>
                            <div class="col-md-11">
                                <c:if test="${mainIndicatorsList[0].contentsTab2 != ' ' && mainIndicatorsList[0].contentsTab2 != null}"><span id="dev_contentsTab2">${mainIndicatorsList[0].contentsTab2} <span onclick="imgDel('contentsTab2');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" name="file" id="contentsTab2" multiple />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">세번째 탭 첫번째 내용 이미지</label>
                            </div>
                            <div class="col-md-11">
                                <c:if test="${mainIndicatorsList[0].contents1Tab3 != ' ' && mainIndicatorsList[0].contents1Tab3 != null}"><span id="dev_contents1Tab3">${mainIndicatorsList[0].contents1Tab3} <span onclick="imgDel('contents1Tab3');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" name="file" id="contents1Tab2" multiple />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">세번째 탭 두번째 내용 이미지</label>
                            </div>
                            <div class="col-md-11">
                                <c:if test="${mainIndicatorsList[0].contents2Tab3 != ' ' && mainIndicatorsList[0].contents2Tab3 != null}"><span id="dev_contents2Tab3">${mainIndicatorsList[0].contents2Tab3} <span onclick="imgDel('contents2Tab3');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" name="file" id="contents2Tab2" multiple />
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
    <script type="text/javascript">
        function saveContent(){
            if( $("#imgTab1").val() == "" && $("#dev_tab1").html() == "" ){
                alert("첫번째탭 이미지를 등록해주세요.");
                $("#imgTab1").focus();
                return false;
            }
            if( $("#imgTab2").val() == "" && $("#dev_tab2").html() == "" ){
                alert("두번째탭 이미지를 등록해주세요.");
                $("#imgTab2").focus();
                return false;
            }
            if( $("#imgTab3").val() == "" && $("#dev_tab3").html() == "" ){
                alert("세번째탭 이미지를 등록해주세요.");
                $("#imgTab3").focus();
                return false;
            }

            $("#mainIndicatorsForm").submit();
        }

        function imgDel(obj) {
            $("#dev_"+obj).html("");
            $("#delImg").val($("#delImg").val()+","+obj)
        }
    </script>
</content>