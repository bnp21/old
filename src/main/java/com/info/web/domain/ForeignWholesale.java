package com.info.web.domain;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class ForeignWholesale {

    private static final long serialVersionUID = 1L;

    private Integer seq;                    //키값
    private String saleDate;               //일자
    private String countryCode;             //국가타입
    private String itemCode;                //품명코드
    private String itemName;                //품명
    private String placeName;               //산지명
    private String unit;                    //단위
    private String firstItem;               //최고(달러),상품(엔)
    private String mediumItem;              //중품(엔)
    private String poorItem;              //최저(달러),하품(엔)
    private String groupCode;           //item테이블 맵핑 코드

    private String createid;                //등록자아이디
    private String createdate;              //등록일
    private String updateid;                //수정아이디
    private String updatedate;              //수정일
    private String pkDate;                  //배치기준

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public String getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(String saleDate) {
        this.saleDate = saleDate;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
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

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getFirstItem() {
        return firstItem;
    }

    public void setFirstItem(String firstItem) {
        this.firstItem = firstItem;
    }

    public String getMediumItem() {
        return mediumItem;
    }

    public void setMediumItem(String mediumItem) {
        this.mediumItem = mediumItem;
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

    public String getPoorItem() {
        return poorItem;
    }

    public void setPoorItem(String poorItem) {
        this.poorItem = poorItem;
    }

    public String getPkDate() {
        return pkDate;
    }

    public void setPkDate(String pkDate) {
        this.pkDate = pkDate;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }
}
