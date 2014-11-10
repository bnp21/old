package com.info.web.atnews.service;

import com.info.framework.crypto.SimpleCrypto;
import com.info.web.atnews.dao.AtnewsDao;
import com.info.web.domain.Account;
import com.info.web.domain.Atnews;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * <pre>
 * AT소식 구현체.
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.10
 */
@Service("atnewsService")
public class AtnewsServiceImpl implements AtnewsService {
    private static Logger LOGGER = LoggerFactory.getLogger(AtnewsServiceImpl.class);

    @Autowired
    private AtnewsDao atnewsDao;


    public List<Atnews> selectAtnewsList(Atnews atnews) {
        return atnewsDao.selectAtnewsList(atnews);
    }
}
