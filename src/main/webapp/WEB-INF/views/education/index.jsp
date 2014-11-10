<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<table style="width:500px;border:1px;">
    <tr>
        <td style="width:15%;">교육과정</td>
        <td style="width:*%;">교육과정명</td>
        <td style="width:10%;">기간구분</td>
        <td style="width:15%;">교육기간</td>
        <td style="width:10%;">기수</td>
        <td style="width:10%;">인원</td>
        <td style="width:12%;">진행상황</td>
    </tr>
    <c:forEach items="${educationList}" var="list">
        <tr>
            <td>${list.course}</td>
            <td class="text-left">${list.educationNm}</td>
            <td>${list.period}</td>
            <td>${list.startdate} ~ ${list.enddate}</td>
            <td>${list.gisu}</td>
            <td>${list.personnel}</td>
            <td>${list.progress}</td>
        </tr>
    </c:forEach>
</table>


<content tag="local_script">
</content>