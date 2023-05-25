<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>adminContent.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>
	<style>
  	body {
		  font-size: 12px;
		}
  </style>
	<script>
	</script>
	
</head>
<body>
	<div class="table">
		<div class="row" style="width:100%; height:800px;">
		
			<div class = "col-5" style="width:100%;"> <iframe  src="${ctp}/AdminBoardList.admin" name="adminBoardList" frameborder="0" style="width: 100%; height: 100%;"></iframe></div>
			
			
			<div class = "col-7"> <iframe src="${ctp}/AdminBoardTool.admin" name="adminGuestTool" frameborder="0" style="width: 100%; height: 100%;"></iframe></div>
			
			
		</div>
	</div>
</body>
</html>