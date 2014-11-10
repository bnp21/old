package com.info.web.notice.dao;

import com.info.web.domain.FileInfo;
import com.info.web.domain.Notice;

import java.util.List;


/**
 * <pre>
 * 계정 DAO 인터페이스.
 * </pre>
 *
 * @author 임세환
 * @version 1.0, 2013.12.11
 */
public interface NoticeDao {

    /**
     * 공지사항 목록 조회
     *
     * @param notice
     * @return 공지사항 목록
     */
    public List<Notice> selectNoticeList(Notice notice);

    public int selectNoticeCount();

    public List<Notice> selectNoticePagingList(Notice notice);

    public Notice selectNoticeView(Notice notice);

    public int insertNotice(Notice notice);

    public int updateNotice(Notice notice);

    public int deleteNotice(Integer seq);

    public List<Notice> selectNoticeFileList(Notice notice);

    /*조회수*/
    public int selectNoticeViewCnt(Notice notice);

    /*파일 키값 가져오기*/
    public int selectFileSeq();

    /*파일 NO 가져오기*/
    public int selectFileNo(Integer seq);

    /*파일 카운트 가져오기*/
    public int selectFileCount(Integer seq);

    /*파일 등록*/
    public int insertNoticeFile(FileInfo fileInfo);

    /*파일 수정*/
    public int updateNoticeFile(FileInfo fileInfo);

    /*파일 삭제*/
    public int deleteNoticeFile(FileInfo fileInfo);
}
