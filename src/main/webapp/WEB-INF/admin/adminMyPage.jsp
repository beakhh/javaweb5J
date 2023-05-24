<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>\
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>adminManPage</title>
		<jsp:include page="/include/bs4.jsp"/>
	<style>
  .table-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 5%;
    width: 90%; /* 내가 설정한 크기 */
    height: 90%; /* 내가 설정한 크기 */
    border: 1px solid #000;
  }

  .table-cell {
    width: 100%; /* 수정: flex-basis 대신 width 사용 */
    height: 100%;
    
    padding: 5px;
  }
  	body {
		  font-size: 12px;
		}
</style>

<body style="width: 100%;">
  <div class="table-container">
  
    <div class="table-cell" style="width: 15%;">
      <iframe src="${ctp}/AdminLeft.admin" name="adminLeft" frameborder="0" style="width: 100%; height: 100%;"></iframe>
    </div>
    
    <div class="table-cell" style="width: 85%;">
    	<iframe src="" name="adminContent" frameborder="0" style="width: 100%; height: 100%;"></iframe>
    </div>
    
  </div>
</body>


