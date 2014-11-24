package com.info.web.exportweather.dao;

import com.info.web.domain.ExportWeather;
import com.info.web.domain.FarmDealTrend;
import com.info.web.domain.NewsLetter;
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
@Repository("exportWeatherDao")
public class ExportWeatherDaoImpl implements ExportWeatherDao {
    private static final Logger logger = LoggerFactory.getLogger(ExportWeatherDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public List<ExportWeather> selectExportWeatherList(ExportWeather exportWeather) {
        return sqlSessionTemplate.selectList("ExportWeather.selectExportWeatherList", exportWeather);
    }


    public ExportWeather selectExportWeatherWeekDate(ExportWeather exportWeather) {
        return sqlSessionTemplate.selectOne("ExportWeather.selectExportWeatherWeekDate", exportWeather);
    }


    public ExportWeather selectExportWeatherTop() {
        return sqlSessionTemplate.selectOne("ExportWeather.selectExportWeatherTop");
    }


    public List<ExportWeather> selectExportWeatherItemUpList(ExportWeather exportWeather) {
        return sqlSessionTemplate.selectList("ExportWeather.selectExportWeatherItemUpList", exportWeather);
    }


    public List<ExportWeather> selectExportWeatherGroupDay() {
        return sqlSessionTemplate.selectList("ExportWeather.selectExportWeatherGroupDay");
    }


    public List<ExportWeather> selectExportWeatherItemDownList(ExportWeather exportWeather) {
        return sqlSessionTemplate.selectList("ExportWeather.selectExportWeatherItemDownList", exportWeather);
    }


    public List<ExportWeather> selectExportWeatherMonthList(ExportWeather exportWeather) {
        return sqlSessionTemplate.selectList("ExportWeather.selectExportWeatherMonthList", exportWeather);
    }


    public List<ExportWeather> selectExportWeatherNationList(ExportWeather exportWeather) {
        return sqlSessionTemplate.selectList("ExportWeather.selectExportWeatherNationList", exportWeather);
    }


    public int updateExportWeatherNation(ExportWeather exportWeather) {
        return sqlSessionTemplate.update("ExportWeather.updateExportWeatherNation", exportWeather);
    }


    public int updateExportWeather(ExportWeather exportWeather) {
        return sqlSessionTemplate.update("ExportWeather.updateExportWeather", exportWeather);
    }

    public List<NewsLetter> selectNewsLetterList(NewsLetter newsLetter) {
        return sqlSessionTemplate.selectList("ExportWeather.selectNewsLetterList", newsLetter);
    }


    public int updateNewsLetter(NewsLetter newsLetter) {
        return sqlSessionTemplate.update("ExportWeather.updateNewsLetter", newsLetter);
    }

}