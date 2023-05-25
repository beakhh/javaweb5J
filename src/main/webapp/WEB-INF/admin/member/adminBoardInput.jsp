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
    
  </script>
</head>
<body>
<div class="table " style="width:100%;">
	<div class="row" style="width:100%;">
		<div class="col" style="width:100%; ">
			<div class="asdf " style="width:100%;  ">
				<div class="card">
				  <h2 class="text-center">관리자 전용 게시판</h2>
				  <form name="myform" method="post" action="${ctp}/BoardInputOk.bo">
				    <table class="table table-bordered" style="margin-top:20px">
				      <tr>
				        <th>글쓴이</th>
				        <td>${sNickName}</td>
				      </tr>
				      <tr>
				        <th>글제목</th>
				        <td><input type="text" name="title" id="title" placeholder="글제목을 입력하세요" autofocus required class="form-control"></td>
				      </tr>
				      <tr>
				        <th>이메일</th>
				        <td><input type="text" name="email" id="email" placeholder="이메일을 입력하세요" class="form-control"/></td>
				      </tr>
				      <tr>
				        <th>홈페이지</th>
				        <td><input type="text" name="homePage" id="homePage" value="https://" placeholder="홈페이지를 입력하세요" class="form-control"/></td>
				      </tr>
				      <tr>
				        <th>글내용</th>
				        <td><textarea rows="6" name="content" class="form-control" required></textarea></td>
				      </tr>
				      <tr>
				        <th>공개여부</th>
				        <td>
				          <input type="radio" name="openSw" value="OK" checked />공개 &nbsp;
				          <input type="radio" name="openSw" value="NO" />비공개
				        </td>
				      </tr>
				      <tr>
					      <th>분류 
					      <c:if test="${sLevel == 0}">/ 공개범위 </c:if>
					      </th>
					      
					      
					      <td style="display:flex">
						      <select name="part" id="part" class="form-control" style="width:50%">
						        <option value="0" ${part=="0" ? "selected" : ""}>분류선택</option>
						        <option value="0" ${part=="0" ? "selected" : ""}>전체</option>
						        <option value="1" ${part=="1" ? "selected" : ""}>전통주</option>
						        <option value="2" ${part=="2" ? "selected" : ""}>서양주</option>
						        <option value="3" ${part=="3" ? "selected" : ""}>동양주</option>
						      </select>
						      <c:if test="${sLevel <2}">
									  <select name="showNum" id="showNum" class="form-control" style="width:50%">
									    <option value="4" ${showNum == 4 ? "selected" : ""}>전체공개</option>
									    <option value="3" ${showNum == 3 ? "selected" : ""}>준회원</option>
									    
									    <c:if test="${sLevel <2}">
									      <option value="2" ${showNum == 2 ? "selected" : ""}>정회원</option>
									      <option value="1" ${showNum == 1 ? "selected" : ""}>우수회원</option>
									    </c:if>
									    
									    <c:if test="${sLevel == 0}">
									      <option value="0" ${showNum == "0" ? "selected" : ""}>관리자</option>
									      <option value="0" ${showNum == "5" ? "selected" : ""}>공지사항</option>
									    </c:if>
									    
									  </select>
									</c:if>
						    </td>
						    
						    
				      </tr>
				      <tr>
				        <td colspan="2" class="text-center">
				          <input type="button" value="글올리기" onclick="fCheck()" class="btn btn-primary"/> &nbsp;
				          <input type="reset" value="다시입력" class="btn btn-warning"/> &nbsp;
				          <input type="button" value="돌아가기" onclick="history.back();" class="btn btn-secondary"/>
				        </td>
				      </tr>
				    </table>
				    <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
				  </form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>