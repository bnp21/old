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
        <li><a href="http://localhost/CodeCovers/www.codecovers.com/boostbox">홈</a></li>
        <li class="active">메인 전시 관리</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i>메인 전시 관리 <small>위치별 노출 메뉴를 변경할 수 있습니다.</small></h3>
    </div>
    <div class="section-body">
        <div class="row">
            <div class="col-lg-12">
                <!-- START BLOG MASONRY -->
                <div class="box box-tiles style-gray">
                    <div class="row">
                        <div class="col-md-6">
                            <article>
                                <div class="box-body style-support1 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main1" id="main1" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-primary">수정</button>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                        <div class="col-md-3">
                            <article>
                                <div class="box-body style-support5 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main2" id="main2" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                                <div class="box-body style-support3 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main3" id="main3" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                        <div class="col-md-3">
                            <article>
                                <div class="box-body style-support3 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main4" id="main4" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                                <div class="box-body style-support5 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main5" id="main5" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                    </div><!--end .row -->
                </div><!--end .box -->
                <!-- END BLOG MASONRY -->
            </div><!--end .col-lg-12 -->
        </div><!--end .row -->
        <!-- START PAGINATION -->
        <div class="row">
            <div class="col-lg-12">
                <!-- START BLOG MASONRY -->
                <div class="box box-tiles style-gray">
                    <div class="row">
                        <div class="col-md-3">
                            <article>
                                <div class="box-body style-support1 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main6" id="main6" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                        <div class="col-md-3">
                            <article>
                                <div class="box-body style-support3 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main7" id="main7" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                        <div class="col-md-3">
                            <article>
                                <div class="box-body style-support1 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main8" id="main8" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                        <div class="col-md-3">
                            <article>
                                <div class="box-body style-support3 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select3-list" name="main9" id="main9" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                    </div><!--end .row -->
                </div><!--end .box -->
                <!-- END BLOG MASONRY -->
            </div><!--end .col-lg-12 -->
        </div><!--end .row -->
        <div class="row">
            <div class="col-lg-12">
                <!-- START BLOG MASONRY -->
                <div class="box box-tiles style-gray">
                    <div class="row">
                        <div class="col-md-3">
                            <article>
                                <div class="box-body style-support1 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main10" id="main10" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                        <div class="col-md-3">
                            <article>
                                <div class="box-body style-support3 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main11" id="main11" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                        <div class="col-md-3">
                            <article>
                                <div class="box-body style-support1 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main12" id="main12" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                        <div class="col-md-3">
                            <article>
                                <div class="box-body style-support3 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select3-list" name="main13" id="main13" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                    </div><!--end .row -->
                </div><!--end .box -->
                <!-- END BLOG MASONRY -->
            </div><!--end .col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <!-- START BLOG MASONRY -->
                <div class="box box-tiles style-gray">
                    <div class="row">
                        <div class="col-md-3">
                            <article>
                                <div class="box-body style-support1 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main14" id="main14" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                        <div class="col-md-3">
                            <article>
                                <div class="box-body style-support3 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main15" id="main15" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                        <div class="col-md-3">
                            <article>
                                <div class="box-body style-support1 blog-text box-body-darken">
                                    <div class="text-support3-alt"></div>
                                    <h3><a class="link-default" href="#"></a></h3>
                                    <select class="form-control select2-list" name="main16" id="main16" data-placeholder="Select an item">
                                        <option value="0">선택안함</option>
                                        <c:forEach items="${list}" var="list">
                                            <option value="${list.id}">${list.name}</option>
                                        </c:forEach>
                                    </select>
                                    <p></p>
                                    <button type="button" class="btn btn-white">수정</button>
                                    <br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                </div>
                            </article><!-- end /article -->
                        </div><!--end .col-md-3 -->
                    </div><!--end .row -->
                </div><!--end .box -->
                <!-- END BLOG MASONRY -->
            </div><!--end .col-lg-12 -->
        </div>
        <!-- END PAGINATION -->

    </div><!--end .section-body -->
</section>



<content tag="local_script">
    <script>
        function getMenuList(){
            var menuHtml = "";
            $.get("/admin/getMenuList", {time : new Date().getTime() }, function(data, status){
                $.each(data, function(i){
                    $("#main1").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                });
                $("#main1 option:eq(2)").attr("selected", "selected");
            })
        }

        function getMainList() {
            var menuHtml = "";
            $.get("/admin/getMainList", {time : new Date().getTime() }, function(data, status){
                $.each(data, function(i) {
                    $("#main" + data[i].id + "").val(data[i].menuId);
                    var outlinkValue = "";
                    /*var outlinkValue = " | 내부링크";
                    if (data[i].outlinkYn == "N") {
                        outlinkValue = " | 외부링크";
                    }*/
                    $("#main" + data[i].id + "").parent("div").find(".link-default").html(data[i].menuname);
                    if (data[i].updatedate != null) {
                        $("#main" + data[i].id + "").parent("div").find(".text-support3-alt").html(data[i].updatedate + " 수정됨 | " + data[i].updatename + outlinkValue + " <i class='fa fa-link'></i>");
                    }else if (data[i].createdate != null) {
                        $("#main" + data[i].id + "").parent("div").find(".text-support3-alt").html(data[i].createdate + " 수정됨 | " + data[i].createname + outlinkValue + " <i class='fa fa-link'></i>");
                    }else{
                        $("#main" + data[i].id + "").parent("div").find(".text-support3-alt").html("");
                    }
                });
            })
        }

        $(document).ready(function() {
            getMainList();
            //getMenuList();

            $(".btn-white").click(function(){
                var indexId = $(this).parent("div").find("select").attr("id").replace("main","");
                $.get("/admin/getMainMody?mode=mody&modyId="+indexId+"&menuId="+$("#main"+indexId+" option:selected").val(), {time : new Date().getTime() }, function(data, status){
                    getMainList();
                })
            });

            $(".btn-primary").click(function(){
                $.get("/admin/getMainMody?mode=mody&modyId=1&menuId="+$("#main1 option:selected").val(), {time : new Date().getTime() }, function(data, status){
                    getMainList();
                })
            });
        });
    </script>
</content>