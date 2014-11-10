package com.info.web.distributionreality.service;

import com.info.web.distributionreality.dao.DistributionRealityDao;
import com.info.web.domain.DistributionReality;
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
@Service("distributionRealityService")
public class DistributionRealityServiceImpl implements DistributionRealityService {
    private static Logger LOGGER = LoggerFactory.getLogger(DistributionRealityServiceImpl.class);

    @Autowired
    private DistributionRealityDao distributionRealityDao;


    public List<DistributionReality> selectDistributionRealityList(DistributionReality distributionReality) {
        return distributionRealityDao.selectDistributionRealityList(distributionReality);
    }


    public int selectDistributionRealitySeq(){
        return distributionRealityDao.selectDistributionRealitySeq();
    }


    public List<DistributionReality> selectDistributionRealityFrontList(){
        return distributionRealityDao.selectDistributionRealityFrontList();
    }


    public DistributionReality selectDistributionRealityView(DistributionReality distributionReality) {
        return distributionRealityDao.selectDistributionRealityView(distributionReality);
    }


    public int insertDistributionReality(DistributionReality distributionReality) {
        return distributionRealityDao.insertDistributionReality(distributionReality);
    }


    public int updateDistributionReality(DistributionReality distributionReality) {
        return distributionRealityDao.updateDistributionReality(distributionReality);
    }


    public int deleteDistributionReality(DistributionReality distributionReality) {
        return distributionRealityDao.deleteDistributionReality(distributionReality);
    }


    public List<DistributionReality> selectDistributionRealityItemList(DistributionReality distributionReality) {
        return distributionRealityDao.selectDistributionRealityItemList(distributionReality);
    }


    public int insertDistributionRealityItem(DistributionReality distributionReality) {
        return distributionRealityDao.insertDistributionRealityItem(distributionReality);
    }


    public int updateDistributionRealityItem(DistributionReality distributionReality) {
        return distributionRealityDao.updateDistributionRealityItem(distributionReality);
    }


    public int deleteDistributionRealityItem(DistributionReality distributionReality) {
        return distributionRealityDao.deleteDistributionRealityItem(distributionReality);
    }
}
