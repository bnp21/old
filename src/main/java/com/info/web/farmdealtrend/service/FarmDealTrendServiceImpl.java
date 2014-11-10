package com.info.web.farmdealtrend.service;

import com.info.web.domain.FarmDealTrend;
import com.info.web.farmdealtrend.dao.FarmDealTrendDao;
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
@Service("farmDealTrendService")
public class FarmDealTrendServiceImpl implements FarmDealTrendService {
    private static Logger LOGGER = LoggerFactory.getLogger(FarmDealTrendServiceImpl.class);

    @Autowired
    private FarmDealTrendDao farmDealTrendDao;


    public List<FarmDealTrend> selectFarmDealTrendList(FarmDealTrend farmDealTrend) {
        return farmDealTrendDao.selectFarmDealTrendList(farmDealTrend);
    }


    public FarmDealTrend selectFarmDealTrendTop() {
        return farmDealTrendDao.selectFarmDealTrendTop();
    }


    public List<FarmDealTrend> selectFarmDealTrendTermList(FarmDealTrend farmDealTrend) {
        return farmDealTrendDao.selectFarmDealTrendTermList(farmDealTrend);
    }


    public int selectFarmDealTrendMaxPrice(FarmDealTrend farmDealTrend) {
        return farmDealTrendDao.selectFarmDealTrendMaxPrice(farmDealTrend);
    }


    public int checkFarmDealTrend(FarmDealTrend farmDealTrend) {
        return farmDealTrendDao.checkFarmDealTrend(farmDealTrend);
    }


    public int insertFarmDealTrend(FarmDealTrend farmDealTrend) {
        return farmDealTrendDao.insertFarmDealTrend(farmDealTrend);
    }


    public int updateFarmDealTrend(FarmDealTrend farmDealTrend) {
        return farmDealTrendDao.updateFarmDealTrend(farmDealTrend);
    }
}
