package com.info.web.domain;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class WeeklyShopping {

    private static final long serialVersionUID = 1L;

    private Integer groupCode = null;            //등록그룹
    private String type = null;                 //타입 1 : 이번주, 2 : 다음주
    private String startDate = null;            //이번주or다음주 시작일
    private String endDate = null;              //이번주or다음주 종료일
    private String itemCode = null;             //품목코드
    private String itemName = null;             //품목명
    private String lastWeekPrice = null;        //지난주 금액
    private String weekPrice = null;            //이번주 금액
    private String rate = null;                 //증감율
    private String memo = null;                 //내용
    private String seq = null;                  //키값
    private String unit = null;                 //단위
    private String fluctuationType = null;    //증감구분
    private String itemImgName = null;          //이미지 코드
    private String booknum = null;              //호수

    private String createid = null;                 //등록 아이디
    private String updateid = null;                 //업데이트 아이디
    private String createdate = null;                //등록일
    private String updatedate = null;               //업데이트일

    private String publishdate;

    public Integer getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(Integer groupCode) {
        this.groupCode = groupCode;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public String getLastWeekPrice() {
        return lastWeekPrice;
    }

    public void setLastWeekPrice(String lastWeekPrice) {
        this.lastWeekPrice = lastWeekPrice;
    }

    public String getWeekPrice() {
        return weekPrice;
    }

    public void setWeekPrice(String weekPrice) {
        this.weekPrice = weekPrice;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
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

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getFluctuationType() {
        return fluctuationType;
    }

    public void setFluctuationType(String fluctuationType) {
        this.fluctuationType = fluctuationType;
    }

    public String getItemImgName() {
        return itemImgName;
    }

    public void setItemImgName(String itemImgName) {
        this.itemImgName = itemImgName;
    }

    public String getBooknum() {
        return booknum;
    }

    public void setBooknum(String booknum) {
        this.booknum = booknum;
    }

    public void setPublishdate(String publishdate) {
        this.publishdate = publishdate;
    }

    public String getPublishdate() {
        return publishdate;
    }
}
