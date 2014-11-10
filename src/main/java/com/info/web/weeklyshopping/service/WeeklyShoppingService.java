package com.info.web.weeklyshopping.service;

import com.info.web.domain.WeeklyShopping;

import java.util.List;


/**
 * <pre>
 * 주요 농산물 거래 동향
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.16
 */
public interface WeeklyShoppingService {
    /**
     *알뜰 장보기 데이터 리스트
     *
     * @param weeklyShopping
     * @return 알뜰 장보기 데이터 리스트
     */
    public List<WeeklyShopping> selectWeeklyShoppingList(WeeklyShopping weeklyShopping);

    /*알뜰 장보기 그룹코드 가져오기*/
    public int selectWeeklyShoppingGroupCode();

    /*알뜰 장보기 일자 데이터 가져오기*/
    public List<WeeklyShopping> selectWeeklyShoppingGroupDay();

    /*알뜰 장보기 최근 데이터 가져오기*/
    public WeeklyShopping selectWeeklyShoppingTop(WeeklyShopping weeklyShopping);

    /*알뜰 장보기 등록*/
    public int insertWeeklyShopping(WeeklyShopping weeklyShopping);

    /*알뜰 장보기 수정*/
    public int updateWeeklyShopping(WeeklyShopping weeklyShopping);
}
