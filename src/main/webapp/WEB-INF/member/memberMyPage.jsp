<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>\
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>memberMyPage</title>
		<jsp:include page="/include/bs4.jsp"/>
<style>
  	body {
		  font-size: 12px;
		  width: 100%;
		}
  .table {
    display: table;
    width:60%; 
    margin-left:20%;
    height: 50%;
    border-collapse: collapse;
    table-layout: fixed;
  }
  .table-row {
    display: table-row;
  }
  .table-cell {
    display: table-cell;
    border: 1px solid lightgray;
    padding: 10px;
  }
  
  .col-1 {
    width: 20%; /* 첫 번째 열의 크기 */
    
  }
  .col-2 {
    width: 95%; /* 두 번째 열의 크기 */
  }
  .col-3 {
    width: 5%; /* 세 번째 열의 크기 */
  }
  .row-1{
  	 height:25%;
  }
  .row-2{
  	height:75%;
  }
</style>

<body style="width: 100%;">
  <jsp:include page="/include/nav.jsp" />
  <div class="table">
    <div class="table-row row-1">
      <div class="table-cell col-1">
      
        <div class="card" style="width:100%; text-align:center; ">
			    <img class="card-img-top" src="${ctp}/images/member/${photo}" style="width:100%;">
			    <div class="card-body">
			      <h4 class="card-title">프로필 사진</h4>
			      <a href="#" class="btn btn-primary">수정하기</a>
			    </div>
			  </div>
			</div>
      <div class="table-cell col-2">1행 </div>
      <div class="table-cell col-3">1행 </div>
    </div>
    <div class="table-row row-2">
      <div class="table-cell col-1">
			
			 <div id="memberInfo1" class="mr-5">
				 <ul style="font-size: 18px; list-style-type: none; margin:5px">
				    <li>현재 <font color="blue">${sNickName}</font>(${strLevel})님 로그인 중이십니다.</li>
				    <li>누적 포인트 : <span class="viewCheck">${point}</span></li>
				    <li>최종 방문일자 : <span class="viewCheck">${fn:substring(sLastDate,0,fn:length(sLastDate)-2)}</span></li>
				    <li>총 방문횟수 : <span class="viewCheck">${visitCnt}</span></li>
				    <li>오늘 방문횟수 : <span class="viewCheck">${todayCnt}</span></li>
			    </ul>
		  	</div>
				
			</div>
      <div class="table-cell col-2">2행 2열</div>
      <div class="table-cell col-3">2행 3열</div>
    </div>
  </div>
</body>
