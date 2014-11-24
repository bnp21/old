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

    response.setContentType("application/vnd.ms-excel; charset=euc-kr");
    response.addHeader("Content-Disposition","attachment; filename=statistics.xls");
    response.setHeader("Cache-Control", "max-age=10");
    response.flushBuffer();

%>

<html>
    <head>
        <!-- 운영에서 한글깨져서 추가함 -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    <body>
        <table border="1" cellspacing="0" cellpadding="0">
            <tr align="center">
                <td align="center" bgcolor="#7fff00">No.</td>
                <td align="center" bgcolor="#7fff00">생생정보명</td>
                <td align="center" bgcolor="#7fff00">방문자수(명)</td>
                <td align="center" bgcolor="#7fff00">방문횟수(회)</td>
                <td align="center" bgcolor="#7fff00">페이지뷰(회)</td>
            </tr>

            <c:set var="totVisitantCnt" value="0" />
            <c:set var="totVisitCnt" value="0" />
            <c:set var="totPageCnt" value="0" />
            <c:forEach items="${statisticsList}" var="list">
                <tr>
                    <td align="center">${list.seq}</td>
                    <td>${list.menuNm}</td>
                    <td align="right">${list.visitantCnt}</td>
                    <td align="right">${list.visitCnt}</td>
                    <td align="right">${list.pageCnt}</td>
                </tr>
                <c:set var="totVisitantCnt" value="${totVisitantCnt + list.visitantCnt}" />
                <c:set var="totVisitCnt" value="${totVisitCnt + list.visitCnt}" />
                <c:set var="totPageCnt" value="${totPageCnt + list.pageCnt}" />
            </c:forEach>
            <tr>
                <td align="center" colspan="2">합 계</td>
                <td align="right">${totVisitantCnt}</td>
                <td align="right">${totVisitCnt}</td>
                <td align="right">${totPageCnt}</td>
            </tr>

        </table>
    </body>
</html>
