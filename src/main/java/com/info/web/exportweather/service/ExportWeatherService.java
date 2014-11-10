package com.info.web.exportweather.service;

import com.info.web.domain.ExportWeather;

import java.util.List;


/**
 * <pre>
 * 한
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.09.01
 */
public interface ExportWeatherService {
    /**
     *농수산식품 수출기상도 데이터 리스트
     *
     * @param exportWeather
     * @return 농수산식품 수출기상도 데이터 리스트
     */
    public List<ExportWeather> selectExportWeatherList(ExportWeather exportWeather);

    /*농수산식품 수출기상도 최근 데이터*/
    public ExportWeather selectExportWeatherTop();

    /*농수산식품 수출기상도 기간 가져오기*/
    public ExportWeather selectExportWeatherWeekDate(ExportWeather exportWeather);

    /*농수산식품 수출기상도 기간 가져오기*/
    public List<ExportWeather> selectExportWeatherGroupDay();

    /**
     *농수산식품 수출기상도 상승 아이템 데이터 리스트
     *
     * @param exportWeather
     * @return 농수산식품 수출기상도 상승 아이템 데이터 리스트
     */
    public List<ExportWeather> selectExportWeatherItemUpList(ExportWeather exportWeather);

    /**
     *농수산식품 수출기상도 하락 아이템 데이터 리스트
     *
     * @param exportWeather
     * @return 농수산식품 수출기상도 하락 아이템 데이터 리스트
     */
    public List<ExportWeather> selectExportWeatherItemDownList(ExportWeather exportWeather);

    /**
     *농수산식품 수출기상도 최근3개월 데이터 리스트
     *
     * @param exportWeather
     * @return 농수산식품 수출기상도 최근3개월 데이터 리스트
     */
    public List<ExportWeather> selectExportWeatherMonthList(ExportWeather exportWeather);

    /**
     *농수산식품 수출기상도 국가 데이터 리스트
     *
     * @param exportWeather
     * @return 농수산식품 수출기상도 국가 데이터 리스트
     */
    public List<ExportWeather> selectExportWeatherNationList(ExportWeather exportWeather);

    /*농수산식품 수출기상도 수정*/
    public  int updateExportWeather(ExportWeather exportWeather);

    /*농수산식품 수출기상도 국가별 이슈 수정*/
    public int updateExportWeatherNation(ExportWeather exportWeather);
}
