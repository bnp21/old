<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<table>
    <tr><td><a href="/notice/write">글쓰기</a></td></tr>
</table>
<table style="width:500px;border:1px;">
    <tr>
        <td style="width:20%;">제목</td>
        <td style="width:*%;">내용</td>
        <td style="width:12%;">아이디</td>
        <td style="width:20%;">등록일</td>
        <td style="width:15%;">기능</td>
    </tr>
<c:forEach items="${noticeList}" var="list">
    <tr>
        <td>${list.title}</td>
        <td class="text-left">${list.contents}</td>
        <td>${list.accountId}</td>
        <td>${list.regdate}</td>
        <td><a href="/notice/write?seq=${list.seq}">[수정]</a> / <a href="/notice/del?seq=${list.seq}">[삭제]</a></td>
    </tr>
</c:forEach>
</table>


<content tag="local_script">
</content>