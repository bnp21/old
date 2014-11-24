package com.info.web.education.controller;

import com.info.web.domain.Education;
import com.info.web.education.service.EducationService;
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
 * 작성자 : 이소정
 * 작성일 : 2014.07.10
 * -------------------
 * 수정자 :
 * 수정일 :
 * -------------------
 */
@Controller
@RequestMapping(value = "/education")
public class EducationController {

    private static final Logger LOGGER = LoggerFactory.getLogger(EducationController.class);

    @Autowired
    private EducationService educationService;

    /**
     * 인덱스 페이지
     *
     * @return
     */

    @RequestMapping(value = {"/index","/"}, method = RequestMethod.GET)
    public String list(Model model) {
        //LOGGER.debug("유통교육원 리스트 페이지");

        Education education = new Education();

        List<Education> educationList = educationService.selectEducationList(education);

        //LOGGER.info("List Size : {}", educationList.size());
        model.addAttribute("educationList", educationList);

        return "education/index";
    }
}
