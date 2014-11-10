package com.info.web.admin.controller;

import com.info.framework.security.AuthenticationUtils;
import com.info.web.common.service.MenuService;
import com.info.web.domain.*;
import com.info.web.fis.service.FisService;
import com.info.web.eatingbusiness.service.EatingBusinessService;
import com.info.web.Mainindicators.service.MainIndicatorsService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Array;
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
@RequestMapping(value = "/admin/fis/")
public class FisController {

    //운영서버시
    private String upload_path = "/d01/jeus6.0/webhome/aT_HP_WASSvr_container5/info/info_war___/resources/front/upload/";
    //개발서버시
    //private String upload_path = "D:/workspace/old/src/main/webapp/resources/front/upload/";

    private static List<Grain> list = new ArrayList<Grain>();

    @Autowired
    private FisService fisService;

    @Autowired
    private EatingBusinessService eatingBusinessService;

    @Autowired
    private MainIndicatorsService mainIndicatorsService;

    @Autowired
    private MenuService menuService;


    /**
     * 일일곡물시황 리스트 페이지
     *
     * @return
     */
    @RequestMapping(value = {"/grain-marketCondition","/grain"}, method = RequestMethod.GET)
    public String list(Grain grain, Model model,RedirectAttributes redirectAttributes) {

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
        menu.setId(3);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        List<Grain> grainList = fisService.selectGrainMarketConditionList(grain);

        model.addAttribute("grainList", grainList);


        return "admin/fis/grain-marketCondition/index";
    }

    /*일일곡물시황 해석 데이터 가져오기*/
    @ResponseBody
    @RequestMapping(value = "/commendView", method = RequestMethod.GET)
    public Grain commendView(Model model, HttpServletRequest request) {
        String referenceDate = request.getParameter("referenceDate");
        Grain grain = new Grain();
        grain.setReferenceDate(referenceDate);
        Grain grainCommendView = fisService.selectGrainCommendView(grain);
        model.addAttribute("grainCommendView", grainCommendView);
        return grainCommendView;
    }

    /*일일곡물시황 해석 데이터 등록하기*/
    @ResponseBody
    @RequestMapping(value = "/commendSave", method = RequestMethod.GET)
    public int commendSave(Model model, HttpServletRequest request) {
        String referenceDate = request.getParameter("referenceDate");
        String comments = request.getParameter("comments");
        String mode = request.getParameter("mode");
        Grain grain = new Grain();

        Account account = AuthenticationUtils.getUser();

        grain.setReferenceDate(referenceDate);
        grain.setComments(comments);
        grain.setUpdateid(account.getName());
        grain.setCreateid(account.getName());
        int saveCount = 0;
        if( fisService.checkGrainMarketCommentCondition(grain) > 0  ) {
            saveCount = fisService.updateGrainCommend(grain);
        }else{
            saveCount = fisService.insertGrainCommend(grain);
        }

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(3);
        int menuUpdateCount = menuService.updateMenu(menu);

        return saveCount;
    }

    /**
     * 일일곡물시황 상세 페이지 하단 링크
     *
     * @return
     */
    @RequestMapping(value = {"/grain-marketCondition/mainSave"}, method = RequestMethod.POST)
    public String grainMarketConditionMainSave(@ModelAttribute("menu") Menu menu,RedirectAttributes redirectAttributes){

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
        menu.setId(3);
        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/fis/grain-marketCondition";
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

    @RequestMapping(value = "/grain-marketCondition/excelUpload", method = RequestMethod.POST)
    public String processForm(Model model, @ModelAttribute("grain") Grain grain, BindingResult result,RedirectAttributes redirectAttributes) throws IOException {

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

        FileOutputStream outputStream = null;

        String filePath = upload_path+"excel/"+grain.getFile().getOriginalFilename();


        //version issue environment.getProperty("upload.filepath")+"excel/" + grain.getFile().getOriginalFilename();
        System.out.println("filePath==>"+filePath);

        outputStream = new FileOutputStream(new File(filePath));
        outputStream.write(grain.getFile().getFileItem().get());
        //load
        FileInputStream file = new FileInputStream(new File(filePath));

        XSSFWorkbook workbook = new XSSFWorkbook(file);
        XSSFSheet sheet = workbook.getSheetAt(0);

        Iterator<Row> rowIterator = sheet.iterator();

        HashMap<String,String> map = new HashMap<String,String>();

        while (rowIterator.hasNext())
        {
            Row row = rowIterator.next();
            //System.out.println("row : " + row.getRowNum());
            if(row.getRowNum() > 2){

                if(map.containsKey(row.getCell(1).getStringCellValue())){

                }else{
                    grain.setUpdateid(account.getEmail());
                    grain.setCreateid(account.getEmail());
                    grain.setReferenceDate(row.getCell(0).getStringCellValue());
                    grain.setItemCode(row.getCell(1).getStringCellValue());
                    grain.setNetChangePrice(row.getCell(2).getStringCellValue());
                    grain.setReferenceDatePrice(row.getCell(3).getStringCellValue());
                    grain.setReferenceDateFluctuation(row.getCell(4).getStringCellValue());
                    grain.setAveragePrice(row.getCell(5).getStringCellValue());
                    grain.setAverageFluctuation(row.getCell(6).getStringCellValue());

                    System.out.println("check ==> " + fisService.checkGrainMarketCondition(grain));

                    if(fisService.checkGrainMarketCondition(grain) > 0){
                        //todo : UPDATE 수행
                        fisService.updateGrainMarketCondition(grain);
                    }else {
                        //todo : INSERT 수행
                        fisService.insertGrainMarketCondition(grain);
                    }
//                    list.add(new Grain(row.getCell(0).getStringCellValue(), row.getCell(1).getStringCellValue(), row.getCell(2).getStringCellValue(), row.getCell(3).getStringCellValue(), row.getCell(4).getStringCellValue()));


                }
                map.put(row.getCell(1).getStringCellValue(),row.getCell(0).getStringCellValue());

            }
        }
        file.close();

        //iUploadService.addExcel(list);

        list.clear();

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(3);
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/fis/grain-marketCondition";
    }

    /**
     * 주요 원자재 주간가격동향 메인이미지
     *
     * @return
     */

    @RequestMapping(value = {"/InternationalRawMaterial"}, method = RequestMethod.GET)
    public String list(InternationalRawMaterial internationalRawMaterial, Model model,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        List<InternationalRawMaterial> irmList = fisService.selectInternationalRawMaterial(internationalRawMaterial);

        model.addAttribute("irmList", irmList);

        Menu menu = new Menu();
        menu.setId(10);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "admin/fis/internationalRawMaterial/index";
    }

    /**
     * 주요 원자재 주간가격동향 메인이미지
     *
     * @return
     */
    @RequestMapping(value = {"/InternationalRawMaterial/mainSave"}, method = RequestMethod.POST)
    public String InternationalRawMaterialMainSave(@ModelAttribute("menu") Menu menu,RedirectAttributes redirectAttributes){

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
        menu.setId(10);

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/fis/InternationalRawMaterial";
    }

    @RequestMapping(value = "/InternationalRawMaterial/excelUpload", method = RequestMethod.POST)
    public String processForm2(Model model, @ModelAttribute("irm") InternationalRawMaterial irm, BindingResult result,RedirectAttributes redirectAttributes) throws IOException {

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

        FileOutputStream outputStream = null;

        String filePath =  upload_path+"excel/"+irm.getFile().getOriginalFilename();
        //version issue environment.getProperty("upload.filepath")+"excel/" + irm.getFile().getOriginalFilename();
        System.out.println("filePath==>"+filePath);

        outputStream = new FileOutputStream(new File(filePath));
        outputStream.write(irm.getFile().getFileItem().get());
        //load
        FileInputStream file = new FileInputStream(new File(filePath));

        XSSFWorkbook workbook = new XSSFWorkbook(file);
        XSSFSheet sheet = workbook.getSheetAt(0);

        Iterator<Row> rowIterator = sheet.iterator();

        HashMap<String,String> map = new HashMap<String,String>();

        while (rowIterator.hasNext())
        {
            Row row = rowIterator.next();
            //System.out.println("row : " + row.getRowNum());
            if(row.getRowNum() > 2){

                if(map.containsKey(row.getCell(2).getStringCellValue())){

                }else{
                    irm.setUpdateid(account.getEmail());
                    irm.setCreateid(account.getEmail());
                    irm.setReferenceDateFrom(row.getCell(0).getStringCellValue());
                    irm.setReferenceDateTo(row.getCell(1).getStringCellValue());
                    irm.setItemCode(row.getCell(2).getStringCellValue());
                    irm.setWeeklyAveragePrice(row.getCell(3).getStringCellValue());
                    irm.setLastWeeklyAveragePrice(row.getCell(4).getStringCellValue());
                    irm.setLastYearlyAveragePrice(row.getCell(5).getStringCellValue());

                    if(fisService.checkInternationalRawMaterial(irm) > 0){
                        //todo : UPDATE 수행
                        fisService.updateInternationalRawMaterial(irm);
                    }else {
                        //todo : INSERT 수행
                        fisService.insertInternationalRawMaterial(irm);
                    }
//                    list.add(new Grain(row.getCell(0).getStringCellValue(), row.getCell(1).getStringCellValue(), row.getCell(2).getStringCellValue(), row.getCell(3).getStringCellValue(), row.getCell(4).getStringCellValue()));


                }
                map.put(row.getCell(1).getStringCellValue(),row.getCell(0).getStringCellValue());

            }
        }
        file.close();

        //iUploadService.addExcel(list);

        list.clear();

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(10);
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/fis/InternationalRawMaterial";
    }

    /* 주요 가공식품 주간 가격동향 관리*/
    @RequestMapping(value = {"/ProcessedFood","/ProcessedFood/index"}, method = RequestMethod.GET)
    public String ProcessedFoodIndex(ProcessedFood processedFood, Model model,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        List<ProcessedFood> processedFoodList = fisService.selectProcessedFoodList(processedFood);

        model.addAttribute("processedFoodList", processedFoodList);

        Menu menu = new Menu();
        menu.setId(4);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "admin/fis/ProcessedFood/index";
    }

    /**
     * 주요 가공식품 주간 가격동향 메인이미지
     *
     * @return
     */
    @RequestMapping(value = {"/ProcessedFood/mainSave"}, method = RequestMethod.POST)
    public String ProcessedFoodMainSave(@ModelAttribute("menu") Menu menu,RedirectAttributes redirectAttributes){

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
        menu.setId(4);
        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/fis/ProcessedFood";
    }

    /**
     * 삭제
     *
     * @return
     */
    @RequestMapping(value = "/ProcessedFood/del/{fromDate}/{toDate}", method = RequestMethod.GET)
    public String del(@PathVariable("fromDate") String fromDate, @PathVariable("toDate") String toDate, Model model,RedirectAttributes redirectAttributes, HttpServletRequest  request) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        ProcessedFood processedFood=new ProcessedFood();
        processedFood.setReferenceDateFrom(fromDate);
        processedFood.setReferenceDateTo(toDate);

        fisService.deleteProcessedFood(processedFood);

        Account account = AuthenticationUtils.getUser();
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(4);
        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/fis/ProcessedFood";
    }

    @RequestMapping(value = "/ProcessedFood/excelUpload", method = RequestMethod.POST)
    public String ProcessedFoodExcel(Model model, @ModelAttribute("processedFood") ProcessedFood processedFood, BindingResult result,RedirectAttributes redirectAttributes) throws IOException {

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

        FileOutputStream outputStream = null;

        String filePath = upload_path+"excel/"+ processedFood.getFile().getOriginalFilename();
        //version issue environment.getProperty("upload.filepath")+"excel/" + processedFood.getFile().getOriginalFilename();

        System.out.println("filePath==>"+filePath);

        outputStream = new FileOutputStream(new File(filePath));
        outputStream.write(processedFood.getFile().getFileItem().get());
        //load
        FileInputStream file = new FileInputStream(new File(filePath));

        XSSFWorkbook workbook = new XSSFWorkbook(file);
        XSSFSheet sheet = workbook.getSheetAt(0);

        Iterator<Row> rowIterator = sheet.iterator();

        HashMap<String,String> map = new HashMap<String,String>();

        while (rowIterator.hasNext())
        {
            Row row = rowIterator.next();
            System.out.println("row ==> " + row.getRowNum());

            if(row.getRowNum() > 2){

                if(map.containsKey(row.getCell(2).getStringCellValue())){

                }else{
                    processedFood.setUpdateid(account.getEmail());
                    processedFood.setCreateid(account.getEmail());
                    processedFood.setReferenceDateFrom(row.getCell(0).getStringCellValue());
                    processedFood.setReferenceDateTo(row.getCell(1).getStringCellValue());
                    processedFood.setItemCode(row.getCell(2).getStringCellValue());
                    processedFood.setUnit(row.getCell(3).getStringCellValue());
                    processedFood.setProductName(row.getCell(4).getStringCellValue());
                    processedFood.setWeeklyPrice(row.getCell(5).getStringCellValue());
                    processedFood.setLastMonthPrice(row.getCell(6).getStringCellValue());
                    processedFood.setWeeklyFluctuation(row.getCell(7).getStringCellValue());

                    if(fisService.checkProcessedFood(processedFood) > 0){
                        //todo : UPDATE 수행
                        fisService.updateProcessedFood(processedFood);
                    }else {
                        //todo : INSERT 수행
                        fisService.insertProcessedFood(processedFood);
                    }
                }
                map.put(row.getCell(1).getStringCellValue(),row.getCell(0).getStringCellValue());

            }
        }
        file.close();

        list.clear();

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(4);
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/fis/ProcessedFood";
    }

    /**
     * 한국외식업경기지수 페이지
     *
     * @return
     */
    @RequestMapping(value = {"/eating_business","/eating_business/index"}, method = RequestMethod.GET)
    public String eatingBusinessIndex(Model model, @ModelAttribute("eatingBusiness") EatingBusiness paramEatingBusiness,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        EatingBusiness eatingBusiness = new EatingBusiness();
        if( paramEatingBusiness != null ) {
            eatingBusiness = paramEatingBusiness;
        }
        //주간 물가 정보 데이터 가져오기
        List<EatingBusiness> eatingBusinessComment = eatingBusinessService.selectEatingBusinessComment(eatingBusiness);
        model.addAttribute("eatingBusinessComment", eatingBusinessComment);

        model.addAttribute("eatingBusiness", eatingBusiness);

        Menu menu = new Menu();
        menu.setId(13);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "admin/fis/eating_business/index";
    }

    /**
     * 한국외식업경기지수 메인이미지
     *
     * @return
     */
    @RequestMapping(value = {"/eating_business/mainSave"}, method = RequestMethod.POST)
    public String eatingBusinessMainSave(@ModelAttribute("menu") Menu menu,@RequestParam MultipartFile file,BindingResult result,RedirectAttributes redirectAttributes) throws IOException {

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
        menu.setId(13);

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
           //version isssue file.transferTo(new File(environment.getProperty("upload.filepath")+ newFileName));

            menu.setFileName(fileName);
            menu.setThumbnailName(newFileName);
        }
        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/fis/eating_business";
    }

    /*한국외식업경기지수 등록 페이지*/
    @RequestMapping(value =  {"/eating_business/write/{groupCode}"}, method = RequestMethod.GET)
    public String eatingBusinessWrite(Model model, @PathVariable("groupCode") int groupCode,RedirectAttributes redirectAttributes) {

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
        EatingBusiness eatingBusiness = new EatingBusiness();
        List<EatingBusiness> eatingBusinessList = null;
        List<EatingBusiness> eatingBusinessCommentList = null;
        if( groupCode != 0 ){
            eatingBusiness.setGroupCode( groupCode  );
            eatingBusinessList = eatingBusinessService.selectEatingBusinessList(eatingBusiness);
            eatingBusinessCommentList = eatingBusinessService.selectEatingBusinessComment(eatingBusiness);
        }

        model.addAttribute("eatingBusinessList", eatingBusinessList);
        model.addAttribute("eatingBusinessCommentList", eatingBusinessCommentList);

        return "admin/fis/eating_business/write";
    }

    /*한국외식업경기지수 등록*/
    @RequestMapping(value =  {"/eating_business/insertEatingBusiness"}, method = RequestMethod.POST)
    public String insertEatingBusiness(@ModelAttribute("eatingBusiness") EatingBusiness eatingBusiness,RedirectAttributes redirectAttributes, HttpServletRequest request) {

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
        eatingBusiness.setCreateid(account.getEmail());
        eatingBusiness.setUpdateid(account.getEmail());

        if( eatingBusiness.getGroupCode() != null && eatingBusiness.getGroupCode() != 0) {
            //제품 수정하기
            //이번주 동향
            eatingBusiness.setGroupType("1");
            eatingBusiness.setLastDate(request.getParameter("type1lastDate"));
            eatingBusiness.setLastRate(request.getParameter("type1lastRate"));
            eatingBusiness.setNowDate(request.getParameter("type1nowDate"));
            eatingBusiness.setNowRate(request.getParameter("type1nowRate"));
            eatingBusiness.setFoodType("");
            eatingBusiness.setSeq(null);
            eatingBusinessService.updateEatingBusiness(eatingBusiness);

            eatingBusiness.setLastDate("");
            eatingBusiness.setLastRate("");
            eatingBusiness.setFoodType("");
            for (int i = 1; i <= 10; i++) {
                eatingBusiness.setGroupType("2");
                eatingBusiness.setNowDate(request.getParameter("type2nowDate" + i + ""));
                eatingBusiness.setNowRate(request.getParameter("type2nowRate" + i + ""));
                eatingBusiness.setSeq(Integer.parseInt(request.getParameter("type2seq" + i + "")));
                eatingBusinessService.updateEatingBusiness(eatingBusiness);
            }

            for (int j = 1; j <= 7; j++) {
                eatingBusiness.setGroupType("3");
                eatingBusiness.setFoodType(request.getParameter("type3foodType"+j+""));
                eatingBusiness.setLastDate(request.getParameter("type3lastDate"+j+""));
                eatingBusiness.setLastRate(request.getParameter("type3lastRate"+j+""));
                eatingBusiness.setNowDate(request.getParameter("type3nowDate"+j+""));
                eatingBusiness.setNowRate(request.getParameter("type3nowRate"+j+""));
                eatingBusiness.setSeq(Integer.parseInt(request.getParameter("type3seq" + j + "")));
                eatingBusinessService.updateEatingBusiness(eatingBusiness);
            }

            eatingBusiness.setTitle(request.getParameter("title"));
            eatingBusiness.setMemo1Title(request.getParameter("Memo1Title"));
            eatingBusiness.setMemo1(request.getParameter("Memo1"));
            eatingBusiness.setMemo2Title(request.getParameter("Memo2Title"));
            eatingBusiness.setMemo2(request.getParameter("Memo2"));
            eatingBusinessService.updateEatingBusinessComment(eatingBusiness);
        }else {
            //그룹코드 가져오기
            int groupCode = eatingBusinessService.selectEatingBusinessGroupCode();
            eatingBusiness.setGroupCode(groupCode);
            //상단 경기지수 등록하기
            //이번주 동향
            eatingBusiness.setGroupType("1");
            eatingBusiness.setLastDate(request.getParameter("type1lastDate"));
            eatingBusiness.setLastRate(request.getParameter("type1lastRate"));
            eatingBusiness.setNowDate(request.getParameter("type1nowDate"));
            eatingBusiness.setNowRate(request.getParameter("type1nowRate"));
            eatingBusiness.setFoodType("");
            eatingBusinessService.insertEatingBusiness(eatingBusiness);

            eatingBusiness.setLastDate("");
            eatingBusiness.setLastRate("");
            eatingBusiness.setFoodType("");
            for (int i = 1; i <= 10; i++) {
                eatingBusiness.setGroupType("2");
                eatingBusiness.setNowDate(request.getParameter("type2nowDate" + i + ""));
                eatingBusiness.setNowRate(request.getParameter("type2nowRate" + i + ""));
                eatingBusinessService.insertEatingBusiness(eatingBusiness);
            }

            for (int j = 1; j <= 7; j++) {
                eatingBusiness.setGroupType("3");
                eatingBusiness.setFoodType(request.getParameter("type3foodType"+j+""));
                eatingBusiness.setLastDate(request.getParameter("type3lastDate"+j+""));
                eatingBusiness.setLastRate(request.getParameter("type3lastRate"+j+""));
                eatingBusiness.setNowDate(request.getParameter("type3nowDate"+j+""));
                eatingBusiness.setNowRate(request.getParameter("type3nowRate"+j+""));
                eatingBusinessService.insertEatingBusiness(eatingBusiness);
            }

            eatingBusiness.setTitle(request.getParameter("title"));
            eatingBusiness.setMemo1Title(request.getParameter("Memo1Title"));
            eatingBusiness.setMemo1(request.getParameter("Memo1"));
            eatingBusiness.setMemo2Title(request.getParameter("Memo2Title"));
            eatingBusiness.setMemo2(request.getParameter("Memo2"));
            eatingBusinessService.insertEatingBusinessComment(eatingBusiness);
        }

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(13);

        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/fis/eating_business/index";
    }

     /*한국외식업경기지수 삭제하기*/
    @RequestMapping(value =  {"/eating_business/del/{seq}"}, method = RequestMethod.GET)
    public String deleteEatingBusiness(Model model, @PathVariable("seq") int seq,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        EatingBusiness eatingBusiness = new EatingBusiness();
        Account account = AuthenticationUtils.getUser();
        eatingBusiness.setUpdateid(account.getEmail());
        eatingBusiness.setSeq(seq);

        eatingBusinessService.deleteEatingBusiness(eatingBusiness);

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(13);
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/fis/eating_business/index";
    }

    /*국내외 식품산업 주요지표 리스트 가져오기*/
    @RequestMapping(value = {"/mainIndicators","/mainIndicators"}, method = RequestMethod.GET)
    public String mainIndicatorsIndex(MainIndicators mainIndicators, Model model,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        List<MainIndicators> mainIndicatorsList = mainIndicatorsService.selectMainIndicatorsList(mainIndicators);

        model.addAttribute("mainIndicatorsList", mainIndicatorsList);

        Menu menu = new Menu();
        menu.setId(8);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "admin/fis/main_indicators/index";
    }

    /*국내외 식품산업 주요지표 데이터 가져오기*/
    @RequestMapping(value =  {"/mainIndicators/write/{seq}"}, method = RequestMethod.GET)
    public String mainIndicatorsWrite(Model model, @PathVariable("seq") int seq,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        MainIndicators mainIndicators = new MainIndicators();
        List<MainIndicators> mainIndicatorsList = null;
        if( seq != 0 ){
            mainIndicators.setSeq(seq);
            mainIndicatorsList = mainIndicatorsService.selectMainIndicatorsList(mainIndicators);
        }

        model.addAttribute("mainIndicatorsList", mainIndicatorsList);

        return "admin/fis/main_indicators/write";
    }

    /**
     * 국내외 식품산업 주요지표 등록
     *
     * @return
     */
    @RequestMapping(value = {"/mainIndicators/mainSave"}, method = RequestMethod.POST)
    public String foreignWholesaleMainSave(@ModelAttribute("menu") Menu menu,@RequestParam MultipartFile file,BindingResult result,RedirectAttributes redirectAttributes) throws IOException {

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
        menu.setId(8);

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
            //version issue file.transferTo(new File(environment.getProperty("upload.filepath") + newFileName));
            file.transferTo(new File(upload_path+ newFileName));

            menu.setFileName(fileName);
            menu.setThumbnailName(newFileName);
        }
        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/fis/mainIndicators";
    }

    @RequestMapping(value = "/mainIndicators/insertMainIndicators", method = RequestMethod.POST)
    public String insertMainIndicators(@ModelAttribute("mainIndicators") MainIndicators mainIndicators, MultipartHttpServletRequest multipartRequest,RedirectAttributes redirectAttributes) throws IOException {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        List<MultipartFile> fileList = multipartRequest.getFiles("file");

        String[] fileInfoName = new String[10];
        int fileListNum = 0;
        for (MultipartFile file : fileList) {
            if( file != null && file.getSize() > 0 ) {
                String fileName = file.getOriginalFilename();
                String fileMime = file.getContentType();
                if (fileListNum == 0 || fileListNum == 2 || fileListNum == 4){
                    fileName = fileName.replace("_on.",".");
                    fileName = fileName.replace(".","_on.");
                }else if (fileListNum == 1 || fileListNum == 3 || fileListNum == 5){
                    fileName = fileName.replace("_off.",".");
                    fileName = fileName.replace(".","_off.");
                }
                fileInfoName[fileListNum] = fileName;
                //version issue file.transferTo(new File(environment.getProperty("upload.filepath")+"main-indicators/"+fileName));upload_path+"excel/"+grain.getFile().getOriginalFilename();
                file.transferTo(new File(upload_path+ fileName));

            }
            fileListNum++;
        }

        Account account = AuthenticationUtils.getUser();
        mainIndicators.setCreateid(account.getEmail());
        mainIndicators.setUpdateid(account.getEmail());

        mainIndicators.setImgTab1On(fileInfoName[0]);
        mainIndicators.setImgTab1Off(fileInfoName[1]);
        mainIndicators.setImgTab2On(fileInfoName[2]);
        mainIndicators.setImgTab2Off(fileInfoName[3]);
        mainIndicators.setImgTab3On(fileInfoName[4]);
        mainIndicators.setImgTab3Off(fileInfoName[5]);
        mainIndicators.setContentsTab1(fileInfoName[6]);
        mainIndicators.setContentsTab2(fileInfoName[7]);
        mainIndicators.setContents1Tab3(fileInfoName[8]);
        mainIndicators.setContents2Tab3(fileInfoName[9]);

        if( mainIndicators.getDelImg() != "" ){
            String[] delImgArr = mainIndicators.getDelImg().split(",");
            for(int i=1;i<delImgArr.length;i++){
                if ( delImgArr[i].equals("imgTab1On" )){
                    mainIndicators.setImgTab1On(" ");
                }
                if ( delImgArr[i].equals("imgTab2On") ){
                    mainIndicators.setImgTab2On(" ");
                }
                if ( delImgArr[i].equals("imgTab3On") ){
                    mainIndicators.setImgTab3On(" ");
                }
                if ( delImgArr[i].equals("imgTab1Off" )){
                    mainIndicators.setImgTab1Off(" ");
                }
                if ( delImgArr[i].equals("imgTab2Off") ){
                    mainIndicators.setImgTab2Off(" ");
                }
                if ( delImgArr[i].equals("imgTab3Off") ){
                    mainIndicators.setImgTab3Off(" ");
                }
                if ( delImgArr[i].equals("contentsTab1") ){
                    mainIndicators.setContentsTab1(" ");
                }
                if ( delImgArr[i].equals("contentsTab2") ){
                    mainIndicators.setContentsTab2(" ");
                }
                if ( delImgArr[i].equals("contents1Tab3") ){
                    mainIndicators.setContents1Tab3(" ");
                }
                if ( delImgArr[i].equals("contents2Tab3") ){
                    mainIndicators.setContents2Tab3(" ");
                }
            }
        }

        if( mainIndicators.getSeq() != null ) {
            int updateCount = mainIndicatorsService.updateMainIndicators(mainIndicators);
        }else{
            int insertCount = mainIndicatorsService.insertMainIndicators(mainIndicators);
        }

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(8);
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/fis/mainIndicators";
    }

    /*국내외 식품산업 주요지표 데이터 삭제하기*/
    @RequestMapping(value =  {"/mainIndicators/del/{seq}"}, method = RequestMethod.GET)
    public String mainIndicatorsDelete(Model model, @PathVariable("seq") int seq,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        MainIndicators mainIndicators = new MainIndicators();
        Account account = AuthenticationUtils.getUser();
        mainIndicators.setUpdateid(account.getEmail());
        mainIndicators.setSeq(seq);

        mainIndicatorsService.deleteMainIndicators(mainIndicators);

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(8);
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/fis/mainIndicators";
    }
}