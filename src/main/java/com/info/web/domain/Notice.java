package com.info.web.domain;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class Notice {

    private static final long serialVersionUID = 1L;
    //게시물 ID
    private Integer seq;
    //게시판 ID
    private String  title;

    private String  contents;

    private String  delYn;

    private String  topYn;

    private String  regdate;

    private String  moddate;

    private String filemime;

    private Integer  accountId;

    private Integer viewcnt;

    private Integer fileSeq;

    private Integer fileNo;

    private String filename;

    private String delfile;

    private Integer filesize;

    private String realFilename;

    /*페이징*/
    private Integer totalCount;
    private Integer listNum;
    private Integer nowPage;
    private Integer pageSize;

    public Integer getFilesize() {
        return filesize;
    }

    public void setFilesize(Integer filesize) {
        this.filesize = filesize;
    }

    public String getFilemime() {
        return filemime;
    }

    public void setFilemime(String filemime) {
        this.filemime = filemime;
    }

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getDelYn() {
        return delYn;
    }

    public void setDelYn(String delYn) {
        this.delYn = delYn;
    }

    public String getTopYn() {
        return topYn;
    }

    public void setTopYn(String topYn) {
        this.topYn = topYn;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getModdate() {
        return moddate;
    }

    public void setModdate(String moddate) {
        this.moddate = moddate;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public Integer getViewcnt() {
        return viewcnt;
    }

    public void setViewcnt(Integer viewcnt) {
        this.viewcnt = viewcnt;
    }

    public Integer getFileSeq() {
        return fileSeq;
    }

    public void setFileSeq(Integer fileSeq) {
        this.fileSeq = fileSeq;
    }

    public Integer getFileNo() {
        return fileNo;
    }

    public void setFileNo(Integer fileNo) {
        this.fileNo = fileNo;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getDelfile() {
        return delfile;
    }

    public void setDelfile(String delfile) {
        this.delfile = delfile;
    }

    public Integer getNowPage() {
        return nowPage;
    }

    public void setNowPage(Integer nowPage) {
        this.nowPage = nowPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getListNum() {
        return listNum;
    }

    public void setListNum(Integer listNum) {
        this.listNum = listNum;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public String getRealFilename() {
        return realFilename;
    }

    public void setRealFilename(String realFilename) {
        this.realFilename = realFilename;
    }
}
