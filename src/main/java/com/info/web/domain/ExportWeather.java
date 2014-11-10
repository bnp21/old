package com.info.web.domain;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class ExportWeather {

    private static final long serialVersionUID = 1L;

    //export_weather, export_weather_item
    private String seq;
    private String pkYear;
    private String pkMonth;
    private String pkWeek;
    private String itemCode;
    private String itemName;
    private String btotAmt;
    private String totAmt;
    private String totAmtper;
    private String booknum;
    private String totAmtperNum;
    private String itemGroup;
    private String viewYn;
    private String startdate;
    private String enddate;
    private String titledate;
    private String publishdate;

    //기간
    private String pkMonthDate;

    //export_weather_month
    private String curAmt1;
    private String curAmt2;
    private String curAmt3;
    private String curAmtDate1;
    private String curAmtDate2;
    private String curAmtDate3;
    private String maxCurAmt;

    //export_weather_nation
    private String upItem;
    private String downItem;
    private String memo1;
    private String memo2;

    private String creatid;
    private String createdate;
    private String updateid;
    private String updatedate;

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public String getPkYear() {
        return pkYear;
    }

    public void setPkYear(String pkYear) {
        this.pkYear = pkYear;
    }

    public String getPkMonth() {
        return pkMonth;
    }

    public void setPkMonth(String pkMonth) {
        this.pkMonth = pkMonth;
    }

    public String getPkWeek() {
        return pkWeek;
    }

    public void setPkWeek(String pkWeek) {
        this.pkWeek = pkWeek;
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

    public String getBtotAmt() {
        return btotAmt;
    }

    public void setBtotAmt(String btotAmt) {
        this.btotAmt = btotAmt;
    }

    public String getTotAmt() {
        return totAmt;
    }

    public void setTotAmt(String totAmt) {
        this.totAmt = totAmt;
    }

    public String getTotAmtper() {
        return totAmtper;
    }

    public void setTotAmtper(String totAmtper) {
        this.totAmtper = totAmtper;
    }

    public String getBooknum() {
        return booknum;
    }

    public void setBooknum(String booknum) {
        this.booknum = booknum;
    }

    public String getCurAmt1() {
        return curAmt1;
    }

    public void setCurAmt1(String curAmt1) {
        this.curAmt1 = curAmt1;
    }

    public String getCurAmt2() {
        return curAmt2;
    }

    public void setCurAmt2(String curAmt2) {
        this.curAmt2 = curAmt2;
    }

    public String getCurAmt3() {
        return curAmt3;
    }

    public void setCurAmt3(String curAmt3) {
        this.curAmt3 = curAmt3;
    }

    public String getUpItem() {
        return upItem;
    }

    public void setUpItem(String upItem) {
        this.upItem = upItem;
    }

    public String getDownItem() {
        return downItem;
    }

    public void setDownItem(String downItem) {
        this.downItem = downItem;
    }

    public String getMemo1() {
        return memo1;
    }

    public void setMemo1(String memo1) {
        this.memo1 = memo1;
    }

    public String getMemo2() {
        return memo2;
    }

    public void setMemo2(String memo2) {
        this.memo2 = memo2;
    }

    public String getCreatid() {
        return creatid;
    }

    public void setCreatid(String creatid) {
        this.creatid = creatid;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getTotAmtperNum() {
        return totAmtperNum;
    }

    public void setTotAmtperNum(String totAmtperNum) {
        this.totAmtperNum = totAmtperNum;
    }

    public String getItemGroup() {
        return itemGroup;
    }

    public void setItemGroup(String itemGroup) {
        this.itemGroup = itemGroup;
    }

    public String getPkMonthDate() {
        return pkMonthDate;
    }

    public void setPkMonthDate(String pkMonthDate) {
        this.pkMonthDate = pkMonthDate;
    }

    public String getCurAmtDate1() {
        return curAmtDate1;
    }

    public void setCurAmtDate1(String curAmtDate1) {
        this.curAmtDate1 = curAmtDate1;
    }

    public String getCurAmtDate2() {
        return curAmtDate2;
    }

    public void setCurAmtDate2(String curAmtDate2) {
        this.curAmtDate2 = curAmtDate2;
    }

    public String getCurAmtDate3() {
        return curAmtDate3;
    }

    public void setCurAmtDate3(String curAmtDate3) {
        this.curAmtDate3 = curAmtDate3;
    }

    public String getMaxCurAmt() {
        return maxCurAmt;
    }

    public void setMaxCurAmt(String maxCurAmt) {
        this.maxCurAmt = maxCurAmt;
    }

    public String getViewYn() {
        return viewYn;
    }

    public void setViewYn(String viewYn) {
        this.viewYn = viewYn;
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

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public void setTitledate(String titledate) {
        this.titledate = titledate;
    }

    public String getTitledate() {
        return titledate;
    }

    public void setPublishdate(String publishdate) {
        this.publishdate = publishdate;
    }

    public String getPublishdate() {
        return publishdate;
    }
}
