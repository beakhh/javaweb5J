<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>guestList(블록페이징처리-한페이지분량조정하기-부트스트랩페이지네이션적용).jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
    th {
      background-color:#eee;
      text-align: center;
    }
    .asdf {
      margin-top: 20px;
      border-radius: 20px;
      padding: 20px;
      background-color: #f8f9fa;
      position: relative;
    }
  </style>
  <script>
    'use strict';
    
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "${ctp}/GuestList.gu?pag=${pag}&pageSize="+pageSize;
    }
    
    function delCheck(idx) {
    	let ans = confirm("현재 게시물을 삭제하시겠습니까?");
    	if(ans) location.href = "${ctp}/GuestDelete.gu?idx="+idx;
    }
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br/></p>

<div class="table">
	<div class="row" style="width:100%;">
		<div class="col-8" style="width:60%; margin-left:15%">
			<div class="asdf" style="width:80%; margin-left:15%;  ">
			
			
  <h3 class="text-center">방명록리스트</h3>
  <table class="table table-borderless mb-0 p-0">
    <tr>
      <td>
      </td>
      <td style="text-align:right;"><a href="${ctp}/GuestInput.gu" class="btn btn-primary btn-sm">글쓰기</a></td>
    </tr>
  </table>
  <table class="table table-borderless mb-0 p-0">
    <tr>
      <td style="text-align:right;">
        <select name="pageSize" id="pageSize" onchange="pageCheck()">
          <option <c:if test="${pageSize == 3}">selected</c:if>>3</option>
          <option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
          <option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
          <option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
          <option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
        </select> 건
      </td>
    </tr>
  </table>
  
  <c:forEach var="vo" items="${vos}" varStatus="st">
	  <table class="table table-borderless mb-0 mt-0">
	    <tr>
	      <td>
	        번호 : ${curScrStartNo}
	        <c:if test="${sAdmin != null}">
	        	<a href="javascript:delCheck(${vo.idx})" class="btn btn-danger btn-sm">삭제</a>
	        </c:if>
	      </td>
	    </tr>
	  </table>
	  
	  <table class="table table-bordered mt-0" style="width:100%">
	    <tr>
	      <th style="20%">성명</th>
	      <td style="25%">${vo.name}</td>
	      <th style="20%">방문일자</th>
	      <td style="35%">${fn:substring(vo.visitDate,0,19)}</td>
	    </tr>
			<tr>
			  <th>방문소감</th>
			  
			  
			  <td colspan="3" style="height:20%;">
			  <c:set var="maxWords" value="80" />
			    <c:choose>
			      <c:when test="${fn:length(vo.content) > maxWords}">
			        <c:set var="truncatedContent" value="${fn:substring(vo.content, 0, maxWords)}" />
			        ${fn:replace(truncatedContent, newLine, '<br/>')}<br/>
			      </c:when>
			      <c:otherwise>
			        ${fn:replace(vo.content, newLine, '<br/>')}<br/>
			      </c:otherwise>
			    </c:choose>
			  </td>
			  
			  
			</tr>
	  </table>
	  
	  <br/>
	  <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
  </c:forEach>
  <br/>			<!-- 4페이지(1블록)에서 0블록으로 가게되면 현재페이지는 1페이지가 블록의 시작페이지가 된다. -->
  <!-- 첫페이지 / 이전블록 / 1(4) 2(5) 3 / 다음블록 / 마지막페이지 -->
  <div class="text-center">
	  <ul class="pagination justify-content-center">
	    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
	    <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
	    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
	      <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	      <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
	    </c:forEach>
	    <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
	    <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/GuestList.gu?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
	  </ul>
  </div>
</div>
		</div>
		<div class="col-2" style="width:200px">
		
			광고 띄울거야
		</div>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>