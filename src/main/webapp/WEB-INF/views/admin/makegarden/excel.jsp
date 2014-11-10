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
    response.addHeader("Content-Disposition","attachment; filename=email.xls");
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
                <th align="center" bgcolor="#7fff00">질문일자</th>
                <th align="center" bgcolor="#7fff00">제목</th>
                <th align="center" bgcolor="#7fff00">질문</th>
               <th align="center" bgcolor="#7fff00">이름</th>
                <th align="center" bgcolor="#7fff00">답변일자</th>
                <th align="center" bgcolor="#7fff00">답변</th>
                <th align="center" bgcolor="#7fff00">담당부서</th>
                <th align="center" bgcolor="#7fff00">담당자명</th>
                <th align="center" bgcolor="#7fff00">전화번호</th>
                <th align="center" bgcolor="#7fff00">이메일</th>
            </tr>

            <c:forEach items="${makeGardenList}" var="list" varStatus="status">
                <tr>
                    <td align="center">${list.seq}</td>
                    <td align="center">${list.createdate}</td>
                    <td>${list.title}</td>
                    <td>${list.memo}</td>
                    <td align="center">${list.name}</td>
                    <td align="center">${list.replydate}</td>
                    <td>${list.replyMemo}</td>
                    <td align="center">${list.replyDept}</td>
                    <td align="center">${list.replyName}</td>
                    <td align="center">${list.replyPhone}</td>
                    <td align="center">${list.replyEmail}</td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
