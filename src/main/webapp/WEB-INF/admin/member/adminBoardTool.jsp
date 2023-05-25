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
    
    if(${pag} > ${totPage}) location.href="${ctp}/AdminBoardTool.admin?pag=${totPage}&pageSize=${pageSize}";
    
    /*
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
    */
  //전체 선택
    $(function() {
    	$("#checkAll").click(function() {
    		if($("#checkAll").prop("checked")) {
    		  $(".chk").prop("checked",true);
    	  }
    	  else {
    		  $(".chk").prop("checked",false);
    	  }
    	});
    });
    
 // 선택항목의 반전
    $(function() {
    	$("#reverseAll").click(function() {
    		$(".chk").prop("checked", function() {
    			return !$(this).prop("checked");
    		});
    	});
    });
    
 // 삭제
    function memberDelete(idx) {
    	let ans = confirm("선택한 게시글을 삭제 하시겠습니까?");
    	if(!ans) return false;
    	
  		let changeItems = "";
    	
    	for(var i=0; i<myform.chk.length; i++) {
  			if(myform.chk[i].checked==true) changeItems += myform.chk[i].value + "/";
  		}
    	changeItems = changeItems.substring(0,changeItems.length-1);
    	
    	$.ajax({
    		type   : "post",
    		url    : "${ctp}/AdminBoardDelete.admin",
    		data   : {changeItems   : changeItems},
    		success:function() {
  				alert("게시글 삭제 완료!");
  				//location.href = "${ctp}/AdminGuest.admin";
  				window.parent.location.reload();
    		},
    		error : function() {
    			alert("전송 오류~~");
    		}
    	});
    }
//페이지
 		function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "${ctp}/AdminBoardTool.admin?pag=${pag}&pageSize="+pageSize;
    }
  
 // 분류 조회하기
 		function selectCheck() {
        
    	let part = myform.part.value;
    	let showNum = myform.showNum.value;
    	location.href = "${ctp}/AdminBoardToolShow.admin?pag=${pag}&pageSize=${pageSize}&part="+part+"&showNum="+showNum;
    	
  		myform.submit();
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
					<h2 class="text-center">게 시 판 수 정</h2>
					
						<form name="myform" method="post" action="${ctp}/AdminBoardToolShow.admin">
							<table class="table table-borderless">
								<tr>
									<td>
										<input type="checkbox" id="checkAll"/>전체선택/해제 &nbsp; &nbsp;
										<input type="checkbox" id="reverseAll"/>전체반전 &nbsp; &nbsp;
									</td>
									<td class="text-right">
										<a href="javascript:memberDelete()"  class="btn btn-danger btn-sm" ><b>삭제</b></a>
									</td>
									<td>
										<a href="${ctp}/AdminBoardInput.admin" class="btn btn-primary btn-sm">글쓰기</a>
									</td>
									
									<td class="text-right" style="display:flex" >
											<select name="part" id="part">
											  <option value="0" ${part=="0" ? "selected" : ""}>전체</option>
												<option value="1" ${part=="1" ? "selected" : ""}>전통주</option>
												<option value="2" ${part=="2" ? "selected" : ""}>서양주</option>
												<option value="3" ${part=="3" ? "selected" : ""}>동양주</option>
											</select>
										
											<select name="showNum" id="showNum">
												<option value="0" ${showNum == "0" ? "selected" : ""}>전체공개</option>
												<option value="1" ${showNum == "1" ? "selected" : ""}>준회원</option>
												<option value="2" ${showNum == "2" ? "selected" : ""}>정회원</option>
												<option value="3" ${showNum == "3" ? "selected" : ""}>우수회원</option>
												<option value="4" ${showNum == "4" ? "selected" : ""}>운영자</option>
												<option value="5" ${showNum == "5" ? "selected" : ""}>관리자</option>
												<option value="5" ${showNum == "6" ? "selected" : ""}>공지전용</option>
											</select>
											<input type="button" value="검색" onclick="selectCheck()" class="btn btn-primary"/> &nbsp;
									</td>
									
									<td>
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
							<input type="hidden" name="pag" value="${pag}"/>
							<input type="hidden" name="pageSize" value="${pageSize}"/>
						</form>
							<table class="table table-hover" style="width: 100%;">
								<tr class="table-dark text-dark text-center">
									<th style="width: 8%;">번호</th>
									<th style="width: 3%;" ></th>
									<th style="width: 10%;">글제목</th>
									<th style="width: 10%;">글쓴이</th>
									<th style="width: 10%;">분류</th>
									<th style="width: 10%;">공개범위</th>
									<th style="width: 10%;">글쓴날짜</th>
									<th style="width: 8%;">조회수</th>
									<th style="width: 8%;">좋아요</th>
								</tr>
								<c:forEach var="vo" items="${vos}" varStatus="st">
									<tr class="text-center">
										<td>
											<input type="checkbox" class="chk" name="chk" name="chk" value="${vo.idx}"/> &nbsp;
											${curScrStartNo}
										</td>
										<td>
											<c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif"/></c:if>
										</td>
										<td class="text-left">
											<a href="${ctp}/AdminBoardContent.admin?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}" style="margin-left:5%;">${vo.title}</a>
											
										</td>
										<td>
											<a href="${ctp}/AdminMemberInfor.admin?mid=${vo.mid}&pag=${pag}&pageSize=${pageSize}" style="margin-left:5%;"> ${vo.nickName}</a>
										</td>
										<td>
											<c:if test="${vo.part == 1}"> 전통주 </c:if>
											<c:if test="${vo.part == 2}"> 서양주 </c:if>
											<c:if test="${vo.part == 3}"> 동양주 </c:if>
										</td>
										
										
										<td>${vo.showNum}</td>
										
										
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
										  <!-- 블록 페이징 처리 -->
							<div class="text-center m-4">
							<ul class="pagination justify-content-center pagination-sm">
								<c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminBoardTool.admin?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
								<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminBoardTool.admin?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
									<c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
										<c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/AdminBoardTool.admin?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
										<c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminBoardTool.admin?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
									</c:forEach>
								<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminBoardTool.admin?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
								<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminBoardTool.admin?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
							</ul>
						</div>
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
</div>
</body>
</html>