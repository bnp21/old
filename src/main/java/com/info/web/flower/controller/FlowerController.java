package com.info.web.flower.controller;

import com.info.web.common.service.MenuService;
import com.info.web.domain.FlowerVolume;
import com.info.web.domain.Menu;
import com.info.web.flower.service.FlowerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
@RequestMapping(value = "/flower_volume")
public class FlowerController {

    private static final Logger LOGGER = LoggerFactory.getLogger(FlowerController.class);

    @Autowired
    private FlowerService flowerService;

    @Autowired
    private MenuService menuService;
    /**
     * 주요 원자재 주간가격동향 페이지
     *
     * @return "fis/InternationalRawMaterial"
     */
    @RequestMapping(value =  {"/index", "/", ""}, method = RequestMethod.GET)
    public String FlowerIndex(Model model) throws ParseException {
        FlowerVolume flowerVolume = new FlowerVolume();

        //todo:절화 데이터 가져오기
        flowerVolume.setType("N");
        flowerVolume.setAuctionDay("");
        FlowerVolume flowerVolumeNType = flowerService.selectFlowerVolumeTop(flowerVolume);
        List<FlowerVolume> flowerVolumeList1 = null;
        if( flowerVolumeNType != null ){
            flowerVolumeNType.setGroupType("FN");
            flowerVolumeList1 = flowerService.selectFlowerVolumeList(flowerVolumeNType);
        }

        //todo:난 데이터 가져오기
        flowerVolume.setType("Y");
        flowerVolume.setAuctionDay("");
        FlowerVolume flowerVolumeYType = flowerService.selectFlowerVolumeTop(flowerVolume);
        List<FlowerVolume> flowerVolumeList2 = null;

        if( flowerVolumeYType != null ){
            flowerVolumeYType.setGroupType("FY");
            flowerVolumeList2 = flowerService.selectFlowerVolumeList(flowerVolumeYType);
        }

        //todo:관엽 최근경매일 기준 리스트 가져오기
        flowerVolume.setType("C");
        flowerVolume.setAuctionDay("");
        FlowerVolume flowerVolumeCType = flowerService.selectFlowerVolumeTop(flowerVolume);
        List<FlowerVolume> flowerVolumeList3 = null;
        if( flowerVolumeCType!= null ){
            flowerVolumeCType.setGroupType("FC");
            flowerVolumeList3 = flowerService.selectFlowerVolumeList(flowerVolumeCType);
        }

        model.addAttribute("flowerVolumeList1", flowerVolumeList1);
        model.addAttribute("flowerVolumeList2", flowerVolumeList2);
        model.addAttribute("flowerVolumeList3", flowerVolumeList3);

        Menu menu = new Menu();
        menu.setId(16);
        List<Menu> menuList = menuService.selectMenuList(menu);
        model.addAttribute("menuList", menuList);

        return "front/flower_volume/index";
    }


}
