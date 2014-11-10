package com.info.web.domain;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class EatingBusiness {

    private static final long serialVersionUID = 1L;

    private Integer seq;                    //키값
    private Integer groupCode;               //그룹코드
    private String groupType;               //그룹타입 1 : 상단 경기지수, 2 : 상단 그래프, 3 : 하단 경기지수
    private String lastDate;                //이전 경기지수날짜
    private String nowDate;                 //현재 경기지수날짜
    private String lastRate;                //이전 경기지수
    private String nowRate;                 //현재 경기지수
    private String foodType;                //음식명

    //commnet
    private String title;                   //제목
    private String memo1;                   //상단 설명
    private String memo2;                   //하단 설명
    private String memo1Title;               //상단 설명 제목
    private String memo2Title;              //하단 설명 제목

    private String createid;                //등록자아이디
    private String createdate;              //등록일
    private String updateid;                //수정아이디
    private String updatedate;              //수정일

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public Integer getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(Integer groupCode) {
        this.groupCode = groupCode;
    }

    public String getGroupType() {
        return groupType;
    }

    public void setGroupType(String groupType) {
        this.groupType = groupType;
    }

    public String getLastDate() {
        return lastDate;
    }

    public void setLastDate(String lastDate) {
        this.lastDate = lastDate;
    }

    public String getNowDate() {
        return nowDate;
    }

    public void setNowDate(String nowDate) {
        this.nowDate = nowDate;
    }

    public String getLastRate() {
        return lastRate;
    }

    public void setLastRate(String lastRate) {
        this.lastRate = lastRate;
    }

    public String getNowRate() {
        return nowRate;
    }

    public void setNowRate(String nowRate) {
        this.nowRate = nowRate;
    }

    public String getFoodType() {
        return foodType;
    }

    public void setFoodType(String foodType) {
        this.foodType = foodType;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public String getMemo1Title() {
        return memo1Title;
    }

    public void setMemo1Title(String memo1Title) {
        this.memo1Title = memo1Title;
    }

    public String getMemo2Title() {
        return memo2Title;
    }

    public void setMemo2Title(String memo2Title) {
        this.memo2Title = memo2Title;
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

}
