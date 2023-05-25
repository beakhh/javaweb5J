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
      padding: 20px;
      background-color: #f8f9fa;
      /* position: relative; */
    }
    .btn-back {
      /* position: absolute; */
      bottom: 10px;
      right: 10px;
      border-radius: 50%;
      /* width: 50px; */
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
    
    if(${pag} > ${totPage}) location.href="${ctp}/BoardList.bo?pag=${totPage}&pageSize=${pageSize}";
    
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "${ctp}/BoardList.bo?pag=${pag}&pageSize="+pageSize;
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
    
 // 회원 조회하기
    function showNumShowCheck() {
    	let showNumCheck = document.getElementById("showNumCheck").value;
    	
    	location.href = "${ctp}/BoardShowNumCheck.bo?pageSize=${pageSize}&showNumCheck="+showNumCheck;
    }
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />
<p><br/></p>

<div class="table">
	<div class="row" style="width:100%;">
		<div class="col-8" style="width:80%; margin-left:10%">
			<div class="asdf" style="width:100%; margin-left:5%;  ">
				<div class="card">
				  <form>
			    <div class="card-header">
				  <h2 class="text-center">게 시 판 리 스 트</h2>
				  
				  <table class="table table-borderless">
				    <tr>
				      <td><c:if test="${sLevel != 0}"><a href="${ctp}/BoardInput.bo" class="btn btn-primary btn-sm">글쓰기</a></c:if></td>
				      <td class="text-right">
				      
				      <!-- 등급별검색 -->
					    	<select name="showNumCheck" id="showNumCheck" onchange="showNumShowCheck()">
					        <option value="0" ${showNum == "0" ? "selected" : ""}>전체공개</option>
									<option value="1" ${showNum == "1" ? "selected" : ""}>준회원</option>
									<option value="2" ${showNum == "2" ? "selected" : ""}>정회원</option>
									<option value="3" ${showNum == "3" ? "selected" : ""}>우수회원</option>
									<option value="4" ${showNum == "4" ? "selected" : ""}>운영자</option>
									<option value="5" ${showNum == "5" ? "selected" : ""}>관리자</option>
									<option value="6" ${showNum == "6" ? "selected" : ""}>공지</option>
					    	</select>
					    	
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
				    	<th style="width: 8%;">번호</th>
				      <th style="width: 50%;">글제목</th>
				      <th style="width: 15%;">글쓴이</th>
				      <th style="width: 10%;">글쓴날짜</th>
				      <th style="width: 6%;">조회수</th>
				      <th style="width: 6%;">좋아요</th>
				    </tr>
				    
				    <c:forEach var="vo" items="${vos}" varStatus="st">
					    <c:if test="${ (vo.showNum ==  6)}">
					    	<tr class="text-center">
						    	<td class = "badge badge-danger" style="margin-top:4.5px">
						    		<a href="${ctp}/BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}" style="margin-left: 5%; color: white;">
						    			공지
						    		</a>
						    	</td>
						    	<td class="text-left">
						    		<a href="${ctp}/BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}" style="margin-left:5%;">${vo.title}</a>
						    	</td>
					    		<td>${vo.nickName}</td>
					        <td>
					          <!-- 1일(24시간) 이내는 시간만 표시, 이후는 날짜와 시간을 표시 : 2023-05-04 10:35:25 -->
					          <!-- 단(24시간안에 만족하는 자료), 날짜가 오늘날짜만 시간으로표시하고, 어제날짜는 날짜로 표시하시오. -->
					          <c:if test="${vo.hour_diff > 24}">${fn:substring(vo.wDate,0,10)}</c:if>
					          <c:if test="${vo.hour_diff <= 24}">
					            ${vo.day_diff == 0 ? fn:substring(vo.wDate,11,19) : fn:substring(vo.wDate,10,16)}
					          </c:if>
					        </td>
						    	<td>${vo.readNum}</td>
						    	<td>${vo.good}</td>
					    	</tr>
					    </c:if>
				    </c:forEach>
				    
				    <c:forEach var="vo" items="${vos}" varStatus="st">
				    <c:if test="${ (vo.showNum < 6)}">
				      <tr class="text-center">
				        <td>${curScrStartNo}</td>
				        
				        <td class="text-left">
				          <c:if test="${(vo.openSw == 'OK' && sLevel == 4 && vo.showNum < 2)}">
					          <a href="${ctp}/BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}" style="margin-left:5%;">${vo.title}</a>
				          	<c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
				          </c:if>
				          <c:if test="${(vo.openSw == 'OK' && sLevel == 4 && vo.showNum > 1)}">
				          	${vo.title}
				          	<c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
				          </c:if>
				         
				          <c:if test="${(vo.openSw == 'OK' && sLevel == 3 &&  vo.showNum < 3) }">
						        <a href="${ctp}/BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}" style="margin-left:5%;">${vo.title}</a>
					          <c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
				          </c:if>
				          <c:if test="${(vo.openSw == 'OK' && sLevel == 3 &&  vo.showNum > 2)}">
					        	 ${vo.title}
				          	<c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
				          </c:if>
				          
				          <c:if test="${(vo.openSw == 'OK' && sLevel == 2 &&  vo.showNum < 4) }">
						        <a href="${ctp}/BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}" style="margin-left:5%;">${vo.title}</a>
					          <c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
				          </c:if>
				          
				          <c:if test="${(vo.openSw == 'OK' && sLevel == 2 &&  vo.showNum > 3)}">
					        	 ${vo.title}
				          	<c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
				          </c:if>
				          
				          <c:if test="${(vo.openSw == 'OK' && sLevel == 1 &&  vo.showNum < 5) }">
						        <a href="${ctp}/BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}" style="margin-left:5%;">${vo.title}</a>
					          <c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
				          </c:if>
				          
				          <c:if test="${(vo.openSw == 'OK' && sLevel == 1 &&  vo.showNum > 4)}">
					        	 ${vo.title}
				          	<c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
				          </c:if>
				          
				          <c:if test="${sLevel == 0}">
						        <a href="${ctp}/BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}" style="margin-left:5%;">${vo.title}</a>
					          <c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
				          </c:if>
				          
				        </td>
				        
				        <td>${vo.nickName}</td>
				        <td>
				          <!-- 1일(24시간) 이내는 시간만 표시, 이후는 날짜와 시간을 표시 : 2023-05-04 10:35:25 -->
				          <!-- 단(24시간안에 만족하는 자료), 날짜가 오늘날짜만 시간으로표시하고, 어제날짜는 날짜로 표시하시오. -->
				          <c:if test="${vo.hour_diff > 24}">${fn:substring(vo.wDate,0,10)}</c:if>
				          <c:if test="${vo.hour_diff <= 24}">
				            ${vo.day_diff == 0 ? fn:substring(vo.wDate,11,19) : fn:substring(vo.wDate,10,16)}
				          </c:if>
				        </td>
				        <td>${vo.readNum}</td>
				        <td>${vo.good}</td>
				      </tr>
				      <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
				    </c:if>
				    </c:forEach>
				    <tr><td colspan="6" class="m-0 p-0"></td></tr>
				  </table>
				  </div>
				  </form>
				  </div>
			  <!-- 블록 페이징 처리 -->
			  <div class="text-center m-4">
				  <ul class="pagination justify-content-center pagination-sm">
				    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
				    <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
				    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
				      <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
				      <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
				    </c:forEach>
				    <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
				    <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
				  </ul>
			  </div>
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
			</div>
		</div>
		
		<div class = "col" style="margin-left:5%; " >
			광고 넣을거야
		</div>
		
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>