package com.info.web.notice.service;

import com.info.framework.crypto.SimpleCrypto;
import com.info.web.domain.FileInfo;
import com.info.web.domain.Notice;
import com.info.web.notice.dao.NoticeDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * <pre>
 * 계정 서비스 구현체.
 * </pre>
 *
 * @author 임세환
 * @version 1.0, 2013.12.11
 */
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
    private static Logger LOGGER = LoggerFactory.getLogger(NoticeServiceImpl.class);

    @Autowired
    private NoticeDao noticeDao;


    public List<Notice> selectNoticeList(Notice notice) {
        return noticeDao.selectNoticeList(notice);
    }


    public int selectNoticeCount(){
        return noticeDao.selectNoticeCount();
    }


    public List<Notice> selectNoticePagingList(Notice notice) {
        return noticeDao.selectNoticePagingList(notice);
    }


    public Notice selectNoticeView(Notice notice) {
        return noticeDao.selectNoticeView(notice);
    }


    public int selectNoticeViewCnt(Notice notice){
        return noticeDao.selectNoticeViewCnt(notice);
    }


    public List<Notice> selectNoticeFileList(Notice notice) {
        return noticeDao.selectNoticeFileList(notice);
    }

    @Transactional

    public int insertNotice(Notice notice) {
        int insertCount = 0;

        boolean result = false;

        insertCount = noticeDao.insertNotice(notice);

        LOGGER.info("insertCount : " + insertCount);
        if (insertCount > 0) {
            LOGGER.info("등록 처리");
        }else {
            LOGGER.info("등록 오류");
        }

        return insertCount;
    }

    @Transactional

    public int updateNotice(Notice notice) {
        int updateCount = 0;

        boolean result = false;

        updateCount = noticeDao.updateNotice(notice);

        LOGGER.info("insertCount : " + updateCount);
        if (updateCount > 0) {
            LOGGER.info("등록처리");
        }else {
            LOGGER.info("등록오류");
        }

        return updateCount;
    }

    @Transactional

    public int deleteNotice(Integer seq) {
        int deleteCount = 0;

        deleteCount = noticeDao.deleteNotice(seq);

        LOGGER.info("deleteCount : " + deleteCount);
        if (deleteCount > 0) {
            LOGGER.info("삭제 처리");
        }else {
            LOGGER.info("삭제 오류");
        }

        return deleteCount;
    }

    @Transactional

    public int selectFileSeq() {
        int fileseq = 0;

        fileseq = noticeDao.selectFileSeq();

        if (fileseq > 0) {
            LOGGER.info("파일SEQ 가져오기 성공");
        }else {
            LOGGER.info("파일SEQ 가져오기 오류");
        }

        return fileseq;
    }

    @Transactional

    public int selectFileNo(Integer seq) {
        int fileseq = 0;

        fileseq = noticeDao.selectFileNo(seq);

        if (fileseq > 0) {
            LOGGER.info("파일SEQ 가져오기 성공");
        }else {
            LOGGER.info("파일SEQ 가져오기 오류");
        }

        return fileseq;
    }

    @Transactional

    public int selectFileCount(Integer seq) {
        int filecount = 0;

        filecount = noticeDao.selectFileCount(seq);

        return filecount;
    }

    /*파일 등록*/
    @Transactional

    public int insertNoticeFile(FileInfo fileInfo) {
        int insertCount = 0;

        boolean result = false;

        insertCount = noticeDao.insertNoticeFile(fileInfo);

        if (insertCount > 0) {
            LOGGER.info("등록 처리");
        }else {
            LOGGER.info("등록 오류");
        }

        return insertCount;
    }

    /*파일 수정*/
    @Transactional

    public int updateNoticeFile(FileInfo fileInfo) {
        int updateCount = 0;

        updateCount = noticeDao.updateNoticeFile(fileInfo);

        if (updateCount > 0) {
            LOGGER.info("수정 처리");
        }else {
            LOGGER.info("수정 오류");
        }

        return updateCount;
    }

    @Transactional

    public int deleteNoticeFile(FileInfo fileInfo) {
        int deleteCount = 0;

        deleteCount = noticeDao.deleteNoticeFile(fileInfo);

        LOGGER.info("deleteCount : " + deleteCount);
        if (deleteCount > 0) {
            LOGGER.info("삭제 처리");
        }else {
            LOGGER.info("삭제 오류");
        }

        return deleteCount;
    }
}
