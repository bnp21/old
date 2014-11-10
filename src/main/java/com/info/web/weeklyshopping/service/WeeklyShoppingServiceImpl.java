package com.info.web.weeklyshopping.service;

import com.info.web.domain.WeeklyShopping;
import com.info.web.weeklyshopping.dao.WeeklyShoppingDao;
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
@Service("weeklyShoppingService")
public class WeeklyShoppingServiceImpl implements WeeklyShoppingService {
    private static Logger LOGGER = LoggerFactory.getLogger(WeeklyShoppingServiceImpl.class);

    @Autowired
    private WeeklyShoppingDao weeklyShoppingDao;


    public List<WeeklyShopping> selectWeeklyShoppingList(WeeklyShopping weeklyShopping) {
        return weeklyShoppingDao.selectWeeklyShoppingList(weeklyShopping);
    }


    public int selectWeeklyShoppingGroupCode(){
        return weeklyShoppingDao.selectWeeklyShoppingGroupCode();
    }


    public List<WeeklyShopping> selectWeeklyShoppingGroupDay(){
        return weeklyShoppingDao.selectWeeklyShoppingGroupDay();
    }


    public WeeklyShopping selectWeeklyShoppingTop(WeeklyShopping weeklyShopping){
        return weeklyShoppingDao.selectWeeklyShoppingTop(weeklyShopping);
    }


    public int insertWeeklyShopping(WeeklyShopping weeklyShopping) {
        return weeklyShoppingDao.insertWeeklyShopping(weeklyShopping);
    }


    public int updateWeeklyShopping(WeeklyShopping weeklyShopping) {
        return weeklyShoppingDao.updateWeeklyShopping(weeklyShopping);
    }
}
