package com.info.web.farmdealtrend.service;

import com.info.web.domain.FarmDealTrend;

import java.util.List;


/**
 * <pre>
 * 주요 농산물 거래 동향
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.16
 */
public interface FarmDealTrendService {
    /**
     *주요 농산물 거래 동향 데이터 리스트
     *
     * @param farmDealTrend
     * @return 주요 농산물 거래 동향 데이터 리스트
     */
    public List<FarmDealTrend> selectFarmDealTrendList(FarmDealTrend farmDealTrend);

    /*주요 농산물 거래 동향 최근 데이터*/
    public FarmDealTrend selectFarmDealTrendTop();

    /*주요 농산물 거래 동향 최근 5일 데이터*/
    public List<FarmDealTrend> selectFarmDealTrendTermList(FarmDealTrend farmDealTrend);

    /*주요 농산물 거래 동향 최근 5일 최고가*/
    public int selectFarmDealTrendMaxPrice(FarmDealTrend farmDealTrend);

    /**
     *주요 농산물 거래 동향 데이터 카운트
     *
     * @param farmDealTrend
     * @return 주요 농산물 거래 동향 데이터 카운트
     */
    public int checkFarmDealTrend(FarmDealTrend farmDealTrend);

    /*주요 농산물 거래 동향 엑셀 업로드 등록*/
    public int insertFarmDealTrend(FarmDealTrend farmDealTrend);

    /*주요 농산물 거래 동향 엑셀 업로드 수정*/
    public int updateFarmDealTrend(FarmDealTrend farmDealTrend);
}
