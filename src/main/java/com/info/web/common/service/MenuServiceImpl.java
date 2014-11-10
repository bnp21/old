package com.info.web.common.service;

import com.info.web.common.dao.MenuDao;
import com.info.web.domain.Menu;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * <pre>
 * 계정 서비스 구현체.
 * </pre>
 *
 * @author 임세환
 * @version 1.0, 2013.12.11
 */
@Service("menuService")
public class MenuServiceImpl implements MenuService {
    private static Logger LOGGER = LoggerFactory.getLogger(MenuServiceImpl.class);

    @Autowired
    private MenuDao menuDao;


    public List<Menu> selectMenuList(Menu menu) {
        return menuDao.selectMenuList(menu);
    }


    public List<Menu> selectOutMenuList() {
        return menuDao.selectOutMenuList();
    }


    public int updateMenu(Menu menu) {
        return menuDao.updateMenu(menu);
    }
}
