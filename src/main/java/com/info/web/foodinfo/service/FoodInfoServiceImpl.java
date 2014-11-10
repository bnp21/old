package com.info.web.foodinfo.service;

import com.info.web.domain.FoodInfo;
import com.info.web.foodinfo.dao.FoodInfoDao;
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
@Service("foodInfoService")
public class FoodInfoServiceImpl implements FoodInfoService {
    private static Logger LOGGER = LoggerFactory.getLogger(FoodInfoServiceImpl.class);

    @Autowired
    private FoodInfoDao foodInfoDao;


    public List<FoodInfo> selectFoodInfoList(FoodInfo foodInfo) {
        return foodInfoDao.selectFoodInfoList(foodInfo);
    }


    public FoodInfo selectFoodInfoTop() {
        return foodInfoDao.selectFoodInfoTop();
    }


    public int insertFoodInfo(FoodInfo foodInfo) {
        return foodInfoDao.insertFoodInfo(foodInfo);
    }


    public int updateFoodInfo(FoodInfo foodInfo) {
        return foodInfoDao.updateFoodInfo(foodInfo);
    }


    public int deleteFoodInfo(FoodInfo foodInfo) {
        return foodInfoDao.deleteFoodInfo(foodInfo);
    }
}
