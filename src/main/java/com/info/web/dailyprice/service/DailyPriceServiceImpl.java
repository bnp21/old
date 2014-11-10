package com.info.web.dailyprice.service;

import com.info.web.dailyprice.dao.DailyPriceDao;
import com.info.web.domain.DailyPrice;
import com.info.web.domain.FarmDealTrend;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * <pre>
 * 계정 서비스 구현체.
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.08
 */
@Service("dailyPriceService")
public class DailyPriceServiceImpl implements DailyPriceService {
    private static Logger LOGGER = LoggerFactory.getLogger(DailyPriceServiceImpl.class);

    @Autowired
    private DailyPriceDao dailyPriceDao;

    public List<DailyPrice> selectDailyPriceList(DailyPrice dailyPrice) {
        return dailyPriceDao.selectDailyPriceList(dailyPrice);
    }

    public DailyPrice selectDailyPriceTop() {
        return dailyPriceDao.selectDailyPriceTop();
    }

    public List<DailyPrice> selectDailyPriceDayList(DailyPrice dailyPrice) {
        return dailyPriceDao.selectDailyPriceDayList(dailyPrice);
    }

    public int updateDailyPrice(DailyPrice dailyPrice) {
        return dailyPriceDao.updateDailyPrice(dailyPrice);
    }

    public int deleteDailyPrice(DailyPrice dailyPrice) {
        return dailyPriceDao.deleteDailyPrice(dailyPrice);
    }

}
