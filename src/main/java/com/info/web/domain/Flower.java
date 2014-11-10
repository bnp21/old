package com.info.web.domain;
import java.io.Serializable;

/**
 * 계정 정보
 */
public class Flower implements Serializable {
    private static final long serialVersionUID = 1L;

    private String date = "";            //기준일자

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }




}
