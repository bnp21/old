<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!--
    <meta charset="utf-8"/>
    <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible' />
    <meta name="language" content="ko" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0 minimal-ui" />
    -->
    <title>aT생생정보</title>
    <link rel="stylesheet" type="text/css" href="/resources/front/css/common.css" />
    <link rel="stylesheet" type="text/css" href="/resources/front/css/style.css" />
    <script type="text/javascript" src="/resources/front/js/jquery-1.11.0.min.js"></script>

</head>
<body>
<div id="warp" class="mail_warp">
    <!-- header -->
    <div id="header">
        <section>
            <div class="mail_box">
                <h1 class="h_title"><img src="/resources/front/img/bg/create_bg.jpg" alt="창조마당에 아이디어 및 건의사항을 남겨주세요!"></h1>
            </div>
        </section>
    </div>
    <!-- //header -->
    <!-- contents -->
    <div id="contents">
        <section>
            <div class="mail_contents_box">
                <form id="makeGardenForm" name="makeGardenForm" action="/makegarden/insertMakeGarden" method="POST">
                    <fieldset>
                        <legend>창조마당 메일 보내기</legend>
                        <table>
                            <tr>
                                <th class="form_title"><label for="title">제목</label></th>
                                <td class="form_main"><input id="title" name="title" type="text" maxlength="20"></td>
                            </tr>
                            <tr>
                                <th class="form_title"><label for="memo">주요건의사항 및<br>창조적아이디어</label></th>
                                <td class="form_main"><textarea id="memo" name="memo"></textarea></td>
                            </tr>
                            <tr>
                                <th class="form_title"><label for="name">성명</label></th>
                                <td class="form_main"><input id="name" name="name" type="text" style="width:197px;" maxlength="10"></td>
                            </tr>
                            <tr>
                                <th class="form_title"><label for="phone">휴대전화 번호</label></th>
                                <td class="form_main"><input id="phone" name="phone" type="text" style="width:197px;" maxlength="15"></td>
                            </tr>
                            <tr>
                                <th class="form_title"><label for="email">E-mail</label></th>
                                <td class="form_main"><input id="email" name="email" type="text" maxlength="80"></td>
                            </tr>
                            <tr>
                                <th class="form_title"><label for="addr">주소</label></th>
                                <td class="form_main"><input id="addr" name="addr" type="text" maxlength="100"></td>
                            </tr>
                            <tr>
                                <th class="form_title">개인정보<br>수집 동의 안내</th>
                                <td class="form_main">* 개인정보 : 성명, 휴대전화 번호, 이메일, 주소<br>
                                    <!-- * 휴대폰 번호를 기입하시면 이메일 답변이 발송된 후에 문자메시지(SMS)로 알려드립니다.<br> -->
                                    * 해당 정보는 회신 및 경품 배송을 위해 보관하오며, 이 외의 목적으로 사용되지 않습니다.</td>
                            </tr>
                        </table>
                        <div class="check">
                            <input type="checkbox" name="chk_agree" id="chk_agree"> 상기 내용을 이해하였으며, 개인정보 수집에 동의합니다.
                        </div>

                        <div class="send">
                            <img src="/resources/front/img/btn/create_btn.png" border="0" onclick="save();" style="cursor:pointer;" alt="메일보내기">
                        </div>
                    </fieldset>
                </form>
            </div>
        </section>
    </div>
     <!-- //contents -->
    <!-- footer -->
    <div id="footer" class="footer_mail">
        <section>
            <img src="/resources/front/img/common/mail_footer.png" alt="AT 한국농수산식품 유통공사 로고">
        </section>
    </div>
    <!-- //footer -->
</div>
</body>
</html>

<content tag="local_script">
    <script type="text/javascript">

        function save(){

            if( $("#title").val() == "" ){
                alert("제목을 입력해주세요.");
                $("#title").focus();
                return false;
            }
            if( $("#memo").val() == "" ){
                alert("주요건의사항 및 창조적아이디어를 입력해주세요.");
                $("#memo").focus();
                return false;
            }
            if( $("#name").val() == "" ){
                alert("성명을 입력해주세요.");
                $("#name").focus();
                return false;
            }
            if( $("#phone").val() == "" ){
                alert("휴대전화번호를 입력해주세요.");
                $("#phone").focus();
                return false;
            }
            if( $("#email").val() == "" ){
                alert("E-mail을 입력해주세요.");
                $("#email").focus();
                return false;
            }
            if( $("#addr").val() == "" ){
                alert("주소을 입력해주세요.");
                $("#addr").focus();
                return false;
            }
            if( $("#chk_agree").is(":checked") == false ){
                alert("개인정보 수집에 동의해주세요.");
                $("#chk_agree").focus();
                return false;
            }
            $("#makeGardenForm").submit();
        }
    </script>
</content>