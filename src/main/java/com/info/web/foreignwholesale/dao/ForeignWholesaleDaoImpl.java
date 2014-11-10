package com.info.web.foreignwholesale.dao;

import com.info.web.domain.ForeignWholesale;
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
@Repository("foreignWholesaleDao")
public class ForeignWholesaleDaoImpl implements ForeignWholesaleDao {
    private static final Logger logger = LoggerFactory.getLogger(ForeignWholesaleDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public List<ForeignWholesale> selectForeignWholesaleList(ForeignWholesale foreignWholesale) {
        return sqlSessionTemplate.selectList("ForeignWholesale.selectForeignWholesaleList", foreignWholesale);
    }


    public ForeignWholesale selectForeignWholesaleTop(ForeignWholesale foreignWholesale) {
        return sqlSessionTemplate.selectOne("ForeignWholesale.selectForeignWholesaleTop", foreignWholesale);
    }
}