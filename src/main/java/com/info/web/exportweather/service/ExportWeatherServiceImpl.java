package com.info.web.exportweather.service;

import com.info.web.domain.ExportWeather;
import com.info.web.exportweather.dao.ExportWeatherDao;
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
@Service("exportWeatherService")
public class ExportWeatherServiceImpl implements ExportWeatherService {
    private static Logger LOGGER = LoggerFactory.getLogger(ExportWeatherServiceImpl.class);

    @Autowired
    private ExportWeatherDao exportWeatherDao;


    public List<ExportWeather> selectExportWeatherList(ExportWeather exportWeather) {
        return exportWeatherDao.selectExportWeatherList(exportWeather);
    }


    public ExportWeather selectExportWeatherTop() {
        return exportWeatherDao.selectExportWeatherTop();
    }


    public ExportWeather selectExportWeatherWeekDate(ExportWeather exportWeather) {
        return exportWeatherDao.selectExportWeatherWeekDate(exportWeather);
    }


    public List<ExportWeather> selectExportWeatherGroupDay() {
        return exportWeatherDao.selectExportWeatherGroupDay();
    }


    public List<ExportWeather> selectExportWeatherItemUpList(ExportWeather exportWeather) {
        return exportWeatherDao.selectExportWeatherItemUpList(exportWeather);
    }


    public List<ExportWeather> selectExportWeatherItemDownList(ExportWeather exportWeather) {
        return exportWeatherDao.selectExportWeatherItemDownList(exportWeather);
    }


    public List<ExportWeather> selectExportWeatherMonthList(ExportWeather exportWeather) {
        return exportWeatherDao.selectExportWeatherMonthList(exportWeather);
    }


    public List<ExportWeather> selectExportWeatherNationList(ExportWeather exportWeather) {
        return exportWeatherDao.selectExportWeatherNationList(exportWeather);
    }


    public int updateExportWeather(ExportWeather exportWeather) {
        return exportWeatherDao.updateExportWeather(exportWeather);
    }


    public int updateExportWeatherNation(ExportWeather exportWeather) {
        return exportWeatherDao.updateExportWeatherNation(exportWeather);
    }
}
