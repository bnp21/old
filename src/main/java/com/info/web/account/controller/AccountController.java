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
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
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
    public String login(Model model,RedirectAttributes redirectAttributes) {

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

        System.out.println("로그인 ip==>"+ip);
        System.out.println("id==>"+id);

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


