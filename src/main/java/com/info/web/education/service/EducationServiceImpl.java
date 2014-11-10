package com.info.web.education.service;

import com.info.web.domain.Education;
import com.info.web.education.dao.EducationDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * <pre>
 * 유통교육원 구현체.
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.11
 */
@Service("educationService")
public class EducationServiceImpl implements EducationService {
    private static Logger LOGGER = LoggerFactory.getLogger(EducationServiceImpl.class);

    @Autowired
    private EducationDao educationDao;


    public List<Education> selectEducationList(Education education) {
        return educationDao.selectEducationList(education);
    }
}
