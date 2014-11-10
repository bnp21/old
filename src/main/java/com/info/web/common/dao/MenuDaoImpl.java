package com.info.web.common.dao;

import com.info.web.domain.Menu;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <pre>
 * 계정 DAO 구현체.
 * </pre>
 *
 * @author 임세환
 * @version 1.0, 2013.12.11
 */
@Repository("menuDao")
public class MenuDaoImpl implements MenuDao {
    private static final Logger logger = LoggerFactory.getLogger(MenuDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public List<Menu> selectMenuList(Menu menu) {
        return sqlSessionTemplate.selectList("Menu.selectMenuList", menu);
    }


    public List<Menu> selectOutMenuList() {
        return sqlSessionTemplate.selectList("Menu.selectOutMenuList");
    }


    public int updateMenu(Menu menu) {
        return sqlSessionTemplate.update("Menu.updateMenu", menu);
    }


}