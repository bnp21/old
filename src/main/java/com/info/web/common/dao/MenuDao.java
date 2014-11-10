package com.info.web.common.dao;

import com.info.web.domain.Menu;

import java.util.List;


public interface MenuDao {

    /**
     * 공지사항 목록 조회
     *
     * @return 공지사항 목록
     */
    public List<Menu> selectMenuList(Menu menu);

    /*메뉴 데이터 수정*/
    public int updateMenu(Menu menu);

    public List<Menu> selectOutMenuList();
}