package com.info.web.dailyprice.dao;

import com.info.web.domain.DailyPrice;
import com.info.web.domain.FarmDealTrend;
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
@Repository("dailyPriceDao")
public class DailyPriceDaoImpl implements DailyPriceDao {
    private static final Logger logger = LoggerFactory.getLogger(DailyPriceDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public List<DailyPrice> selectDailyPriceList(DailyPrice dailyPrice) {
        return sqlSessionTemplate.selectList("DailyPrice.selectDailyPriceList", dailyPrice);
    }

    public DailyPrice selectDailyPriceTop() {
        return sqlSessionTemplate.selectOne("DailyPrice.selectDailyPriceTop");
    }


    public List<DailyPrice> selectDailyPriceDayList(DailyPrice dailyPrice) {
        return sqlSessionTemplate.selectList("DailyPrice.selectDailyPriceDayList", dailyPrice);
    }

    public int updateDailyPrice(DailyPrice dailyPrice) {
        return sqlSessionTemplate.update("DailyPrice.updateDailyPrice",dailyPrice);
    }

    public int deleteDailyPrice(DailyPrice dailyPrice) {
        return sqlSessionTemplate.delete("DailyPrice.deleteDailyPrice",dailyPrice);
    }
}