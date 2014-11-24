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
                <td align="center" bgcolor="#7fff00" rowspan="2"> 메 뉴 </td>
                <c:forEach items="${dateList}" var="list">
                    <c:if test="${statistics.searchCntGbn == '0'}">
                        <td align="center" bgcolor="#7fff00" colspan="3">${list.pkDate}</td>
                    </c:if>
                    <c:if test="${statistics.searchCntGbn == '1' || statistics.searchCntGbn == '2' || statistics.searchCntGbn == '3' }">
                        <td align="center" bgcolor="#7fff00" colspan="1">${list.pkDate}</td>
                    </c:if>
                </c:forEach>
            </tr>
            <tr align="center">
                <c:forEach items="${dateList}" var="list">
                    <c:if test="${statistics.searchCntGbn == '0' || statistics.searchCntGbn == '1' }">
                    <td align="center" bgcolor="#7fff00">방문자수(명)</td>
                    </c:if>
                    <c:if test="${statistics.searchCntGbn == '0' || statistics.searchCntGbn == '2' }">
                    <td align="center" bgcolor="#7fff00">방문횟수(회)</td>
                    </c:if>
                    <c:if test="${statistics.searchCntGbn == '0' || statistics.searchCntGbn == '3' }">
                    <td align="center" bgcolor="#7fff00">페이지뷰(회)</td>
                    </c:if>
                </c:forEach>
            </tr>
                <c:forEach items="${menuList}" var="menuList">
                     <tr><td align="left">${menuList.menuNm}</td>

                        <c:forEach items="${statisticsList}" var="list">
                            <c:if test="${menuList.menuId==list.menuId}">
                                <c:if test="${statistics.searchCntGbn == '0' || statistics.searchCntGbn == '1' }">
                                    <td align="right">${list.visitantCnt}</td>
                                </c:if>
                                <c:if test="${statistics.searchCntGbn == '0' || statistics.searchCntGbn == '2' }">
                                    <td align="right">${list.visitCnt}</td>
                                </c:if>
                                <c:if test="${statistics.searchCntGbn == '0' || statistics.searchCntGbn == '3' }">
                                    <td align="right">${list.pageCnt}</td>
                                </c:if>
                            </c:if>
                        </c:forEach>

                     </tr>
                </c:forEach>
            <!-- 합계 -->
            <tr align="center">
                <td align="center" bgcolor="#7fff00" rowspan="1"> 합 계 </td>
                <c:forEach items="${dateList}" var="list">
                    <c:if test="${statistics.searchCntGbn == '0' || statistics.searchCntGbn == '1' }">
                        <td align="right" bgcolor="#7fff00">
                            <c:choose><c:when test="${list.visitantCnt != null}"> ${list.visitantCnt}</c:when><c:otherwise>0</c:otherwise></c:choose>
                        </td>
                    </c:if>
                    <c:if test="${statistics.searchCntGbn == '0' || statistics.searchCntGbn == '2' }">
                        <td align="right" bgcolor="#7fff00">
                            <c:choose><c:when test="${list.visitCnt != null}"> ${list.visitCnt}</c:when><c:otherwise>0</c:otherwise></c:choose>
                        </td>
                    </c:if>
                    <c:if test="${statistics.searchCntGbn == '0' || statistics.searchCntGbn == '3' }">
                        <td align="right" bgcolor="#7fff00">
                            <c:choose><c:when test="${list.pageCnt != null}"> ${list.pageCnt}</c:when><c:otherwise>0</c:otherwise></c:choose>
                        </td>
                    </c:if>
                </c:forEach>
            </tr>

        </table>
    </body>
</html>
