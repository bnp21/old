package com.info.framework.batch.service;

import com.info.web.domain.Batch;

import java.util.List;


/**
 * <pre>
 * 계정 서비스 인터페이스.
 * </pre>
 *
 * @author 임세환
 * @version 1.0, 2013.12.11
 */
public interface BatchService {

    /**
     * 회원정보 목록 조회
     *
     * @return 공지사항 목록
     */
    public List<Batch> selectBatchList();

    public void getBatchData001();

    public void getBatchData001C();

    public void getBatchData001Y();

    public void getBatchData002();

    public void getBatchData003();

    public void getBatchData004();

    public void getBatchData005();

    public void getBatchData006();

    public void getBatchData007();

}
