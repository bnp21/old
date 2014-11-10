package com.info.web.weeklyshopping.dao;

import com.info.web.domain.WeeklyShopping;
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
@Repository("weeklyShoppingDao")
public class WeeklyShoppingDaoImpl implements WeeklyShoppingDao {
    private static final Logger logger = LoggerFactory.getLogger(WeeklyShoppingDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public List<WeeklyShopping> selectWeeklyShoppingList(WeeklyShopping weeklyShopping) {
        return sqlSessionTemplate.selectList("WeeklyShopping.selectWeeklyShoppingList", weeklyShopping);
    }


    public int selectWeeklyShoppingGroupCode(){
        return sqlSessionTemplate.selectOne("WeeklyShopping.selectWeeklyShoppingGroupCode");
    }


    public List<WeeklyShopping> selectWeeklyShoppingGroupDay() {
        return sqlSessionTemplate.selectList("WeeklyShopping.selectWeeklyShoppingGroupDay");
    }


    public WeeklyShopping selectWeeklyShoppingTop(WeeklyShopping weeklyShopping){
        return sqlSessionTemplate.selectOne("WeeklyShopping.selectWeeklyShoppingTop",weeklyShopping);
    }


    public int insertWeeklyShopping(WeeklyShopping weeklyShopping) {
        return sqlSessionTemplate.insert("WeeklyShopping.insertWeeklyShopping", weeklyShopping);
    }


    public int updateWeeklyShopping(WeeklyShopping weeklyShopping) {
        return sqlSessionTemplate.update("WeeklyShopping.updateWeeklyShopping", weeklyShopping);
    }
}