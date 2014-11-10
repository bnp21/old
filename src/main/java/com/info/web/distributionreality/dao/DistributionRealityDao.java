package com.info.web.distributionreality.dao;

import com.info.web.domain.DistributionReality;

import java.util.List;


public interface DistributionRealityDao {
    /**
     *비용별·단계별 유통실태 데이터 리스트
     *
     * @param distributionReality
     * @return 비용별·단계별 유통실태 데이터 리스트
     */
    public List<DistributionReality> selectDistributionRealityList(DistributionReality distributionReality);

    /* 비용별·단계별 유통실태 SEQ*/
    public int selectDistributionRealitySeq();

    /*비용별·단계별 유통실태 데이터 최근 데이터*/
    public List<DistributionReality> selectDistributionRealityFrontList();

    /*비용별·단계별 유통실태 데이터 리스트*/
    public DistributionReality selectDistributionRealityView(DistributionReality distributionReality);

    /*비용별·단계별 유통실태 등록*/
    public int insertDistributionReality(DistributionReality distributionReality);

    /*비용별·단계별 유통실태 수정*/
    public int updateDistributionReality(DistributionReality distributionReality);

    /*비용별·단계별 유통실태 삭제*/
    public int deleteDistributionReality(DistributionReality distributionReality);

    /**
     *비용별·단계별 유통실태 조사품목 데이터 리스트
     *
     * @param distributionReality
     * @return 비용별·단계별 유통실태 조사품목 데이터 리스트
     */
    public List<DistributionReality> selectDistributionRealityItemList(DistributionReality distributionReality);

    /*비용별·단계별 유통실태 조사품목 등록*/
    public int insertDistributionRealityItem(DistributionReality distributionReality);

    /*비용별·단계별 유통실태 조사품목 수정*/
    public int updateDistributionRealityItem(DistributionReality distributionReality);

    /*비용별·단계별 유통실태 조사품목 삭제*/
    public int deleteDistributionRealityItem(DistributionReality distributionReality);
}
