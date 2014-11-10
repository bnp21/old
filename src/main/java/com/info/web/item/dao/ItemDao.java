package com.info.web.item.dao;

import com.info.web.domain.Item;

import java.util.List;


public interface ItemDao {

    /**
     * 공지사항 목록 조회
     *
     * @param item
     * @return 공지사항 목록
     */
    public List<Item> selectItemList(Item item);

}
