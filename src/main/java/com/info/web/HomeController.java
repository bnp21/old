package com.info.web;

import com.info.web.atnews.service.AtnewsService;
import com.info.web.common.service.MenuService;
import com.info.web.dailyprice.service.DailyPriceService;
import com.info.web.domain.*;
import com.info.web.exportweather.service.ExportWeatherService;
import com.info.web.farmdealtrend.service.FarmDealTrendService;
import com.info.web.fis.service.FisService;
import com.info.web.flower.service.FlowerService;
import com.info.web.main.service.MainService;
import com.info.web.education.service.EducationService;
import com.info.web.notice.service.NoticeService;
import com.info.web.weeklyshopping.service.WeeklyShoppingService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class HomeController {

    private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private AtnewsService atnewsService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private EducationService educationService;

    @Autowired
    private MainService mainService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private FisService fisService;

    @Autowired
    private FarmDealTrendService farmDealTrendService;

    @Autowired
    private WeeklyShoppingService weeklyShoppingService;

    @Autowired
    private FlowerService flowerService;

    @Autowired
    private ExportWeatherService exportWeatherService;

    @Autowired
    private DailyPriceService dailyPriceService;

    /*메인화면 리스트*/
    @RequestMapping(value = {"","/index"}, method = RequestMethod.GET)
    public String index(ModelMap model, HttpServletRequest request, HttpServletResponse response ) throws SerialException, IOException{
        /*모바일체크*/
        String userAgent = request.getHeader("User-Agent");
        String[] mobileArr = {"iphone","ipod","android","blackberry","windows ce","nokia","webos","opera mini","sonyericsson","opera mobi","iemobile"};
        Boolean mobileYn = false;
        for( int i=0; i<mobileArr.length; i++){
         if(userAgent.toLowerCase().indexOf(mobileArr[i]) > 0 ){
             mobileYn = true;
             break;
         }
        }
        if( mobileYn == true){
            HttpSession session = request.getSession(true);
            if( session.getAttribute("goPC") == null ){
                return "redirect:/mobile/index";
            }else{
                if( !session.getAttribute("goPC").equals("Y") ){
                    return "redirect:/mobile/index";
                }else{
                    /*at센터 최근소식*/
                    Atnews atnews = new Atnews();

                    List<Atnews> atnewsList = atnewsService.selectAtnewsList(atnews);

                    model.addAttribute("atnewsList", atnewsList);

                    /*유통교육원 최근소식*/
                    Education education = new Education();

                    List<Education> educationList = educationService.selectEducationList(education);

                    model.addAttribute("educationList", educationList);

                    /*메인 노출데이터*/
                    Main main = new Main();
                    List<Main> mainList = mainService.selectMainList(main);
                    //List<Menu> mainOutList = menuService.selectOutMenuList();

    //            for (int i = 0; i < mainList.size(); i++) {
    //                System.out.println(i+"==>"+mainList.get(i).getMenuname());
    //            }
                    model.addAttribute("mainList", mainList);
                    model.addAttribute("mainListSize", mainList.size());
                    //model.addAttribute("menuList", mainOutList);
                }
            }
        }else {

            /*at센터 최근소식*/
            Atnews atnews = new Atnews();

            List<Atnews> atnewsList = atnewsService.selectAtnewsList(atnews);

            model.addAttribute("atnewsList", atnewsList);

            /*유통교육원 최근소식*/
            Education education = new Education();

            List<Education> educationList = educationService.selectEducationList(education);

            model.addAttribute("educationList", educationList);

            /*메인 노출데이터*/
            Main main = new Main();
            List<Main> mainList = mainService.selectMainList(main);
            //List<Menu> mainOutList = menuService.selectOutMenuList();

//            for (int i = 0; i < mainList.size(); i++) {
//                System.out.println(i+"==>"+mainList.get(i).getMenuname());
//            }
            model.addAttribute("mainList", mainList);
            model.addAttribute("mainListSize", mainList.size());
            //model.addAttribute("menuList", mainOutList);
        }

        /************** 통계정보 입력 Start **************/
            String ip = request.getRemoteAddr();

            Statistics statistics=new Statistics();

            statistics.setIp(ip);
            statistics.setMenuId(90);   //웹메인:90, 모바일메인:91, 나머지는 메뉴아이디:1~16
            statistics.setPageGbn("A"); //메인:A,모바일메인:B,생생정보:C,원본:D

            int cnt=mainService.updateStatistics(statistics);
            //System.out.println("웹메인 cnt==>"+cnt);
        /************** 통계정보 입력  End **************/

        return "index";
    }

    /* 통계 생생정보 등록 */
    @ResponseBody
    @RequestMapping(value = "insertStatistics/{url}/{gbn}", method = RequestMethod.GET)
    public int insertStatistics(Model model, @PathVariable("url") String url, @PathVariable("gbn") String gbn
                                                        , HttpServletRequest request, HttpServletResponse response) {

        /************** 통계정보 입력 Start **************/
        String ip = request.getRemoteAddr();
        int menuId = 0;

        //System.out.println("ip==>"+ip);
        //System.out.println("url==>"+url);
        //System.out.println("gbn==>"+gbn);

        if(url!=null){

            if(url.equals("1") || url.equals("5") || url.equals("14")){  //외부링크일 경우:  사이버거래소[1], 뉴스레터[5], e-book[14]
                menuId=Integer.parseInt(url);
                //System.out.println("menuId==>" + menuId);
            }else {
//                Main main = new Main();
//                main.setUrl(url);
//                List<Main> mainList = mainService.selectCategoryList(main);
//                menuId = mainList.get(0).getId();

            //if(url.equals("http://www.eatmart.co.kr")){menuId=1;}       //사이버거래소, 프로모션 ###
            if(url.equals("dailyPrice")){menuId=2;}     //KAMIS, 농산물일일도소매가격
            if(url.equals("grain-marketCondition")){menuId=3;}  //FIS, 일일곡물시황
            if(url.equals("ProcessedFood")){menuId=4;}  //FIS, 주요가공식품주간가격동향
            //if(url.equals("news-letter")){menuId=5;}   //KATI, 뉴스레터 ###
            if(url.equals("exportweather")){menuId=6;}  //KATI, 농수산식품수출기상도
            if(url.equals("WeeklyShopping")){menuId=7;} //KAMIS, 알뜰장보기
            if(url.equals("mainIndicators")){menuId=8;} //FIS, 국내외식품산업주요지표
            if(url.equals("farmdealTrend")){menuId=9;}  //KATI, 주요 농산물 거래 동향
            if(url.equals("InternationalRawMaterial")){menuId=10;}   //FIS, 국제원자재 가격
            if(url.equals("foreignwholesale")){menuId=11;}   //KATI, 해외도소매 가격
            if(url.equals("distributionReality")){menuId=12;}    //KAMIS, 비용별·단계별품목유통실태
            if(url.equals("EatingBusiness")){menuId=13;}    //FIS, 한국외식업경기지수
            //if(url.equals("http://foodbiz.or.kr/kfood_web/?sub_num=28&state=view&idx=122")){menuId=14;}  //e-Book 지원사업 ###
            if(url.equals("food-info")){menuId=15;}  //KATI. aT Global Food Info
            if(url.equals("flower_volume")){menuId=16;}  //화훼공판장, 경매시세

                //System.out.println("menuId==>" + menuId);

            }

        }

        Statistics statistics=new Statistics();

        statistics.setIp(ip);
        statistics.setMenuId(menuId);   //웹메인:91, 모바일메인:92, 나머지는 메뉴아이디:1~16
        statistics.setPageGbn(gbn); //메인:A,모바일메인:B,생생정보:C,원본:D

        int cnt=mainService.updateStatistics(statistics);
        //System.out.println("생생정보 cnt==>"+cnt);
        /************** 통계정보 입력  End **************/
        return cnt;
    }

    /* 통계 생생정보 등록 */
    @ResponseBody
    @RequestMapping(value = "insertFootUrlStatistics/{id}/{gbn}", method = RequestMethod.GET)
    public int insertFootUrlStatistics(Model model, @PathVariable("id") String id, @PathVariable("gbn") String gbn
            , HttpServletRequest request, HttpServletResponse response) {

        /************** 통계정보 입력 Start **************/
        String ip = request.getRemoteAddr();
        int menuId = 0;

        //System.out.println("ip==>"+ip);
        //System.out.println("id==>"+id);
        //System.out.println("gbn==>"+gbn);

        if(id!=null){
            menuId=Integer.parseInt(id);
        }
        //System.out.println("menuId==>"+menuId);

        Statistics statistics=new Statistics();

        statistics.setIp(ip);
        statistics.setMenuId(menuId);   //웹메인:91, 모바일메인:92, 나머지는 메뉴아이디:1~16
        statistics.setPageGbn(gbn); //메인:A,모바일메인:B,생생정보:C,원본:D

        int cnt=mainService.updateStatistics(statistics);
        //System.out.println("원본 cnt==>"+cnt);
        /************** 통계정보 입력  End **************/
        return cnt;
    }

    /*메인화면 리스트*/
    @RequestMapping(value = {"category/{type}"}, method = RequestMethod.GET)
    public String typeIndex(ModelMap model, @PathVariable("type") String type) {
        /*at센터 최근소식*/
        Atnews atnews = new Atnews();

        List<Atnews> atnewsList = atnewsService.selectAtnewsList(atnews);

        model.addAttribute("atnewsList", atnewsList);

        /*유통교육원 최근소식*/
        Education education = new Education();

        List<Education> educationList = educationService.selectEducationList(education);

        model.addAttribute("educationList", educationList);

        /*카타고리 노출데이터*/
        Main main = new Main();
        main.setType(type);

        //List<Main> mainList = mainService.selectMainList(main);
        List<Main> mainList = mainService.selectCategoryList(main);
        mainList.get(0).setParamType(type);

        model.addAttribute("mainList", mainList);

        return "index";
    }

    @ResponseBody
    @RequestMapping(value = "getNoticeData/{page}/{pageSize}", method = RequestMethod.GET)
    public List getNoticeData(Model model, @PathVariable("page") String page, @PathVariable("pageSize") String pageSize) {
        Notice notice = new Notice();
        notice.setNowPage(Integer.parseInt(page));
        notice.setPageSize(Integer.parseInt(pageSize));
        List<Notice> noticeList = noticeService.selectNoticePagingList(notice);

        int listCnt = noticeService.selectNoticeCount();
        noticeList.get(0).setTotalCount(listCnt);
        model.addAttribute("noticeList", noticeList);
        return noticeList;
    }

    @ResponseBody
    @RequestMapping(value = "getMainData/{seq}", method = RequestMethod.GET)
    public List getMainData(Model model, @PathVariable("seq") String seq) {

        /*메인 노출데이터*/
        Main main = new Main();
        main.setMenuId(Integer.parseInt(seq));
        List<Main> mainList = mainService.selectMainList(main);
        //List<Menu> mainOutList = menuService.selectOutMenuList();

        //LOGGER.info("getMainData seq ==>", seq);

        if( seq.equals("2") ){//KAMIS, 농산물일일도소매가격
            DailyPrice dailyPrice = dailyPriceService.selectDailyPriceTop();
            dailyPrice.setViewYn("Y");
            List<DailyPrice> dailyPriceList = dailyPriceService.selectDailyPriceList(dailyPrice);
            model.addAttribute("dailyPriceList", dailyPriceList);
            return dailyPriceList;
        }else if( seq.equals("3") ){//FIS, 일일곡물시황
            Grain grain = fisService.selectGrainMarketConditionTop();
            List<Grain> menuList = fisService.selectGrainMarketConditionList(grain);
            model.addAttribute("mainList", menuList);
            return menuList;
        }else if( seq.equals("4") ){//FIS, 주요가공식품주간가격동향
            ProcessedFood processedFood = fisService.selectProcessedFoodTop();
            List<ProcessedFood> processedFoodsList = fisService.selectProcessedFoodList(processedFood);
            model.addAttribute("processedFoodsList",processedFoodsList);
            return processedFoodsList;
        }else if( seq.equals("5") ){//KATI, 뉴스레터

            NewsLetter newsLetter=new NewsLetter();
            newsLetter.setViewYn("Y");

            List<NewsLetter> newsLetterList = exportWeatherService.selectNewsLetterList(newsLetter);

            model.addAttribute("newsLetterList", newsLetterList);
            return newsLetterList;

        }else if( seq.equals("6") ){//KATI, 농수산식품수출기상도
            ExportWeather exportWeather = new ExportWeather();
            exportWeather = exportWeatherService.selectExportWeatherTop();
            /*시작일 종료일 가져오기*/
            ExportWeather exportWeatherDate = new ExportWeather();
            exportWeather.setPkMonthDate(exportWeather.getPkYear()+exportWeather.getPkMonth());
            /*exportWeatherDate = exportWeatherService.selectExportWeatherWeekDate(exportWeather);
            exportWeather.setStartDate(exportWeatherDate.getStartDate());
            exportWeather.setEndDate(exportWeatherDate.getEndDate());*/
            exportWeather.setViewYn("Y");
            List<ExportWeather> exportWeatherList = null;
            exportWeatherList = exportWeatherService.selectExportWeatherList(exportWeather);
            /*exportWeatherList.get(0).setStartDate(exportWeatherDate.getStartDate());
            exportWeatherList.get(0).setEndDate(exportWeatherDate.getEndDate());*/
            model.addAttribute("exportWeatherList", exportWeatherList);
            return exportWeatherList;
        }else if( seq.equals("7") ){//KAMIS, 알뜰장보기
            WeeklyShopping weeklyShopping = new WeeklyShopping();
            weeklyShopping = weeklyShoppingService.selectWeeklyShoppingTop(weeklyShopping);
            //주간 물가 정보 데이터 가져오기
            List<WeeklyShopping> weeklyShoppingList = weeklyShoppingService.selectWeeklyShoppingList(weeklyShopping);
            model.addAttribute("weeklyShoppingList", weeklyShoppingList);
            return weeklyShoppingList;
        }else if( seq.equals("9") ){//KATI, 주요 농산물 거래 동향
            FarmDealTrend farmDealTrend = farmDealTrendService.selectFarmDealTrendTop();
            List<FarmDealTrend> farmDealTrendList = farmDealTrendService.selectFarmDealTrendList(farmDealTrend);
            model.addAttribute("farmDealTrendList", farmDealTrendList);
            return farmDealTrendList;
        }else if( seq.equals("10") ){//FIS, 국제원자재 가격
            InternationalRawMaterial irm = fisService.selectInternationalRawMaterialTop();
            List<InternationalRawMaterial> irmList = fisService.selectInternationalRawMaterial(irm);
            model.addAttribute("irmList", irmList);
            return irmList;
        }else if( seq.equals("16") ){//화훼공판장, 경매시세
            FlowerVolume flowerVolume = new FlowerVolume();
            List<FlowerVolume> flowerVolumeList = new ArrayList<FlowerVolume>();

            //todo:절화 데이터 가져오기
            flowerVolume.setType("N");
            flowerVolume.setAuctionDay("");
            FlowerVolume flowerVolumeNType = flowerService.selectFlowerVolumeTop(flowerVolume);
            List<FlowerVolume> flowerVolumeList1 = null;
            if( flowerVolumeNType != null ){
                flowerVolumeNType.setGroupType("FN");
                flowerVolumeList1 = flowerService.selectFlowerVolumeList(flowerVolumeNType);
                //flowerVolumeList = flowerVolumeList1;
                System.out.println("flowerVolumeList1==>"+flowerVolumeList1);
                System.out.println("flowerVolumeList1.size==>"+flowerVolumeList1.size());
                if(flowerVolumeList1!=null) {
                    System.out.println("절화[N]==> 데이터있음");
                    flowerVolumeList.add(flowerVolumeList1.get(0));
                }else{
                    System.out.println("절화[N]==> 데이터없음");
                    FlowerVolume flowerVolumeVo=new FlowerVolume();
                    flowerVolumeVo.setItemCode("F31");
                    flowerVolumeVo.setItemName("-");
                    flowerVolumeVo.setAvgPrice("0");

                    flowerVolumeList.add(flowerVolumeVo);
                }

            }
            //todo:난 데이터 가져오기
            flowerVolume.setType("Y");
            flowerVolume.setAuctionDay("");
            FlowerVolume flowerVolumeYType = flowerService.selectFlowerVolumeTop(flowerVolume);
            List<FlowerVolume> flowerVolumeList2 = null;
            if( flowerVolumeYType != null ){
                flowerVolumeYType.setGroupType("FY");
                flowerVolumeList2 = flowerService.selectFlowerVolumeList(flowerVolumeYType);
                System.out.println("flowerVolumeList2==>"+flowerVolumeList2);
                System.out.println("flowerVolumeList2.size==>"+flowerVolumeList2.size());
                if(flowerVolumeList2!=null) {
                    System.out.println("난[Y]==> 데이터있음");
                    //flowerVolumeList.set(1, flowerVolumeList2.get(0));
                    flowerVolumeList.add(flowerVolumeList2.get(0));
                }else{
                    System.out.println("난[Y]==> 데이터없음");
                    FlowerVolume flowerVolumeVo=new FlowerVolume();
                    flowerVolumeVo.setItemCode("F32");
                    flowerVolumeVo.setItemName("-");
                    flowerVolumeVo.setAvgPrice("0");

                    flowerVolumeList.add(flowerVolumeVo);
                }
            }

            //todo:난 최근경매일 기준 리스트 가져오기
            flowerVolume.setType("C");
            flowerVolume.setAuctionDay("");
            FlowerVolume flowerVolumeCType = flowerService.selectFlowerVolumeTop(flowerVolume);
            List<FlowerVolume> flowerVolumeList3 = null;
            if( flowerVolumeCType!= null ){
                flowerVolumeCType.setGroupType("FC");
                flowerVolumeList3 = flowerService.selectFlowerVolumeList(flowerVolumeCType);

                System.out.println("flowerVolumeList3==>"+flowerVolumeList3);
                System.out.println("flowerVolumeList3.size==>"+flowerVolumeList3.size());

                if(flowerVolumeList3!=null) {
                    System.out.println("관엽[C]==> 데이터있음");
                    //flowerVolumeList.set(2,flowerVolumeList3.get(0));
                    flowerVolumeList.add(flowerVolumeList3.get(0));
                }else{
                    System.out.println("관엽[C]==> 데이터없음");
                    FlowerVolume flowerVolumeVo=new FlowerVolume();
                    flowerVolumeVo.setItemCode("F33");
                    flowerVolumeVo.setItemName("-");
                    flowerVolumeVo.setAvgPrice("0");

                    flowerVolumeList.add(flowerVolumeVo);
                }
            }

            for (int i = 0; i < flowerVolumeList.size(); i++) {
                System.out.println(i + "==>" + flowerVolumeList.get(i).getItemName());
            }

            model.addAttribute("flowerVolumeList", flowerVolumeList);
            return flowerVolumeList;

        }else{
            model.addAttribute("mainList", mainList);
            return mainList;
        }
        //return null;
    }

    @RequestMapping(value = {"mobile/", "mobile/index", "mobile"}, method = RequestMethod.GET)
    public String mobileIndex(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
        Main main = new Main();
        List<Main> mainList = mainService.selectMainList(main);

        model.addAttribute("mainList", mainList);

        /************** 통계정보 입력 Start **************/
        String ip = request.getRemoteAddr();

        Statistics statistics=new Statistics();

        statistics.setIp(ip);
        statistics.setMenuId(91);   //웹메인:90, 모바일메인:91, 나머지는 메뉴아이디:1~16
        statistics.setPageGbn("B"); //메인:A,모바일메인:B,생생정보:C,원본:D

        int cnt=mainService.updateStatistics(statistics);

        /************** 통계정보 입력  End **************/

        return "/front/mobile/index";
    }

    @RequestMapping(value = {"mobile/goPC"}, method = RequestMethod.GET)
    public String mobilePcIndex(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws SerialException, IOException{
        HttpSession session1 = request.getSession(true);
        session1.setAttribute("goPC","Y");
        session1.setMaxInactiveInterval(-1);

//        /*at센터 최근소식*/
//        Atnews atnews = new Atnews();
//
//        List<Atnews> atnewsList = atnewsService.selectAtnewsList(atnews);
//
//        model.addAttribute("atnewsList", atnewsList);
//
//            /*유통교육원 최근소식*/
//        Education education = new Education();
//
//        List<Education> educationList = educationService.selectEducationList(education);
//
//        model.addAttribute("educationList", educationList);
//
//            /*메인 노출데이터*/
//        Main main = new Main();
//        List<Main> mainList = mainService.selectMainList(main);
//        //List<Menu> mainOutList = menuService.selectOutMenuList();
//
//        model.addAttribute("mainList", mainList);
//        model.addAttribute("mainListSize", mainList.size());
//        //model.addAttribute("menuList", mainOutList);

        /************** 통계정보 입력 Start **************/
        String ip = request.getRemoteAddr();

        Statistics statistics=new Statistics();

        statistics.setIp(ip);
        statistics.setMenuId(90);   //웹메인:91, 모바일메인:92, 나머지는 메뉴아이디:1~16
        statistics.setPageGbn("A"); //메인:A,모바일메인:B,생생정보:C,원본:D

        int cnt=mainService.updateStatistics(statistics);
        //System.out.println("웹메인 cnt==>"+cnt);
        /************** 통계정보 입력  End **************/

        return "redirect:/index";
        //return "index";
    }

    @RequestMapping(value = "mobile/{type}", method = RequestMethod.GET)
    public String mobileTypeIndex(ModelMap model, @PathVariable("type") String type) {
        Main main = new Main();
        main.setType(type);
        //List<Main> mainList = mainService.selectMainList(main);
        //카타고리 가져오기
        List<Main> mainList = mainService.selectCategoryList(main);
        mainList.get(0).setParamType(type);

        model.addAttribute("mainList", mainList);
        return "/front/mobile/index";
    }

}