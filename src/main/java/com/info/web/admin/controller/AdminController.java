package com.info.web.admin.controller;

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
public class AdminController {

    //운영서버시
    private String upload_path = "/d01/jeus6.0/webhome/aT_HP_WASSvr_container5/info/info_war___/resources/front/upload/";
    //개발서버시
    //private String upload_path = "D:/workspace/old/src/main/webapp/resources/front/upload/";

    @Autowired
    private AccountService accountService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private MainService mainService;

    @Autowired
    private FarmDealTrendService farmDealTrendService;



    private static List<FarmDealTrend> list = new ArrayList<FarmDealTrend>();

    @ResponseBody
    @RequestMapping(value = "/getMenuList", method = RequestMethod.GET)
    public List<Menu> getHopList(Model model,RedirectAttributes redirectAttributes) {

        // 메뉴 목록 조회
        Menu menu = new Menu();
        List<Menu> list = menuService.selectMenuList(menu);
        model.addAttribute("list", list);
        return list;
    }

    /**
     * 인덱스 페이지
     *
     * @return
     */
    @RequestMapping(value =  {"", "/"}, method = RequestMethod.GET)
    public String index(Model model,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        /************** 권한별 화면 불러오기 Start **************/
        if(user != null){
            System.out.println("user.getAuthority()==>"+user.getAuthority());
            System.out.println("user.getUrl()==>"+user.getUrl());

            if(user.getAuthority() == null && user.getAuthority2() == null && user.getAuthority3() == null && user.getAuthority4() == null && user.getAuthority5() == null ) {
                msg = ("권한이 없습니다. 시스템 관리자에게 권한을 부여 받으십시요.");
                redirectAttributes.addFlashAttribute("msg", msg);
                return "redirect:/account/login";
            }else{
                if(user.getAuthority() != null){
                    return "redirect:"+user.getUrl();
                }else if(user.getAuthority2() != null){
                    return "redirect:"+user.getUrl2();
                }else if(user.getAuthority3() != null){
                    return "redirect:"+user.getUrl3();
                }else if(user.getAuthority4() != null){
                    return "redirect:"+user.getUrl4();
                }else if(user.getAuthority5() != null){
                    return "redirect:"+user.getUrl5();
                }else{

                }
            }
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        return "redirect:/admin/main/index";

    }

    @RequestMapping(value =  {"/main/index", "/main"}, method = RequestMethod.GET)
     public String main(Model model,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        Menu menu = new Menu();
        List<Menu> list = menuService.selectMenuList(menu);
        model.addAttribute("list", list);

        return "admin/main/index";
    }
    /*
        시스템관리 - 사용자관리
     */
    @RequestMapping(value =  {"/account/index", "/account"}, method = {RequestMethod.GET,RequestMethod.POST} )
    public String list(Model model, @ModelAttribute("account") Account paramAccount
                       ,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        List<Account> accountList = accountService.selectAccountList(paramAccount);
        List<Account> authList = accountService.selectAuthList(paramAccount);

        model.addAttribute("authList", authList);
        model.addAttribute("accountList", accountList);
        model.addAttribute("paramAccount", paramAccount);

        return "admin/account/index";
    }
    /*
        통계관리 - 메인 조회수
     */
    @RequestMapping(value =  {"/statistics/index", "/statistics"}, method = {RequestMethod.GET,RequestMethod.POST} )
    public String statisticsList(Model model, @ModelAttribute("statistics") Statistics statistics
            ,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        statistics.setSearchViewGbn(0);     //메인 조회수[메인과 모바일메일]

        System.out.println("statistics searchViewGbn==>"+statistics.getSearchViewGbn());
        System.out.println("statistics searchDateGbn==>"+statistics.getSearchDateGbn());

        if(statistics.getStartDate()!=null) {
            statistics.setStartDate(statistics.getStartDate().replaceAll("-", ""));
        }
        if(statistics.getEndDate()!=null) {
            statistics.setEndDate(statistics.getEndDate().replaceAll("-",""));
        }

        System.out.println("statistics startDate==>"+statistics.getStartDate());
        System.out.println("statistics endDate==>"+statistics.getEndDate());

        List<Statistics> statisticsList = mainService.selectStatisticsList(statistics);

        model.addAttribute("statisticsList", statisticsList);
        model.addAttribute("statistics", statistics);

        System.out.println("excelYn==>"+statistics.getExcelYn());

        if(statistics.getExcelYn().equals("Y")){    //엑셀일 경우
            return "admin/statistics/excel";
        }else {
            return "admin/statistics/index";
        }
    }

    /*
        통계관리 - 생생정보 조회수
     */
    @RequestMapping(value =  {"/statistics2/index", "/statistics2"}, method = {RequestMethod.GET,RequestMethod.POST} )
    public String statisticsList2(Model model, @ModelAttribute("statistics") Statistics statistics
            ,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        statistics.setSearchViewGbn(1);     //조회수[생생정보]

        System.out.println("statistics searchViewGbn==>"+statistics.getSearchViewGbn());
        System.out.println("statistics searchDateGbn==>"+statistics.getSearchDateGbn());

        if(statistics.getStartDate()!=null) {
            statistics.setStartDate(statistics.getStartDate().replaceAll("-", ""));
        }
        if(statistics.getEndDate()!=null) {
            statistics.setEndDate(statistics.getEndDate().replaceAll("-",""));
        }

        System.out.println("statistics startDate==>"+statistics.getStartDate());
        System.out.println("statistics endDate==>"+statistics.getEndDate());

        List<Statistics> statisticsList = mainService.selectStatisticsList(statistics);

        model.addAttribute("statisticsList", statisticsList);
        model.addAttribute("statistics", statistics);

        System.out.println("excelYn==>"+statistics.getExcelYn());

        if(statistics.getExcelYn().equals("Y")){    //엑셀일 경우
            return "admin/statistics/excel";
        }else {
            return "admin/statistics/index2";
        }

    }

    /*
        통계관리 - 원본 조회수
     */
    @RequestMapping(value =  {"/statistics3/index", "/statistics3"}, method = {RequestMethod.GET,RequestMethod.POST} )
    public String statisticsList3(Model model, @ModelAttribute("statistics") Statistics statistics
            ,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        statistics.setSearchViewGbn(2);     //조회수[원본]

        System.out.println("statistics searchViewGbn==>"+statistics.getSearchViewGbn());
        System.out.println("statistics searchDateGbn==>"+statistics.getSearchDateGbn());

        if(statistics.getStartDate()!=null) {
            statistics.setStartDate(statistics.getStartDate().replaceAll("-", ""));
        }
        if(statistics.getEndDate()!=null) {
            statistics.setEndDate(statistics.getEndDate().replaceAll("-",""));
        }

        System.out.println("statistics startDate==>"+statistics.getStartDate());
        System.out.println("statistics endDate==>"+statistics.getEndDate());

        List<Statistics> statisticsList = mainService.selectStatisticsList(statistics);

        model.addAttribute("statisticsList", statisticsList);
        model.addAttribute("statistics", statistics);

        if(statistics.getExcelYn().equals("Y")){    //엑셀일 경우
            return "admin/statistics/excel";
        }else {
            return "admin/statistics/index3";
        }

    }


    @RequestMapping(value = "/account/write", method = RequestMethod.GET)
    public String write(Model model,RedirectAttributes redirectAttributes, HttpServletRequest request) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        Account account = new Account();
        List<Account> authList = accountService.selectAuthList(account);

        model.addAttribute("authList", authList);

        return "admin/account/write";
    }

    @RequestMapping(value = "/account/mody/{seq}", method = RequestMethod.GET)
    public String mody(@PathVariable("seq") Integer seq, Model model,RedirectAttributes redirectAttributes, HttpServletRequest request) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        Account account = new Account();
        Account accountView = null;

        account.setId(seq);
        accountView = accountService.selectAccount(account);
        List<Account> authList = accountService.selectAuthList(account);

        model.addAttribute("authList", authList);
        model.addAttribute("accountView", accountView);

        return "admin/account/write";
    }

    /*메인 리스트*/
    @ResponseBody
    @RequestMapping(value = "/getMainList", method = RequestMethod.GET)
    public List<Main> getMainList(Model model) {

        // 맥주 홉 목록 조회
        Main main = new Main();
        List<Main> list = mainService.selectMainList(main);
        model.addAttribute("list", list);
        return list;
    }

    /*메인 수정*/
    @ResponseBody
    @RequestMapping(value = "/getMainMody", method = RequestMethod.GET)
    public int getMainMody(Model model, HttpServletRequest  request) {

        Account account = AuthenticationUtils.getUser();

        int updateCount = 0;
        int id = Integer.parseInt(request.getParameter("modyId"));

        System.out.println("modyId==>"+request.getParameter("modyId"));
        System.out.println("menuId==>"+request.getParameter("menuId"));

        int menuId = 0;
        if( request.getParameter("menuId") != "" ){
            menuId = Integer.parseInt(request.getParameter("menuId"));
        }

        if( request.getParameter("mode").equals("mody") ) {
            Main main = new Main();
            main.setId(id);
            main.setMenuId(menuId);
            main.setUpdateid(account.getId());

            updateCount = mainService.updateMain(main);
            model.addAttribute("updateCount", updateCount);
        }
        return updateCount;
    }

    @RequestMapping(value = "/account/insertAccount", method = RequestMethod.POST)
    public String insertAccount(@ModelAttribute("account") Account account,
                               BindingResult result,
                               RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        if( account.getId() != 0 ) {
            int updateCount = accountService.updateAccount(account);
        }else{
            int insertCount = accountService.insertAdminAccount(account);
        }

        return "redirect:/admin/account/index";
    }

    /**
     * 삭제
     *
     * @return
     */
    @RequestMapping(value = "/account/{mode}/{seq}", method = RequestMethod.GET)
    public String del(@PathVariable("mode") String mode, @PathVariable("seq") Integer seq, Model model,RedirectAttributes redirectAttributes, HttpServletRequest  request) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        Account account = new Account();

        if( mode.equals("ins") ) {
            account.setId(seq);
            account.setActivation("ENABLE");

            if( seq != null ) {
                int deleteCount = accountService.deleteAccount(account);
            }
        }

        if( mode.equals("del") ) {
            account.setId(seq);
            account.setActivation("DISABLE");

            if( seq != null ) {
                int deleteCount = accountService.deleteAccount(account);
            }
        }
        return "redirect:/admin/account";
    }

    /*사이버거래소, 프로모션 관리자 화면*/
    @RequestMapping(value =  {"/promotion", "/promotion/index"}, method = RequestMethod.GET)
    public String promotion(Model model,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        Menu menu = new Menu();
        menu.setId(1);
        List<Menu> list = menuService.selectMenuList(menu);
        model.addAttribute("list", list);
        return "admin/promotion/index";
    }

    /*프로모션 메인화면 등록*/
    @RequestMapping(value =  {"/promotion/mainSave"}, method = RequestMethod.POST)
    public String mainSave(@ModelAttribute("menu") Menu menu,
                           @RequestParam MultipartFile file,
                           BindingResult result,
                           RedirectAttributes redirectAttributes) throws IOException {

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
        menu.setUpdateid(account.getEmail());
        menu.setId(1);

        if( menu.getDelFile().equals("Y") ){
            menu.setFileName("");
            menu.setThumbnailName("");
        }

        if( file != null && file.getSize() > 0 ) {
            GregorianCalendar gc = new GregorianCalendar();
            SimpleDateFormat simDate = new SimpleDateFormat("yyyyMMddHHmmss");
            Date nowTime = gc.getTime();
            String[] ArrFileName = null;

            String fileName = file.getOriginalFilename();
            if (fileName.indexOf(".") >= 0) {
                ArrFileName = fileName.split("\\.");
            }

            String newFileName = ArrFileName[0] + "_" + simDate.format(nowTime) + "." + ArrFileName[1];
          //version issue  file.transferTo(new File(environment.getProperty("upload.filepath")+newFileName));
            file.transferTo(new File(upload_path+ newFileName));

            menu.setFileName(fileName);
            menu.setThumbnailName(newFileName);
        }
        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/promotion";
    }

    /*aT 지원사업 종합안내*/
    @RequestMapping(value =  {"/guidance", "/guidance/index"}, method = RequestMethod.GET)
    public String guidanceIndex(Model model,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        Menu menu = new Menu();
        menu.setId(14);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "admin/guidance/index";
    }

    /**
     * aT 지원사업 종합안내 메인이미지
     *
     * @return
     */
    @RequestMapping(value = {"/guidance/mainSave"}, method = RequestMethod.POST)
    public String guidanceMainSave(@ModelAttribute("menu") Menu menu,@RequestParam MultipartFile file,BindingResult result,RedirectAttributes redirectAttributes) throws IOException {

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
        menu.setUpdateid(account.getEmail());
        menu.setId(14);

        if( menu.getDelFile().equals("Y") ){
            menu.setFileName("");
            menu.setThumbnailName("");
        }

        if( file != null && file.getSize() > 0 ) {
            GregorianCalendar gc = new GregorianCalendar();
            SimpleDateFormat simDate = new SimpleDateFormat("yyyyMMddHHmmss");
            Date nowTime = gc.getTime();
            String[] ArrFileName = null;

            String fileName = file.getOriginalFilename();
            if (fileName.indexOf(".") >= 0) {
                ArrFileName = fileName.split("\\.");
            }
            String newFileName = ArrFileName[0] + "_" + simDate.format(nowTime) + "." + ArrFileName[1];
            //version issue file.transferTo(new File(environment.getProperty("upload.filepath")+ newFileName));
            file.transferTo(new File(upload_path+ newFileName));


            menu.setFileName(fileName);
            menu.setThumbnailName(newFileName);
        }
        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/guidance";
    }

    /*화훼 거래시세 화면*/
    @RequestMapping(value =  {"/flower_volume","/flower_volume/", "/flower_volume/index"}, method = RequestMethod.GET)
    public String flowerVolumeIndex(Model model,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        Menu menu = new Menu();
        menu.setId(16);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "admin/flower_volume/index";
    }

    /**
     * 화훼 거래시세 상세 페이지 하단 링크
     *
     * @return
     */
    @RequestMapping(value = {"/flower_volume/mainSave"}, method = RequestMethod.POST)
    public String flowerVolumeMainSave(@ModelAttribute("menu") Menu menu,RedirectAttributes redirectAttributes){

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
        menu.setUpdateid(account.getEmail());
        menu.setId(16);

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/flower_volume";
    }
}
