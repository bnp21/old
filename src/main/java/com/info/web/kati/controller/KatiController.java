package com.info.web.kati.controller;

import com.info.web.common.service.MenuService;
import com.info.web.domain.*;
import com.info.web.exportweather.service.ExportWeatherService;
import com.info.web.farmdealtrend.service.FarmDealTrendService;
import com.info.web.foodinfo.service.FoodInfoService;
import com.info.web.foreignwholesale.service.ForeignWholesaleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
@RequestMapping(value = "")
public class KatiController {

    private static final Logger LOGGER = LoggerFactory.getLogger(KatiController.class);

    @Autowired
    private FarmDealTrendService farmDealTrendService;

    @Autowired
    private ForeignWholesaleService foreignWholesaleService;

    @Autowired
    private ExportWeatherService exportWeatherService;

    @Autowired
    private FoodInfoService foodInfoService;

    @Autowired
    private MenuService menuService;

    /**
     * Newsletter 페이지
     *
     * @return "front/kati/newsletter/index"
     */
    @RequestMapping(value =  {"/newsletter/","/newsletter/index"}, method = RequestMethod.GET)
    public String wholesalePriceIndex(Model model) {
        return "front/kati/newsletter/index";
    }

    /**
     * 농수산식품 수출 기상도 페이지
     *
     * @return "front/kati/exportweather/index"
     */
    @RequestMapping(value =  {"/exportweather/","/exportweather/index"}, method = RequestMethod.GET)
    public String exportWeatherIndex(Model model) {

        ExportWeather exportWeather = new ExportWeather();
        exportWeather = exportWeatherService.selectExportWeatherTop();
        /*시작일 종료일 가져오기*/
        /*ExportWeather exportWeatherDate = new ExportWeather();
        exportWeather.setPkMonthDate(exportWeather.getPkYear()+exportWeather.getPkMonth());
        exportWeatherDate = exportWeatherService.selectExportWeatherWeekDate(exportWeather);
        exportWeather.setStartDate(exportWeatherDate.getStartDate());
        exportWeather.setEndDate(exportWeatherDate.getEndDate());*/
        exportWeather.setViewYn("Y");
        List<ExportWeather> exportWeatherList = null;
        List<ExportWeather> exportWeatherItemList1Up = null;
        List<ExportWeather> exportWeatherItemList1Down = null;
        List<ExportWeather> exportWeatherItemList2Up = null;
        List<ExportWeather> exportWeatherItemList2Down = null;
        List<ExportWeather> exportWeatherItemList3Up = null;
        List<ExportWeather> exportWeatherItemList3Down = null;
        List<ExportWeather> exportWeatherMonthList = null;
        List<ExportWeather> exportWeatherNation = null;
        exportWeatherList = exportWeatherService.selectExportWeatherList(exportWeather);
        if( exportWeatherList != null && exportWeatherList.size() > 0 ) {
            exportWeather.setStartdate(exportWeatherList.get(0).getStartdate());
            exportWeather.setEnddate(exportWeatherList.get(0).getEnddate());
            exportWeatherList.get(1).setItemGroup("1");
            exportWeatherList.get(2).setItemGroup("2");
            exportWeatherList.get(3).setItemGroup("3");
            exportWeatherItemList1Up = exportWeatherService.selectExportWeatherItemUpList(exportWeatherList.get(1));
            exportWeatherItemList1Down = exportWeatherService.selectExportWeatherItemDownList(exportWeatherList.get(1));
            exportWeatherItemList2Up = exportWeatherService.selectExportWeatherItemUpList(exportWeatherList.get(2));
            exportWeatherItemList2Down = exportWeatherService.selectExportWeatherItemDownList(exportWeatherList.get(2));
            exportWeatherItemList3Up = exportWeatherService.selectExportWeatherItemUpList(exportWeatherList.get(3));
            exportWeatherItemList3Down = exportWeatherService.selectExportWeatherItemDownList(exportWeatherList.get(3));
            exportWeatherMonthList = exportWeatherService.selectExportWeatherMonthList(exportWeather);
            exportWeatherNation = exportWeatherService.selectExportWeatherNationList(exportWeather);
        }

        /*model.addAttribute("exportWeatherDate", exportWeatherDate);*/
        model.addAttribute("exportWeatherList", exportWeatherList);
        model.addAttribute("exportWeatherItemList1Up", exportWeatherItemList1Up);
        model.addAttribute("exportWeatherItemList1Down", exportWeatherItemList1Down);
        model.addAttribute("exportWeatherItemList2Up", exportWeatherItemList2Up);
        model.addAttribute("exportWeatherItemList2Down", exportWeatherItemList2Down);
        model.addAttribute("exportWeatherItemList3Up", exportWeatherItemList3Up);
        model.addAttribute("exportWeatherItemList3Down", exportWeatherItemList3Down);
        model.addAttribute("exportWeatherMonthList", exportWeatherMonthList);
        model.addAttribute("exportWeatherNation", exportWeatherNation);

        Menu menu = new Menu();
        menu.setId(6);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "front/kati/exportweather/index";
    }

    /**
     * 해외 농산물 도매 가격 페이지
     *
     * @return "front/kati/foreignwholesale/index"
     */
    @RequestMapping(value =  {"/foreignwholesale/","/foreignwholesale/index"}, method = RequestMethod.GET)
    public String foreignWholesaleIndex(Model model) {

        ForeignWholesale foreignWholesale = new ForeignWholesale();
        foreignWholesale.setCountryCode("US");
        ForeignWholesale UsForeignWholesale = foreignWholesaleService.selectForeignWholesaleTop(foreignWholesale);
        UsForeignWholesale.setGroupCode("I1");
        List<ForeignWholesale> foreignWholesaleUSList = foreignWholesaleService.selectForeignWholesaleList(UsForeignWholesale);
        foreignWholesale.setCountryCode("JP");
        ForeignWholesale JpForeignWholesale = foreignWholesaleService.selectForeignWholesaleTop(foreignWholesale);
        JpForeignWholesale.setGroupCode("I2");
        List<ForeignWholesale> foreignWholesaleJPList = foreignWholesaleService.selectForeignWholesaleList(JpForeignWholesale);

        model.addAttribute("foreignWholesaleUSList", foreignWholesaleUSList);
        model.addAttribute("foreignWholesaleJPList", foreignWholesaleJPList);

        Menu menu = new Menu();
        menu.setId(11);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "front/kati/foreign_wholesale/index";
    }

    /**
     * 주요 농산물 일일 거래동향
     *
     * @return "front/kati/farmdealTrend/index"
     */
    @RequestMapping(value =  {"/farmdealTrend/","/farmdealTrend/index"}, method = RequestMethod.GET)
    public String farmdealTrendIndex(Model model) {

        FarmDealTrend farmDealTrend = farmDealTrendService.selectFarmDealTrendTop();

        List<FarmDealTrend> farmDealTrendList = farmDealTrendService.selectFarmDealTrendList(farmDealTrend);

        farmDealTrendList.get(0).setAvgPrice( Integer.toString(farmDealTrendService.selectFarmDealTrendMaxPrice(farmDealTrendList.get(0))) );
        farmDealTrendList.get(1).setAvgPrice( Integer.toString(farmDealTrendService.selectFarmDealTrendMaxPrice(farmDealTrendList.get(1))) );
        farmDealTrendList.get(2).setAvgPrice( Integer.toString(farmDealTrendService.selectFarmDealTrendMaxPrice(farmDealTrendList.get(2))) );
        farmDealTrendList.get(3).setAvgPrice( Integer.toString(farmDealTrendService.selectFarmDealTrendMaxPrice(farmDealTrendList.get(3))) );
        farmDealTrendList.get(4).setAvgPrice( Integer.toString(farmDealTrendService.selectFarmDealTrendMaxPrice(farmDealTrendList.get(4))) );

        List<FarmDealTrend> farmDealTrendItemList1 = farmDealTrendService.selectFarmDealTrendTermList(farmDealTrendList.get(0));
        List<FarmDealTrend> farmDealTrendItemList2 = farmDealTrendService.selectFarmDealTrendTermList(farmDealTrendList.get(1));
        List<FarmDealTrend> farmDealTrendItemList3 = farmDealTrendService.selectFarmDealTrendTermList(farmDealTrendList.get(2));
        List<FarmDealTrend> farmDealTrendItemList4 = farmDealTrendService.selectFarmDealTrendTermList(farmDealTrendList.get(3));
        List<FarmDealTrend> farmDealTrendItemList5 = farmDealTrendService.selectFarmDealTrendTermList(farmDealTrendList.get(4));


        model.addAttribute("farmDealTrendList", farmDealTrendList);
        model.addAttribute("farmDealTrendItemList1", farmDealTrendItemList1);
        model.addAttribute("farmDealTrendItemList2", farmDealTrendItemList2);
        model.addAttribute("farmDealTrendItemList3", farmDealTrendItemList3);
        model.addAttribute("farmDealTrendItemList4", farmDealTrendItemList4);
        model.addAttribute("farmDealTrendItemList5", farmDealTrendItemList5);
        Menu menu = new Menu();
        menu.setId(9);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);
        return "front/kati/farm_dealTrend/index";
    }

    /**
     * Global Food Info
     *
     * @return "katis/food_info/index"
     */
    @RequestMapping(value =  {"/food-info/","/food-info/index"}, method = RequestMethod.GET)
    public String foodInfoIndex(Model model){

        Menu menu = new Menu();
        menu.setId(15);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        FoodInfo foodInfo = foodInfoService.selectFoodInfoTop();
        model.addAttribute("foodInfo", foodInfo);
        return "front/kati/food_info/index";
    }

}
