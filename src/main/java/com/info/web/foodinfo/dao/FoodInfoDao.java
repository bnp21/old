package com.info.web.foodinfo.dao;


import com.info.web.domain.FoodInfo;

import java.util.List;


public interface FoodInfoDao {
    /**
     *Asia Food Info 데이터 리스트
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
