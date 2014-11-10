package com.info.web.admin.controller;

import com.info.framework.security.AuthenticationUtils;
import com.info.web.account.service.AccountService;
import com.info.web.common.service.MenuService;
import com.info.web.domain.*;
import com.info.web.exportweather.service.ExportWeatherService;
import com.info.web.farmdealtrend.service.FarmDealTrendService;
import com.info.web.foodinfo.service.FoodInfoService;
import com.info.web.foreignwholesale.service.ForeignWholesaleService;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
@RequestMapping(value = "/admin/katis")
public class KatisAdminController {

    private static final Logger log = LoggerFactory.getLogger(KatisAdminController.class);

    //운영서버시
    private String upload_path = "/d01/jeus6.0/webhome/aT_HP_WASSvr_container5/info/info_war___/resources/front/upload/";
    //개발서버시
    //private String upload_path = "D:/workspace/old/src/main/webapp/resources/front/upload/";

    @Autowired
    private AccountService accountService;

    @Autowired
    private FarmDealTrendService farmDealTrendService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private ExportWeatherService exportWeatherService;

    @Autowired
    private FoodInfoService foodInfoService;


    private static List<FarmDealTrend> list = new ArrayList<FarmDealTrend>();

    /*주요 농산물 일일거래동향 화면*/
    @RequestMapping(value =  {"/farm-dealTrend", "/farm-dealTrend/index"}, method = RequestMethod.GET)
    public String farmDealTrend(FarmDealTrend farmDealTrend, Model model,RedirectAttributes redirectAttributes) {

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
        menu.setId(9);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        List<FarmDealTrend> farmDealTrendList = farmDealTrendService.selectFarmDealTrendList(farmDealTrend);

        model.addAttribute("farmDealTrendList", farmDealTrendList);

        return "admin/katis/farm-dealTrend/index";
    }

    /**
     * 주요 농산물 거래 동향 상세 페이지 하단 링크
     *
     * @return
     */
    @RequestMapping(value = {"/farm-dealTrend/mainSave"}, method = RequestMethod.POST)
    public String farmDealTrendMainSave(@ModelAttribute("menu") Menu menu,RedirectAttributes redirectAttributes){

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
        menu.setId(9);
        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/katis/farm-dealTrend";
    }

    /*주요 농산물 거래 동향 엑셀 업로드*/
    @RequestMapping(value = "/farm-dealTrend/excelUpload", method = RequestMethod.POST)
    public String processForm2(Model model, @ModelAttribute("farmDealTrend") FarmDealTrend farmDealTrend, BindingResult result,RedirectAttributes redirectAttributes) throws IOException {

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

        String filePath = upload_path+"excel/"+farmDealTrend.getFile().getOriginalFilename();
        //version issue environment.getProperty("upload.filepath")+"excel/" + farmDealTrend.getFile().getOriginalFilename();
        System.out.println("filePath==>"+filePath);

        outputStream = new FileOutputStream(new File(filePath));
        outputStream.write(farmDealTrend.getFile().getFileItem().get());
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
                    farmDealTrend.setUpdateid(account.getEmail());
                    farmDealTrend.setCreateid(account.getEmail());
                    farmDealTrend.setStandardDate(row.getCell(0).getStringCellValue());
                    farmDealTrend.setItemCode(row.getCell(1).getStringCellValue());
                    farmDealTrend.setStandardPrice(row.getCell(2).getStringCellValue());
                    farmDealTrend.setDanger(row.getCell(3).getStringCellValue());
                    farmDealTrend.setYearPrice(row.getCell(4).getStringCellValue());

                    if(farmDealTrendService.checkFarmDealTrend(farmDealTrend) > 0){
                        //todo : UPDATE 수행
                        farmDealTrendService.updateFarmDealTrend(farmDealTrend);
                    }else {
                        //todo : INSERT 수행
                        farmDealTrendService.insertFarmDealTrend(farmDealTrend);
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
        menu.setId(9);

        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/katis/farm-dealTrend";
    }

    /**
     * 해외 농산물 도매가격 관리 페이지
     *
     * @return "admin/kamis/foreign-wholesale/index"
     */
    @RequestMapping(value =  {"/foreign-wholesale/index", "/foreign-wholesale"}, method = RequestMethod.GET)
    public String foreignWholesaleIndex(Model model, @ModelAttribute("foreign-wholesale") DistributionReality paramDistributionReality,RedirectAttributes redirectAttributes) {

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
        menu.setId(11);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "admin/katis/foreign-wholesale/index";
    }

    /**
     * 해외도소매가격 메인이미지
     *
     * @return
     */
    @RequestMapping(value = {"/foreign-wholesale/mainSave"}, method = RequestMethod.POST)
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
        menu.setId(11);

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

        return "redirect:/admin/katis/foreign-wholesale";
    }

    /**
     * 농수산식품 수출기상도
     *
     * @return
     */
    @RequestMapping(value =  {"/export-weather/index", "/export-weather"}, method = RequestMethod.GET)
    public String exportWeatherIndex(Model model, @ModelAttribute("export-weather") DistributionReality paramDistributionReality,RedirectAttributes redirectAttributes) {

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
        menu.setId(6);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        List<ExportWeather> exportWeathersDayList = exportWeatherService.selectExportWeatherGroupDay();
        model.addAttribute("exportWeathersDayList", exportWeathersDayList);
        return "admin/katis/export-weather/index";
    }

    /*농수산식품 수출기상도 수정페이지*/
    @RequestMapping(value =  {"/export-weather/write/{indexDate}"}, method = RequestMethod.GET)
    public String exportWeatherWrite(Model model, @PathVariable("indexDate") String indexDate,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        ExportWeather exportWeather = new ExportWeather();

        exportWeather.setPkYear(indexDate.substring(0,4));
        exportWeather.setPkMonth(indexDate.substring(4,6));
        exportWeather.setPkWeek(indexDate.substring(6,7));

        List<ExportWeather> exportWeatherList = exportWeatherService.selectExportWeatherList(exportWeather);
        List<ExportWeather> exportWeatherNation = exportWeatherService.selectExportWeatherNationList(exportWeather);

        model.addAttribute("exportWeatherList", exportWeatherList);
        model.addAttribute("exportWeatherNation", exportWeatherNation);

        return "admin/katis/export-weather/write";
    }

    /**
     * 농수산식품 수출기상도 상세페이지 하단 링크 변경
     *
     * @return
     */
    @RequestMapping(value = {"/export-weather/mainSave"}, method = RequestMethod.POST)
    public String exportWeatherMainSave(@ModelAttribute("menu") Menu menu,RedirectAttributes redirectAttributes) {

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
        menu.setId(6);
        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/katis/export-weather";
    }

    /**
     * 농수산식품수출기상도 쓰기 페이지
     *
     * @return
     */
    @RequestMapping(value = {"/export-weather/insertExportWeather"}, method = RequestMethod.POST)
    public String insertExportWeather(@ModelAttribute("exportWeather") ExportWeather exportWeather,RedirectAttributes redirectAttributes, HttpServletRequest request) {

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
        exportWeather.setUpdateid(account.getEmail());

        exportWeatherService.updateExportWeather(exportWeather);

        for( int i = 1; i<=6; i++){
            exportWeather.setItemName(request.getParameter("nation"+i+"itemName"));
            exportWeather.setUpItem(request.getParameter("nation"+i+"UpItem"));
            exportWeather.setDownItem(request.getParameter("nation"+i+"DownItem"));
            exportWeather.setMemo1(request.getParameter("nation"+i+"Memo1"));
            exportWeather.setMemo2(request.getParameter("nation"+i+"Memo2"));

            exportWeatherService.updateExportWeatherNation(exportWeather);

        }

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(6);

        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/katis/export-weather";
    }

    /* Global Food Info*/
    @RequestMapping(value =  {"/food-info", "/food-info/index"}, method = RequestMethod.GET)
    public String foodInfoIndex(FoodInfo foodInfo, Model model,RedirectAttributes redirectAttributes) {

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
        menu.setId(15);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        List<FoodInfo> foodInfoList = foodInfoService.selectFoodInfoList(foodInfo);

        model.addAttribute("foodInfoList", foodInfoList);

        return "admin/katis/food-info/index";
    }

    /**
     * Global Food Info 메인이미지
     *
     * @return
     */
    @RequestMapping(value = {"/food-info/mainSave"}, method = RequestMethod.POST)
    public String foodInfoMainSave(@ModelAttribute("menu") Menu menu,@RequestParam MultipartFile file,BindingResult result,RedirectAttributes redirectAttributes) throws IOException {

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
        menu.setId(15);

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

        return "redirect:/admin/katis/food-info";
    }

    /**
     * Global Food Info 쓰기 페이지
     *
     * @return
     */
    @RequestMapping(value = {"/food-info/write/{seq}"}, method = RequestMethod.GET)
    public String foodInfoWrite(Model model, @PathVariable("seq") int seq,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        FoodInfo foodInfo = new FoodInfo();
        List<FoodInfo> foodInfoList = null;
        if( seq != 0 ){
            foodInfo.setSeq(seq);
            foodInfoList = foodInfoService.selectFoodInfoList(foodInfo);
        }

        model.addAttribute("foodInfoList", foodInfoList);

        return "admin/katis/food-info/write";
    }

    @RequestMapping(value = "/food-info/insertFoodInfo", method = RequestMethod.POST)
    public String insertMainIndicators(@ModelAttribute("foodInfo") FoodInfo foodInfo, MultipartHttpServletRequest multipartRequest,RedirectAttributes redirectAttributes) throws IOException {

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
                fileInfoName[fileListNum] = fileName;
                //version issue file.transferTo(new File(environment.getProperty("upload.filepath")+"food-info/"+fileName));
                file.transferTo(new File(upload_path+"food-info/"+ fileName));
            }
            fileListNum++;
        }

        Account account = AuthenticationUtils.getUser();
        foodInfo.setCreateid(account.getEmail());
        foodInfo.setUpdateid(account.getEmail());

        foodInfo.setTab1Img(fileInfoName[0]);
        foodInfo.setTab2Img(fileInfoName[1]);
        foodInfo.setTab3Img(fileInfoName[2]);

        if( foodInfo.getDelImg() != "" ){
            String[] delImgArr = foodInfo.getDelImg().split(",");
            for(int i=1;i<delImgArr.length;i++){
                if ( delImgArr[i].equals("tab1Img" )){
                    foodInfo.setTab1Img(" ");
                }
                if ( delImgArr[i].equals("tab2Img") ){
                    foodInfo.setTab2Img(" ");
                }
                if ( delImgArr[i].equals("tab3Img") ){
                    foodInfo.setTab3Img(" ");
                }
            }
        }

        if( foodInfo.getSeq() != null ) {
            int updateCount = foodInfoService.updateFoodInfo(foodInfo);
        }else{
            int insertCount = foodInfoService.insertFoodInfo(foodInfo);
        }

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(15);
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/katis/food-info";
    }

    /* Global Food Info 데이터 삭제하기*/
    @RequestMapping(value =  {"/food-info/del/{seq}"}, method = RequestMethod.GET)
    public String foodInfoDelete(Model model, @PathVariable("seq") int seq,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        FoodInfo foodInfo = new FoodInfo();
        Account account = AuthenticationUtils.getUser();
        foodInfo.setUpdateid(account.getEmail());
        foodInfo.setSeq(seq);

        foodInfoService.deleteFoodInfo(foodInfo);

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Menu menu=new Menu();
        menu.setUpdateid(account.getEmail());
        menu.setId(15);
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/katis/food-info";
    }

    /**
     * KATI, 뉴스레터
     *
     * @return
     */
    @RequestMapping(value =  {"/news-letter/index", "/news-letter"}, method = RequestMethod.GET)
    public String newsLetterIndex(Model model, @ModelAttribute("news-letter") DistributionReality paramDistributionReality,RedirectAttributes redirectAttributes) {

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
        menu.setId(5);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "admin/katis/news-letter/index";
    }

    /**
     * KATI, 뉴스레터 링크 변경
     *
     * @return
     */
    @RequestMapping(value = {"/news-letter/mainSave"}, method = RequestMethod.POST)
    public String newsLetterMainSave(@ModelAttribute("menu") Menu menu,RedirectAttributes redirectAttributes) {

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
        menu.setId(5);
        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        int menuUpdateCount = menuService.updateMenu(menu);

        return "redirect:/admin/katis/news-letter";
    }
}
