package com.info.web.makegarden.controller;

import com.info.web.atnews.service.AtnewsService;
import com.info.web.domain.Email;
import com.info.web.domain.MakeGarden;
import com.info.web.makegarden.service.MakeGardenService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

/**
 * <pre>
 * 계정 Controller.
 * </pre>
 *
 * -------------------
 * 작성 내역
 * -------------------
 * 작성자 : 이소정
 * 작성일 : 2014.07.10
 * -------------------
 * 수정자 :
 * 수정일 :
 * -------------------
 */
@Controller
@RequestMapping(value = "/")
public class MakeGardenController {

    private static final Logger LOGGER = LoggerFactory.getLogger(MakeGardenController.class);

    @Autowired
    private MakeGardenService makeGardenService;

    /**
     * 창조마당 인덱스 페이지
     *
     * @return
     */

    @RequestMapping(value = {"/makegarden/"}, method = RequestMethod.GET)
    public String list(Model model) {

        return "/makegarden/index";
    }

    /**
     * 창조마당 등록
     *
     * @return
     */
    @RequestMapping(value = {"/makegarden/insertMakeGarden"}, method = RequestMethod.POST)
    public String insertMakeGarden(@ModelAttribute("makeGarden") MakeGarden makeGarden, HttpServletRequest request,  HttpServletResponse response) {
        LOGGER.info("쓰기 페이지");

        System.out.println("chk_agree==>");
        //등록하기
        int cnt=makeGardenService.insertMakeGarden(makeGarden);
        System.out.println("cnt==>"+cnt);

        /** 메일보내기 추가해야함 - 2014년11월04일 **/

        Calendar cal = Calendar.getInstance();  //기본적으로 현재날짜와 시간으로 설정됨.

        String  toYear = String.valueOf(cal.get(Calendar.YEAR));

        String  toMonth = String.valueOf(cal.get(Calendar.MONTH)+1);  // 0~11

        String  toDate = String.valueOf(cal.get(Calendar.DATE));

        if( toMonth.length() == 1){ toMonth = "0"+toMonth; }  // 1~9 까지는 01~09로 표시

        if( toDate.length() == 1){ toDate = "0"+toDate; }  // 1~9 까지는 01~09로 표시

        String  toHour = String.valueOf(cal.get(Calendar.HOUR_OF_DAY));
        String  toMinite = String.valueOf(cal.get(Calendar.MINUTE));
        String  toSecond = String.valueOf(cal.get(Calendar.SECOND));

        String today = toYear+"."+toMonth+"."+toDate+" "+toHour+":"+toMinite+":"+toSecond;  //  '2014.11.06 13:30:00'
        System.out.println("today==>"+today);

        if(cnt>0) {
            System.out.println("메일보내기 시작");

            Email email= new Email();
            email.setTitle(makeGarden.getTitle());
            email.setMemo(makeGarden.getMemo());
            email.setName(makeGarden.getName());
            email.setPhone(makeGarden.getPhone());
            email.setEmail(makeGarden.getEmail());
            email.setAddr(makeGarden.getAddr());
            email.setCreatedate(today);

            makeGardenService.sendMail(email, request);
            System.out.println("메일보내기 끝");
        }

        //arlert창 메세지 추가함
        //setContentType을 프로젝트 환경에 맞추어 변경
        response.setContentType("application/x-msdownload");
        PrintWriter printwriter = null;
        try {
            printwriter = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }

        printwriter.println("<script language='javascript'>alert('메일이 정상적으로 발송되었습니다.');</script>");
        printwriter.println("<form id='frm' name='frm' method='get' action='/makegarden/'>");
        printwriter.println("<script language='javascript'>frm.submit();</script>");

        printwriter.flush();
        printwriter.close();

        return "";
        //return "redirect:/makegarden/";

    }
}
