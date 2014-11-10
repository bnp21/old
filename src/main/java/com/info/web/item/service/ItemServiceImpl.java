package com.info.web.item.service;

import com.info.web.domain.FileInfo;
import com.info.web.domain.Item;
import com.info.web.domain.Notice;
import com.info.web.item.dao.ItemDao;
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
@Service("itemService")
public class ItemServiceImpl implements ItemService {
    private static Logger LOGGER = LoggerFactory.getLogger(ItemServiceImpl.class);

    @Autowired
    private ItemDao itemDao;


    public List<Item> selectItemList(Item item) {
        return itemDao.selectItemList(item);
    }

}
