package com.info.web.domain;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class ImageInfo {

    private static final long serialVersionUID = 1L;
    //게시물 ID
    private Integer imageSeq;
    //게시판 ID
    private String  imageName;

    private Integer  imageNo;

    private Long  imageSize;

    private String imageMime;

    private String realImageName;

    public Integer getImageSeq() {
        return imageSeq;
    }

    public void setImageSeq(Integer imageSeq) {
        this.imageSeq = imageSeq;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public Integer getImageNo() {
        return imageNo;
    }

    public void setImageNo(Integer imageNo) {
        this.imageNo = imageNo;
    }

    public Long getImageSize() {
        return imageSize;
    }

    public void setImageSize(Long imageSize) {
        this.imageSize = imageSize;
    }

    public String getImageMime() {
        return imageMime;
    }

    public void setImageMime(String imageMime) {
        this.imageMime = imageMime;
    }

    public String getRealImageName() {
        return realImageName;
    }

    public void setRealImageName(String realImageName) {
        this.realImageName = realImageName;
    }
}
