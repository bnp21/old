package com.info.web.item.dao;

import com.info.web.domain.FileInfo;
import com.info.web.domain.Item;
import com.info.web.domain.Notice;
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
@Repository("itemDao")
public class ItemDaoImpl implements ItemDao {
    private static final Logger logger = LoggerFactory.getLogger(ItemDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public List<Item> selectItemList(Item item) {
        return sqlSessionTemplate.selectList("Item.selectItemList", item);
    }

}