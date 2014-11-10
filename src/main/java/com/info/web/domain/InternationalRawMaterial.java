package com.info.web.domain;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class InternationalRawMaterial {

    private static final long serialVersionUID = 1L;

    private String itemCode = null;                  //품번코드
    private String itemName = null;                  //품명
    private String referenceDateFrom = null;         //기준시작일자
    private String referenceDateTo = null;           //기준종료일자
    private String weeklyAveragePrice = null;        //금주평균가격
    private String lastWeeklyAveragePrice = null;    //전주평균가격
    private String lastYearlyAveragePrice = null;    //전년평균가격

    private CommonsMultipartFile file = null;
    private String createid = null;                 //등록 아이디
    private String updateid = null;                 //업데이트 아이디
    private String createdate = null;                //등록일
    private String updatedate = null;               //업데이트일
    private String commendYn = null;                //해석 입력 여부

    public InternationalRawMaterial() {
    }

    public InternationalRawMaterial(String itemCode, String referenceDateFrom, String referenceDateTo, String weeklyAveragePrice, String lastWeeklyAveragePrice, String lastYearlyAveragePrice) {

        this.itemCode = itemCode;
        this.referenceDateFrom = referenceDateFrom;
        this.referenceDateTo = referenceDateTo;
        this.weeklyAveragePrice = weeklyAveragePrice;
        this.lastWeeklyAveragePrice = lastWeeklyAveragePrice;
        this.lastYearlyAveragePrice = lastYearlyAveragePrice;
    }

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public String getReferenceDateFrom() {
        return referenceDateFrom;
    }

    public void setReferenceDateFrom(String referenceDateFrom) {
        this.referenceDateFrom = referenceDateFrom;
    }

    public String getReferenceDateTo() {
        return referenceDateTo;
    }

    public void setReferenceDateTo(String referenceDateTo) {
        this.referenceDateTo = referenceDateTo;
    }

    public String getWeeklyAveragePrice() {
        return weeklyAveragePrice;
    }

    public void setWeeklyAveragePrice(String weeklyAveragePrice) {
        this.weeklyAveragePrice = weeklyAveragePrice;
    }

    public String getLastWeeklyAveragePrice() {
        return lastWeeklyAveragePrice;
    }

    public void setLastWeeklyAveragePrice(String lastWeeklyAveragePrice) {
        this.lastWeeklyAveragePrice = lastWeeklyAveragePrice;
    }

    public String getLastYearlyAveragePrice() {
        return lastYearlyAveragePrice;
    }

    public void setLastYearlyAveragePrice(String lastYearlyAveragePrice) {
        this.lastYearlyAveragePrice = lastYearlyAveragePrice;
    }

    public CommonsMultipartFile getFile() {
        return file;
    }

    public void setFile(CommonsMultipartFile file) {
        this.file = file;
    }

    public String getCreateid() {
        return createid;
    }

    public void setCreateid(String createid) {
        this.createid = createid;
    }

    public String getUpdateid() {
        return updateid;
    }

    public void setUpdateid(String updateid) {
        this.updateid = updateid;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(String updatedate) {
        this.updatedate = updatedate;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getCommendYn() {
        return commendYn;
    }

    public void setCommendYn(String commendYn) {
        this.commendYn = commendYn;
    }
}
