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
        <li class="active">한국 외식업 경기지수</li>
    </ol>
    <div class="section-header">
        <h3 class="text-standard"><i class="fa fa-fw fa-arrow-circle-right text-gray-light"></i> 한국 외식업 경기지수 </h3> <h4><small>한국 외식업 경기지수를 추가하거나 수정할 수 있습니다.</small></h4>
    </div>
    <div class="section-body">
        <!-- START DATATABLE 1 -->
        <div class="row">
            <div class="col-lg-12">
                <form class="form-horizontal form-banded form-bordered" role="form" id="businessForm" method="POST" action="/admin/fis/eating_business/insertEatingBusiness">
                <input type="hidden" id="groupCode" name="groupCode" value="${eatingBusinessList[0].groupCode}"/>
                <div class="box box-outlined">
                    <div class="box-head">
                        <header><h4 class="text-light"><i class="fa fa-pencil fa-fw"></i> <strong>상단부분</strong></h4></header>
                    </div>
                    <div class="box-body no-padding">
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">제목</label>
                            </div>
                            <div class="col-md-11">
                                <input class="form-control" type="text" name="title" id="title" value="${eatingBusinessCommentList[0].title}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-1 col-md-2 col-sm-1">
                                <label class="control-label">이미지<br/>경기지수</label>
                            </div>
                            <div class="col-md-2 col-sm-2">
                                <label class="control-label">이전<br/>외식업경기지수일</label>
                                <input type="text" class="form-control" name="type1lastDate" id="type1lastDate" value="${eatingBusinessList[0].lastDate}">
                                <label class="control-label">이전<br/>외식업경기지수</label>
                                <input type="text" class="form-control" name="type1lastRate" id="type1lastRate" value="${eatingBusinessList[0].lastRate}">
                                <label class="control-label">현재<br/>외식업경기지수일</label>
                                <input type="text" class="form-control" name="type1nowDate" id="type1nowDate" value="${eatingBusinessList[0].nowDate}">
                                <label class="control-label">현재<br/>외식업경기지수</label>
                                <input type="text" class="form-control" name="type1nowRate" id="type1nowRate" value="${eatingBusinessList[0].nowRate}">
                            </div>
                            <div class="col-lg-1 col-md-2 col-sm-3" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">그래프</br>경기지수일</label>
                            </div>
                            <div class="col-md-1 col-sm-4">
                                <label class="control-label">1. </label>
                                <input type="text" class="form-control" name="type2nowDate1" id="type2nowDate1" value="${eatingBusinessList[1].nowDate}">
                                <input type="hidden" name="type2seq1" id="type2seq1" value="${eatingBusinessList[1].seq}" />
                                <label class="control-label">2. </label>
                                <input type="text" class="form-control" name="type2nowDate2" id="type2nowDate2" value="${eatingBusinessList[2].nowDate}">
                                <input type="hidden" name="type2seq2" id="type2seq2" value="${eatingBusinessList[2].seq}" />
                                <label class="control-label">3. </label>
                                <input type="text" class="form-control" name="type2nowDate3" id="type2nowDate3" value="${eatingBusinessList[3].nowDate}">
                                <input type="hidden" name="type2seq3" id="type2seq3" value="${eatingBusinessList[3].seq}" />
                                <label class="control-label">4. </label>
                                <input type="text" class="form-control" name="type2nowDate4" id="type2nowDate4" value="${eatingBusinessList[4].nowDate}">
                                <input type="hidden" name="type2seq4" id="type2seq4" value="${eatingBusinessList[4].seq}" />
                                <label class="control-label">5. </label>
                                <input type="text" class="form-control" name="type2nowDate5" id="type2nowDate5" value="${eatingBusinessList[5].nowDate}">
                                <input type="hidden" name="type2seq5" id="type2seq5" value="${eatingBusinessList[5].seq}" />
                            </div>
                            <div class="col-md-1 col-sm-5">
                                <label class="control-label">6. </label>
                                <input type="text" class="form-control" name="type2nowDate6" id="type2nowDate6" value="${eatingBusinessList[6].nowDate}">
                                <input type="hidden" name="type2seq6" id="type2seq6" value="${eatingBusinessList[6].seq}" />
                                <label class="control-label">7. </label>
                                <input type="text" class="form-control" name="type2nowDate7" id="type2nowDate7" value="${eatingBusinessList[7].nowDate}">
                                <input type="hidden" name="type2seq7" id="type2seq7" value="${eatingBusinessList[7].seq}" />
                                <label class="control-label">8. </label>
                                <input type="text" class="form-control" name="type2nowDate8" id="type2nowDate8" value="${eatingBusinessList[8].nowDate}">
                                <input type="hidden" name="type2seq8" id="type2seq8" value="${eatingBusinessList[8].seq}" />
                                <label class="control-label">9. </label>
                                <input type="text" class="form-control" name="type2nowDate9" id="type2nowDate9" value="${eatingBusinessList[9].nowDate}">
                                <input type="hidden" name="type2seq9" id="type2seq9" value="${eatingBusinessList[9].seq}" />
                                <label class="control-label">10. </label>
                                <input type="text" class="form-control" name="type2nowDate10" id="type2nowDate10" value="${eatingBusinessList[10].nowDate}">
                                <input type="hidden" name="type2seq10" id="type2seq10" value="${eatingBusinessList[10].seq}" />
                            </div>
                            <div class="col-lg-1 col-md-2 col-sm-6" style="background:none repeat scroll 0 0 #f2f2f2;">
                                <label class="control-label">그래프</br>경기지수</label>
                            </div>
                            <div class="col-md-1 col-sm-7">
                                <label class="control-label">1. </label>
                                <input type="text" class="form-control" name="type2nowRate1" id="type2nowRate1" value="${eatingBusinessList[1].nowRate}">
                                <label class="control-label">2. </label>
                                <input type="text" class="form-control" name="type2nowRate2" id="type2nowRate2" value="${eatingBusinessList[2].nowRate}">
                                <label class="control-label">3. </label>
                                <input type="text" class="form-control" name="type2nowRate3" id="type2nowRate3" value="${eatingBusinessList[3].nowRate}">
                                <label class="control-label">4. </label>
                                <input type="text" class="form-control" name="type2nowRate4" id="type2nowRate4" value="${eatingBusinessList[4].nowRate}">
                                <label class="control-label">5. </label>
                                <input type="text" class="form-control" name="type2nowRate5" id="type2nowRate5" value="${eatingBusinessList[5].nowRate}">
                            </div>
                            <div class="col-md-1 col-sm-8">
                                <label class="control-label">6. </label>
                                <input type="text" class="form-control" name="type2nowRate6" id="type2nowRate6" value="${eatingBusinessList[6].nowRate}">
                                <label class="control-label">7. </label>
                                <input type="text" class="form-control" name="type2nowRate7" id="type2nowRate7" value="${eatingBusinessList[7].nowRate}">
                                <label class="control-label">8. </label>
                                <input type="text" class="form-control" name="type2nowRate8" id="type2nowRate8" value="${eatingBusinessList[8].nowRate}">
                                <label class="control-label">9. </label>
                                <input type="text" class="form-control" name="type2nowRate9" id="type2nowRate9" value="${eatingBusinessList[9].nowRate}">
                                <label class="control-label">10. </label>
                                <input type="text" class="form-control" name="type2nowRate10" id="type2nowRate10" value="${eatingBusinessList[10].nowRate}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">상단 설명 제목</label>
                            </div>
                            <div class="col-md-11">
                                <input type="text" class="form-control" name="Memo1Title" id="Memo1Title" value="${eatingBusinessCommentList[0].memo1Title}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">상단 설명</label>
                            </div>
                            <div class="col-md-11">
                                <textarea name="Memo1" id="Memo1" class="form-control" rows="3">${eatingBusinessCommentList[0].memo1}</textarea>
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
                            <div class="col-lg-2 col-md-4 col-sm-4" style="background:#fff">
                                <input type="hidden" name="type3seq1" id="type3seq1" value="${eatingBusinessList[11].seq}" />
                                <label class="control-label">음식명</label>
                                <input type="text" class="form-control" name="type3foodType1" id="type3foodType1" value="${eatingBusinessList[11].foodType}">
                                <label class="control-label">이전 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3lastDate1" id="type3lastDate1" value="${eatingBusinessList[11].lastDate}">
                                <label class="control-label">이전 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3lastRate1" id="type3lastRate1" value="${eatingBusinessList[11].lastRate}">
                                <label class="control-label">현재 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3nowDate1" id="type3nowDate1" value="${eatingBusinessList[11].nowDate}">
                                <label class="control-label">현재 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3nowRate1" id="type3nowRate1" value="${eatingBusinessList[11].nowRate}">
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-4">
                                <input type="hidden" name="type3seq2" id="type3seq2" value="${eatingBusinessList[12].seq}" />
                                <label class="control-label">음식명</label>
                                <input type="text" class="form-control" name="type3foodType2" id="type3foodType2" value="${eatingBusinessList[12].foodType}">
                                <label class="control-label">이전 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3lastDate2" id="type3lastDate2" value="${eatingBusinessList[12].lastDate}">
                                <label class="control-label">이전 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3lastRate2" id="type3lastRate2" value="${eatingBusinessList[12].lastRate}">
                                <label class="control-label">현재 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3nowDate2" id="type3nowDate2" value="${eatingBusinessList[12].nowDate}">
                                <label class="control-label">현재 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3nowRate2" id="type3nowRate2" value="${eatingBusinessList[12].nowRate}">
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-4">
                                <input type="hidden" name="type3seq3" id="type3seq3" value="${eatingBusinessList[13].seq}" />
                                <label class="control-label">음식명</label>
                                <input type="text" class="form-control" name="type3foodType3" id="type3foodType3" value="${eatingBusinessList[13].foodType}">
                                <label class="control-label">이전 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3lastDate3" id="type3lastDate3" value="${eatingBusinessList[13].lastDate}">
                                <label class="control-label">이전 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3lastRate3" id="type3lastRate3" value="${eatingBusinessList[13].lastRate}">
                                <label class="control-label">현재 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3nowDate3" id="type3nowDate3" value="${eatingBusinessList[13].nowDate}">
                                <label class="control-label">현재 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3nowRate3" id="type3nowRate3" value="${eatingBusinessList[13].nowRate}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-2 col-md-4 col-sm-4"  style="background:#fff">
                                <input type="hidden" name="type3seq4" id="type3seq4" value="${eatingBusinessList[14].seq}" />
                                <label class="control-label">음식명</label>
                                <input type="text" class="form-control" name="type3foodType4" id="type3foodType4" value="${eatingBusinessList[14].foodType}">
                                <label class="control-label">이전 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3lastDate4" id="type3lastDate4" value="${eatingBusinessList[14].lastDate}">
                                <label class="control-label">이전 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3lastRate4" id="type3lastRate4" value="${eatingBusinessList[14].lastRate}">
                                <label class="control-label">현재 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3nowDate4" id="type3nowDate4" value="${eatingBusinessList[14].nowDate}">
                                <label class="control-label">현재 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3nowRate4" id="type3nowRate4" value="${eatingBusinessList[14].nowRate}">
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4">
                                <input type="hidden" name="type3seq5" id="type3seq5" value="${eatingBusinessList[15].seq}" />
                                <label class="control-label">음식명</label>
                                <input type="text" class="form-control" name="type3foodType5" id="type3foodType5" value="${eatingBusinessList[15].foodType}">
                                <label class="control-label">이전 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3lastDate5" id="type3lastDate5" value="${eatingBusinessList[15].lastDate}">
                                <label class="control-label">이전 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3lastRate5" id="type3lastRate5" value="${eatingBusinessList[15].lastRate}">
                                <label class="control-label">현재 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3nowDate5" id="type3nowDate5" value="${eatingBusinessList[15].nowDate}">
                                <label class="control-label">현재 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3nowRate5" id="type3nowRate5" value="${eatingBusinessList[15].nowRate}">
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4">
                                <input type="hidden" name="type3seq6" id="type3seq6" value="${eatingBusinessList[16].seq}" />
                                <label class="control-label">음식명</label>
                                <input type="text" class="form-control" name="type3foodType6" id="type3foodType6" value="${eatingBusinessList[16].foodType}">
                                <label class="control-label">이전 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3lastDate6" id="type3lastDate6" value="${eatingBusinessList[16].lastDate}">
                                <label class="control-label">이전 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3lastRate6" id="type3lastRate6" value="${eatingBusinessList[16].lastRate}">
                                <label class="control-label">현재 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3nowDate6" id="type3nowDate6" value="${eatingBusinessList[16].nowDate}">
                                <label class="control-label">현재 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3nowRate6" id="type3nowRate6" value="${eatingBusinessList[16].nowRate}">
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4">
                                <input type="hidden" name="type3seq7" id="type3seq7" value="${eatingBusinessList[17].seq}" />
                                <label class="control-label">음식명</label>
                                <input type="text" class="form-control" name="type3foodType7" id="type3foodType7" value="${eatingBusinessList[17].foodType}">
                                <label class="control-label">이전 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3lastDate7" id="type3lastDate7" value="${eatingBusinessList[17].lastDate}">
                                <label class="control-label">이전 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3lastRate7" id="type3lastRate7" value="${eatingBusinessList[17].lastRate}">
                                <label class="control-label">현재 외식업경기지수일</label>
                                <input type="text" class="form-control" name="type3nowDate7" id="type3nowDate7" value="${eatingBusinessList[17].nowDate}">
                                <label class="control-label">현재 외식업경기지수</label>
                                <input type="text" class="form-control" name="type3nowRate7" id="type3nowRate7" value="${eatingBusinessList[17].nowRate}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">하단 설명 제목</label>
                            </div>
                            <div class="col-md-11">
                                <input type="text" class="form-control" name="Memo2Title" id="Memo2Title" value="${eatingBusinessCommentList[0].memo2Title}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1">
                                <label class="control-label">하단 설명</label>
                            </div>
                            <div class="col-md-11">
                                <textarea name="Memo2" id="Memo2" class="form-control" rows="3">${eatingBusinessCommentList[0].memo2}</textarea>
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
            if( $("#title").val() == "" ){
                alert("제목을 등록해주세요.");
                $("#title").focus();
                return false;
            }

            $("#businessForm").submit();
        }
    </script>
</content>