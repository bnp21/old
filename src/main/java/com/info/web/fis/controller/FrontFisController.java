package com.info.web.fis.controller;

import com.info.web.common.service.MenuService;
import com.info.web.domain.*;
import com.info.web.eatingbusiness.service.EatingBusinessService;
import com.info.web.fis.service.FisService;
import com.info.web.Mainindicators.service.MainIndicatorsService;
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
public class FrontFisController {

    private static final Logger LOGGER = LoggerFactory.getLogger(FrontFisController.class);

    @Autowired
    private FisService fisService;

    @Autowired
    private EatingBusinessService eatingBusinessService;

    @Autowired
    private MainIndicatorsService mainIndicatorsService;

    @Autowired
    private MenuService menuService;

    /**
     * 주요 원자재 주간가격동향 페이지
     *
     * @return "fis/InternationalRawMaterial"
     */
    @RequestMapping(value =  {"/InternationalRawMaterial/","/InternationalRawMaterial/index"}, method = RequestMethod.GET)
    public String InternationalRawMaterialIndex(Model model) {

        InternationalRawMaterial irm = fisService.selectInternationalRawMaterialTop();

        List<InternationalRawMaterial> irmList = fisService.selectInternationalRawMaterial(irm);
        irm.setReferenceDateFrom(irm.getReferenceDateFrom().substring(0,4)+"."+irm.getReferenceDateFrom().substring(4,6)+"."+irm.getReferenceDateFrom().substring(6,8));
        irm.setReferenceDateTo(irm.getReferenceDateTo().substring(0,4)+"."+irm.getReferenceDateTo().substring(4,6)+"."+irm.getReferenceDateTo().substring(6,8));
        model.addAttribute("irmList", irmList);
        model.addAttribute("irm", irm);
        Menu menu = new Menu();
        menu.setId(10);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);
        return "front/fis/InternationalRawMaterial/index";
    }

    /**
     * 일일 곡물시황 페이지
     *
     * @return "fis/grain-marketCondition"
     */
    @RequestMapping(value =  {"/grain-marketCondition/","/grain-marketCondition/index"}, method = RequestMethod.GET)
    public String GrainIndex(Model model) {

        Grain grain = fisService.selectGrainMarketConditionTop();

        List<Grain> grainList = fisService.selectGrainMarketConditionList(grain);
        Grain grainCommendView = fisService.selectGrainCommendView(grain);

        grain.setReferenceDate(grain.getReferenceDate().substring(0,4)+"-"+grain.getReferenceDate().substring(4,6)+"-"+grain.getReferenceDate().substring(6,8));
        model.addAttribute("grainList", grainList);
        model.addAttribute("grain", grain);
        model.addAttribute("grainCommendView", grainCommendView);

        Menu menu = new Menu();
        menu.setId(3);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "front/fis/grain-marketCondition/index";
    }

    /*주요 가공식품 주간 가격동향*/
    @RequestMapping(value =  {"/ProcessedFood/","/ProcessedFood/index"}, method = RequestMethod.GET)
    public String ProcessedFoodIndex(Model model) {

        ProcessedFood processedFood = fisService.selectProcessedFoodTop();

        List<ProcessedFood> processedFoodsList = fisService.selectProcessedFoodList(processedFood);

        processedFood.setReferenceDateFrom(processedFood.getReferenceDateFrom().substring(0,4)+"."+processedFood.getReferenceDateFrom().substring(4,6)+"."+processedFood.getReferenceDateFrom().substring(6,8));
        processedFood.setReferenceDateTo(processedFood.getReferenceDateTo().substring(0,4)+"."+processedFood.getReferenceDateTo().substring(4,6)+"."+processedFood.getReferenceDateTo().substring(6,8));

        model.addAttribute("processedFoodsList",processedFoodsList);
        model.addAttribute("processedFood",processedFood);

        Menu menu = new Menu();
        menu.setId(4);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "front/fis/ProcessedFood/index";
    }

    /*한국외식업경기지수*/
    @RequestMapping(value =  {"/EatingBusiness/","/EatingBusiness/index"}, method = RequestMethod.GET)
    public String EatingBusinessIndex(Model model) {

        EatingBusiness eatingBusiness = new EatingBusiness();
        eatingBusiness = eatingBusinessService.selectEatingBusinessTop();

        eatingBusiness.setGroupType("1");
        List<EatingBusiness> eatingBusinessList1 = eatingBusinessService.selectEatingBusinessList(eatingBusiness);
        eatingBusiness.setGroupType("2");
        List<EatingBusiness> eatingBusinessList2 = eatingBusinessService.selectEatingBusinessList(eatingBusiness);
        eatingBusiness.setGroupType("3");
        List<EatingBusiness> eatingBusinessList3 = eatingBusinessService.selectEatingBusinessList(eatingBusiness);
        List<EatingBusiness> eatingBusinessCommentList = eatingBusinessService.selectEatingBusinessComment(eatingBusiness);

        model.addAttribute("eatingBusinessList1", eatingBusinessList1);
        model.addAttribute("eatingBusinessList2", eatingBusinessList2);
        model.addAttribute("eatingBusinessList3", eatingBusinessList3);
        model.addAttribute("eatingBusinessCommentList", eatingBusinessCommentList);
        Menu menu = new Menu();
        menu.setId(13);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);
        return "front/fis/eating_business/index";
    }

    /**
     * 국내외 식품산업 주요지표
     *
     * @return "fis/mainIndicators"
     */
    @RequestMapping(value =  {"/mainIndicators/","/mainIndicators/index"}, method = RequestMethod.GET)
    public String mainIndicatorsIndex(Model model) {
        Menu menu = new Menu();
        menu.setId(8);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        MainIndicators mainIndicators = new MainIndicators();
        mainIndicators = mainIndicatorsService.selectMainIndicatorsTop();
        List<MainIndicators> mainIndicatorsList = mainIndicatorsService.selectMainIndicatorsList(mainIndicators);

        model.addAttribute("mainIndicatorsList", mainIndicatorsList);

        return "front/fis/main_indicators/index";
    }
}
