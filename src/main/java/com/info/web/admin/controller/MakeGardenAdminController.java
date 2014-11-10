package com.info.web.admin.controller;

import com.info.framework.security.AuthenticationUtils;
import com.info.web.domain.Account;
import com.info.web.domain.Email;
import com.info.web.domain.MakeGarden;
import com.info.web.makegarden.service.MakeGardenService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 * <pre>
 * 계정 Controller.
 * </pre>
 *
 * -------------------
 * 작성 내역
 * -------------------
 * 작성자 : 임세환
 * 작성일 : 2013.12.11
 * -------------------
 */
@Controller
@RequestMapping(value = "/admin")
public class MakeGardenAdminController {

    private static final Logger LOGGER = LoggerFactory.getLogger(MakeGardenAdminController.class);

    @Autowired
    private MakeGardenService makeGardenService;

    /**
     * 창조마당 관리 페이지
     *
     * @return
     */

    @RequestMapping(value = {"/makegarden/","/makegarden","/makegarden/index"}, method = {RequestMethod.GET,RequestMethod.POST} )
    public String index(Model model,RedirectAttributes redirectAttributes, @ModelAttribute("makeGarden") MakeGarden makeGarden) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        List<MakeGarden> makeGardenList = makeGardenService.selectMakeGardenList(makeGarden);

        model.addAttribute("makeGardenList", makeGardenList);

        System.out.println("excelYn==>"+makeGarden.getExcelYn());

        if(makeGarden.getExcelYn().equals("Y")){    //엑셀일 경우
            return "admin/makegarden/excel";
        }else {
            return "admin/makegarden/index";
        }
    }

    /**
     * 창조마당 관리 쓰기 페이지
     *
     * @return
     */
    @RequestMapping(value = {"/makegarden/write/{mode}/{seq}"}, method = RequestMethod.GET)
    public String write(@PathVariable("mode") String mode, @PathVariable("seq") Integer seq, Model model,RedirectAttributes redirectAttributes, HttpServletRequest request) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        MakeGarden makeGarden = new MakeGarden();
        MakeGarden makeGardenView = null;

        //수정모드
        if( mode.equals("mody") ) {
            makeGarden.setSeq(seq);
            makeGardenView = makeGardenService.selectMakeGardenView(makeGarden);
            model.addAttribute("makeGardenView", makeGardenView);
        }
        return "admin/makegarden/write";
    }

    /**
     * 창조마당 관리 답변 등록
     *
     * @return
     */
    @RequestMapping(value = {"/makegarden/insertMakeGarden"}, method = RequestMethod.POST)
    public String insertMakeGarden(@ModelAttribute("makeGarden") MakeGarden makeGarden,RedirectAttributes redirectAttributes , HttpServletRequest request) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        Account account = AuthenticationUtils.getUser();
        makeGarden.setReplyid(account.getEmail());
        //등록하기
        int cnt=makeGardenService.updateMakeGarden(makeGarden);

        /** 메일보내기 추가해야함 - 2014년11월04일 **/
        if(cnt>0) {
            System.out.println("어드민 메일보내기 시작");
            System.out.println("email==>"+makeGarden.getEmail());
            Email email= new Email();
            email.setTitle(makeGarden.getTitle());
            email.setMemo(makeGarden.getMemo());
            email.setName(makeGarden.getName());
            email.setPhone(makeGarden.getPhone());
            email.setEmail(makeGarden.getEmail());
            email.setAddr(makeGarden.getAddr());
            email.setCreatedate(makeGarden.getCreatedate());
            email.setReplyMemo(makeGarden.getReplyMemo());
            email.setReplyDept(makeGarden.getReplyDept());
            email.setReplyPhone(makeGarden.getReplyPhone());
            email.setReplyName(makeGarden.getReplyName());
            email.setReplyEmail(makeGarden.getReplyEmail());

            makeGardenService.sendAdminMail(email, request);
            System.out.println("어드민 메일보내기 끝");
        }

        return "redirect:/admin/makegarden/";
    }
}
