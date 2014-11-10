package com.info.web.atnews.controller;

import com.info.framework.crypto.SimpleCrypto;
import com.info.framework.security.LoginAuthorityType;
import com.info.framework.security.UserAuthenticationSuccessHandler;
import com.info.web.atnews.service.AtnewsService;
import com.info.web.domain.Atnews;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
 * 작성자 : 이소정
 * 작성일 : 2014.07.10
 * -------------------
 * 수정자 :
 * 수정일 :
 * -------------------
 */
@Controller
@RequestMapping(value = "/atnews")
public class AtnewsController {

    private static final Logger LOGGER = LoggerFactory.getLogger(AtnewsController.class);

    @Autowired
    private AtnewsService atnewsService;

    /**
     * 인덱스 페이지
     *
     * @return
     */

    @RequestMapping(value = {"/index","/"}, method = RequestMethod.GET)
    public String list(Model model) {
        LOGGER.debug("AT소식 리스트 페이지");

        Atnews atnews = new Atnews();

        List<Atnews> atnewsList = atnewsService.selectAtnewsList(atnews);

        LOGGER.info("List Size : {}", atnewsList.size());
        model.addAttribute("atnewsList", atnewsList);

        return "atnews/index";
    }
}
