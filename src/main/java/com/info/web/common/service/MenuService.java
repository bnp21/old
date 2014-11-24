package com.info.web.common.service;

import com.info.web.domain.Menu;

import java.util.List;


/**
 * <pre>
 * 계정 서비스 인터페이스.
 * </pre>
 *
 * @author 임세환
 * @version 1.0, 2013.12.11
 */
public interface MenuService {

    /**
     * 회원정보 목록 조회
     *
     * @return 공지사항 목록
     */
    public List<Menu> selectMenuList(Menu menu);

    public List<Menu> selectOutMenuList();

    /*메뉴 데이터 수정*/
    public int updateMenu(Menu menu);
    /*메뉴 데이터 수정*/
    public int updateMenuNewLetter(Menu menu);
}
