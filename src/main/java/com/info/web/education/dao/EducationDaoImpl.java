package com.info.web.education.dao;

import com.info.web.domain.Education;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <pre>
 * 유통교육원 구현체.
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.10
 */
@Repository("educationDao")
public class EducationDaoImpl implements EducationDao {
    private static final Logger logger = LoggerFactory.getLogger(EducationDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;



    public List<Education> selectEducationList(Education education) {
        return sqlSessionTemplate.selectList("Education.selectEducationList", education);
    }
}