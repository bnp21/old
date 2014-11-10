<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="wrapper">
    <div class="header">
        <h1>파일 첨부</h1>
    </div>
    <div class="body">
        <form:form commandName="file" name="insert_form" id="insert_form" class="form-horizontal form-banded form-bordered" enctype="multipart/form-data"  method="POST">
        <dl class="alert">
            <dt>파일 첨부 확인</dt>
            <div class="form-group">
                <div class="col-lg-11 col-md-10 col-sm-9">
                    <span id="delFileArea"></span>
                    <input type="file" name="file" id="file" multiple />
                </div>
            </div>
        </dl>
        </form:form>
    </div>
    <div class="footer">
        <p><a href="#" onclick="closeWindow();" title="닫기" class="close">닫기</a></p>
        <ul>
            <li class="submit"><a href="#"  onclick="FileUpload();"  id="filesubmit" name="filesubmit" title="등록" class="btnlink">등록</a> </li>
            <li class="cancel"><a href="#" onclick="closeWindow();" title="취소" class="btnlink">취소</a></li>
        </ul>
    </div>
</div>
<content tag="local_script">
<script type="text/javascript">
    $(document).ready(function(){
        initUploader();
    });
    $(document).ajaxError(function(event, request){
                if(request.status==500)
                    alert("데이터 저장시 오류 발생!!");
            }
    );

    //파일전송 후 콜백 함수
    function FileuploadCallback(data, state){
        if (data=="error"){
            alert("파일전송중 에러 발생!!");
            return false;
        }

        var _mockdata = {
            'imageurl': '/resources/front/upload/editor/'+data.filename,
            'filename': data.filename,
            'filesize':  data.filesize,
            'imagealign': 'C',
            'originalurl': '/resources/front/upload/editor/'+data.filename,
            'thumburl': '/resources/front/upload/editor/'+data.filename
        };

        execAttach(_mockdata);
        closeWindow();
    }

    $(function(){
        //비동기 파일 전송
        var frm=$('#insert_form');

        frm.ajaxForm(FileuploadCallback);
        frm.submit(function(){return false;});
    });

    // 파일업로드 이벤트
    function FileUpload(){
        if (typeof(execAttach) == 'undefined') { //Virtual Function
            return;
        }

        if(!$("#file").val()){
            alert("파일을 선택하세요.");
            $("#file").focus();
            return;
        }
        //파일전송
        var frm;
        frm = $('#insert_form');
        frm.attr("action","/file/upload/insertFile");
        frm.submit();
    }


    function done() {

    }

    function initUploader(){
        var _opener = PopupUtil.getOpener();
        if (!_opener) {
            alert('잘못된 경로로 접근하셨습니다.');
            return;
        }

        var _attacher = getAttacher('image', _opener);
        registerAction(_attacher);
    }

</script>
</content>