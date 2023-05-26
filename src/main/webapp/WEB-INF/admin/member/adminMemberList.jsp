<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>adminMemberList.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
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
    
    // 선택항목의 반전
    $(function() {
    	$("#reverseAll").click(function() {
    		$(".chk").prop("checked", function() {
    			return !$(this).prop("checked");
    		});
    	});
    });
    
    
    
    // 등급별 조회하기
    function MemberSelectCheck() {
    	let pageSize = myform1.pageSize.value;
    	let levelShow = myform1.levelShow.value;
    	
    	location.href = "${ctp}/AdminMemberLevelShow.admin?pag=${pag}&levelShow="+levelShow+"&pageSize="+pageSize;
    }
    
    if(${pag} > ${totPage}) location.href="${ctp}/AdminMemberList.ad?pag=${totPage}&pageSize=${pageSize}";
    
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "${ctp}/AdminMemberList.ad?pag=${pag}&pageSize="+pageSize;
    }
    
    
    function memberDelete(idx) {
    	let ans = confirm("선택한 회원의 삭제 하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		type   : "post",
    		url    : "${ctp}/AdminMemberDelete.ad",
    		data   : {idx : idx},
    		success:function() {
  				alert("회원 삭제 완료!");
  				location.reload();
    		},
    		error : function() {
    			alert("전송 오류~~");
    		}
    	});
    }
 // 선택항목 처리하기
    function mSelectLevelCheck() {
    	let ans = confirm("선택한 항목을 모두 등급변경 하시겠습니까?");
    	if(!ans) return false;
    	
  		let totalLevel = document.getElementById("totalLevel").value;
  		let changeItems = "";
  		
  		for(var i=0; i<myform2.chk.length; i++) {
  		    if(myform2.chk[i].checked==true) changeItems += myform2.chk[i].value;
  		}
  		changeItems = changeItems.substring(0,changeItems.length-1);
    	
  		let query = {
  				changeItems   : changeItems,
    			level : totalLevel
    	}
    	
    	$.ajax({
    		type   : "post",
    		url    : "${ctp}/AdminMemberLevelTotalChange.admin",
    		data   : query,
    		success:function() {
  				alert("등급 수정 완료!");
  				location.reload();
    		},
    		error : function() {
    			alert("전송 오류~~");
    		}
    	});
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myform2">
	  <h2 class="text-center">전체 회원 리스트</h2>
	  <br/>
	  <table class="table table-borderless m-0 p-0">
	    <tr>
	      <td>
	      	<input type="checkbox" id="checkAll"/>전체선택/해제 &nbsp; &nbsp;
	        <input type="checkbox" id="reverseAll"/>전체반전 &nbsp; &nbsp;
	        
	        <select name="totalLevel" id="totalLevel">
            <option value="0">관리자</option>
            <option value="1">준회원</option>
            <option value="2" selected>정회원</option>
            <option value="3">우수회원</option>
            <option value="4">준회원</option>
          </select>
	        <input type="button" value="선택항목등급변경" onclick="mSelectLevelCheck()"/>
	      </td>
	     </tr>
	     </table>
	     
		<form name="myform1">
			<table>
				<tr>
					<td class="text-right">
						<!-- 등급별검색 -->
						<select name="levelShow" id="levelShow" >
						  <option value="9" ${levelShow==9 ? "selected" : ""}>전체보기</option>
							<option value="0" ${levelShow==0 ? "selected" : ""}>관리자</option>
							<option value="1" ${levelShow==1 ? "selected" : ""}>운영자</option>
							<option value="2" ${levelShow==2 ? "selected" : ""}>우수회원</option>
							<option value="3" ${levelShow==3 ? "selected" : ""}>정회원</option>
							<option value="4" ${levelShow==4 ? "selected" : ""}>준회원</option>
						</select>
					</td>
					<td>
				  <!-- 한페이지 분량처리 -->
						<select name="pageSize" id="pageSize" >
						  <option value="3" ${pageSize == "3" ? "selected" : ""}>3</option>
					    <option value="5" ${pageSize == "5" ? "selected" : ""}>5</option>
					    <option value="10" ${pageSize == "10" ? "selected" : ""}>10</option>
					    <option value="15" ${pageSize == "15" ? "selected" : ""}>15</option>
					    <option value="20" ${pageSize == "20" ? "selected" : ""}>20</option>
			      </select> 건
			      <input type="button" value="검색" onclick="MemberSelectCheck()" class="btn btn-primary"/> &nbsp;
		      </td>
			  </tr>
			</table>
		</form>
		
		
	  <table class="table table-hover text-center">
	    <tr class="table-dark text-dark">
	      <th>번호</th>
	      <th>아이디</th>
	      <th>별명</th>
	      <th>성명</th>
	      <th>최초가입일</th>
	      <th>마지막접속일</th>
	      <th>등급</th>
	      <th>탈퇴유무</th>
	    </tr>
	    <c:forEach var="vo" items="${vos}" varStatus="st">
	      <tr>
	        <td>
	          <input type="checkbox" class="chk" name="chk" value="${vo.idx}"/> &nbsp;
	          ${curScrStartNo}
	        </td>
	        <td><a href="${ctp}/AdminMemberInfor.ad?mid=${vo.mid}&pag=${pag}&pageSize=${pageSize}">${vo.mid}</a></td>
	        <td>${vo.nickName}</td>
	        <td>${vo.name}</td>
	        <td>${vo.startDate}</td>
	        <td>${vo.lastDate}</td>
	        <td>
		        <c:if test="${vo.level==0}">관리자</c:if>
		        <c:if test="${vo.level==1}">운영자</c:if>
		        <c:if test="${vo.level==2}">우수회원</c:if>
		        <c:if test="${vo.level==3}">정회원</c:if>
		        <c:if test="${vo.level==4}">준회원</c:if>
	        </td>
	        <td>
	          <c:if test="${vo.userDel == 'OK'}">
	            <font color="red"><b>탈퇴신청</b></font>
	            <c:if test="${vo.deleteDiff >= 30}">
	              (<a href="javascript:memberDelete(${vo.idx})" title="30일경과">x</a>)
	            </c:if>
	          </c:if>
	          <c:if test="${vo.userDel != 'OK'}">활동중</c:if>
	        </td>
	      </tr>
	      <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	    </c:forEach>
	    <tr><td colspan="8" class="m-0 p-0"></td></tr>
	  </table>
	  <!-- 블록 페이징 처리 -->
	  <div class="text-center m-4">
		  <ul class="pagination justify-content-center pagination-sm">
		    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminMemberList.ad?pageSize=${pageSize}&pag=1">첫페이지</a></li></c:if>
		    <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminMemberList.ad?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li></c:if>
		    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="${ctp}/AdminMemberList.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
		      <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminMemberList.ad?pageSize=${pageSize}&pag=${i}">${i}</a></li></c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminMemberList.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
		    <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminMemberList.ad?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li></c:if>
		  </ul>
	  </div>
	 </form>
	  <!-- <input type="hidden" name="changeItems"/> -->
</div>
<p><br/></p>
</body>
</html>