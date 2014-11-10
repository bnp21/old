package com.info.web.fis.dao;


import com.info.web.domain.Grain;
import com.info.web.domain.InternationalRawMaterial;
import com.info.web.domain.ProcessedFood;

import java.util.List;


public interface FisDao {

    /**
     *일일곡물시항 데이터 리스트
     *
     * @param grain
     * @return 일일곡물시항 데이터 리스트
     */
    public List<Grain> selectGrainMarketConditionList(Grain grain);

    /**
     *일일곡물시항 데이터 카운트
     *
     * @param grain
     * @return 일일곡물시항 데이터 카운트
     */
    public int checkGrainMarketCondition(Grain grain);

    /*일일곡믈시항 업로드 등록*/
    public int insertGrainMarketCondition(Grain grain);

    /*일일곡물시항 업로드 수정*/
    public int updateGrainMarketCondition(Grain grain);

    public Grain selectGrainCommendView(Grain grain);

    /*일일곡물시황 해석 내용 카운트*/
    public int checkGrainMarketCommentCondition(Grain grain);

    /*일일곡물시황 해석 내용 등록*/
    public int insertGrainCommend(Grain grain);

    /*일일곡물시황 해석 내용 수정*/
    public int updateGrainCommend(Grain grain);

    /*일일곡물시황 최근글*/
    public Grain selectGrainMarketConditionTop();

    /*국제 원자재가격 관리 데이터 리스트*/
    public List<InternationalRawMaterial> selectInternationalRawMaterial(InternationalRawMaterial irm);

    /*국제 원자재가격 관리 최근 글*/
    public InternationalRawMaterial selectInternationalRawMaterialTop();

    /*국제 원자재가격 관리 데이터 카운트*/
    public int checkInternationalRawMaterial(InternationalRawMaterial irm);

    /*국제 원자재가격 관리 업로드 등록*/
    public int insertInternationalRawMaterial(InternationalRawMaterial irm);

    /*국제 원자재가격 관리 업로드 수정*/
    public int updateInternationalRawMaterial(InternationalRawMaterial irm);

    /*가공식품 주간 가격동향 관리 리스트*/
    public List<ProcessedFood> selectProcessedFoodList(ProcessedFood processedFood);

    /*가공식품 주간 가격동향 관리 최근 글*/
    public ProcessedFood selectProcessedFoodTop();

    /*가공식품 주간 가격동향 관리 데이터 카운트*/
    public int checkProcessedFood(ProcessedFood processedFood);

    /*가공식품 주간 가격동향 관리 업로드 등록*/
    public int insertProcessedFood(ProcessedFood processedFood);

    /*가공식품 주간 가격동향 관리 업로드 수정*/
    public int updateProcessedFood(ProcessedFood processedFood);

    /*가공식품 주간 가격동향 관리 업로드 삭제*/
    public int deleteProcessedFood(ProcessedFood processedFood);
}
