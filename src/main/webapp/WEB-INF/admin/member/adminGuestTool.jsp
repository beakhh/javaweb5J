<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
  
    // 삭제
    function memberDelete(idx) {
    	let ans = confirm("선택한 회원의 삭제 하시겠습니까?");
    	if(!ans) return false;
    	
  		let changeItems = "";
    	
    	for(var i=0; i<myform.chk.length; i++) {
  			if(myform.chk[i].checked==true) changeItems += myform.chk[i].value + "/";
  		}
    	changeItems = changeItems.substring(0,changeItems.length-1);
    	
    	$.ajax({
    		type   : "post",
    		url    : "${ctp}/AdminMemberDelete.admin",
    		data   : {changeItems   : changeItems},
    		success:function() {
  				alert("회원 삭제 완료!");
  				//location.href = "${ctp}/AdminGuest.admin";
  				window.parent.location.reload();
    		},
    		error : function() {
    			alert("전송 오류~~");
    		}
    	});
    }
    
 // 선택항목의 반전
    $(function() {
    	$("#reverseAll").click(function() {
    		$(".chk").prop("checked", function() {
    			return !$(this).prop("checked");
    		});
    	});
    });
    
    // 회원 조회하기
    function MidShowCheck() {
    	let midCheck = document.getElementById("midCheck").value;
    	
    	location.href = "${ctp}/AdminMemberMidShow.admin?midCheck="+midCheck;
    }
    
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "${ctp}/AminGuestTool.admin?pag=${pag}&pageSize="+pageSize;
    }
  </script>
</head>
<body>
	<form name="myform">
	  <h3 class="text-center">방명록 수정</h3>
	  <br/>
	  <table class="table table-borderless m-0 p-0">
	    <tr>
	      <td>
	      	<input type="checkbox" id="checkAll"/>전체선택/해제 &nbsp; &nbsp;
	        <input type="checkbox" id="reverseAll"/>전체반전 &nbsp; &nbsp;
	      </td>
	      <td class="text-right">
      
        	<a href="javascript:memberDelete()"  class="btn btn-danger btn-sm" ><b>삭제</b></a>
        
	      </td>
	      <td class="text-right;" style=" padding:13px;">
	      	<!-- 등급별검색 -->
	      	<select name="midCheck" id="midCheck" onchange="MidShowCheck()">
            <option value="0" ${midCheck == 0 ? "selected" : ""}>전체보기</option>
            <option value="1" ${midCheck == 1 ? "selected" : ""}>회원 보기</option>
	      	</select>
	      	&nbsp;&nbsp;
	      
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

	<div>
	  <table class="table table-hover text-center">
	    <tr class="table-dark text-dark">
	      <th>성명</th>
	      <th>닉네임</th>
	      <th>아이디</th>
	      <th>내용</th>
	      <th>방문일자</th>
	      <th>접속 IP</th>
	    </tr>
	    <c:forEach var="vo" items="${vos}" varStatus="st">
	      <tr>
	        <td>
	          <input type="checkbox" class="chk" name="chk" name="chk" value="${vo.idx}"/> &nbsp;
	          ${curScrStartNo}
	        </td>
	        <td><a href="${ctp}/AdminMemberInfor.ad?">${vo.name}</a></td>
	        <td>${vo.mid}</td>
	        <td>
	        	<c:set var="maxWords" value="20" />
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
	        <td>${vo.visitDate}</td>
	        <td>${vo.hostIp}</td>
	        </tr>
	      <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	    </c:forEach>
	    <tr><td colspan="8" class="m-0 p-0"></td></tr>
	  </table>
	  </div>
	  
	  
	  <!-- 블록 페이징 처리 -->
	  <div class="text-center m-4">
		  <ul class="pagination justify-content-center pagination-sm">
		    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AminGuestTool.admin?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
		    <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AminGuestTool.admin?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
		    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/AminGuestTool.admin?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
		      <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AminGuestTool.admin?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AminGuestTool.admin?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
		    <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AminGuestTool.admin?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
		  </ul>
	  </div>
	  <!-- <input type="hidden" name="changeItems"/> -->
  </form>
</body>
</html>