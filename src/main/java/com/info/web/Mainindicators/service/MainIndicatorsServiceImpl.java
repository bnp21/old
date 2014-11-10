package com.info.web.Mainindicators.service;

import com.info.web.domain.MainIndicators;
import com.info.web.Mainindicators.dao.MainIndicatorsDao;
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
@Service("mainIndicatorsService")
public class MainIndicatorsServiceImpl implements MainIndicatorsService {
    private static Logger LOGGER = LoggerFactory.getLogger(MainIndicatorsServiceImpl.class);

    @Autowired
    private MainIndicatorsDao mainIndicatorsDao;


    public List<MainIndicators> selectMainIndicatorsList(MainIndicators mainIndicators) {
        return mainIndicatorsDao.selectMainIndicatorsList(mainIndicators);
    }


    public MainIndicators selectMainIndicatorsTop() {
        return mainIndicatorsDao.selectMainIndicatorsTop();
    }


    public int insertMainIndicators(MainIndicators mainIndicators) {
        return mainIndicatorsDao.insertMainIndicators(mainIndicators);
    }


    public int updateMainIndicators(MainIndicators mainIndicators) {
        return mainIndicatorsDao.updateMainIndicators(mainIndicators);
    }


    public int deleteMainIndicators(MainIndicators mainIndicators) {
        return mainIndicatorsDao.deleteMainIndicators(mainIndicators);
    }
}
