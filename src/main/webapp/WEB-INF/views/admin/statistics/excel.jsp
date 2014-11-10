<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 14. 6. 26
  Time: 오후 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="application/vnd.ms-excel; name='excel', text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%

     String fileNm="통계";

    response.setContentType("application/vnd.ms-excel; charset=euc-kr");
    response.addHeader("Content-Disposition","attachment; filename=statistics.xls");
    response.setHeader("Cache-Control", "max-age=10");
    response.flushBuffer();

%>

<html>
    <head>

    </head>
    <body>
        <table border="1" cellspacing="0" cellpadding="0">
            <tr align="center">
                <th align="center" bgcolor="#7fff00">No.</th>
                <th align="center" bgcolor="#7fff00">생생정보명</th>
                <th align="center" bgcolor="#7fff00">방문자수</th>
                <th align="center" bgcolor="#7fff00">방문횟수</th>
                <th align="center" bgcolor="#7fff00">페이지뷰</th>
            </tr>

            <c:forEach items="${statisticsList}" var="list" varStatus="status">
                <tr>
                    <td align="center">${list.seq}</td>
                    <td>${list.menuNm}</td>
                    <td align="right">${list.visitantCnt} 명</td>
                    <td align="right">${list.visitCnt} 회</td>
                    <td align="right">${list.pageCnt} 회</td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
