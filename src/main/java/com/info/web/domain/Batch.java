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
}
