package com.info.framework.batch.dao;

import com.info.web.domain.*;
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
@Repository("batchDao")
public class BatchDaoImpl implements BatchDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public List<Batch> selectBatchList() {
        return sqlSessionTemplate.selectList("Batch.selectBatchList");
    }

    public List<Batch> getBatchData001List(Batch batch) {
        return sqlSessionTemplate.selectList("Batch.getBatchData001List",batch);
    }
    public List<Batch> getBatchData001CList(Batch batch) {
        return sqlSessionTemplate.selectList("Batch.getBatchData001CList",batch);
    }
    public List<Batch> getBatchData001YList(Batch batch) {
        return sqlSessionTemplate.selectList("Batch.getBatchData001YList",batch);
    }

    public int deleteBatch001(){
        return sqlSessionTemplate.delete("Batch.deleteBatch001");
    }
    public int deleteBatch001Y(){
        return sqlSessionTemplate.delete("Batch.deleteBatch001Y");
    }
    public int deleteBatch001C(){
        return sqlSessionTemplate.delete("Batch.deleteBatch001C");
    }

    public int insertBatch001(){
        return sqlSessionTemplate.insert("Batch.insertBatch001");
    }

    public int insertBatch001C(){
        return sqlSessionTemplate.insert("Batch.insertBatch001C");
    }

    public int insertBatch001Y(){
        return sqlSessionTemplate.insert("Batch.insertBatch001Y");
    }

    public int deleteBatch002(){
        return sqlSessionTemplate.delete("Batch.deleteBatch002");
    }

    public int insertBatch002(){
        return sqlSessionTemplate.insert("Batch.insertBatch002");
    }
    public int deleteBatch002_JP(){
        return sqlSessionTemplate.delete("Batch.deleteBatch002_JP");
    }

    public int insertBatch002_JP(){
        return sqlSessionTemplate.insert("Batch.insertBatch002_JP");
    }

    public int insertBatch003(){
        return sqlSessionTemplate.insert("Batch.insertBatch003");
    }

    public int deleteBath004(){
        return sqlSessionTemplate.delete("Batch.deleteBath004");
    }

    public int insertBatch004(){
        return sqlSessionTemplate.insert("Batch.insertBatch004");
    }

    public int deleteBath005(){
        return sqlSessionTemplate.delete("Batch.deleteBath005");
    }

    public int insertBatch005(){
        return sqlSessionTemplate.insert("Batch.insertBatch005");
    }

    public int insertBatch005_01(){
        return sqlSessionTemplate.insert("Batch.insertBatch005_01");
    }

    //수출기상도
    public Batch getBatchData006(Batch batch){
        return sqlSessionTemplate.selectOne("Batch.getBatchData006", batch);
    }

    public void insertBatch006(Batch batch){
        sqlSessionTemplate.insert("Batch.insertBatch006", batch);
    }

    public void insertBatch008(Batch batch){
        sqlSessionTemplate.insert("Batch.insertBatch008", batch);
    }

    public void insertBatch009(Batch batch){
        sqlSessionTemplate.insert("Batch.insertBatch009", batch);
    }

    public void insertBatch009_01(Batch batch){
        sqlSessionTemplate.insert("Batch.insertBatch009_01", batch);
    }

    public void insertBatch009_02(Batch batch){
        sqlSessionTemplate.insert("Batch.insertBatch009_02", batch);
    }

    public void insertBatch010(Batch batch){
        sqlSessionTemplate.insert("Batch.insertBatch010", batch);
    }

    public void insertBatch011(Batch batch){
        sqlSessionTemplate.insert("Batch.insertBatch011", batch);
    }

    //뉴스래터
    public void insertBatch007(NewsLetter newsLetter){
        sqlSessionTemplate.insert("Batch.insertBatch007",newsLetter);
    }
    //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
    public void updateMenu(Batch batch){
        sqlSessionTemplate.insert("Batch.updateMenu",batch);
    }

}