<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<table style="width:500px;border:1px;">
    <tr>
        <td style="width:20%;">구분</td>
        <td >행사명</td>
        <td style="width:12%;">행사장소</td>
        <td style="width:15%;">주최</td>
        <td style="width:15%;">행사기간</td>
        <td style="width:12%;">연락처</td>
    </tr>
    <c:forEach items="${atnewsList}" var="list">
        <tr>
            <td>${list.type}</td>
            <td class="text-left">${list.eventNm}</td>
            <td>${list.host}</td>
            <td>${list.conduct}</td>
            <td>${list.year}.${list.startMonth}.${list.startDay} ~ ${list.year}.${list.stopMonth}.${list.stopDay}</td>
            <td>${list.inquiry}</td>
        </tr>
    </c:forEach>
</table>


<content tag="local_script">
</content>