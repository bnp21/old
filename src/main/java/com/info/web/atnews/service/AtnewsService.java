package com.info.web.atnews.service;

import com.info.web.domain.Account;
import com.info.web.domain.Atnews;

import java.util.List;


/**
 * <pre>
 * AT소식 인터페이스.
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.10
 */
public interface AtnewsService {

    /**
     * AT소식 목록 조회
     *
     * @param atnews
     * @return AT소식 목록
     */
    public List<Atnews> selectAtnewsList(Atnews atnews);
}
