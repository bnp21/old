package com.info.framework.batch.service;

import com.info.framework.batch.dao.BatchDao;
import com.info.web.domain.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * <pre>
 * 배치 서비스 구현체.
 * </pre>
 *
 * @author 임세환
 * @version 1.0, 2013.12.11
 */
@Service("batchService")
public class BatchServiceImpl implements BatchService {

    @Autowired
    private BatchDao batchDao;


    //샘플 배치
    public List<Batch> selectBatchList() {
        System.out.println("batch test");

        return batchDao.selectBatchList();
    }

    //KATI, 화훼시세
    public void getBatchData001() {
        System.out.println("배치시작!!!!!!! NN");
        batchDao.deleteBatch001();
        batchDao.insertBatch001();
        System.out.println("배치끝!!!!!!! NN");
    }
    //KATI, 화훼시세
    public void getBatchData001C() {
        System.out.println("배치시작!!!!!!! CC");
        batchDao.deleteBatch001C();
        batchDao.insertBatch001C();
        System.out.println("배치끝!!!!!!! CC");
    }
    //KATI, 화훼시세
    public void getBatchData001Y() {
        System.out.println("배치시작!!!!!!! YY");
        batchDao.deleteBatch001Y();
        batchDao.insertBatch001Y();
        System.out.println("배치끝!!!!!!! YY");

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Batch menu=new Batch();
        menu.setId(16);
        batchDao.updateMenu(menu);

    }


    //KATI, 해외도소매가격식품
    public void getBatchData002() {

        System.out.println("getBatchData002 배치시작!!!!!!!");
        batchDao.deleteBatch002();
        batchDao.insertBatch002();

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Batch menu=new Batch();
        menu.setId(11);
        batchDao.updateMenu(menu);

        System.out.println("getBatchData002 배치끝!!!!!!!");
    }


    //aT센터, 최근소식
    public void getBatchData003() {

        System.out.println("getBatchData003 배치시작!!!!!!!");
        batchDao.insertBatch003();
        System.out.println("getBatchData003 배치끝!!!!!!!");
    }

    //유통교육원, 연간교육일정
    public void getBatchData004() {

        System.out.println("getBatchData004 배치시작!!!!!!!");
        batchDao.insertBatch004();
        System.out.println("getBatchData004 배치끝!!!!!!!");
    }

    //농축수산물소매가격일일동향 default 10개 표시
    public void getBatchData005() {
        System.out.println("getBatchData005 배치시작!!!!!!!");
        batchDao.insertBatch005();
        System.out.println("getBatchData005 배치끝!!!!!!!");
        System.out.println("insertBatch005_01 배치시작!!!!!!!");
        batchDao.insertBatch005_01();

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Batch menu=new Batch();
        menu.setId(2);
        batchDao.updateMenu(menu);

        System.out.println("insertBatch005_01 배치끝!!!!!!!");
    }


    //KATIS 수출기상도
    public void getBatchData006() {

        Price price = new Price();
        String today = "";
        price.setPkDate(today);

       // batchDao.deleteBath006(price);
        System.out.println("insertBatch006 배치시작!!!!!!!");
        batchDao.insertBatch006();
        System.out.println("insertBatch006 배치끝!!!!!!!");

        System.out.println("insertBatch008 배치시작!!!!!!!");
        batchDao.insertBatch008();
        System.out.println("insertBatch008 배치끝!!!!!!!");

        System.out.println("insertBatch009 배치시작!!!!!!!");
        batchDao.insertBatch009();
        System.out.println("insertBatch009 배치끝!!!!!!!");

        System.out.println("insertBatch009_01 배치시작!!!!!!!");
        batchDao.insertBatch009_01();
        System.out.println("insertBatch009_01 배치끝!!!!!!!");

        System.out.println("insertBatch009_02 배치시작!!!!!!!");
        batchDao.insertBatch009_02();
        System.out.println("insertBatch009_02 배치끝!!!!!!!");

        System.out.println("insertBatch010 배치시작!!!!!!!");
        batchDao.insertBatch010();
        System.out.println("insertBatch010 배치끝!!!!!!!");

        System.out.println("insertBatch011 배치시작!!!!!!!");
        batchDao.insertBatch011();
        System.out.println("insertBatch011 배치끝!!!!!!!");

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Batch menu=new Batch();
        menu.setId(6);
        batchDao.updateMenu(menu);

    }

}
