package com.info.web.fis.service;

import com.info.web.domain.Grain;
import com.info.web.domain.InternationalRawMaterial;
import com.info.web.domain.Item;
import com.info.web.domain.ProcessedFood;
import com.info.web.fis.dao.FisDao;
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
@Service("fisService")
public class FisServiceImpl implements FisService {
    private static Logger LOGGER = LoggerFactory.getLogger(FisServiceImpl.class);

    @Autowired
    private FisDao fisDao;


    public List<Grain> selectGrainMarketConditionList(Grain grain) {
        return fisDao.selectGrainMarketConditionList(grain);
    }


    public int checkGrainMarketCondition(Grain grain) {
        return fisDao.checkGrainMarketCondition(grain);
    }


    public int insertGrainMarketCondition(Grain grain) {
        return fisDao.insertGrainMarketCondition(grain);
    }


    public int updateGrainMarketCondition(Grain grain) {
        return fisDao.updateGrainMarketCondition(grain);
    }


    public Grain selectGrainMarketConditionTop(){
        return fisDao.selectGrainMarketConditionTop();
    }


    public int checkGrainMarketCommentCondition(Grain grain) {
        return fisDao.checkGrainMarketCommentCondition(grain);
    }


    public Grain selectGrainCommendView(Grain grain) {
        return fisDao.selectGrainCommendView(grain);
    }


    public int insertGrainCommend(Grain grain) {
        return fisDao.insertGrainCommend(grain);
    }


    public int updateGrainCommend(Grain grain) {
        return fisDao.updateGrainCommend(grain);
    }


    public List<InternationalRawMaterial> selectInternationalRawMaterial(InternationalRawMaterial irm) {
        return fisDao.selectInternationalRawMaterial(irm);
    }


    public InternationalRawMaterial selectInternationalRawMaterialTop(){
        return fisDao.selectInternationalRawMaterialTop();
    }


    public int checkInternationalRawMaterial(InternationalRawMaterial irm) {
        return fisDao.checkInternationalRawMaterial(irm);
    }


    public int insertInternationalRawMaterial(InternationalRawMaterial irm) {
        return fisDao.insertInternationalRawMaterial(irm);
    }


    public int updateInternationalRawMaterial(InternationalRawMaterial irm) {
        return fisDao.updateInternationalRawMaterial(irm);
    }


    public List<ProcessedFood> selectProcessedFoodList(ProcessedFood processedFood){
        return fisDao.selectProcessedFoodList(processedFood);
    }


    public ProcessedFood selectProcessedFoodTop(){
        return fisDao.selectProcessedFoodTop();
    }


    public int checkProcessedFood(ProcessedFood processedFood) {
        return fisDao.checkProcessedFood(processedFood);
    }


    public int insertProcessedFood(ProcessedFood processedFood) {

        return fisDao.insertProcessedFood(processedFood);
    }


    public int updateProcessedFood(ProcessedFood processedFood) {
        return fisDao.updateProcessedFood(processedFood);
    }

    public int deleteProcessedFood(ProcessedFood processedFood) {
        return fisDao.deleteProcessedFood(processedFood);
    }
}
