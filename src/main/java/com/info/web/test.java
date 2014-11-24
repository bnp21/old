package com.info.web;
import java.sql.*;

/**
 * Created by Ljd on 2014-11-13.
 */
public class test {

    public static void main(String[] args) {
        //System.out.println("###### 커넥션 Start #####");
        Connection conn;
        Statement stmt;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");//드라이버 로딩: DriverManager에 등록
        }catch(ClassNotFoundException e) {
            //System.err.print("ClassNotFoundException: ");
        }

        try {
            String jdbcUrl = "jdbc:mysql://210.103.25.76:3306/news";//사용하는 데이터베이스명을 포함한 url
            String userId = "enews";//사용자계정
            String userPass = "kati_news";//사용자 패스워드

            conn = DriverManager.getConnection(jdbcUrl, userId, userPass);//Connection 객체를 얻어냄

            //System.out.println("제대로 연결되었습니다");//성공시 화면에 표시됨

            stmt = conn.createStatement();//Statement 객체를 얻어냄
            rs = stmt.executeQuery("SELECT  \n" +
                                            "\t A.UCCNO  \n" +
                                            "\t,A.UCCKIND    \n" +
                                            "\t,A.SCCODE\n" +
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
                                            "\t,A.UTITLE    \n" +
                                            "\t,A.USTITLE    \n" +
                                            "\t,A.UCONTENT    \n" +
                                            "\t,A.USCONTENT \n" +
                                            "\t,A.UCCCNT\n" +
                                            "\t,A.URDATE\n" +
                                            "\t,A.MBID\n" +
                                            "\tFROM tgumucmst A\n" +
                                            "\tWHERE\n" +
                                            "\tA.SCCODE = '57'  -- sccode  > 57 : 이주의 핫이슈, 72 : 신기술 신상품, 58 : 수출기업 성공노하우, 67 : 스페셜 리포트\n" +
                                            "\tAND A.VIEWKIND = '1'\n" +
                                            "\tORDER BY A.UCCNO DESC");

            while (rs.next()) {

                String title = rs.getString("UTITLE");
                String img = rs.getString("MTFILE1");

                //System.out.println("title==>" + title );
                //System.out.println("img==>" + img );
            }

            stmt.close();
            conn.close();
        }catch(SQLException e) {
            //System.out.println("SQLException: " + e.getMessage());
        }
        //System.out.println("###### 커넥션 End #####");
    }

}
