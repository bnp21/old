package com.info.web.farmdealtrend.dao;

import com.info.web.domain.FarmDealTrend;
import com.info.web.domain.Grain;
import com.info.web.domain.InternationalRawMaterial;
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
@Repository("farmDealTrendDao")
public class FarmDealTrendDaoImpl implements FarmDealTrendDao {
    private static final Logger logger = LoggerFactory.getLogger(FarmDealTrendDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public List<FarmDealTrend> selectFarmDealTrendList(FarmDealTrend farmDealTrend) {
        return sqlSessionTemplate.selectList("FarmDealTrend.selectFarmDealTrendList", farmDealTrend);
    }


    public FarmDealTrend selectFarmDealTrendTop() {
        return sqlSessionTemplate.selectOne("FarmDealTrend.selectFarmDealTrendTop");
    }


    public List<FarmDealTrend> selectFarmDealTrendTermList(FarmDealTrend farmDealTrend) {
        return sqlSessionTemplate.selectList("FarmDealTrend.selectFarmDealTrendTermList", farmDealTrend);
    }


    public int selectFarmDealTrendMaxPrice(FarmDealTrend farmDealTrend) {
        return sqlSessionTemplate.selectOne("FarmDealTrend.selectFarmDealTrendMaxPrice", farmDealTrend);
    }


    public int checkFarmDealTrend(FarmDealTrend farmDealTrend) {
        return sqlSessionTemplate.selectOne("FarmDealTrend.checkFarmDealTrend", farmDealTrend);
    }


    public int insertFarmDealTrend(FarmDealTrend farmDealTrend) {
        return sqlSessionTemplate.insert("FarmDealTrend.insertFarmDealTrend", farmDealTrend);
    }


    public int updateFarmDealTrend(FarmDealTrend farmDealTrend) {
        return sqlSessionTemplate.update("FarmDealTrend.updateFarmDealTrend", farmDealTrend);
    }
}