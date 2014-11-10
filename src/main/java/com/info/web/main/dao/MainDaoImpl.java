package com.info.web.main.dao;

import com.info.web.domain.Main;
import com.info.web.domain.Statistics;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <pre>
 * 메인 인터페이스
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.04
 */
@Repository("mainDao")
public class MainDaoImpl implements MainDao {
    private static final Logger logger = LoggerFactory.getLogger(MainDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;



    public List<Main> selectMainList(Main main) {
        return sqlSessionTemplate.selectList("Main.selectMainList",main);
    }

    public List<Main> selectCategoryList(Main main) {
        return sqlSessionTemplate.selectList("Main.selectCategoryList",main);
    }

    public int updateMain(Main main) {
        return sqlSessionTemplate.update("Main.updateMain", main);
    }

    public List<Statistics> selectStatisticsList(Statistics statistics) {
        return sqlSessionTemplate.selectList("Main.selectStatisticsList",statistics);
    }

    public int updateStatistics(Statistics statistics) {
        return sqlSessionTemplate.update("Main.updateStatistics", statistics);
    }

}