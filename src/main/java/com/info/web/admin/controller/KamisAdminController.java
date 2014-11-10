package com.info.web.admin.controller;

import com.info.framework.data.RequestAttribute;
import com.info.framework.security.AuthenticationUtils;
import com.info.web.account.service.AccountService;
import com.info.web.common.service.MenuService;
import com.info.web.dailyprice.service.DailyPriceService;
import com.info.web.distributionreality.service.DistributionRealityService;
import com.info.web.domain.*;
import com.info.web.item.service.ItemService;
import com.info.web.weeklyshopping.service.WeeklyShoppingService;
import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.spi.LocationAwareLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpServletRequest;
import java.io.File;
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
@RequestMapping(value = "/admin/kamis")
public class KamisAdminController {

    private String upload_path = "/d01/jeus6.0/webhome/aT_HP_WASSvr_container5/info/info_war___/resources/front/upload/";

    @Autowired
    private AccountService accountService;

    @Autowired
    private ItemService itemService;

    @Autowired
    private WeeklyShoppingService weeklyShoppingService;

    @Autowired
    private DistributionRealityService distributionRealityService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private DailyPriceService dailyPriceService;

    /**
     * 인덱스 페이지 - 없는화면 ㅋ
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

        return "admin/kamis/index";
    }

    /**
     * 알뜰장보기 관리 페이지
     *
     * @return "admin/kamis/wholesale/price/index"
     */
    @RequestMapping(value =  {"/weekly_shopping/index", "/weekly_shopping"}, method = RequestMethod.GET)
    public String weeklyShoppingPriceIndex(Model model, @ModelAttribute("weeklyShopping") WeeklyShopping paramWeeklyShopping,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        WeeklyShopping weeklyShopping = new WeeklyShopping();
        if( paramWeeklyShopping != null ) {
            weeklyShopping = paramWeeklyShopping;
        }

        weeklyShopping = weeklyShoppingService.selectWeeklyShoppingTop(weeklyShopping);

        //주간 물가 정보 일자 가져오기
        List<WeeklyShopping> weeklyShoppingDayList = weeklyShoppingService.selectWeeklyShoppingGroupDay();
        model.addAttribute("weeklyShoppingDayList", weeklyShoppingDayList);

        //주간 물가 정보 데이터 가져오기
        List<WeeklyShopping> weeklyShoppingList = weeklyShoppingService.selectWeeklyShoppingList(weeklyShopping);
        model.addAttribute("weeklyShoppingList", weeklyShoppingList);

        //주간 물가 정보 조건 데이터
        model.addAttribute("weeklyShopping", weeklyShopping);

        Menu menu = new Menu();
        menu.setId(7);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "admin/kamis/weekly_shopping/index";
    }

    /*알뜰장보기 등록*/
    @RequestMapping(value =  {"/weekly_shopping/write/{groupCode}"}, method = RequestMethod.GET)
    public String weeklyShoppingPriceWrite(Model model, @PathVariable("groupCode") int groupCode,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        //품목 가져오기
        Item item = new Item();
        item.setGroupCode("D");
        List<Item> itemList = itemService.selectItemList(item);

        //주간 물가 정보 데이터 가져오기
        WeeklyShopping weeklyShopping = new WeeklyShopping();
        List<WeeklyShopping> weeklyShoppingList = null;
        if( groupCode != 0 ){
            weeklyShopping.setGroupCode( groupCode  );
            weeklyShoppingList = weeklyShoppingService.selectWeeklyShoppingList(weeklyShopping);
        }

        model.addAttribute("itemList",itemList);
        model.addAttribute("weeklyShoppingList", weeklyShoppingList);

        return "admin/kamis/weekly_shopping/write";
    }

    /**
     * 알뜰장보기 쓰기 페이지
     *
     * @return
     */
    @RequestMapping(value = {"/weekly_shopping/insertWeeklyShopping"}, method = RequestMethod.POST)
    public String insertWeeklyShopping(@ModelAttribute("weeklyShopping") WeeklyShopping weeklyShopping,RedirectAttributes redirectAttributes, HttpServletRequest request) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        //아이디
        Account account = AuthenticationUtils.getUser();
        weeklyShopping.setCreateid(account.getEmail());
        weeklyShopping.setUpdateid(account.getEmail());
        if( weeklyShopping.getGroupCode() != null && weeklyShopping.getGroupCode() != 0) {
            //제품 등록하기
            for( int i = 1; i <= 11; i++){
                if( i < 5 ) {
                    //이번주 동향
                    weeklyShopping.setStartDate(request.getParameter("weekstartdate"));
                    weeklyShopping.setEndDate(request.getParameter("weekenddate"));
                    weeklyShopping.setType(Integer.toString(i));
                    weeklyShopping.setItemCode(request.getParameter("type" + i + "ItemCode"));
                    weeklyShopping.setLastWeekPrice(request.getParameter("type" + i + "lastWeekPrice"));
                    weeklyShopping.setWeekPrice(request.getParameter("type" + i + "WeekPrice"));
                    weeklyShopping.setRate(request.getParameter("type" + i + "Rate"));
                    weeklyShopping.setMemo(request.getParameter("type" + i + "Memo"));
                    weeklyShoppingService.updateWeeklyShopping(weeklyShopping);
                }else{
                    weeklyShopping.setStartDate(request.getParameter("nextweekstartdate"));
                    weeklyShopping.setEndDate(request.getParameter("nextweekenddate"));
                    weeklyShopping.setLastWeekPrice("");
                    weeklyShopping.setWeekPrice("");
                    weeklyShopping.setRate("");
                    //약보합1
                    weeklyShopping.setType(Integer.toString(i));
                    weeklyShopping.setItemCode(request.getParameter("type" + i + "ItemCode"));
                    weeklyShopping.setMemo(request.getParameter("type" + i + "Memo"));
                    weeklyShoppingService.updateWeeklyShopping(weeklyShopping);
                }
            }
        }else{
            //그룹코드 가져오기
            int groupCode = weeklyShoppingService.selectWeeklyShoppingGroupCode();
            weeklyShopping.setGroupCode(groupCode);
            //제품 등록하기
            for( int i = 1; i <= 11; i++){
                if( i < 5 ) {
                    //이번주 동향
                    weeklyShopping.setStartDate(request.getParameter("weekstartdate"));
                    weeklyShopping.setEndDate(request.getParameter("weekenddate"));
                    weeklyShopping.setType(Integer.toString(i));
                    weeklyShopping.setItemCode(request.getParameter("type" + i + "ItemCode"));
                    weeklyShopping.setLastWeekPrice(request.getParameter("type" + i + "lastWeekPrice"));
                    weeklyShopping.setWeekPrice(request.getParameter("type" + i + "WeekPrice"));
                    weeklyShopping.setRate(request.getParameter("type" + i + "Rate"));
                    weeklyShopping.setMemo(request.getParameter("type" + i + "Memo"));
                    weeklyShoppingService.insertWeeklyShopping(weeklyShopping);
                }else{
                    weeklyShopping.setStartDate(request.getParameter("nextweekstartdate"));
                    weeklyShopping.setEndDate(request.getParameter("nextweekenddate"));
                    weeklyShopping.setLastWeekPrice("");
                    weeklyShopping.setWeekPrice("");
                    weeklyShopping.setRate("");
                    //약보합1
                    weeklyShopping.setType(Integer.toString(i));
                    weeklyShopping.setItemCode(request.getParameter("type" + i + "ItemCode"));
                    weeklyShopping.setMemo(request.getParameter("type" + i + "Memo"));
                    weeklyShoppingService.insertWeeklyShopping(weeklyShopping);
                }
            }
        }

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(7);
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/kamis/weekly_shopping";
    }

    /**
     * 알뜰장보기 상세 페이지 하단 링크
     *
     * @return
     */
    @RequestMapping(value = {"/weekly_shopping/mainSave"}, method = RequestMethod.POST)
    public String weeklyShoppingMainSave(@ModelAttribute("menu") Menu menu,RedirectAttributes redirectAttributes){

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
        menu.setId(7);

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/kamis/weekly_shopping";
    }

    /**
     * 주요 농산물 유통실태 관리 페이지
     *
     * @return "admin/kamis/distribution_reality/index"
     */
    @RequestMapping(value =  {"/distribution_reality/index", "/distribution_reality"}, method = RequestMethod.GET)
    public String distributionRealityIndex(Model model, @ModelAttribute("distribution_reality") DistributionReality paramDistributionReality,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        DistributionReality distributionReality = new DistributionReality();
        if( distributionReality != null ) {
            distributionReality = paramDistributionReality;
        }
        //주간 물가 정보 데이터 가져오기
        List<DistributionReality> distributionRealityList = distributionRealityService.selectDistributionRealityList(distributionReality);
        model.addAttribute("distributionRealityList", distributionRealityList);

        //파라미터 전달
        model.addAttribute("distributionReality", distributionReality);

        Menu menu = new Menu();
        menu.setId(12);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "admin/kamis/distribution_reality/index";
    }

    /**
     * 주요 농산물 유통실태 메인이미지
     *
     * @return
     */
    @RequestMapping(value = {"/distribution_reality/mainSave"}, method = RequestMethod.POST)
    public String distributionRealityMainSave(@ModelAttribute("menu") Menu menu,@RequestParam MultipartFile file,BindingResult result,RedirectAttributes redirectAttributes) throws IOException {

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
        menu.setId(12);
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
           //version issue
            file.transferTo(new File("/d02/wassrc/info_upload/"+ newFileName));

            menu.setFileName(fileName);
            menu.setThumbnailName(newFileName);
        }
        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/kamis/distribution_reality";
    }


    /**
     * 주요 농산물 유통실태 쓰기 페이지
     *
     * @return "admin/kamis/distribution_reality/write"
     */
    @RequestMapping(value =  {"/distribution_reality/write/{seq}"}, method = RequestMethod.GET)
    public String distributionRealityWrite(Model model, @PathVariable("seq") int seq,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        //주간 물가 정보 데이터 가져오기
        DistributionReality distributionReality = new DistributionReality();
        DistributionReality distributionRealityView = null;
        List<DistributionReality> distributionRealityItemList = null;
        if( seq != 0 ){
            distributionReality.setSeq(seq);
            distributionRealityView = distributionRealityService.selectDistributionRealityView(distributionReality);

            //조사품목 가져오기
            distributionReality.setSeq(null);
            distributionReality.setMainSeq(seq);
            distributionRealityItemList = distributionRealityService.selectDistributionRealityItemList(distributionReality);
        }
        model.addAttribute("distributionRealityView", distributionRealityView);
        model.addAttribute("distributionRealityItemList", distributionRealityItemList);

        return "admin/kamis/distribution_reality/write";
    }

    /* 주요 농산물 유통실태 등록*/
    @RequestMapping(value =  {"/distribution_reality/insertDistributionReality"}, method = RequestMethod.POST)
    public String insertDistributionReality(@ModelAttribute("distributionReality") DistributionReality distributionReality
            ,RedirectAttributes redirectAttributes, HttpServletRequest request, MultipartHttpServletRequest multipartRequest) throws IOException {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        //아이디
        Account account = AuthenticationUtils.getUser();
        distributionReality.setCreateid(account.getEmail());
        distributionReality.setUpdateid(account.getEmail());

        /*조사품목명*/
        int imgTitleSize = 0;
        if(distributionReality.getImgTitle() != null){
            imgTitleSize = distributionReality.getImgTitle().length;
        }

        /*조사품목 이미지*/
        List<MultipartFile> fileList = multipartRequest.getFiles("file");
        String[] fileInfoName = new String[imgTitleSize];
        int fileListNum = 0;
        for (MultipartFile file : fileList) {
            if( file != null && file.getSize() > 0 ) {
                String fileName = file.getOriginalFilename();
                String fileMime = file.getContentType();
                fileInfoName[fileListNum] = fileName;


                file.transferTo(new File(upload_path+"distribution_reality/"+ fileName));
               //version issue file.transferTo(new File(environment.getProperty("upload.filepath")+"distribution_reality/"+fileName));
            }
            fileListNum++;
        }


        if( distributionReality.getSeq() != null && distributionReality.getSeq() != 0) {
            // 수정하기
            distributionRealityService.updateDistributionReality(distributionReality);
            if(imgTitleSize > 0){
                for(int i=0; i < imgTitleSize; i++ ){
                    DistributionReality distributionRealityItem = new DistributionReality();
                    distributionRealityItem.setTitle(distributionReality.getImgTitle()[i]);
                    distributionRealityItem.setFileImg(fileInfoName[i]);
                    distributionRealityItem.setMainSeq(distributionReality.getSeq());
                    distributionRealityItem.setCreateid(account.getEmail());
                    distributionRealityItem.setUpdateid(account.getEmail());
                    if( !distributionRealityItem.getTitle().equals("") && distributionRealityItem.getFileImg() != null) {
                        if (distributionReality.getItemSeq()[i] != null && !distributionReality.getItemSeq()[i].equals("")) {
                            distributionRealityItem.setSeq(Integer.parseInt(distributionReality.getItemSeq()[i]));
                            distributionRealityService.updateDistributionRealityItem(distributionRealityItem);
                        } else {
                            distributionRealityService.insertDistributionRealityItem(distributionRealityItem);
                        }
                    }
                }
            }
        }else {
            int maxSeq = distributionRealityService.selectDistributionRealitySeq();
            distributionReality.setSeq(maxSeq);
            distributionRealityService.insertDistributionReality(distributionReality);
            if(imgTitleSize > 0){

                for(int i=0; i < imgTitleSize; i++ ){
                    DistributionReality distributionRealityItem = new DistributionReality();
                    distributionRealityItem.setTitle(distributionReality.getImgTitle()[i]);
                    distributionRealityItem.setFileImg(fileInfoName[i]);
                    distributionRealityItem.setMainSeq(distributionReality.getSeq());
                    distributionRealityItem.setCreateid(account.getEmail());
                    distributionRealityItem.setUpdateid(account.getEmail());
                    if( !distributionRealityItem.getTitle().equals("") && distributionRealityItem.getFileImg() != null) {
                        if (distributionReality.getItemSeq().length > 0 && distributionReality.getItemSeq()[i] != null && !distributionReality.getItemSeq()[i].equals("")) {

                            distributionRealityItem.setSeq(Integer.parseInt(distributionReality.getItemSeq()[i]));
                            distributionRealityService.updateDistributionRealityItem(distributionRealityItem);
                        } else {

                            distributionRealityService.insertDistributionRealityItem(distributionRealityItem);
                        }
                    }
                }
            }
        }
        /*파일삭제하기*/
        if( distributionReality.getDelImg() != null ) {
            String[] delImgArr = distributionReality.getDelImg().split(",");
            for (int j = 1; j < delImgArr.length; j++) {
                distributionReality.setSeq(Integer.parseInt(delImgArr[j]));
                distributionRealityService.deleteDistributionRealityItem(distributionReality);
            }
        }

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(12);
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/kamis/distribution_reality/index";
    }

    /* 주요 농산물 유통실태 삭제*/
    @RequestMapping(value =  {"/distribution_reality/delDistributionReality/{seq}"}, method = RequestMethod.GET)
    public String delDistributionReality(Model model, @PathVariable("seq") int seq,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        //아이디
        Account account = AuthenticationUtils.getUser();

        DistributionReality distributionReality = new DistributionReality();
        distributionReality.setSeq(seq);
        distributionReality.setUpdateid(account.getEmail());

        distributionRealityService.deleteDistributionReality(distributionReality);

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(12);
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/kamis/distribution_reality/index";
    }

    /*농산물일일도소매가격*/
    @RequestMapping(value =  {"/daily_price/index", "/daily_price"}, method = RequestMethod.GET)
    public String dailyPriceIndex(Model model, @ModelAttribute("dailyPrice") DailyPrice dailyPrice,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        List<DailyPrice> dailyPriceList = dailyPriceService.selectDailyPriceDayList(dailyPrice);

        model.addAttribute("dailyPriceList", dailyPriceList);

        Menu menu = new Menu();
        menu.setId(2);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "admin/kamis/daily_price/index";
    }

    /**
     * 농산물일일도소매가격 상세 페이지 하단 링크
     *
     * @return
     */
    @RequestMapping(value = {"/daily_price/mainSave"}, method = RequestMethod.POST)
    public String dailyPriceMainSave(@ModelAttribute("menu") Menu menu,RedirectAttributes redirectAttributes){

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
        menu.setId(2);
        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/kamis/daily_price";
    }


    /**
     * 농산물일일도소매가격 쓰기 페이지
     *
     * @return "admin/kamis/daily_price/write"
     */
    @RequestMapping(value =  {"/daily_price/write/{pkDate}"}, method = RequestMethod.GET)
    public String distributionRealitdailyPriceyWrite(Model model, @PathVariable("pkDate") String pkDate,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        DailyPrice dailyPrice = new DailyPrice();
        dailyPrice.setPkDate(pkDate);
        List<DailyPrice> dailyPriceList = dailyPriceService.selectDailyPriceList(dailyPrice);
        model.addAttribute("dailyPriceList", dailyPriceList);
        return "admin/kamis/daily_price/write";
    }

    /**
     * 농산물일일도소매가격 쓰기 페이지
     *
     * @return "admin/kamis/daily_price/write"
     */
    @RequestMapping(value = {"/daily_price/insertDailyPrice"}, method = RequestMethod.POST)
    public String insertDailyPrice(@ModelAttribute("dailyPrice") DailyPrice dailyPrice,RedirectAttributes redirectAttributes, HttpServletRequest request) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        //아이디
        Account account = AuthenticationUtils.getUser();
        dailyPrice.setUpdateid(account.getEmail());

        List<DailyPrice> dailyPriceList = dailyPriceService.selectDailyPriceList(dailyPrice);

        for( int i=0; i<dailyPriceList.size(); i++){
            dailyPrice.setProductId(request.getParameter("productId_" + dailyPriceList.get(i).getProductId()));
            dailyPrice.setViewYn(request.getParameter("viewYn_" + dailyPriceList.get(i).getProductId()));
            dailyPriceService.updateDailyPrice(dailyPrice);
        }

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(2);

        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/kamis/daily_price/index";
    }

    /*농산물일일도소매가격 삭제*/
    @RequestMapping(value =  {"/daily_price/delDailyPrice/{pkDate}"}, method = RequestMethod.GET)
    public String delDailyPrice(Model model, @PathVariable("pkDate") String pkDate,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        DailyPrice dailyPrice = new DailyPrice();
        dailyPrice.setPkDate(pkDate);
        dailyPriceService.deleteDailyPrice(dailyPrice);

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Account account = AuthenticationUtils.getUser();
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(2);

        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/kamis/daily_price/index";
    }
}
