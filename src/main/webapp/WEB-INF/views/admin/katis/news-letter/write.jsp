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
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 뉴스 레터 </h3> <h4><small>뉴스 레터를 수정할 수 있습니다.</small></h4>
    </div>
    <div class="section-body">
        <!-- START DATATABLE 1 -->
        <div class="row">
            <div class="col-lg-12">
                <form class="form-horizontal form-banded form-bordered" role="form" id="newsLetterForm" method="POST" action="/admin/katis/news-letter/insertNewsLetter">
                <input type="hidden" id="pkDate" name="pkDate" value="${newsLetterList[0].pkDate}"/>
                <div class="box box-outlined">
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-md-2">
                                <label class="control-label">URL</label>
                            </div>
                            <div class="col-md-10">
                                <input type="text" style="width:80%" class="form-control" name="url" id="url" value="${newsLetterList[0].url}"/>
                            </div>
                        </div>
                    </div>
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-md-2">
                                <label class="control-label">발행일</label>
                            </div>
                            <div class="col-md-10">
                                <input type="text" style="width:80%" class="form-control" name="publishdate" id="publishdate" value="${newsLetterList[0].publishdate}"/>
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
            if( $("#url").val() == "" ){
                alert("URL를 입력해주세요.");
                $("#url").focus();
                return false;
            }
            if( $("#publishdate").val() == "" ){
                alert("발행일을 입력해주세요.");
                $("#publishdate").focus();
                return false;
            }
            $("#newsLetterForm").submit();
        }
    </script>
</content>