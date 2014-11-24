package com.info.web.account.controller;


import com.info.framework.security.AuthenticationUtils;
import com.info.web.account.service.AccountService;
import com.info.web.common.service.MenuService;
import com.info.web.domain.*;
import com.info.web.farmdealtrend.service.FarmDealTrendService;
import com.info.web.main.service.MainService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <pre>
 *  계정 Controller.
 * </pre>
 *
 * -------------------
 * 작성 내역
 * -------------------
 * 작성자 : 임세환
 * 작성일 : 2013.12.11
 * -------------------
 * 수정자 : jaeger
 * 수정일 : 2014.02.14
 * -------------------
 */
@Controller
@RequestMapping(value = "/account")
public class AccountController {

    private static String ENABLE  = "ENABLE";   // 계정 활성화
    private static String DISABLE = "DISABLE";  // 계정 비활성화

    @Autowired
    private AccountService accountService;

    /**
     * 로그인 페이지
     *
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET )
    public String login(Model model,RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response) {

        /************** 내부아이피일경우만 어드민에 접속하도록 함 Start **************/

        String ip = request.getRemoteAddr();
        //System.out.println("어드민 ip==>"+ip);
        if(ip != null){
            //공사공인아이피[210.103.25.*], 공사내부아이피[192.168.*.*], [135.22.*.*], 서울대학교[147.47.204.83]
            if(ip.indexOf("210.103.25.") > -1 || ip.indexOf("192.168.") > -1 || ip.indexOf("135.22.") > -1 || ip.indexOf("147.47.204.83") > -1 ){

            //개발자 egg wifi 아이피[125.152.240.195], 운영pc 아이피[210.103.25.169] - 개발자 편리를 위해 추가함-차후 주석처리
            }else if(ip.indexOf("125.152.") > -1 || ip.indexOf("175.253.") > -1 || ip.indexOf("0:0:0:0:0:0:0:1") > -1 ){    //개발서버ip이걸로 찍힘[0:0:0:0:0:0:0:1]

                //허용된 아이피가 아니면 메인홈으로 보냄
            }else{
                //arlert창 메세지 추가함
                //setContentType을 프로젝트 환경에 맞추어 변경
                response.setContentType("application/x-msdownload");
                PrintWriter printwriter = null;
                try {
                    printwriter = response.getWriter();
                } catch (IOException e) {
                    e.printStackTrace();
                }

                printwriter.println("<script language='javascript'>alert('관리자 화면에 허용된 접속아이피가 아닙니다.');</script>");
                printwriter.println("<form id='frm' name='frm' method='get' action='/'>");
                printwriter.println("<script language='javascript'>frm.submit();</script>");

                printwriter.flush();
                printwriter.close();

                return "";
            }

        }
        /************** 내부아이피일경우만 어드민에 접속하도록 함 End **************/

        return "account/login";
    }

    /**
     * 로그아웃
     *
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(Model model
            ,HttpServletRequest request , HttpServletResponse responsel) {

        request.getSession().setAttribute("account", null);
        //메세지설정
        model.addAttribute("msg", "로그아웃 하였습니다.");

        return "forward:/account/login";

    }

    /**
     * 로그인 처리
     *
     * @return
     */
    @RequestMapping(value = "/actionLogin", method = RequestMethod.POST)
    public String actionLogin(Model model, @ModelAttribute("account") Account account
                    ,RedirectAttributes redirectAttributes
                    ,HttpServletRequest request , HttpServletResponse response) {

        String ip = request.getRemoteAddr();
        String id = account.getEmail();
        String pwd = account.getPassword();

        //System.out.println("로그인 ip==>"+ip);
        //System.out.println("id==>"+id);

        String msg ="";

        if("".equals(id)){
            msg=("아이디를 입력해 주세요.") ;
            model.addAttribute("msg", msg);
            return "account/login";
         }

        if("".equals(pwd)){
            msg=("비밀번호를 입력해 주세요.") ;
            model.addAttribute("msg", msg);
            return "account/login";
        }
        //아이디, 비밀번호 체크
        Account result=accountService.checkAccount(account);

        //System.out.println("result==>"+result);

        if(result == null){
            msg=("로그인에 실패하였습니다.");
            model.addAttribute("msg", msg);
            return "account/login";
        }else{
           //msg=("로그인에 성공하셨습니다.");
           //model.addAttribute("msg", msg);
            request.getSession().setAttribute("account", result);
            return "redirect:/admin";
        }
    }
}


