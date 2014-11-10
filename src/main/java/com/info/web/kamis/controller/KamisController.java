package com.info.web.kamis.controller;

import com.info.web.account.service.AccountService;
import com.info.web.common.service.MenuService;
import com.info.web.dailyprice.service.DailyPriceService;
import com.info.web.distributionreality.service.DistributionRealityService;
import com.info.web.domain.*;
import com.info.web.weeklyshopping.service.WeeklyShoppingService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
@RequestMapping(value = "/")
public class KamisController {

    private static final Logger LOGGER = LoggerFactory.getLogger(KamisController.class);

    @Autowired
    private WeeklyShoppingService weeklyShoppingService;

    @Autowired
    private DistributionRealityService distributionRealityService;

    @Autowired
    private DailyPriceService dailyPriceService;

    @Autowired
    private MenuService menuService;

    /**
     * 농산물일일도소매가격 관리 페이지
     *
     * @return "kamis/daily_price/index"
     */
    @RequestMapping(value =  {"/dailyPrice/","/dailyPrice/index"}, method = RequestMethod.GET)
    public String wholesalePriceIndex(Model model) {

        DailyPrice dailyPrice = dailyPriceService.selectDailyPriceTop();

        dailyPrice.setViewYn("Y");
        List<DailyPrice> dailyPriceList = dailyPriceService.selectDailyPriceList(dailyPrice);

        model.addAttribute("dailyPriceList", dailyPriceList);

        Menu menu = new Menu();
        menu.setId(2);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "front/kamis/daily_price/index";
    }

    /**
     * 주요 농산물 유통실태 관리 페이지
     *
     * @return "kamis/distributionReality/price/index"
     */
    @RequestMapping(value =  {"/distributionReality/","/distributionReality/index"}, method = RequestMethod.GET)
    public String distributionRealityIndex(Model model) {
       //주간 물가 정보 데이터 가져오기
        List<DistributionReality> distributionRealityList = distributionRealityService.selectDistributionRealityFrontList();

        DistributionReality distributionReality = distributionRealityList.get(0);
        distributionReality.setMainSeq(distributionReality.getSeq());
        distributionReality.setSeq(0);
        List<DistributionReality> distributionRealityItem = distributionRealityService.selectDistributionRealityItemList(distributionReality);

        model.addAttribute("distributionRealityList", distributionRealityList);
        model.addAttribute("distributionRealityItem", distributionRealityItem);

        Menu menu = new Menu();
        menu.setId(12);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "front/kamis/distribution_reality/index";
    }

    /**
     * 알뜰장보기
     *
     * @return "kamis/WeeklyShopping/index"
     */
    @RequestMapping(value =  {"/WeeklyShopping/","/WeeklyShopping/index"}, method = RequestMethod.GET)
    public String weekShoppingIndex(Model model) {
        WeeklyShopping weeklyShopping = new WeeklyShopping();

        weeklyShopping = weeklyShoppingService.selectWeeklyShoppingTop(weeklyShopping);
        //주간 물가 정보 데이터 가져오기
        List<WeeklyShopping> weeklyShoppingList = weeklyShoppingService.selectWeeklyShoppingList(weeklyShopping);
        model.addAttribute("weeklyShoppingList", weeklyShoppingList);

        Menu menu = new Menu();
        menu.setId(7);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "front/kamis/weekly_shopping/index";
    }
}
