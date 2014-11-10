package com.info.web.domain;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class Atnews {

    private static final long serialVersionUID = 1L;
    //게시물 ID
    private Integer eventId;
    //게시판 ID
    private String  eventNm;

    private String  host;

    private String  startYear;

    private String  startMonth;

    private String  startDay;

    private String  stopYear;

    private String  stopMonth;

    private String  stopDay;

    private String inquiry;

    private String desplayType;

    private String createid;

    private String updatedate;

    private String conduct;

    private String updateid;

    private String cratedate;

    private String type;

    private String pkDate;

    public Integer getEventId() {
        return eventId;
    }

    public void setEventId(Integer eventId) {
        this.eventId = eventId;
    }

    public String getEventNm() {
        return eventNm;
    }

    public void setEventNm(String eventNm) {
        this.eventNm = eventNm;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getStartYear() {
        return startYear;
    }

    public void setStartYear(String startYear) {
        this.startYear = startYear;
    }

    public String getStopYear() {
        return stopYear;
    }

    public void setStopYear(String stopYear) {
        this.stopYear = stopYear;
    }

    public String getStartMonth() {
        return startMonth;
    }

    public void setStartMonth(String startMonth) {
        this.startMonth = startMonth;
    }

    public String getStartDay() {
        return startDay;
    }

    public void setStartDay(String startDay) {
        this.startDay = startDay;
    }

    public String getStopMonth() {
        return stopMonth;
    }

    public void setStopMonth(String stopMonth) {
        this.stopMonth = stopMonth;
    }

    public String getStopDay() {
        return stopDay;
    }

    public void setStopDay(String stopDay) {
        this.stopDay = stopDay;
    }

    public String getInquiry() {
        return inquiry;
    }

    public void setInquiry(String inquiry) {
        this.inquiry = inquiry;
    }

    public String getDesplayType() {
        return desplayType;
    }

    public void setDesplayType(String desplayType) {
        this.desplayType = desplayType;
    }

    public String getCreateid() {
        return createid;
    }

    public void setCreateid(String createid) {
        this.createid = createid;
    }

    public String getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(String updatedate) {
        this.updatedate = updatedate;
    }

    public String getUpdateid() {
        return updateid;
    }

    public void setUpdateid(String updateid) {
        this.updateid = updateid;
    }

    public String getCratedate() {
        return cratedate;
    }

    public void setCratedate(String cratedate) {
        this.cratedate = cratedate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getConduct() {
        return conduct;
    }

    public void setConduct(String conduct) {
        this.conduct = conduct;
    }

    public String getPkDate() {
        return pkDate;
    }

    public void setPkDate(String pkDate) {
        this.pkDate = pkDate;
    }
}
