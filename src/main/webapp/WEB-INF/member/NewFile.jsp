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
		<style>
.container {
  display: flex;
}

.left {
  flex: 1;
  background-color: lightgray;
}

.right {
  flex: 1;
  background-color: lightblue;
}
</style>

<body>
  <div class="container">
    <div class="left">
      왼쪽 내용
    </div>
    <div class="right">
      오른쪽 내용
    </div>
  </div>
</body>
  <script>
    'use strict';
  </script>
</head>
<body>
  <div class="container">
    <div class="left">
      왼쪽 내용
    </div>
    <div class="right">
      오른쪽 내용
    </div>
  </div>
</body>