package com.info.web.eatingbusiness.dao;

import com.info.web.domain.EatingBusiness;
import org.mybatis.spring.SqlSessionTemplate;
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
@Repository("eatingBusinessDao")
public class EatingBusinessDaoImpl implements EatingBusinessDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public List<EatingBusiness> selectEatingBusinessList(EatingBusiness eatingBusiness) {
        return sqlSessionTemplate.selectList("EatingBusiness.selectEatingBusinessList", eatingBusiness);
    }


    public int selectEatingBusinessGroupCode(){
        return sqlSessionTemplate.selectOne("EatingBusiness.selectEatingBusinessGroupCode");
    }


    public EatingBusiness selectEatingBusinessTop(){
        return sqlSessionTemplate.selectOne("EatingBusiness.selectEatingBusinessTop");
    }


    public int insertEatingBusiness(EatingBusiness eatingBusiness) {
        return sqlSessionTemplate.insert("EatingBusiness.insertEatingBusiness", eatingBusiness);
    }


    public int updateEatingBusiness(EatingBusiness eatingBusiness) {
        return sqlSessionTemplate.update("EatingBusiness.updateEatingBusiness", eatingBusiness);
    }


    public List<EatingBusiness> selectEatingBusinessComment(EatingBusiness eatingBusiness){
        return sqlSessionTemplate.selectList("EatingBusiness.selectEatingBusinessComment",eatingBusiness);
    }


    public int insertEatingBusinessComment(EatingBusiness eatingBusiness) {
        return sqlSessionTemplate.insert("EatingBusiness.insertEatingBusinessComment", eatingBusiness);
    }


    public int updateEatingBusinessComment(EatingBusiness eatingBusiness) {
        return sqlSessionTemplate.update("EatingBusiness.updateEatingBusinessComment", eatingBusiness);
    }
    public int deleteEatingBusiness(EatingBusiness eatingBusiness) {
        return sqlSessionTemplate.update("EatingBusiness.deleteEatingBusiness", eatingBusiness);
    }
}