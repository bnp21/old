package com.info.web.admin.controller;

import com.info.framework.security.AuthenticationUtils;
import com.info.web.domain.Account;
import com.info.web.domain.FileInfo;
import com.info.web.domain.Item;
import com.info.web.domain.Notice;
import com.info.web.item.service.ItemService;
import com.info.web.notice.service.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
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
public class ItemController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ItemController.class);

    @Autowired
    private ItemService itemService;

    /**
     * 인덱스 페이지
     *
     * @return
     */
    @RequestMapping(value = {"/item/index","/item"}, method = RequestMethod.GET)
    public String list(Model model, @ModelAttribute("item") Item paramItem,RedirectAttributes redirectAttributes) {

        /************** 비로그인시 로그인화면으로 이동 Start **************/
        Account user = AuthenticationUtils.getUser();
        String msg ="";
        if(user == null){
            msg=("권한이 없습니다. 로그인을 먼저 하세요.");
            redirectAttributes.addFlashAttribute("msg", msg);
            return "redirect:/account/login";
        }
        /************** 비로그인시 로그인화면으로 이동 End **************/

        List<Item> item_list = itemService.selectItemList(paramItem);
        model.addAttribute("item_list", item_list);
        return "admin/item/index";
    }

    @RequestMapping(value = "/item/getItemList", method = RequestMethod.GET)
    @ResponseBody
    public List getNoticeArea() {

        Item paramItem = new Item();
        List<Item> item_list = itemService.selectItemList(paramItem);
        return item_list;
    }

}
