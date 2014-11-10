package com.info.web.dailyprice.dao;


import com.info.web.domain.DailyPrice;
import com.info.web.domain.FarmDealTrend;

import java.util.List;


public interface DailyPriceDao {
    /**
     *농축수산물 소매가격 일일동향 데이터 리스트
     *
     * @param dailyPrice
     * @return 농축수산물 소매가격 일일동향 데이터 리스트
     */
    public List<DailyPrice> selectDailyPriceList(DailyPrice dailyPrice);

    /*농축수산물 소매가격 일일동향 최근 데이터*/
    public DailyPrice selectDailyPriceTop();

    /**
     *농축수산물 소매가격 일일동향 날짜 데이터 리스트
     *
     * @param dailyPrice
     * @return 농축수산물 소매가격 일일동향 날짜 데이터 리스트
     */
    public List<DailyPrice> selectDailyPriceDayList(DailyPrice dailyPrice);

    public int updateDailyPrice(DailyPrice dailyPrice);

    public int deleteDailyPrice(DailyPrice dailyPrice);
}
