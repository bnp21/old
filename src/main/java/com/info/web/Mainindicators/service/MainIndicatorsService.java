package com.info.web.Mainindicators.service;

import com.info.web.domain.MainIndicators;

import java.util.List;


/**
 * <pre>
 * 국내외 식품산업 주요지표
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.16
 */
public interface MainIndicatorsService {
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
