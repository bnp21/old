package com.info.web.domain;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Ljd on 2014-11-06.
 */
public class Email {

    private String senderEmail="";                  //메일 송신자의 이메일
    private String senderName="";             //메일 송신자 이름
    private String receiverEmail="";                  //메일 수신자의 이메일
    private String receiverName="";             //메일 수신자 이름
    private String subject="";                  //제목
    private String content="";               //내용
    private String content2="";               //답변

    private Integer seq;
    private String title;
    private String name;
    private String phone;
    private String email;
    private String addr;
    private String memo;
    private String replyMemo;
    private String replyYn;

    private String createdate;
    private String replydate;
    private String replyid;
    private String replyDept;
    private String replyPhone;
    private String replyName;
    private String replyEmail;


    public String getSenderEmail() {
        return senderEmail;
    }
    public void setSenderEmail(String senderEmail) {
        this.senderEmail = senderEmail;
    }

    public String getSenderName() {
        return senderName;
    }
    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getReceiverEmail() {
        return receiverEmail;
    }
    public void setReceiverEmail(String receiverEmail) {
        this.receiverEmail = receiverEmail;
    }

    public String getReceiverName() {
        return receiverName;
    }
    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getContent2() {
        return content2;
    }
    public void setContent2(String content2) {
        this.content2 = content2;
    }

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getReplyMemo() {
        return replyMemo;
    }

    public void setReplyMemo(String replyMemo) {
        this.replyMemo = replyMemo;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getReplydate() {
        return replydate;
    }

    public void setReplydate(String replydate) {
        this.replydate = replydate;
    }

    public String getReplyid() {
        return replyid;
    }

    public void setReplyid(String replyid) {
        this.replyid = replyid;
    }

    public String getReplyYn() {
        return replyYn;
    }

    public void setReplyYn(String replyYn) {
        this.replyYn = replyYn;
    }

    public String getReplyDept() {
        return replyDept;
    }

    public void setReplyDept(String replyDept) {
        this.replyDept = replyDept;
    }

    public String getReplyPhone() {
        return replyPhone;
    }

    public void setReplyPhone(String replyPhone) {
        this.replyPhone = replyPhone;
    }
    public String getReplyName() {
        return replyName;
    }

    public void setReplyName(String replyName) {
        this.replyName = replyName;
    }
    public String getReplyEmail() {
        return replyEmail;
    }

    public void setReplyEmail(String replyEmail) {
        this.replyEmail = replyEmail;
    }

    //창조마당 메일 바디 만들기
    public String getHtml(Email email, HttpServletRequest request) {
        StringBuffer body=new StringBuffer();

        String url= String.valueOf(request.getRequestURL());
        String pathUrl="";
        String rootUrl="";

        if(url.indexOf("localhost")>-1){
            pathUrl="http://localhost:8080"+"/resources/front";
            rootUrl="http://localhost:8080";
        }else{
            pathUrl="http://info.at.or.kr"+"/resources/front";
            rootUrl="http://info.at.or.kr";
        }

        System.out.println("url==>"+url);
        System.out.println("pathUrl==>"+pathUrl);
        System.out.println("rootUrl==>"+rootUrl);

        //body.append("\n <link href='"+rootUrl+"/css/content.css' rel='stylesheet' type='text/css'> ");
        //http://info.at.or.kr/resources/front/img/bg/mail_top_bg.jpg

        body.append("\n <!DOCTYPE html>");
        body.append("\n <html lang=\"ko\">");
        body.append("\n <head>");
        body.append("\n <meta charset=\"utf-8\"/>");
        body.append("\n <meta content=\"IE=edge,chrome=1\" http-equiv=\"X-UA-Compatible\" />");
        body.append("\n <meta name=\"language\" content=\"ko\" />");
        body.append("\n <title>aT생생정보</title>");
        body.append("\n <script type=\"text/javascript\" src=\"scripts/jquery-1.11.0.min.js\"></script>");
        body.append("\n </head>");
        body.append("\n <body>");
        body.append("\n <style>");
        body.append("\n @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);");
        body.append("\n body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, form, fieldset, p, input, textarea, select, button, label, pre, table, th, td {margin:0; padding:0; }");
        body.append("\n </style>");
        body.append("\n <div style=\"width:720px; margin:0 auto; font-family: 'Nanum Gothic';\"> ");
        /* header start */
        body.append("\n <div style=\"margin:0 auto; height:276px; padding:32px 50px; background:url("+pathUrl+"/img/bg/mail_top_bg.jpg); background-repeat:no-repeat; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box;\">");
        body.append("\n <section style=\"display:block;\">");
        body.append("\n <div style=\"float:left; display:inline-block;\"> <img src='"+pathUrl+"/img/common/mail_a_logo.png' alt=\"aT 창조마당\"> </div>");
        body.append("\n <div style=\"float:right; display:inline-block; margin-top:15px; margin-right:60px; font-family:'돋움','Dotum'; color:#888; font-size:12px;\"> 접수시간 :");
        body.append("\n <span style=\"color:#5d5d5d;\">"+ email.getCreatedate()+"</span>");
        body.append("\n </div>");
        body.append("\n <div style=\"clear:both; padding-top:46px; font-size:28px; line-height:normal; color:#2d2d2d;\">");
        body.append("\n <span style=\"color:#50b848;\">한국농수산식품유통공사</span>");
        body.append("\n 에<br>");
        body.append("\n 관심을 가져 주셔서 감사합니다. </div>");
        body.append("\n <div style=\"margin-top:30px; font-size:12px; color:#888; letter-spacing:normal;\"> 아래와 같이 보내 주신 의견은 담당자의 검토를 거쳐 신속히 회신 드리도록 하겠습니다.<br>");
        body.append("\n 앞으로도 지속적인 관심 부탁 드립니다.");
        body.append("\n </div>");
        body.append("\n </section>");
        body.append("\n </div>");
        /* header end */
        /* contents start */
        body.append("\n <div style=\"width:100%; margin:0 auto; padding-top:0;\">");
        body.append("\n <section style=\"display:block;\">");
        body.append("\n <div style=\"width:100%; padding: 0 50px 50px 50px; margin:0 auto; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; background-image:url("+pathUrl+"/img/bg/mail_middle_bg.jpg); background-repeat:repeat-y;\">");
        body.append("\n <div>");
        body.append("\n <h2 style=\"font-size:14px; color:#2d2d2d; margin-bottom:13px;\">접수 내용</h2>");
        body.append("\n <table style=\"display:inline-block; width:100%; border-top:2px solid #50b948;\">");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">제목</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getTitle()+"</td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">주요건의사항 및<br> 창조적아이디어</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getMemo()+"</td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">성명</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getName()+"</td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">휴대전화 번호</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getPhone()+"</td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">E-mail</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getEmail()+"</td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">주소</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getAddr()+"</td>");
        body.append("\n </tr>");
        body.append("\n </table>");
        body.append("\n </div>");
        body.append("\n <div style=\"display:inline-block; padding-top:45px; font-size:12px; color:#888; font-family:'돋움','dotum';\">");
        body.append("\n <div style=\"float:left; margin-right:5px;\">※</div>");
        body.append("\n <div style=\"float:right; width:600px; text-align:left;\"> 이 메일은 발신전용 메일입니다. <br>");
        body.append("\n 의견을 보내실 때는 창조마당(<a style=\"color:#5d5d5d; text-decoration:underline;\" href='"+rootUrl+"/makegarden/' target=\"_blank\">aT센터 창조마당 메일보내기</a>)을 이용해 주십시오.</div>");
        body.append("\n </div>");
        body.append("\n </div>");
        body.append("\n </section>");
        body.append("\n </div>");
        /* contents end */
        /* footer start */
        body.append("\n <div style=\"width:100%; height:110px; background-image:url("+pathUrl+"/img/bg/mail_bottom_bg.jpg); background-repeat:no-repeat; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; margin:0 auto;\">");
        body.append("\n <section style=\"width:620px; height:70px; margin:0 auto; background-color:#ccc;\">");
        body.append("\n <div style=\"margin:0 auto; text-align:center; padding-top:20px;\"><img src='"+pathUrl+"/img/common/mail_footer.png' alt=\"AT 한국농수산식품 유통공사 로고\"></div>");
        body.append("\n </section>");
        body.append("\n </div>");
        /* footer end */
        body.append("\n </div>");
        body.append("\n </body>");
        body.append("\n </html>");

        return body.toString();
    }

    //창조마당 어드민메일 바디 만들기
    public String getAdminHtml(Email email, HttpServletRequest request) {

        StringBuffer body=new StringBuffer();

        String url= String.valueOf(request.getRequestURL());
        String pathUrl="";
        String rootUrl="";

        if(url.indexOf("localhost")>-1){
            pathUrl="http://localhost:8080"+"/resources/front";
            rootUrl="http://localhost:8080";
        }else{
            pathUrl="http://info.at.or.kr"+"/resources/front";
            rootUrl="http://info.at.or.kr";
        }

        System.out.println("url==>"+url);
        System.out.println("pathUrl==>"+pathUrl);
        System.out.println("rootUrl==>"+rootUrl);

        //body.append("\n <link href='"+rootUrl+"/css/content.css' rel='stylesheet' type='text/css'> ");
        //http://info.at.or.kr/resources/front/img/bg/mail_top_bg.jpg

        body.append("\n <!DOCTYPE html>");
        body.append("\n <html lang=\"ko\">");
        body.append("\n <head>");
        body.append("\n <meta charset=\"utf-8\"/>");
        body.append("\n <meta content=\"IE=edge,chrome=1\" http-equiv=\"X-UA-Compatible\" />");
        body.append("\n <meta name=\"language\" content=\"ko\" />");
        body.append("\n <title>aT생생정보</title>");
        body.append("\n <script type=\"text/javascript\" src=\"scripts/jquery-1.11.0.min.js\"></script>");
        body.append("\n </head>");
        body.append("\n <body>");
        body.append("\n <style style=\"font-size:12px;\">");
        body.append("\n @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);");
        body.append("\n body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, form, fieldset, p, input, textarea, select, button, label, pre, table, th, td {margin:0; padding:0; }");
        body.append("\n </style>");
        body.append("\n <div style=\"width:720px; margin:0 auto; font-family: 'Nanum Gothic';\"> ");
        /* header start */
        body.append("\n <div style=\"margin:0 auto; height:276px; padding:32px 50px; background:url("+pathUrl+"/img/bg/mail_top_bg.jpg); background-repeat:no-repeat; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box;\">");
        body.append("\n <section style=\"display:block;\">");
        body.append("\n <div style=\"float:left; display:inline-block;\"> <img src='"+pathUrl+"/img/common/mail_a_logo.png' alt=\"aT 창조마당\"> </div>");
        body.append("\n <div style=\"float:right; display:inline-block; margin-top:15px; margin-right:60px; font-family:'돋움','Dotum'; color:#888; font-size:12px;\"> 접수시간 :");
        body.append("\n <span style=\"color:#5d5d5d;\">"+ email.getCreatedate()+"</span>");
        body.append("\n </div>");
        body.append("\n <div style=\"clear:both; padding-top:46px; font-size:28px; line-height:normal; color:#2d2d2d;\">");
        body.append("\n <span style=\"color:#50b848;\">한국농수산식품유통공사</span>");
        body.append("\n 에<br>");
        body.append("\n 보내주신 의견에 대한 답변입니다. </div>");
        body.append("\n <div style=\"margin-top:30px; font-size:12px; color:#888; letter-spacing:normal;\"> 보내주신 의견에 대해 아래와 같이 답변 드리오며, 추가 문의는 하단의 담당자에게 연락하여 주시기 바랍니다.<br>");
        body.append("\n 고객을 위해 최선을 다하는 한국농수산식품유통공사가 되겠습니다. ");
        body.append("\n </div>");
        body.append("\n </section>");
        body.append("\n </div>");
        /* header end */
        /* contents start */
        body.append("\n <div style=\"width:100%; margin:0 auto; padding-top:0;\">");
        body.append("\n <section style=\"display:block;\">");
        body.append("\n <div style=\"width:100%; padding: 0 50px 50px 50px; margin:0 auto; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; background-image:url("+pathUrl+"/img/bg/mail_middle_bg.jpg); background-repeat:repeat-y;\">");
        body.append("\n <div>");
        body.append("\n <h2 style=\"font-size:14px; color:#2d2d2d; margin-bottom:13px;\">접수 내용</h2>");
        body.append("\n <table style=\"display:inline-block; width:100%; border-top:2px solid #50b948;\">");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">제목</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getTitle()+"</td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">주요건의사항 및<br> 창조적아이디어</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getMemo()+"</td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">성명</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getName()+"</td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">휴대전화 번호</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getPhone()+"</td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">E-mail</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getEmail()+"</td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">주소</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getAddr()+"</td>");
        body.append("\n </tr>");
        body.append("\n </table>");
        body.append("\n </div>");
        /* reply start */
        body.append("\n <div style=\"margin-top:30px;\">");
        body.append("\n <h2 style=\"font-size:14px; color:#2d2d2d; margin-bottom:13px;\">답변 내용</h2>");
        body.append("\n <table style=\"display:inline-block; width:100%; border-top:2px solid #50b948;\">");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">답변</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\"><span style=\"color:#0072bc;\">"+ email.getReplyMemo()+"</span></td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">담당부서</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getReplyDept()+"</td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">연락처</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getReplyPhone()+"</td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">담당자</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getReplyName()+"</td>");
        body.append("\n </tr>");
        body.append("\n <tr style=\"width:100%; border-bottom:1px solid #d9d9d9; clear:both;\">");
        body.append("\n <th style=\"width:197px; padding:12px 28px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; color:#2d2d2d; font-weight:bold; background-color:#f2f2f2;  text-align:left; font-size:13px;\">E-mail</th>");
        body.append("\n <td style=\"width:613px; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; padding:12px 31px; line-height:1.6em; font-size:12px; font-family:'돋움','dotum'\">"+ email.getReplyEmail()+"</td>");
        body.append("\n </tr>");
        body.append("\n </table>");
        body.append("\n </div>");
        /* reply end */
        body.append("\n <div style=\"display:inline-block; padding-top:45px; font-size:12px; color:#888; font-family:'돋움','dotum';\">");
        body.append("\n <div style=\"float:left; margin-right:5px;\">※</div>");
        body.append("\n <div style=\"float:right; width:600px; text-align:left;\"> 이 메일은 발신전용 메일입니다. <br>");
        body.append("\n 의견을 보내실 때는 창조마당(<a style=\"color:#5d5d5d; text-decoration:underline;\" href='"+rootUrl+"/makegarden/' target=\"_blank\">aT센터 창조마당 메일보내기</a>)을 이용해 주십시오.</div>");
        body.append("\n </div>");
        body.append("\n </div>");
        body.append("\n </section>");
        body.append("\n </div>");
        /* contents end */
        /* footer start */
        body.append("\n <div style=\"width:100%; height:110px; background-image:url("+pathUrl+"/img/bg/mail_bottom_bg.jpg); background-repeat:no-repeat; -webkit-box-sizing: border-box; -moz-box-sizing: border-box;box-sizing: border-box; margin:0 auto;\">");
        body.append("\n <section style=\"width:620px; height:70px; margin:0 auto; background-color:#ccc;\">");
        body.append("\n <div style=\"margin:0 auto; text-align:center; padding-top:20px;\"><img src='"+pathUrl+"/img/common/mail_footer.png' alt=\"AT 한국농수산식품 유통공사 로고\"></div>");
        body.append("\n </section>");
        body.append("\n </div>");
        /* footer end */
        body.append("\n </div>");
        body.append("\n </body>");
        body.append("\n </html>");

        return body.toString();
    }

}
