package com.info.web.makegarden.dao;

import com.info.web.domain.Email;
import com.info.web.domain.FileInfo;
import com.info.web.domain.MakeGarden;
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
@Repository("makeGardenDao")
public class MakeGardenDaoImpl implements MakeGardenDao {
    private static final Logger logger = LoggerFactory.getLogger(MakeGardenDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public List<MakeGarden> selectMakeGardenList(MakeGarden makeGarden) {
        return sqlSessionTemplate.selectList("MakeGarden.selectMakeGardenList", makeGarden);
    }


    public  MakeGarden selectMakeGardenView(MakeGarden makeGarden){
        return sqlSessionTemplate.selectOne("MakeGarden.selectMakeGardenView", makeGarden);
    };


    public int insertMakeGarden(MakeGarden makeGarden) {
        return sqlSessionTemplate.insert("MakeGarden.insertMakeGarden", makeGarden);
    }


    public int updateMakeGarden(MakeGarden makeGarden) {
        return sqlSessionTemplate.update("MakeGarden.updateMakeGarden", makeGarden);
    }

    public List<Email> getEmailReceivers(Email email) {
        return sqlSessionTemplate.selectList("MakeGarden.getEmailReceivers", email);
    }
}