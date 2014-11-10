package com.info.web.domain;

import org.apache.commons.lang.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * 계정 정보
 */
public class FoodInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer seq;
    private String tab1Title;
    private String tab2Title;
    private String tab3Title;
    private String tab1Img;
    private String tab2Img;
    private String tab3Img;
    private String delImg;

    private String createid;
    private String createdate;
    private String updateid;
    private String updatedate;

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public String getTab1Title() {
        return tab1Title;
    }

    public void setTab1Title(String tab1Title) {
        this.tab1Title = tab1Title;
    }

    public String getTab2Title() {
        return tab2Title;
    }

    public void setTab2Title(String tab2Title) {
        this.tab2Title = tab2Title;
    }

    public String getTab3Title() {
        return tab3Title;
    }

    public void setTab3Title(String tab3Title) {
        this.tab3Title = tab3Title;
    }

    public String getTab1Img() {
        return tab1Img;
    }

    public void setTab1Img(String tab1Img) {
        this.tab1Img = tab1Img;
    }

    public String getTab2Img() {
        return tab2Img;
    }

    public void setTab2Img(String tab2Img) {
        this.tab2Img = tab2Img;
    }

    public String getTab3Img() {
        return tab3Img;
    }

    public void setTab3Img(String tab3Img) {
        this.tab3Img = tab3Img;
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

    public String getDelImg() {
        return delImg;
    }

    public void setDelImg(String delImg) {
        this.delImg = delImg;
    }
}
