<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form id="notice" method="POST" action="/notice/insertNotice" modelAttribute="notice"  enctype="multipart/form-data">
    <input type="hidden" name="seq" id="seq" value="${noticeView.seq}"/>
    제목 : <input type="text" id="title" name="title" value="${noticeView.title}">
    <br/>내용 : <textarea name="contents" id="contents" rows="10" cols="50" style="width:200px;height:50px;">${noticeView.contents}</textarea>
    <br/>공지글 여부 : 공지글 <input type="checkbox" name="topYn" id="topYn" value="Y" ${noticeView.topYn}/>
    <br/>등록자 : <input type="text" name="accountId" id="accountId" value="${noticeView.accountId}"/>
    <br/>파일첨부 : <input type="file" name="file" id="fileInput" multiple />
    <button type="submit"> 등록 </button>
</form:form>