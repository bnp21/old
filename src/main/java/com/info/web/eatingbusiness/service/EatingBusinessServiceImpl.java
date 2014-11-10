package com.info.web.eatingbusiness.service;

import com.info.web.domain.EatingBusiness;
import com.info.web.eatingbusiness.dao.EatingBusinessDao;
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
@Service("eatingBusinessService")
public class EatingBusinessServiceImpl implements EatingBusinessService {
    private static Logger LOGGER = LoggerFactory.getLogger(EatingBusinessServiceImpl.class);

    @Autowired
    private EatingBusinessDao eatingBusinessDao;


    public List<EatingBusiness> selectEatingBusinessList(EatingBusiness eatingBusiness) {
        return eatingBusinessDao.selectEatingBusinessList(eatingBusiness);
    }


    public int selectEatingBusinessGroupCode(){
        return eatingBusinessDao.selectEatingBusinessGroupCode();
    }


    public EatingBusiness selectEatingBusinessTop(){
        return eatingBusinessDao.selectEatingBusinessTop();
    }


    public int insertEatingBusiness(EatingBusiness eatingBusiness) {
        return eatingBusinessDao.insertEatingBusiness(eatingBusiness);
    }


    public int updateEatingBusiness(EatingBusiness eatingBusiness) {
        return eatingBusinessDao.updateEatingBusiness(eatingBusiness);
    }


    public List<EatingBusiness> selectEatingBusinessComment(EatingBusiness eatingBusiness){
        return eatingBusinessDao.selectEatingBusinessComment(eatingBusiness);
    }


    public int insertEatingBusinessComment(EatingBusiness eatingBusiness) {
        return eatingBusinessDao.insertEatingBusinessComment(eatingBusiness);
    }


    public int updateEatingBusinessComment(EatingBusiness eatingBusiness) {
        return eatingBusinessDao.updateEatingBusinessComment(eatingBusiness);
    }
    public int deleteEatingBusiness(EatingBusiness eatingBusiness) {
        return eatingBusinessDao.deleteEatingBusiness(eatingBusiness);
    }
}
