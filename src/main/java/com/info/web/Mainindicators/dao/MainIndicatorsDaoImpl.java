package com.info.web.Mainindicators.dao;

import com.info.web.domain.FarmDealTrend;
import com.info.web.domain.MainIndicators;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <pre>
 * 계정 DAO 구현체.
 * </pre>
 *
 * @author 임세환
 * @version 1.0, 2013.12.11
 */
@Repository("mainIndicatorsDao")
public class MainIndicatorsDaoImpl implements MainIndicatorsDao {
    private static final Logger logger = LoggerFactory.getLogger(MainIndicatorsDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public List<MainIndicators> selectMainIndicatorsList(MainIndicators mainIndicators) {
        return sqlSessionTemplate.selectList("MainIndicators.selectMainIndicatorsList", mainIndicators);
    }


    public MainIndicators selectMainIndicatorsTop() {
        return sqlSessionTemplate.selectOne("MainIndicators.selectMainIndicatorsTop");
    }


    public int insertMainIndicators(MainIndicators mainIndicators) {
        return sqlSessionTemplate.insert("MainIndicators.insertMainIndicators", mainIndicators);
    }


    public int updateMainIndicators(MainIndicators mainIndicators) {
        return sqlSessionTemplate.update("MainIndicators.updateMainIndicators", mainIndicators);
    }


    public int deleteMainIndicators(MainIndicators mainIndicators) {
        return sqlSessionTemplate.update("MainIndicators.deleteMainIndicators", mainIndicators);
    }
}