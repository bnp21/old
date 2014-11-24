package com.info.web.main.service;

import com.info.web.domain.Main;

import com.info.web.domain.Statistics;

import java.util.List;


/**
 * <pre>
 * 메인 인터페이스
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.04
 */
public interface MainService {

    /**
     * 메인 목록 조회
     *
     * @return 메인 목록
     */
    public List<Main> selectMainList(Main main);

    /**
     * 카타고리 목록 조회
     *
     * @return 카타고리 목록
     */
    public List<Main> selectCategoryList(Main main);

    /*메인 데이터 수정하기*/
    public int updateMain(Main main);

    /**
     * 통계 목록 조회
     *
     * @return 통계 목록
     */
    public List<Statistics> selectStatisticsList(Statistics statistics);
    /**
     * 통계 목록 조회
     *
     * @return 통계 데이터 날짜 목록
     */
    public List<Statistics> selectStatisticsDateList(Statistics statistics);
 /**
     * 통계 목록 조회
     *
     * @return 통계 데이터 메뉴 목록
     */
    public List<Statistics> selectStatisticsMenuList(Statistics statistics);

    /**
     * 통계 목록 조회
     *
     * @return 통계 데이터 다운로드 목록
     */
    public List<Statistics> selectStatisticsDateDownloadList(Statistics statistics);

    /*통계 데이터 수정하기*/
    public int updateStatistics(Statistics statistics);
}
