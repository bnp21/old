package com.info.web.domain;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class DistributionReality {

    private static final long serialVersionUID = 1L;

    private Integer seq;                    //키값
    private String year;                    //연도
    private String title;                   //제목
    private String distribution;            //유통 비용율
    private String costDirectly;            //비용별_직접비
    private String costIndirect;            //비용별_간접비
    private String costProfit;              //비용별_이윤
    private String stageShipment;           //단계별_출하단계
    private String stageWholesale;          //단계별 도매단계
    private String stageRetail;             //단계별 소매단계

    //조사품목
    private Integer mainSeq;
    private String[] imgTitle;
    private String[] itemSeq;
    private String fileImg;
    private String delImg;

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

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDistribution() {
        return distribution;
    }

    public void setDistribution(String distribution) {
        this.distribution = distribution;
    }

    public String getCostDirectly() {
        return costDirectly;
    }

    public void setCostDirectly(String costDirectly) {
        this.costDirectly = costDirectly;
    }

    public String getCostIndirect() {
        return costIndirect;
    }

    public void setCostIndirect(String costIndirect) {
        this.costIndirect = costIndirect;
    }

    public String getCostProfit() {
        return costProfit;
    }

    public void setCostProfit(String costProfit) {
        this.costProfit = costProfit;
    }

    public String getStageShipment() {
        return stageShipment;
    }

    public void setStageShipment(String stageShipment) {
        this.stageShipment = stageShipment;
    }

    public String getStageWholesale() {
        return stageWholesale;
    }

    public void setStageWholesale(String stageWholesale) {
        this.stageWholesale = stageWholesale;
    }

    public String getStageRetail() {
        return stageRetail;
    }

    public void setStageRetail(String stageRetail) {
        this.stageRetail = stageRetail;
    }

    public Integer getMainSeq() {
        return mainSeq;
    }

    public void setMainSeq(Integer mainSeq) {
        this.mainSeq = mainSeq;
    }

    public String[] getImgTitle() {
        return imgTitle;
    }

    public void setImgTitle(String[] imgTitle) {
        this.imgTitle = imgTitle;
    }

    public String[] getItemSeq() {
        return itemSeq;
    }

    public void setItemSeq(String[] itemSeq) {
        this.itemSeq = itemSeq;
    }

    public String getFileImg() {
        return fileImg;
    }

    public void setFileImg(String fileImg) {
        this.fileImg = fileImg;
    }

    public String getDelImg() {
        return delImg;
    }

    public void setDelImg(String delImg) {
        this.delImg = delImg;
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
