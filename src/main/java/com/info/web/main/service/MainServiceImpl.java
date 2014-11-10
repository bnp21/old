package com.info.web.main.service;

import com.info.web.domain.Main;
import com.info.web.domain.Statistics;
import com.info.web.main.dao.MainDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * <pre>
 * 메인 인터페이스
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.04
 */
@Service("mainService")
public class MainServiceImpl implements MainService {
    private static Logger LOGGER = LoggerFactory.getLogger(MainServiceImpl.class);

    @Autowired
    private MainDao mainDao;


    public List<Main> selectMainList(Main main) {
        return mainDao.selectMainList(main);
    }


    public List<Main> selectCategoryList(Main main) {
        return mainDao.selectCategoryList(main);
    }


    public int updateMain(Main main) {
        int updateCount = 0;

        updateCount = mainDao.updateMain(main);

        if (updateCount > 0) {
            LOGGER.info("수정 처리");
        }else {
            LOGGER.info("수정 오류");
        }

        return updateCount;
    }

    public List<Statistics> selectStatisticsList(Statistics statistics) {
        return mainDao.selectStatisticsList(statistics);
    }

    public int updateStatistics(Statistics statistics) {
        int updateCount = 0;

        updateCount = mainDao.updateStatistics(statistics);

        return updateCount;
    }

}
