package com.info.web.atnews.dao;

import com.info.web.domain.Atnews;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <pre>
 * AT소식 구현체.
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.10
 */
@Repository("atnewsDao")
public class AtnewsDaoImpl implements AtnewsDao {
    private static final Logger logger = LoggerFactory.getLogger(AtnewsDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;



    public List<Atnews> selectAtnewsList(Atnews atnews) {
        return sqlSessionTemplate.selectList("Atnews.selectAtnewsList", atnews);
    }
}