package com.info.web.domain;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class Education {

    private static final long serialVersionUID = 1L;

    private String cateCode;          //교육과정대분류코드
    private String educationCode;          //교육과정 코드
    private String educationName;          //교육과정명
    private String course;                  //교육과정 구분
    private String period;                  //기간구분
    private String startDate;               //교육시작일자
    private String endDate;                 //교육종료일자
    private String gisu;                   //기수
    private String personnel;              //인원
    private String progress;                //진행상태

    private String createid;                //등록자아이디
    private String createdate;              //등록일
    private String updateid;                //수정아이디
    private String updatedate;              //수정일
    private String pkDate;                  //배치기준일

    public String getCateCode() {
        return cateCode;
    }

    public void setCateCode(String cateCode) {
        this.cateCode = cateCode;
    }

    public String getEducationCode() {
        return educationCode;
    }

    public void setEducationCode(String educationCode) {
        this.educationCode = educationCode;
    }

    public String getEducationName() {
        return educationName;
    }

    public void setEducationName(String educationName) {
        this.educationName = educationName;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getPersonnel() {
        return personnel;
    }

    public void setPersonnel(String personnel) {
        this.personnel = personnel;
    }

    public String getGisu() {
        return gisu;
    }

    public void setGisu(String gisu) {
        this.gisu = gisu;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }

    public String getCreateid() {
        return createid;
    }

    public void setCreateid(String createid) {
        this.createid = createid;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getUpdateid() {
        return updateid;
    }

    public void setUpdateid(String updateid) {
        this.updateid = updateid;
    }

    public String getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(String updatedate) {
        this.updatedate = updatedate;
    }

    public String getPkDate() {
        return pkDate;
    }

    public void setPkDate(String pkDate) {
        this.pkDate = pkDate;
    }
}
