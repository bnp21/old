package com.info.web.Mainindicators.dao;


import com.info.web.domain.MainIndicators;

import java.util.List;


public interface MainIndicatorsDao {
    /**
     *국내외 식품산업 주요지표 데이터 리스트
     *
     * @param mainIndicators
     * @return 국내외 식품산업 주요지표 데이터 리스트
     */
    public List<MainIndicators> selectMainIndicatorsList(MainIndicators mainIndicators);

    public MainIndicators selectMainIndicatorsTop();

    public int insertMainIndicators(MainIndicators mainIndicators);

    public int updateMainIndicators(MainIndicators mainIndicators);

    public int deleteMainIndicators(MainIndicators mainIndicators);
}
