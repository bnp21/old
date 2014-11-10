package com.info.framework.batch.dao;

import com.info.web.domain.*;

import java.util.List;


public interface BatchDao {

    /**
     * 공지사항 목록 조회
     *
     * @return 공지사항 목록
     */
    public List<Batch> selectBatchList();

    public int deleteBatch001();

    public int deleteBatch001C();

    public int deleteBatch001Y();

    //KATI, 화훼 등록하기
    public int insertBatch001();

    //KATI, 화훼 등록하기
    public int insertBatch001C();

    //KATI, 화훼 등록하기
    public int insertBatch001Y();


    //KATI, 해외도소매가격식품 삭제하기
    public int deleteBatch002();

    //KATI, 해외도소매가격식품 등록하기
    public int insertBatch002();

    //aT센터, 최근소식 등록하기
    public int insertBatch003();

    //유통교육원, 연간교육일정 삭제하기
    public int deleteBath004();
    //유통교육원, 연간교육일정 등록하기
    public int insertBatch004();

    //kamis농축수산물소매가격일일동향
    public int insertBatch005();

    //kamis농축수산물소매가격일일동향
    public int insertBatch005_01();

    //kamis 농산물일일도소매가격 삭제
    public void deleteBath006(Price price);

    //kamis 수출기상도
    public void insertBatch006();

    //kamis 수출기상도
    public void insertBatch008();

    //kamis 수출기상도
    public void insertBatch009();

    //kamis 수출기상도
    public void insertBatch009_01();

    //kamis 수출기상도
    public void insertBatch009_02();

    //kamis 수출기상도
    public void insertBatch010();

    //kamis 수출기상도
    public void insertBatch011();

    //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
    public void updateMenu(Batch batch);

}