package com.info.web.domain;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ljd on 2014-11-10.
 */
public class NewsLetter {

    private static final long serialVersionUID = 1L;

    //코드
    private Integer id;

    private String name;

    private String thumbnailName;

    private String footerurl;

    private String pkDate;

    private String title;

    private String img;

    private String url;

    private String publishdate;

    private String  createdate;

    private String  createid;

    private String  updatedate;

    private String  updateid;

    private String  viewYn;

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

    public String getThumbnailName() {
        return thumbnailName;
    }

    public void setThumbnailName(String thumbnailName) {
        this.thumbnailName = thumbnailName;
    }

    public String getFooterurl() {
        return footerurl;
    }

    public void setFooterurl(String footerurl) {
        this.footerurl = footerurl;
    }

    public String getPkDate() {
        return pkDate;
    }

    public void setPkDate(String pkDate) {
        this.pkDate = pkDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPublishdate() {
        return publishdate;
    }

    public void setPublishdate(String publishdate) {
        this.publishdate = publishdate;
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
    public String getViewYn() {
        return viewYn;
    }

    public void setViewYn(String viewYn) {
        this.viewYn = viewYn;
    }

    public List<NewsLetter> selectNewsLetterList(NewsLetter newsLetter) {

        System.out.println("############ mysql2 Start ############");
        Connection conn;
        Statement stmt;
        ResultSet rs = null;

        List<NewsLetter> list=new ArrayList<NewsLetter>();
        NewsLetter newsVO=new NewsLetter();

        try {
            Class.forName("com.mysql.jdbc.Driver");//드라이버 로딩: DriverManager에 등록
        }catch(ClassNotFoundException e) {
            System.err.print("ClassNotFoundException: ");
        }

        try {
            String jdbcUrl = "jdbc:mysql://210.103.25.76/news?autoReconnect=true";//사용하는 데이터베이스명을 포함한 url :3306
            String userId = "enews";//사용자계정
            String userPass = "kati_news";//사용자 패스워드

            conn = DriverManager.getConnection(jdbcUrl, userId, userPass);//Connection 객체를 얻어냄

            System.out.println("제대로 연결되었습니다");//성공시 화면에 표시됨

            stmt = conn.createStatement();//Statement 객체를 얻어냄
            rs = stmt.executeQuery("SELECT  \n" +
                                        "\t A.UCCNO  \n" +
                                        "\t,IFNULL(\n" +
                                        "\t     (SELECT CONCAT(D.UCCMFILEPATH,'/',D.MTFILE1) \n" +
                                        "\t         FROM \n" +
                                        "\t             TGUMUCMF D \n" +
                                        "\t         WHERE \n" +
                                        "\t             D.UCCNO = A.UCCNO \n" +
                                        "\t         ORDER BY \n" +
                                        "\t             D.UCCFNO\n" +
                                        "\t         LIMIT 0,1),\n" +
                                        "\t '') AS MTFILE1\n" +
                                        "\t ,A.UTITLE    \n" +
                                        "\t ,A.USTITLE    \n" +
                                        "\t FROM tgumucmst A \n" +
                                        "\t WHERE\n" +
                                        "\t A.SCCODE = '57' \n" +
                                        "\t AND A.VIEWKIND = '1' \n" +
                                        "\t ORDER BY A.UCCNO DESC limit 1 \n");

            while (rs.next()) {

                newsVO=new NewsLetter();

                String title = rs.getString("UTITLE");
                String img = rs.getString("MTFILE1");

                newsVO.setTitle(title);
                newsVO.setImg(img);

                list.add(newsVO);

                System.out.println("title==>" + title );
                System.out.println("img==>" + img );
            }

            stmt.close();
            conn.close();
        }catch(SQLException e) {
            System.out.println("SQLException: " + e.getMessage());
        }

        System.out.println("############ mysql2 End ############");

        //return sqlSessionTemplate.selectList("NewsLetter.selectNewsLetterList", newsLetter);
        return list;
    }
}
