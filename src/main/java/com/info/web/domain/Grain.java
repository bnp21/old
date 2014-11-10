package com.info.web.domain;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class Grain {

    private static final long serialVersionUID = 1L;

    private String referenceDate = null;            //기준일자
    private String itemCode  = null;                //품번코드
    private String itemName  = null;                //품명
    private String netChangePrice = null;           //기준일자 금액
    private String referenceDatePrice = null;       //전일대비 금액
    private String referenceDateFluctuation = null;     //전일대비 증감
    private String averagePrice = null;              //전년동월대비 금액
    private String averageFluctuation = null;              //전년동월대비 증감
    private CommonsMultipartFile file = null;
    private String createid = null;                 //등록 아이디
    private String updateid = null;                 //업데이트 아이디
    private String createdate = null;                //등록일
    private String updatedate = null;               //업데이트일
    private String commendYn = null;                //해석 입력 여부

    private String comments = null;                 //해석 입력 내용

    public Grain() {
    }

    public Grain(String referenceDate, String itemCode, String referenceDatePrice, String netChangePrice, String averagePrice) {
        this.referenceDate = referenceDate;
        this.itemCode = itemCode;
        this.referenceDatePrice = referenceDatePrice;
        this.netChangePrice = netChangePrice;
        this.averagePrice = averagePrice;
    }

    public String getReferenceDate() {
        return referenceDate;
    }

    public void setReferenceDate(String referenceDate) {
        this.referenceDate = referenceDate;
    }

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public String getReferenceDatePrice() {
        return referenceDatePrice;
    }

    public void setReferenceDatePrice(String referenceDatePrice) {
        this.referenceDatePrice = referenceDatePrice;
    }

    public String getNetChangePrice() {
        return netChangePrice;
    }

    public void setNetChangePrice(String netChangePrice) {
        this.netChangePrice = netChangePrice;
    }

    public String getAveragePrice() {
        return averagePrice;
    }

    public void setAveragePrice(String averagePrice) {
        this.averagePrice = averagePrice;
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

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getReferenceDateFluctuation() {
        return referenceDateFluctuation;
    }

    public void setReferenceDateFluctuation(String referenceDateFluctuation) {
        this.referenceDateFluctuation = referenceDateFluctuation;
    }

    public String getAverageFluctuation() {
        return averageFluctuation;
    }

    public void setAverageFluctuation(String averageFluctuation) {
        this.averageFluctuation = averageFluctuation;
    }
}
