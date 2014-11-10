<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- contents -->
<div id="contents" class="main_contents">
    <section>
        <div class="contents_box_main">
            <div class="notice_top">
                <div class="notice">
                    <div class="notice_title"> <img src="/resources/front/img/text/notice_title.png" alt="알림마당"> </div>
                    <div class="notice_board">
                        <div class="board_top">
                            <div class="board_title"> ${noticeView.title} </div>
                            <div class="board_sub"> <span class="name">작성자 : <span>${noticeView.accountId}</span></span> <span class="day"><fmt:parseDate value="${noticeView.regdate}" pattern ="yyyy-MM-dd" var="regdate"> </fmt:parseDate>
                                        <fmt:formatDate value="${regdate}" pattern="yyyy.MM.dd"></fmt:formatDate></span> </div>
                        </div>
                        <div class="board_main">
                            ${noticeView.contents}
                        </div>
                    </div>
                    <div class="notice_close">
                        <a href="/"><img src="/resources/front/img/btn/gomain_btn.png" alt="메인화면으로 돌아가기"></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<!-- //contents -->
<!-- footer -->
<div id="footer" class="footer_main">
    <section>
        <div class="footer_logo"><a href="http://www.at.or.kr/" target="_blank"><img src="/resources/front/img/common/footer_logo_g.png" alt="at 한국농수산식품유통공사 로고"></a></div>
        <div class="footer_text">
            <div class="f_top">
                <ul>
                    <li><a href="http://www.at.or.kr/html/member/at_acount_2.html" onclick="javascript:window.open('http://www.at.or.kr/html/member/at_acount_2.html','개인정보처리방침','width=865px,height=680px,scrollbars=yes');return false;" target="_blank"><span><strong>개인정보처리방침</strong></span></a></li>
                    <li><a href="http://www.at.or.kr/privacy/apko372000/intro.action" target="_blank"><span>개인정보침해신고센터</span></a></li>
                    <li><a href="http://www.at.or.kr/html/member/at_acount_5.html" onclick="javascript:window.open('http://www.at.or.kr/html/member/at_acount_5.html','전자우편주소수집거부','width=865px,height=680px,scrollbars=yes');return false;" target="_blank"><span>전자우편주소수집거부</span></a></li>
                    <li><a href="http://www.at.or.kr/contents/apko316110/view.action" target="_blank"><span>찾아오시는길</span></a></li>
                </ul>
            </div>
            <div class="f_bottom"> [137-787] 서울특별시 서초구 강남대로 27, (양재동, aT센터) | 일반안내 : 02-6300-1114<br>
                전시장임대 " 02-6300-1912, 회의실임대 " 02-6300-1900, 사무실임대 : 02-6300-1468, 예식홀임대 : 02-6300-2300<br>
                COPYRIGHTⓒ 2010 BY Korea Agro-Fisheries & Food Trade Corp. ALL RIGHTS RESERVED. </div>
        </div>
        <div class="footer_etc">
            <div class="e_top">
                <select id="familyLink">
                    <option value="">-- Family Site --</option>
                    <option value="http://www.foodbiz.or.kr/">농수산식품기업지원센터</option>
                    <option value="http://www.kati.net/">aTKati</option>
                    <option value="http://www.agrotrade.net/">Agro Trade</option>
                    <option value="http://atcenter.at.or.kr">aTCenter</option>
                    <option value="http://whimori.at.or.kr">Whimori</option>
                    <option value="http://forestproduct.at.or.kr">Korea Forest Products</option>
                    <option value="http://atess.at.or.kr/">수출지원시스템</option>
                    <option value="http://global.at.or.kr/">aT수출업체종합지원시스템</option>
                    <option value="http://www.kamis.co.kr/">aTKAMIS</option>
                    <option value="http://yfmc.at.or.kr">aT회훼공판장</option>
                    <option value="http://edu.at.or.kr">aT농식품유통교육원</option>
                    <option value="http://www.eat.co.kr/attach/cyber/index.htm">농수산물사이버거래소</option>
                    <option value="http://www.atbid.co.kr/">비축농산물 전자입찰시스템</option>
                    <option value="http://www.atfis.or.kr">식품산업통계정보</option>
                    <option value="http://www.eSingSing.com">싱싱장터</option>
                </select>
                <img src="/resources/front/img/btn/btn_go.png" alt="바로가기" onclick="outLinkAction($('#familyLink').val())" style="cursor:pointer"></div>
            <div class="e_top">
                <select id="relatedLink">
                    <option value="">--- 유관기관 ---</option>
                    <option value="http://www.maf.go.kr/">농림축산식품부</option>
                    <option value="http://www.naqs.go.kr/">국립농산물품질관리원</option>
                    <option value="http://www.naas.go.kr/">농촌진흥청 국립농업과학원</option>
                    <option value="http://www.qia.go.kr/">농림수산검역검사본부</option>
                    <option value="http://www.seed.go.kr/">국립종자원</option>
                    <option value="http://www.kma.go.kr/">기상청</option>
                    <option value="http://www.ipet.re.kr/">농림수산식품기술기획평가원</option>
                    <option value="http://www.epis.or.kr/">농림수산식품교육문화정보원</option>
                    <option value="http://www.ati.go.kr/">농수산식품연수원</option>
                    <option value="http://www.rda.go.kr/">농촌진흥청</option>
                    <option value="http://www.nonghyup.com/">농협</option>
                    <option value="http://www.forest.go.kr">산림청</option>
                    <option value="http://www.suhyup.co.kr/">수협</option>
                    <option value="http://www.ekr.or.kr">한국농어촌공사</option>
                    <option value="http://www.af.ac.kr/">한국농수산대학</option>
                    <option value="http://www.krei.re.kr/">한국농촌경제연구원</option>
                    <option value="http://www.kfri.re.kr/">한국식품연구원</option>
                    <option value="http://www.sonosa.or.kr/">남북교류협력지원협회</option>
                </select>
                <img src="/resources/front/img/btn/btn_go.png" alt="바로가기" onclick="outLinkAction($('#relatedLink').val())" style="cursor:pointer"> </div>
            <%--<div class="e_bottom"> <a href="http://www.kats.go.kr/htm/business_06/ea_04_01.asp"><img src="/resources/front/img/common/main_footer_icon01.png" alt=""></a> <a href="http://www.eprivacy.or.kr"><img src="/resources/front/img/common/main_footer_icon02.png" alt=""></a><a href="http://www.eprivacy.or.kr/"><img src="/resources/front/img/common/main_footer_icon03.png" alt=""></a> </div>--%>
        </div>
    </section>
</div>
<!-- //footer -->
</div>
</div>
</body>
</html>
<content tag="local_script">
    <script type="text/javascript">
        function linkAction(linktype){
            location.href = linktype;
        }

        function outLinkAction(linktype){
            window.open(linktype,"","");
        }
    </script>
</content>