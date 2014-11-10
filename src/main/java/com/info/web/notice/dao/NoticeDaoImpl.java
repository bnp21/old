package com.info.web.notice.dao;

import com.info.web.domain.FileInfo;
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
@Repository("noticeDao")
public class NoticeDaoImpl implements NoticeDao {
    private static final Logger logger = LoggerFactory.getLogger(NoticeDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;



    public List<Notice> selectNoticeList(Notice notice) {
        return sqlSessionTemplate.selectList("Notice.selectNoticeList", notice);
    }


    public int selectNoticeViewCnt(Notice notice){
        return sqlSessionTemplate.update("Notice.selectNoticeViewCnt", notice);
    }


    public int selectNoticeCount(){
        return sqlSessionTemplate.selectOne("Notice.selectNoticeCount");
    }


    public List<Notice> selectNoticeFileList(Notice notice) {
        return sqlSessionTemplate.selectList("Notice.selectNoticeFileList", notice);
    }


    public List<Notice> selectNoticePagingList(Notice notice) {
        return sqlSessionTemplate.selectList("Notice.selectNoticePagingList", notice);
    }


    public Notice selectNoticeView(Notice notice) {
        return sqlSessionTemplate.selectOne("Notice.selectNoticeView", notice);
    }


    public  int insertNotice(Notice notice) {
        return sqlSessionTemplate.insert("Notice.insertNotice", notice);
    }



    public  int updateNotice(Notice notice) {
        return sqlSessionTemplate.update("Notice.updateNotice", notice);
    }


    public  int deleteNotice(Integer seq) {
        return sqlSessionTemplate.update("Notice.deleteNotice", seq);
    }


    public  int selectFileSeq() {
        return sqlSessionTemplate.selectOne("Notice.selectFileSeq");
    }


    public  int selectFileNo(Integer seq) {
        return sqlSessionTemplate.selectOne("Notice.selectFileNo",seq);
    }


    public  int selectFileCount(Integer seq) {
        return sqlSessionTemplate.selectOne("Notice.selectFileCount", seq);
    }


    public  int insertNoticeFile(FileInfo fileInfo) {
        return sqlSessionTemplate.insert("Notice.insertNoticeFile", fileInfo);
    }


    public  int updateNoticeFile(FileInfo fileInfo) {
        return sqlSessionTemplate.update("Notice.updateNoticeFile", fileInfo);
    }


    public  int deleteNoticeFile(FileInfo fileInfo) {
        return sqlSessionTemplate.update("Notice.deleteNoticeFile", fileInfo);
    }
}