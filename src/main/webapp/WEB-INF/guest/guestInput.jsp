<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>guestInput.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>


<div class="container">
  <h2 class="text-center">방명록 글올리기</h2>
  <form name="myform" method="post" action="${ctp}/GuestInputOk.gu" class="was-validated">
  
    <div class="form-group">
      <label for="name">성명</label>
      <input type="text" class="form-control" id="name" value="${sMid}" placeholder="Enter username" name="name" required />
      <div class="valid-feedback">Ok!!!</div>
      <div class="invalid-feedback">성명을 입력해 주세요.</div>
    </div>
    
    <div class="form-group">
      <label for="pwd">방문소감</label>
      <textarea rows="5" name="content" id="content" required class="form-control"></textarea>
      <div class="valid-feedback">Ok!!!</div>
      <div class="invalid-feedback">방문소감을 입력해 주세요.</div>
    </div>
    
    <div class="form-group text-center">
    	<button type="submit" class="btn btn-primary mr-3">방명록 등록</button>
    	<button type="reset" class="btn btn-warning mr-3">방명록 다시입력</button>
    	<button type="button" onclick="location.href='${ctp}/GuestList.gu';" class="btn btn-danger">돌아가기</button>
    </div>
    
    
    <input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>"/>
    <input type="hidden" name="mid" value="${sMid}"/>
    
    
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>