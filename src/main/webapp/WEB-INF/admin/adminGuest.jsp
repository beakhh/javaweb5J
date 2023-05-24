<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>title</title>
		<jsp:include page="/include/bs4.jsp"/>
  <script>
    'use strict';
  </script>
</head>
<body>
	<div class="table">
		<div class="row" style="width:100%; height:800px;">
		
			<div class = "col-5" style="width:100%;"> <iframe src="${ctp}/AdminGuestList.admin" name="adminGuest" frameborder="0" style="width: 100%; height: 100%;"></iframe></div>
			
			
			<div class = "col-7"> <iframe src="${ctp}/AminGuestTool.admin" name="adminGuestTool" frameborder="0" style="width: 100%; height: 100%;"></iframe></div>
			
			
		</div>
	</div>
</body>
</html>