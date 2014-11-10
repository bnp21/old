package com.info.web.fis.dao;

import com.info.web.domain.Grain;
import com.info.web.domain.InternationalRawMaterial;
import com.info.web.domain.ProcessedFood;
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
@Repository("fisDao")
public class FisDaoImpl implements FisDao {
    private static final Logger logger = LoggerFactory.getLogger(FisDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public List<Grain> selectGrainMarketConditionList(Grain grain) {
        return sqlSessionTemplate.selectList("Grain.selectGrainMarketConditionList", grain);
    }


    public int checkGrainMarketCondition(Grain grain) {
        return sqlSessionTemplate.selectOne("Grain.checkGrainMarketCondition", grain);
    }


    public int insertGrainMarketCondition(Grain grain) {
        return sqlSessionTemplate.insert("Grain.insertGrainMarketCondition", grain);
    }


    public int updateGrainMarketCondition(Grain grain) {
        return sqlSessionTemplate.update("Grain.updateGrainMarketCondition", grain);
    }


    public Grain selectGrainCommendView(Grain grain) {
        return sqlSessionTemplate.selectOne("Grain.selectGrainCommendView", grain);
    }


    public int checkGrainMarketCommentCondition(Grain grain) {
        return sqlSessionTemplate.selectOne("Grain.checkGrainMarketCommentCondition", grain);
    }


    public int insertGrainCommend(Grain grain) {
        return sqlSessionTemplate.insert("Grain.insertGrainCommend", grain);
    }


    public int updateGrainCommend(Grain grain) {
        return sqlSessionTemplate.update("Grain.updateGrainCommend", grain);
    }


    public Grain selectGrainMarketConditionTop(){
        return sqlSessionTemplate.selectOne("Grain.selectGrainMarketConditionTop");
    }


    public List<InternationalRawMaterial> selectInternationalRawMaterial(InternationalRawMaterial irm) {
        return sqlSessionTemplate.selectList("InternationalRawMaterial.selectInternationalRawMaterial", irm);
    }


    public InternationalRawMaterial selectInternationalRawMaterialTop(){
        return sqlSessionTemplate.selectOne("InternationalRawMaterial.selectInternationalRawMaterialTop");
    }


    public int checkInternationalRawMaterial(InternationalRawMaterial irm) {
        return sqlSessionTemplate.selectOne("InternationalRawMaterial.checkInternationalRawMaterial", irm);
    }


    public int insertInternationalRawMaterial(InternationalRawMaterial irm) {
        return sqlSessionTemplate.insert("InternationalRawMaterial.insertInternationalRawMaterial", irm);
    }


    public int updateInternationalRawMaterial(InternationalRawMaterial irm) {
        return sqlSessionTemplate.update("InternationalRawMaterial.updateInternationalRawMaterial", irm);
    }


    public List<ProcessedFood> selectProcessedFoodList(ProcessedFood processedFood){
        return sqlSessionTemplate.selectList("ProcessedFood.selectProcessedFoodList",processedFood);
    }


    public ProcessedFood selectProcessedFoodTop(){
        return sqlSessionTemplate.selectOne("ProcessedFood.selectProcessedFoodTop");
    }


    public int checkProcessedFood(ProcessedFood processedFood) {
        return sqlSessionTemplate.selectOne("ProcessedFood.checkProcessedFood", processedFood);
    }


    public int insertProcessedFood(ProcessedFood processedFood) {

        return sqlSessionTemplate.insert("ProcessedFood.insertProcessedFood", processedFood);
    }


    public int updateProcessedFood(ProcessedFood processedFood) {
        return sqlSessionTemplate.update("ProcessedFood.updateProcessedFood", processedFood);
    }

    public int deleteProcessedFood(ProcessedFood processedFood) {
        return sqlSessionTemplate.update("ProcessedFood.deleteProcessedFood", processedFood);
    }

}