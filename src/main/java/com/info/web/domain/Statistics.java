package com.info.web.domain;

/**
 * Created by Ljd on 2014-10-30.
 */
public class Statistics {

    private String ip;                  //접속아이피

    private Integer menuId;             //메뉴아이디

    private String contactDate;          //접속일자

    private String contactTime;          //접속시간

    private Integer visitantCnt;        //방문자수

    private Integer visitCnt;           //방문횟수

    private Integer pageCnt;            //페이지수

    private String pageGbn;            //페이지구분[메인화면,생생정보,원본구분]

    private String startDate;            //검색조건-시작일

    private String endDate;            //검색조건-종료일

    private Integer searchViewGbn;            //검색조건-화면구분[메인,모바일메인,생생정보,원본]

    private Integer searchDateGbn;            //검색조건-날짜구분[일간,주간,월간,년간]

    private String seq;            //순번

    private String menuNm;            //메뉴명

    private String excelYn="N";            //엑셀구분

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getContactDate() {
        return contactDate;
    }

    public void setContactDate(String contactDate) {
        this.contactDate = contactDate;
    }

    public String getContactTime() {
        return contactTime;
    }

    public void setContactTime(String contactTime) {
        this.contactTime = contactTime;
    }

    public Integer getVisitantCnt() {
        return visitantCnt;
    }

    public void setVisitantCnt(Integer visitantCnt) {
        this.visitantCnt = visitantCnt;
    }

    public Integer getVisitCnt() {
        return visitCnt;
    }

    public void setVisitCnt(Integer visitCnt) {
        this.visitCnt = visitCnt;
    }

    public Integer getPageCnt() {
        return pageCnt;
    }

    public void setPageCnt(Integer pageCnt) {
        this.pageCnt = pageCnt;
    }

    public String getPageGbn() {
        return pageGbn;
    }

    public void setPageGbn(String pageGbn) {
        this.pageGbn = pageGbn;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Integer getSearchViewGbn() {
        return searchViewGbn;
    }

    public void setSearchViewGbn(Integer searchViewGbn) {
        this.searchViewGbn = searchViewGbn;
    }
    public Integer getSearchDateGbn() {
        return searchDateGbn;
    }

    public void setSearchDateGbn(Integer searchDateGbn) {
        this.searchDateGbn = searchDateGbn;
    }

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public String getMenuNm() {
        return menuNm;
    }

    public void setMenuNm(String menuNm) {
        this.menuNm = menuNm;
    }

    public String getExcelYn() {
        return excelYn;
    }

    public void setExcelYn(String excelYn) {
        this.excelYn = excelYn;
    }
}
