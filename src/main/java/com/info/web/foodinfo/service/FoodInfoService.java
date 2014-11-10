package com.info.web.foodinfo.service;

import com.info.web.domain.FoodInfo;
import com.info.web.domain.MainIndicators;

import java.util.List;


/**
 * <pre>
 * Asia Food Info
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.10.06
 */
public interface FoodInfoService {
    /**
     *Asia Food Info
     *
     * @param foodInfo
     * @return Asia Food Info 데이터 리스트
     */
    public List<FoodInfo> selectFoodInfoList(FoodInfo foodInfo);

    public FoodInfo selectFoodInfoTop();

    public int insertFoodInfo(FoodInfo foodInfo);

    public int updateFoodInfo(FoodInfo foodInfo);

    public int deleteFoodInfo(FoodInfo foodInfo);
}
