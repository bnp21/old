package com.info.web.domain;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class DailyPrice {

    private static final long serialVersionUID = 1L;

    private String productId;
    private String avgPrice;
    private String pkDate;
    private String itemCode;
    private String itemName;
    private String prevAvgPrice;
    private String unit;
    private String viewYn;

    private String createid;
    private String createdate;
    private String updateid;
    private String updatedate;

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getAvgPrice() {
        return avgPrice;
    }

    public void setAvgPrice(String avgPrice) {
        this.avgPrice = avgPrice;
    }

    public String getPkDate() {
        return pkDate;
    }

    public void setPkDate(String pkDate) {
        this.pkDate = pkDate;
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

    public String getPrevAvgPrice() {
        return prevAvgPrice;
    }

    public void setPrevAvgPrice(String prevAvgPrice) {
        this.prevAvgPrice = prevAvgPrice;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getViewYn() {
        return viewYn;
    }

    public void setViewYn(String viewYn) {
        this.viewYn = viewYn;
    }
}
