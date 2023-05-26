<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>adminLeft.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
  	body {
		  font-size: 12px;
		}
  </style>
</head>
<body style="background-color:#EEE5A2">
<p><br/></p>
<div class="text-center">
  <h5>관리자메뉴</h5>
  <hr/>
  <p><a href="${ctp}/AdminGuest.admin" target="adminContent">방명록리스트</a></p>
  <hr/>
  <p><a href="${ctp}/AdminBoard.admin" target="adminContent">게시판리스트</a></p>
  <hr/>
  <p><a href="${ctp}/AdminMemberList.admin" target="adminContent">회원리스트</a></p>
  
  <c:if test="${sAdmin != null}"><a href="${ctp}/" target="_top" class="btn btn-danger btn-sm"> 관리자로그아웃</a></c:if>
  
</div>
<p><br/></p>
</body>
</html>