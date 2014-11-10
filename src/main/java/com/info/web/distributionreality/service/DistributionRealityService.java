package com.info.web.distributionreality.service;

import com.info.web.domain.DistributionReality;

import java.util.List;


/**
 * <pre>
 * 한국외식업경기지수
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.08.08
 */
public interface DistributionRealityService {
    /**
     *비용별·단계별 유통실태 데이터 리스트
     *
     * @param distributionReality
     * @return 한국외식업경기지수 데이터 리스트
     */
    public List<DistributionReality> selectDistributionRealityList(DistributionReality distributionReality);

    /* 비용별·단계별 유통실태 SEQ*/
    public int selectDistributionRealitySeq();

    /*비용별·단계별 유통실태 최근 데이터*/
    public List<DistributionReality> selectDistributionRealityFrontList();

    /*비용별·단계별 유통실태 데이터*/
    public DistributionReality selectDistributionRealityView(DistributionReality distributionReality);

    /*비용별·단계별 유통실태 등록*/
    public int insertDistributionReality(DistributionReality distributionReality);

    /*비용별·단계별 유통실태 수정*/
    public int updateDistributionReality(DistributionReality weeklyShopping);

    /*비용별·단계별 유통실태 삭제*/
    public int deleteDistributionReality(DistributionReality weeklyShopping);

    /**
     *비용별·단계별 유통실태 조사품목 데이터 리스트
     *
     * @param distributionReality
     * @return 한국외식업경기지수 조사품목 데이터 리스트
     */
    public List<DistributionReality> selectDistributionRealityItemList(DistributionReality distributionReality);

    /*비용별·단계별 유통실태 조사품목 등록*/
    public int insertDistributionRealityItem(DistributionReality distributionReality);

    /*비용별·단계별 유통실태 조사품목 수정*/
    public int updateDistributionRealityItem(DistributionReality weeklyShopping);

    /*비용별·단계별 유통실태 조사품목 삭제*/
    public int deleteDistributionRealityItem(DistributionReality weeklyShopping);

}
