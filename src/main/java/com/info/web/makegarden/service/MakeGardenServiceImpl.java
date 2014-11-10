package com.info.web.makegarden.service;

import com.info.web.domain.Email;
import com.info.web.domain.MakeGarden;
import com.info.web.makegarden.dao.MakeGardenDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;


/**
 * <pre>
 * 계정 서비스 구현체.
 * </pre>
 *
 * @author 임세환
 * @version 1.0, 2013.12.11
 */
@Service("makeGardenService")
public class MakeGardenServiceImpl implements MakeGardenService {
    private static Logger LOGGER = LoggerFactory.getLogger(MakeGardenServiceImpl.class);

    @Autowired
    private MakeGardenDao makeGardenDao;


    public List<MakeGarden> selectMakeGardenList(MakeGarden makeGarden) {
        return makeGardenDao.selectMakeGardenList(makeGarden);
    }


    public MakeGarden selectMakeGardenView(MakeGarden makeGarden){
        return makeGardenDao.selectMakeGardenView(makeGarden);
    };


    public int insertMakeGarden(MakeGarden makeGarden) {
        return makeGardenDao.insertMakeGarden(makeGarden);
    }

    public int updateMakeGarden(MakeGarden makeGarden) {
        return makeGardenDao.updateMakeGarden(makeGarden);
    }
/*
*  창조마당 메일 보내기
 */
    public int sendMail(Email email, HttpServletRequest request) {

        //메일보내기 셋팅
        StringBuffer m_ParameterString = new StringBuffer();
        int emailReceiverCnt = 0;

        m_ParameterString.append("cmd=sendSimpleMail");
        m_ParameterString.append("&from=").append("idea@at.or.kr"); // 메일 송신자의 이메일

        // 메일 송신자 이름 --> gmail로 보냈을때.. 한글깨짐...
        if (email.getName() == null || email.getName().equals("")) {
            try {
                m_ParameterString.append("&from_name=").append(URLEncoder.encode("aT창조마당", "EUC-KR"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        } else {
            try {
                m_ParameterString.append("&from_name=").append(URLEncoder.encode("aT창조마당", "EUC-KR"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        //aT담당자에게 메일발송 - 대표메일[idea@at.or.kr],  박성국차장님[parksk@at.or.kr],  박혜련대리님[redplusa@at.or.kr]
        List<Email> list = makeGardenDao.getEmailReceivers(email); // 메일 수신자의 이메일 리스트
        //List<Email> list = new ArrayList<Email>(); // 메일 수신자의 이메일 리스트

        Email send =new Email();    //보낸사람에게도 이메일 발송
        send.setReceiverName(email.getName());
        send.setReceiverEmail(email.getEmail());
        list.add(send);

        StringBuffer emailReceiversBuf = new StringBuffer();

        System.out.println("list.size()==>" + list.size());

        for (int i = 0; i < list.size(); i++) {
            String str = list.get(i).getReceiverEmail();
            System.out.println("str==>"+str);
            if (str == null || str.equals("")) {
                continue;
            }
            emailReceiversBuf.append(str + "|");
            emailReceiverCnt++;
        }

        System.out.println("emailReceiversBuf.toString=" + emailReceiversBuf.toString());
        System.out.println("emailReceiverCnt=" + emailReceiverCnt);

        if (emailReceiverCnt == 0)
            return 0;
        String emailReceiversStr = emailReceiversBuf.toString();
        if (emailReceiversStr == null || emailReceiversStr.equals(""))
            return 0;

        m_ParameterString.append("&to=").append(emailReceiversStr.substring(0, emailReceiversStr.length() - 1));

        try {
            m_ParameterString.append("&subject=").append(URLEncoder.encode("[창조마당]의견이 접수되었습니다.", "EUC-KR")); // 메일 제목
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        m_ParameterString.append("&contentType=").append("text/html");

        //############### 내용 만들어 주기 Start #############################

            Email emailVo=new Email();
            String html=emailVo.getHtml(email,request);
            System.out.println("######## html start #############");
            System.out.println(html);
            System.out.println("######## html end #############");

            email.setContent(html);

        //############### 내용 만들어 주기 Start #############################

        try {
            m_ParameterString.append("&content=").append(URLEncoder.encode(email.getContent(), "EUC-KR")); // 메일(탬플릿) 내용
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        //m_ParameterString.append("&url=").append("www.kati.net");

        HttpURLConnection Con = null;
        PrintWriter writer = null;
        BufferedReader ResultBuffer = null;
        try {

            URL Url = null;
            try {
                Url = new URL("http", "mail.kati.net", "/nara/servlet/sso.UserSignOnServ");
            } catch (MalformedURLException e) {
                e.printStackTrace();
            }

            try {
                Con = (HttpURLConnection) Url.openConnection();
            } catch (IOException e) {
                e.printStackTrace();
            }
            Con.setRequestMethod("POST");
            Con.setUseCaches(false);
            Con.setDoOutput(true);
            Con.setDoInput(true);

            Con.connect();

            writer = new PrintWriter(Con.getOutputStream());

            writer.print(m_ParameterString.toString());
            writer.flush();
            writer.close();

            System.out.println("m_parameterString==>" + m_ParameterString.toString());

            writer = null;
            ResultBuffer = new BufferedReader(new InputStreamReader(Con.getInputStream(), "KSC5601"));
            StringBuffer strBuf = new StringBuffer();
            String str;
            while ((str = ResultBuffer.readLine()) != null) {
                strBuf.append(str);
            }

            ResultBuffer.close();
            ResultBuffer = null;
            Con.disconnect();
            Con = null;
            str = strBuf.toString();

            if (str != null && str.startsWith("<!---[[")) {
                return 1;
            } else {
                return 0;
            }
        } catch (MalformedURLException me) {
//            logger.fatal(me);
//            throw me;
            System.out.println("이메일 MalformedURLException 에러");

        } catch (IOException ioe) {
//            logger.fatal(ioe);
//            throw ioe;
            System.out.println("이메일 IOException 에러");
        } finally {
            try {
                if (writer != null) {
                    writer.close();
                }
            } catch (Exception e) {
                //logger.fatal(e);
                System.out.println("이메일 에러 1");
            }
            try {
                if (ResultBuffer != null) {
                    ResultBuffer.close();
                }
            } catch (Exception e) {
//                logger.fatal(e);
                System.out.println("이메일 에러 2");
            }
            try {
                if (Con != null) {
                    Con.disconnect();
                }
            } catch (Exception e) {
                //logger.fatal(e);
                System.out.println("이메일 에러 3");
            }
        }

        return 1;
    }
    /*
    *  창조마당 어드민 메일 보내기
     */
    public int sendAdminMail(Email email, HttpServletRequest request) {

        //메일보내기 셋팅
        StringBuffer m_ParameterString = new StringBuffer();
        int emailReceiverCnt = 0;

        m_ParameterString.append("cmd=sendSimpleMail");
        m_ParameterString.append("&from=").append("idea@at.or.kr"); // 메일 송신자의 이메일

        // 메일 송신자 이름 --> gmail로 보냈을때.. 한글깨짐...
        if (email.getName() == null || email.getName().equals("")) {
            try {
                m_ParameterString.append("&from_name=").append(URLEncoder.encode("aT창조마당", "EUC-KR"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        } else {
            try {
                m_ParameterString.append("&from_name=").append(URLEncoder.encode("aT창조마당", "EUC-KR"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        //aT담당자에게 메일발송 - 대표메일[idea@at.or.kr],  박성국차장님[parksk@at.or.kr],  박혜련대리님[redplusa@at.or.kr]
        List<Email> list = makeGardenDao.getEmailReceivers(email); // 메일 수신자의 이메일 리스트
        //List<Email> list = new ArrayList<Email>(); // 메일 수신자의 이메일 리스트

        Email send =new Email();    //보낸사람에게도 이메일 발송
        send.setReceiverEmail(email.getEmail());
        list.add(send);

        Email send2 =new Email();    //보낸사람에게도 이메일 발송
        send2.setReceiverEmail(email.getReplyEmail());
        list.add(send2);

        StringBuffer emailReceiversBuf = new StringBuffer();

        System.out.println("list.size()==>" + list.size());

        for (int i = 0; i < list.size(); i++) {
            String str = list.get(i).getReceiverEmail();
            System.out.println("str==>"+str);
            if (str == null || str.equals("")) {
                continue;
            }
            emailReceiversBuf.append(str + "|");
            emailReceiverCnt++;
        }

        System.out.println("emailReceiversBuf.toString=" + emailReceiversBuf.toString());
        System.out.println("emailReceiverCnt=" + emailReceiverCnt);

        if (emailReceiverCnt == 0)
            return 0;
        String emailReceiversStr = emailReceiversBuf.toString();
        if (emailReceiversStr == null || emailReceiversStr.equals(""))
            return 0;

        m_ParameterString.append("&to=").append(emailReceiversStr.substring(0, emailReceiversStr.length() - 1));

        try {
            m_ParameterString.append("&subject=").append(URLEncoder.encode("[창조마당]보내주신 의견에 대한 답변입니다.", "EUC-KR")); // 메일 제목
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        m_ParameterString.append("&contentType=").append("text/html");

        //############### 내용 만들어 주기 Start #############################

        Email emailVo=new Email();
        String html=emailVo.getAdminHtml(email,request);
        System.out.println("######## AdminHtml start #############");
        System.out.println(html);
        System.out.println("######## AdminHtml end #############");

        email.setContent(html);

        //############### 내용 만들어 주기 Start #############################

        try {
            m_ParameterString.append("&content=").append(URLEncoder.encode(email.getContent(), "EUC-KR")); // 메일(탬플릿) 내용
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        //m_ParameterString.append("&url=").append("www.kati.net");

        HttpURLConnection Con = null;
        PrintWriter writer = null;
        BufferedReader ResultBuffer = null;
        try {

            URL Url = null;
            try {
                Url = new URL("http", "mail.kati.net", "/nara/servlet/sso.UserSignOnServ");
            } catch (MalformedURLException e) {
                e.printStackTrace();
            }

            try {
                Con = (HttpURLConnection) Url.openConnection();
            } catch (IOException e) {
                e.printStackTrace();
            }
            Con.setRequestMethod("POST");
            Con.setUseCaches(false);
            Con.setDoOutput(true);
            Con.setDoInput(true);

            Con.connect();

            writer = new PrintWriter(Con.getOutputStream());

            writer.print(m_ParameterString.toString());
            writer.flush();
            writer.close();

            System.out.println("m_parameterString==>" + m_ParameterString.toString());

            writer = null;
            ResultBuffer = new BufferedReader(new InputStreamReader(Con.getInputStream(), "KSC5601"));
            StringBuffer strBuf = new StringBuffer();
            String str;
            while ((str = ResultBuffer.readLine()) != null) {
                strBuf.append(str);
            }

            ResultBuffer.close();
            ResultBuffer = null;
            Con.disconnect();
            Con = null;
            str = strBuf.toString();

            if (str != null && str.startsWith("<!---[[")) {
                return 1;
            } else {
                return 0;
            }
        } catch (MalformedURLException me) {
//            logger.fatal(me);
//            throw me;
            System.out.println("이메일 MalformedURLException 에러");

        } catch (IOException ioe) {
//            logger.fatal(ioe);
//            throw ioe;
            System.out.println("이메일 IOException 에러");
        } finally {
            try {
                if (writer != null) {
                    writer.close();
                }
            } catch (Exception e) {
                //logger.fatal(e);
                System.out.println("이메일 에러 1");
            }
            try {
                if (ResultBuffer != null) {
                    ResultBuffer.close();
                }
            } catch (Exception e) {
//                logger.fatal(e);
                System.out.println("이메일 에러 2");
            }
            try {
                if (Con != null) {
                    Con.disconnect();
                }
            } catch (Exception e) {
                //logger.fatal(e);
                System.out.println("이메일 에러 3");
            }
        }

        return 1;
    }

}
