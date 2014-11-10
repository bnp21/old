package com.info.web.domain;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class ProcessedFood {

    private static final long serialVersionUID = 1L;

    private String itemCode = null;                  //품번코드
    private String itemNum = null;                  //품번번호
    private String itemName = null;                  //품명
    private String productName = null;                  //대표상품
    private String referenceDateFrom = null;         //기준시작일자
    private String referenceDateTo = null;           //기준종료일자
    private String weeklyPrice = null;                  //금주가격
    private String lastMonthPrice = null;              //전월평균가격
    private String weeklyFluctuation = null;          //증감
    private String unit = null;                         //단위

    private CommonsMultipartFile file = null;
    private String createid = null;                 //등록 아이디
    private String updateid = null;                 //업데이트 아이디
    private String createdate = null;                //등록일
    private String updatedate = null;               //업데이트일

    public ProcessedFood() {
    }

    public ProcessedFood(String itemCode, String productName, String referenceDateFrom, String referenceDateTo, String weeklyPrice, String lastMonthPrice, String weeklyFluctuation) {

        this.itemCode = itemCode;
        this.productName = productName;
        this.referenceDateFrom = referenceDateFrom;
        this.referenceDateTo = referenceDateTo;
        this.weeklyPrice = weeklyPrice;
        this.weeklyFluctuation = weeklyFluctuation;
    }

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
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

    public String getWeeklyPrice() {
        return weeklyPrice;
    }

    public void setWeeklyPrice(String weeklyPrice) {
        this.weeklyPrice = weeklyPrice;
    }

    public String getLastMonthPrice() {
        return lastMonthPrice;
    }

    public void setLastMonthPrice(String lastMonthPrice) {
        this.lastMonthPrice = lastMonthPrice;
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

    public String getWeeklyFluctuation() {
        return weeklyFluctuation;
    }

    public void setWeeklyFluctuation(String weeklyFluctuation) {
        this.weeklyFluctuation = weeklyFluctuation;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getItemNum() {
        return itemNum;
    }

    public void setItemNum(String itemNum) {
        this.itemNum = itemNum;
    }
}
