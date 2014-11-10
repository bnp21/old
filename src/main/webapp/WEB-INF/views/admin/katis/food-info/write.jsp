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
        <li class="active">Global Food Info</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> Global Food Info </h3> <h4><small>Global Food Info를 추가하거나 수정할 수 있습니다.</small></h4>
    </div>
    <div class="section-body">
        <!-- START DATATABLE 1 -->
        <div class="row">
            <div class="col-lg-12">
                <form class="form-horizontal form-banded form-bordered" role="form" id="foodInfoForm" method="POST" action="/admin/katis/food-info/insertFoodInfo" enctype="multipart/form-data">
                <input type="hidden" id="seq" name="seq" value="${foodInfoList[0].seq}"/>
                <input type="hidden" id="delImg" name="delImg" />
                <div class="box box-outlined">
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">첫번째 탭 제목</label>
                            </div>
                            <div class="col-md-11">
                                <input type="text" class="form-control" id="tab1Title" name="tab1Title" value="${foodInfoList[0].tab1Title}" maxlength="20"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">두번째 탭 제목</label>
                            </div>
                            <div class="col-md-11">
                                <input type="text" class="form-control" id="tab2Title" name="tab2Title" value="${foodInfoList[0].tab2Title}" maxlength="20"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">세번째 탭 제목</label>
                            </div>
                            <div class="col-md-11">
                                <input type="text" class="form-control" id="tab3Title" name="tab3Title" value="${foodInfoList[0].tab3Title}" maxlength="20"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">첫번째 탭 내용 이미지</label>
                            </div>
                            <div class="col-md-11">
                                <c:if test="${foodInfoList[0].tab1Img != ' ' && foodInfoList[0].tab1Img != null}"><span id="dev_tab1">${foodInfoList[0].tab1Img} <span onclick="imgDel('tab1');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" name="file" id="tab1Img" multiple />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">두번째 탭 내용 이미지</label>
                            </div>
                            <div class="col-md-11">
                                <c:if test="${foodInfoList[0].tab2Img != ' ' && foodInfoList[0].tab2Img != null}"><span id="dev_tab2">${foodInfoList[0].tab2Img} <span onclick="imgDel('tab2');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" name="file" id="tab2Img" multiple />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">세번째 탭 내용 이미지</label>
                            </div>
                            <div class="col-md-11">
                                <c:if test="${foodInfoList[0].tab3Img != ' ' && foodInfoList[0].tab3Img != null}"><span id="dev_tab3">${foodInfoList[0].tab3Img} <span onclick="imgDel('tab3');" style="cursor:pointer;">X</span></span></c:if>
                                <input type="file" name="file" id="tab3Img" multiple />
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
            if( $("#tab1Title").val() == ""){
                alert("첫번째탭 제목을 입력해주세요.");
                $("#tab1Title").focus();
                return false;
            }
            if( $("#tab2Title").val() == ""){
                alert("두번째탭 제목을 입력해주세요.");
                $("#tab2Title").focus();
                return false;
            }
            if( $("#tab3Title").val() == ""){
                alert("세번째탭 제목을 입력해주세요.");
                $("#tab3Title").focus();
                return false;
            }
            if( $("#tab1Img").val() == "" && ( $("#dev_tab1").html() == undefined || $("#dev_tab1").html() == "" ) ){
                alert("첫번째탭 이미지를 등록해주세요.");
                $("#tab1Img").focus();
                return false;
            }
            if( $("#tab2Img").val() == "" && ( $("#dev_tab1").html() == undefined || $("#dev_tab2").html() == "") ){
                alert("두번째탭 이미지를 등록해주세요.");
                $("#tab2Img").focus();
                return false;
            }
            if( $("#tab3Img").val() == "" && ( $("#dev_tab1").html() == undefined || $("#dev_tab3").html() == "") ){
                alert("세번째탭 이미지를 등록해주세요.");
                $("#tab3Img").focus();
                return false;
            }

            $("#foodInfoForm").submit();
        }

        function imgDel(obj) {
            $("#dev_"+obj).html("");
            $("#delImg").val($("#delImg").val()+","+obj)
        }
    </script>
</content>