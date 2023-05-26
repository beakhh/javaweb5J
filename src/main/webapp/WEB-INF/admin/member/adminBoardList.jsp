<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boardList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <style>
  	body {
		  font-size: 12px;
		}
    .asdf {
      margin-top: 20px;
      border-radius: 20px;
      background-color: #f8f9fa;
      /* position: relative; */
    }
    .btn-back {
      /* position: absolute; */
      bottom: 10px;
      right: 10px;
      border-radius: 50%;
      height: 50px;
      font-size: 16px;
      background-color: #f8f9fa;
      border: none;
      box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
    }
    .btn-back:hover {
      background-color: #e9ecef;
    }
    .card {
      border: none;
      margin-bottom: 10px;
    }
    .card-header {
      background-color: #f8f9fa;
      font-weight: bold;
      border-top-left-radius: 20px;
      border-top-right-radius: 20px;
    }
    .card-body {
      background-color: #fff;
    }
    .new-icon {
      vertical-align: middle;
    }
	
  </style>
  <script>
    'use strict';
    
    if(${pag} > ${totPage}) location.href="${ctp}/AdminBoardList.admin?pag=${totPage}&pageSize=${pageSize}";
    
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "${ctp}/AdminBoardList.admin?pag=${pag}&pageSize="+pageSize;
    }
    
    function searchCheck() {
    	let searchString = $("#searchString").val();
    	
    	if(searchString.trim() == "") {
    		alert("찾고자하는 검색어를 입력하세요!");
    		searchForm.searchString.focus();
    	}
    	else {
    		searchForm.submit();
    	}
    }
  </script>
</head>
<body>
<div class="table " style="width:100%;">
	<div class="row" style="width:100%;">
		<div class="col" style="width:100%; ">
			<div class="asdf " style="width:100%;  ">
				<div class="card">
				    <div class="card-header">
				  <h2 class="text-center">게 시 판 리 스 트</h2>
				  <table class="table table-borderless">
				    <tr>
				      <td class="text-right">
				        <!-- 한페이지 분량처리 -->
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
				  <table class="table table-hover" style="width: 100%;">
				  	<tr class="table-dark text-dark text-center">
				    	<th style="width: 7%;">번호</th>
				      <th style="width: 15%;">글제목</th>
				      <th style="width: 50%;">글쓴이</th>
				      <th style="width: 10%;">글쓴날짜</th>
				      <th style="width: 6%;">조회수</th>
				      <th style="width: 6%;">좋아요</th>
				    </tr>
				    
				    <c:forEach var="vo" items="${vos}" varStatus="st">
				      <tr class="text-center">
				        <td>${curScrStartNo}</td>
				        
				        <td class="text-left">
					          <a href="${ctp}/AdminBoardContent.admin?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}" style="margin-left:5%;">${vo.title}</a>
					          <c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
				        </td>
				        <td>
				        	<c:if test="${(sLevel ==0 )}">
					          <a href="${ctp}/AdminMemberInfor.admin?mid=${vo.mid}&pag=${pag}&pageSize=${pageSize}" style="margin-left:5%;"> ${vo.nickName}</a>
				          </c:if>
				        </td>
				        <td>
				          <c:if test="${vo.hour_diff > 24}">${fn:substring(vo.wDate,0,10)}</c:if>
				          <c:if test="${vo.hour_diff <= 24}">
				            ${vo.day_diff == 0 ? fn:substring(vo.wDate,11,19) : fn:substring(vo.wDate,10,16)}
				          </c:if>
				        </td>
				        <td>${vo.readNum}</td>
				        <td>${vo.good}</td>
				      </tr>
				      <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
				    </c:forEach>
				    <tr><td colspan="6" class="m-0 p-0"></td></tr>
				  </table>
				  </div>
				  </div>
			  <!-- 블록 페이징 처리 -->
			  <div class="text-center m-4">
				  <ul class="pagination justify-content-center pagination-sm">
				    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminBoardList.admin?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
				    <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminBoardList.admin?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
				    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
				      <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/AdminBoardList.admin?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
				      <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminBoardList.admin?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
				    </c:forEach>
				    <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminBoardList.admin?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
				    <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminBoardList.admin?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
				  </ul>
			  </div>
			  
  <%-- 
  					<!-- 검색기 처리 -->
			  <div class="container text-center">
			    <form name="searchForm" method="post" action="${ctp}/BoardSearch.bo">
			      <b>검색 : </b>
			      <select name="search">
			        <option value="title" selected>글제목</option>
			        <option value="nickName">글쓴이</option>
			        <option value="content">글내용</option>
			      </select>
			      <input type="text" name="searchString" id="searchString"/>
			      <input type="button" value="검색" onclick="searchCheck()" class="btn btn-secondary btn-sm"/>
			      <input type="hidden" name="pag" value="${pag}"/>
			      <input type="hidden" name="pageSize" value="${pageSize}"/>
			    </form>
			  </div>
			   --%>
			   
			</div>
		</div>
	</div>
</div>
</body>
</html>