package com.info.web.foreignwholesale.service;

import com.info.web.domain.ForeignWholesale;
import com.info.web.foreignwholesale.dao.ForeignWholesaleDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * <pre>
 * 계정 서비스 구현체.
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.08
 */
@Service("foreignWholesaleService")
public class ForeignWholesaleServiceImpl implements ForeignWholesaleService {
    private static Logger LOGGER = LoggerFactory.getLogger(ForeignWholesaleServiceImpl.class);

    @Autowired
    private ForeignWholesaleDao foreignWholesaleDao;


    public List<ForeignWholesale> selectForeignWholesaleList(ForeignWholesale foreignWholesale) {
        return foreignWholesaleDao.selectForeignWholesaleList(foreignWholesale);
    }


    public ForeignWholesale selectForeignWholesaleTop(ForeignWholesale foreignWholesale) {
        return foreignWholesaleDao.selectForeignWholesaleTop(foreignWholesale);
    }
}
