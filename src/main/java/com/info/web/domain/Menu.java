package com.info.web.domain;

/**
 * Created with IntelliJ IDEA.
 * User: hukoru
 * Date: 13. 8. 26
 * Time: 오후 11:53
 * To change this template use File | Settings | File Templates.
 */
public class Menu {

    private static final long serialVersionUID = 1L;

    //코드
    private Integer id;

    private String name;

    private String useYn;

    private String url;

    private String outlinkYn;

    private String thumbnailName;

    private String bigsizeYn;

    private String  createdate;

    private String  createid;

    private String  updatedate;

    private String  updateid;

    private String fileName;

    private String title;

    private String autodataYn;

    private String delFile;

    private String type;

    private String footerurl;

    public String getAutodataYn() {
        return autodataYn;
    }

    public void setAutodataYn(String autodataYn) {
        this.autodataYn = autodataYn;
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

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getOutlinkYn() {
        return outlinkYn;
    }

    public void setOutlinkYn(String outlinkYn) {
        this.outlinkYn = outlinkYn;
    }

    public String getThumbnailName() {
        return thumbnailName;
    }

    public void setThumbnailName(String thumbnailName) {
        this.thumbnailName = thumbnailName;
    }

    public String getBigsizeYn() {
        return bigsizeYn;
    }

    public void setBigsizeYn(String bigsizeYn) {
        this.bigsizeYn = bigsizeYn;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getCreateid() {
        return createid;
    }

    public void setCreateid(String createid) {
        this.createid = createid;
    }

    public String getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(String updatedate) {
        this.updatedate = updatedate;
    }

    public String getUpdateid() {
        return updateid;
    }

    public void setUpdateid(String updateid) {
        this.updateid = updateid;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDelFile() {
        return delFile;
    }

    public void setDelFile(String delFile) {
        this.delFile = delFile;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getFooterurl() {
        return footerurl;
    }

    public void setFooterurl(String footerurl) {
        this.footerurl = footerurl;
    }
}
