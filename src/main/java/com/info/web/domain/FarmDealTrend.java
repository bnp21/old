package com.info.web.domain;

import org.springframework.web.multipart.commons.CommonsMultipartFile;
/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class FarmDealTrend {

    private static final long serialVersionUID = 1L;

    private String itemCode;
    private String itemName;
    private String standardDate;
    private String standardPrice;
    private String danger;
    private String dangerName;
    private String yearPrice;
    private String avgPrice;

    private String createid;
    private String createdate;
    private String updateid;
    private String updatedate;

    private CommonsMultipartFile file = null;

    public FarmDealTrend() {
    }

    public FarmDealTrend(String itemCode, String standardDate, String standardPrice, String danger, String yearPrice) {

        this.itemCode = itemCode;
        this.standardDate = standardDate;
        this.standardPrice = standardPrice;
        this.danger = danger;
        this.yearPrice = yearPrice;
    }

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public String getStandardDate() {
        return standardDate;
    }

    public void setStandardDate(String standardDate) {
        this.standardDate = standardDate;
    }

    public String getStandardPrice() {
        return standardPrice;
    }

    public void setStandardPrice(String standardPrice) {
        this.standardPrice = standardPrice;
    }

    public String getDanger() {
        return danger;
    }

    public void setDanger(String danger) {
        this.danger = danger;
    }

    public String getYearPrice() {
        return yearPrice;
    }

    public void setYearPrice(String yearPrice) {
        this.yearPrice = yearPrice;
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

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getDangerName() {
        return dangerName;
    }

    public void setDangerName(String dangerName) {
        this.dangerName = dangerName;
    }

    public String getAvgPrice() {
        return avgPrice;
    }

    public void setAvgPrice(String avgPrice) {
        this.avgPrice = avgPrice;
    }
}
