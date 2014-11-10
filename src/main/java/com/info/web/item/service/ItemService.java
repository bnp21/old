package com.info.web.item.service;

import com.info.web.domain.Item;

import java.util.List;


/**
 * <pre>
 * 계정 서비스 인터페이스.
 * </pre>
 *
 * @author 임세환
 * @version 1.0, 2013.12.11
 */
public interface ItemService {

    /**
     * 회원정보 목록 조회
     *
     * @param item
     * @return 공지사항 목록
     */
    public List<Item> selectItemList(Item item);

}
