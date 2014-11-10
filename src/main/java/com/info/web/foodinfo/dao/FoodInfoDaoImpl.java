package com.info.web.foodinfo.dao;

import com.info.web.domain.FoodInfo;
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
@Repository("foodInfoDao")
public class FoodInfoDaoImpl implements FoodInfoDao {
    private static final Logger logger = LoggerFactory.getLogger(FoodInfoDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public List<FoodInfo> selectFoodInfoList(FoodInfo foodInfo) {
        return sqlSessionTemplate.selectList("FoodInfo.selectFoodInfoList", foodInfo);
    }


    public FoodInfo selectFoodInfoTop() {
        return sqlSessionTemplate.selectOne("FoodInfo.selectFoodInfoTop");
    }


    public int insertFoodInfo(FoodInfo foodInfo) {
        return sqlSessionTemplate.insert("FoodInfo.insertFoodInfo", foodInfo);
    }


    public int updateFoodInfo(FoodInfo foodInfo) {
        return sqlSessionTemplate.update("FoodInfo.updateFoodInfo", foodInfo);
    }


    public int deleteFoodInfo(FoodInfo foodInfo) {
        return sqlSessionTemplate.update("FoodInfo.deleteFoodInfo", foodInfo);
    }
}