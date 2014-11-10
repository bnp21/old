package com.info.web.common.conroller;

import com.info.framework.security.AuthenticationUtils;
import com.info.web.account.service.AccountService;
import com.info.web.common.service.MenuService;
import com.info.web.domain.Account;
import com.info.web.domain.FarmDealTrend;
import com.info.web.domain.Main;
import com.info.web.domain.Menu;
import com.info.web.farmdealtrend.service.FarmDealTrendService;
import com.info.web.main.service.MainService;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
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
@RequestMapping(value = "/log")
public class LogController {

    private static final Logger LOGGER = LoggerFactory.getLogger(LogController.class);


    @RequestMapping(value = "/link/{address}", method = RequestMethod.GET)
    public String insertLog(Model model, @PathVariable("address") String address) {

        address = "http://www.naver.com";
        LOGGER.debug("address " + address);
        model.addAttribute("address", address);
        return "/front/address";
    }

}
