package com.info.web.domain;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class Batch {

    private static final long serialVersionUID = 1L;

    //코드
    private Integer id;

    private String name;

    private String pkDate;                  //배치기준

    private String type;                  //화훼타입

    private String pkYear;                  //수출기상도 기준년
    private String pkMonth;                  //수출기상도 기준월
    private String pkWeek ;                  //수출기상도 기준주

    private Integer cnt;                //건수

    public String getPkDate() {
        return pkDate;
    }

    public void setPkDate(String pkDate) {
        this.pkDate = pkDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getCnt() {
        return cnt;
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

    public void setCnt(Integer cnt) {
        this.cnt = cnt;
    }
}
