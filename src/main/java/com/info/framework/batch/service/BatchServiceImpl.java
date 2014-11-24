package com.info.framework.batch.service;

import com.info.framework.batch.dao.BatchDao;
import com.info.web.common.dao.NewsLetterDao;
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

    @Autowired
    private NewsLetterDao newsLetterDao;


    //샘플 배치
    public List<Batch> selectBatchList() {

        return batchDao.selectBatchList();
    }

    //KATI, 화훼시세 - 절화
    public void getBatchData001() {

        Batch batch=new Batch();
        List<Batch> list = batchDao.getBatchData001List(batch);

        System.out.println("배치시작!!!!!!! NN list==>"+list);
        System.out.println("배치시작!!!!!!! NN list.size==>"+list.size());

        if(list != null || list.size()>0) {
            System.out.println("배치시작!!!!!!! NN");
            batchDao.deleteBatch001();
            batchDao.insertBatch001();
            System.out.println("배치끝!!!!!!! NN");
        }
    }
    //KATI, 화훼시세 - 관엽
    public void getBatchData001C() {

        Batch batch=new Batch();
        List<Batch> list = batchDao.getBatchData001CList(batch);

        System.out.println("배치시작!!!!!!! CC list==>"+list);
        System.out.println("배치시작!!!!!!! CC list.size==>"+list.size());

        if(list != null || list.size()>0) {
            System.out.println("배치시작!!!!!!! CC");
            batchDao.deleteBatch001C();
            batchDao.insertBatch001C();
            System.out.println("배치끝!!!!!!! CC");
        }
    }
    //KATI, 화훼시세 - 난
    public void getBatchData001Y() {

        Batch batch=new Batch();
        List<Batch> list = batchDao.getBatchData001YList(batch);

        System.out.println("배치시작!!!!!!! YY list==>"+list);
        System.out.println("배치시작!!!!!!! YY list.size==>"+list.size());

        if(list != null || list.size()>0) {
            System.out.println("배치시작!!!!!!! YY");
            batchDao.deleteBatch001Y();
            batchDao.insertBatch001Y();
            System.out.println("배치끝!!!!!!! YY");
        }

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Batch menu=new Batch();
        menu.setId(16);
        batchDao.updateMenu(menu);

    }


    //KATI, 해외도소매가격식품
    public void getBatchData002() {

        //System.out.println("deleteBatch002 배치시작!!!!!!!");
        batchDao.deleteBatch002();
        //System.out.println("deleteBatch002 배치끝!!!!!!!");
        //System.out.println("getBatchData002 배치시작!!!!!!!");
        batchDao.insertBatch002();
        //System.out.println("getBatchData002 배치끝!!!!!!!");

        //System.out.println("deleteBatch002_JP 배치시작!!!!!!!");
        batchDao.deleteBatch002_JP();
        //System.out.println("deleteBatch002_JP 배치끝!!!!!!!");
        //System.out.println("getBatchData002_JP 배치시작!!!!!!!");
        batchDao.insertBatch002_JP();
        //System.out.println("getBatchData002_JP 배치끝!!!!!!!");

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Batch menu=new Batch();
        menu.setId(11);
        batchDao.updateMenu(menu);

    }


    //aT센터, 최근소식
    public void getBatchData003() {

        //System.out.println("getBatchData003 배치시작!!!!!!!");
        batchDao.insertBatch003();
        //System.out.println("getBatchData003 배치끝!!!!!!!");
    }

    //유통교육원, 연간교육일정
    public void getBatchData004() {

        //System.out.println("getBatchData004 배치시작!!!!!!!");
        batchDao.insertBatch004();
        //System.out.println("getBatchData004 배치끝!!!!!!!");
    }

    //농축수산물소매가격일일동향 default 10개 표시
    public void getBatchData005() {
        //System.out.println("getBatchData005 배치시작!!!!!!!");
        batchDao.insertBatch005();
        //System.out.println("getBatchData005 배치끝!!!!!!!");
        //System.out.println("insertBatch005_01 배치시작!!!!!!!");
        batchDao.insertBatch005_01();
        //System.out.println("insertBatch005_01 배치끝!!!!!!!");
        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Batch menu=new Batch();
        menu.setId(2);
        batchDao.updateMenu(menu);
    }


    //KATIS 수출기상도
    public void getBatchData006() {

        System.out.println("getBatchData006 배치시작!!!!!!!");
        Batch param=new Batch();
        Batch batch = batchDao.getBatchData006(param);

        System.out.println("batch==>"+batch);
        System.out.println("getBatchData006 배치끝!!!!!!!");

        if(batch!=null) {
            System.out.println("batch.pkYear==>"+batch.getPkYear());
            System.out.println("batch.pkMonth==>"+batch.getPkMonth());
            System.out.println("batch.pkWeek==>"+batch.getPkWeek());
            System.out.println("insertBatch006 배치시작!!!!!!!");
            batchDao.insertBatch006(batch);
            System.out.println("insertBatch006 배치끝!!!!!!!");

            System.out.println("insertBatch008 배치시작!!!!!!!");
            batchDao.insertBatch008(batch);
            System.out.println("insertBatch008 배치끝!!!!!!!");

            System.out.println("insertBatch009 배치시작!!!!!!!");
            batchDao.insertBatch009(batch);
            System.out.println("insertBatch009 배치끝!!!!!!!");

            System.out.println("insertBatch009_01 배치시작!!!!!!!");
            batchDao.insertBatch009_01(batch);
            System.out.println("insertBatch009_01 배치끝!!!!!!!");

            System.out.println("insertBatch009_02 배치시작!!!!!!!");
            batchDao.insertBatch009_02(batch);
            System.out.println("insertBatch009_02 배치끝!!!!!!!");

            System.out.println("insertBatch010 배치시작!!!!!!!");
            batchDao.insertBatch010(batch);
            System.out.println("insertBatch010 배치끝!!!!!!!");

            System.out.println("insertBatch011 배치시작!!!!!!!");
            batchDao.insertBatch011(batch);
            System.out.println("insertBatch011 배치끝!!!!!!!");

            //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
            Batch menu = new Batch();
            menu.setId(6);
            batchDao.updateMenu(menu);
        }
    }
    //KATIS 뉴스레터 - MYSQL로 연결
    public void getBatchData007() {

        System.out.println("insertBatch007 배치시작!!!!!!!");
        NewsLetter newsLetter=new NewsLetter();
        //List<NewsLetter> newsLettersList=newsLetterDao.selectNewsLetterList(newsLetter);
        List<NewsLetter> newsLettersList=newsLetter.selectNewsLetterList(newsLetter);

        System.out.println("newsLettersList==>"+newsLettersList);
        System.out.println("newsLettersList size==>"+newsLettersList.size());

        if(newsLettersList!=null || !newsLettersList.equals("[]") || newsLettersList.size()>0){

            //for (int i = 0; i < 1; i++) {   //맨 첫번째거만 입력함
                NewsLetter result=newsLettersList.get(0);
                System.out.println(0+"번째 title==>"+result.getTitle());
                System.out.println(0+"번째 img==>"+result.getImg());
                batchDao.insertBatch007(result);
            //}

        }
        System.out.println("insertBatch007 배치끝!!!!!!!");

        //메인화면에서 수정된거 먼저가져오도록 업데이트 날짜 셋팅함
        Batch menu=new Batch();
        menu.setId(5);
        batchDao.updateMenu(menu);

    }

}
