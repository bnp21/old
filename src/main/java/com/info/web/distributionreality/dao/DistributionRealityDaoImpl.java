package com.info.web.distributionreality.dao;

import com.info.web.domain.DistributionReality;
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
@Repository("distributionRealityDao")
public class DistributionRealityDaoImpl implements DistributionRealityDao {
    private static final Logger logger = LoggerFactory.getLogger(DistributionRealityDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public List<DistributionReality> selectDistributionRealityList(DistributionReality distributionReality) {
        return sqlSessionTemplate.selectList("DistributionReality.selectDistributionRealityList", distributionReality);
    }


    public int selectDistributionRealitySeq() {
        return sqlSessionTemplate.selectOne("DistributionReality.selectDistributionRealitySeq");
    }


    public List<DistributionReality> selectDistributionRealityFrontList() {
        return sqlSessionTemplate.selectList("DistributionReality.selectDistributionRealityFrontList");
    }


    public DistributionReality selectDistributionRealityView(DistributionReality distributionReality) {
        return sqlSessionTemplate.selectOne("DistributionReality.selectDistributionRealityView", distributionReality);
    }


    public int insertDistributionReality(DistributionReality distributionReality) {
        return sqlSessionTemplate.insert("DistributionReality.insertDistributionReality", distributionReality);
    }


    public int updateDistributionReality(DistributionReality distributionReality) {
        return sqlSessionTemplate.update("DistributionReality.updateDistributionReality", distributionReality);
    }


    public int deleteDistributionReality(DistributionReality distributionReality) {
        return sqlSessionTemplate.delete("DistributionReality.deleteDistributionReality", distributionReality);
    }


    public List<DistributionReality> selectDistributionRealityItemList(DistributionReality distributionReality) {
        return sqlSessionTemplate.selectList("DistributionReality.selectDistributionRealityItemList", distributionReality);
    }


    public int insertDistributionRealityItem(DistributionReality distributionReality) {
        return sqlSessionTemplate.insert("DistributionReality.insertDistributionRealityItem", distributionReality);
    }


    public int updateDistributionRealityItem(DistributionReality distributionReality) {
        return sqlSessionTemplate.update("DistributionReality.updateDistributionRealityItem", distributionReality);
    }


    public int deleteDistributionRealityItem(DistributionReality distributionReality) {
        return sqlSessionTemplate.delete("DistributionReality.deleteDistributionRealityItem", distributionReality);
    }
}