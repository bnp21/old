package com.info.web.eatingbusiness.service;

import com.info.web.domain.EatingBusiness;

import java.util.List;


/**
 * <pre>
 * 한국외식업경기지수
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.08.08
 */
public interface EatingBusinessService {
    /**
     *한국외식업경기지수 데이터 리스트
     *
     * @param eatingBusiness
     * @return 한국외식업경기지수 데이터 리스트
     */
    public List<EatingBusiness> selectEatingBusinessList(EatingBusiness eatingBusiness);

    /*한국외식업경기지수 그룹코드 가져오기*/
    public int selectEatingBusinessGroupCode();

    /*한국외식업경기지수 최근 데이터 가져오기*/
    public EatingBusiness selectEatingBusinessTop();

    /*한국외식업경기지수 등록*/
    public int insertEatingBusiness(EatingBusiness eatingBusiness);

    /*한국외식업경기지수 수정*/
    public int updateEatingBusiness(EatingBusiness weeklyShopping);

    /*한국외식업경기지수 내용 데이터 가져오기*/
    public List<EatingBusiness> selectEatingBusinessComment(EatingBusiness eatingBusiness);

    /*한국외식업경기지수 내용 등록*/
    public int insertEatingBusinessComment(EatingBusiness eatingBusiness);

    /*한국외식업경기지수 내용 수정*/
    public int updateEatingBusinessComment(EatingBusiness weeklyShopping);

    /*한국외식업경기지수 내용 삭제*/
    public int deleteEatingBusiness(EatingBusiness weeklyShopping);
}
