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
  <title>boardContent.jsp</title>
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
    function boardDelete() {
    	let ans = confirm("현 게시글을 삭제하시겠습니까?");
    	if(ans) location.href="${ctp}/BoardDelete.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&nickName=${vo.nickName}";
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
						<h2 class="text-center">글 내 용 보 기</h2>
					  <br/>
					  <table class="table table-borderless m-0 p-0">
					    <tr>
					      <td class="text-right">접속IP : ${vo.hostIp}</td>
					  	</tr>
						</table>
						<table class="table table-bordered">
							<tr>
								<th>글쓴이</th>
									<td>${vo.nickName}</td>
									
								<th>글쓴날짜</th>
									<td>${fn:substring(vo.wDate,0,fn:length(vo.wDate)-2)}</td>
							</tr>
							
						<tr>
							<th>글제목</th>
							<td colspan="3">${vo.title}</td>
						</tr>
						<tr>
							<th>전자메일</th>
								<td>${vo.email}</td>
								
							<th>조회수</th>
								<td>${vo.readNum}</td>
								
						</tr>
						<tr>
							<th>홈페이지</th>
								<td colspan="3">${vo.homePage}</td>
						</tr>
							<tr>
								<th>글내용</th>
									<td colspan="3" style="height:220px">${fn:replace(vo.content, newLine, "<br/>")}</td>
							</tr>
						<tr>
							<td colspan="4" class="text-center">
								<c:if test="${flag == 'search'}"><input type="button" value="돌아가기" onclick="location.href='${ctp}/BoardSearch.bo?search=${search}&searchString=${searchString}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary"/></c:if>
								<c:if test="${flag == 'searchMember'}"><input type="button" value="돌아가기" onclick="location.href='${ctp}/BoardSearchMember.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary"/></c:if>
								<c:if test="${flag != 'search' && flag != 'searchMember'}"><input type="button" value="돌아가기" onclick="location.href='${ctp}/BoardList.bo?pag=${pag}&pageSize=${pageSize}';" class="btn btn-primary"/></c:if>
									&nbsp;
								<c:if test="${sMid == vo.mid || sLevel == 0}">
								<input type="button" value="수정하기" onclick="location.href='${ctp}/BoardUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-warning"/> &nbsp;
								<input type="button" value="삭제하기" onclick="boardDelete()" class="btn btn-danger"/>
								</c:if>
							</td>
						</tr>
						</table>
					
						<c:if test="${flag != 'search' && flag != 'searchMember'}">
						<!-- 이전글/ 다음글 처리 -->
							<table class="table table-borderless">
								<tr>
									<td>
										<c:if test="${nextVo.nextIdx != 0}">
											☝ <a href="${ctp}/BoardContent.bo?idx=${nextVo.nextIdx}&pag=${pag}&pageSize=${pageSize}">다음글 : ${nextVo.nextTitle}</a><br/>
										</c:if>
										<c:if test="${preVo.preIdx != 0}">
											👇 <a href="${ctp}/BoardContent.bo?idx=${preVo.preIdx}&pag=${pag}&pageSize=${pageSize}">이전글 : ${preVo.preTitle}</a><br/>
										</c:if>
									</td>
								</tr>
							</table>
						</c:if>
					
					<!-- 댓글 리스트보여주기 -->
						<div class="container">
							<table class="table table-hover text-left">
								<tr>
									<th> &nbsp;작성자</th>
									<th>댓글내용</th>
									<th>작성일자</th>
									<th>접속IP</th>
								</tr>
							<c:forEach var="replyVo" items="${replyVos}" varStatus="st">
								<tr>
								  <td class="text-center">${replyVo.nickName}
										<c:if test="${sMid == replyVo.mid || sLevel == 0}">
											(<a href="javascript:replyDelete(${replyVo.idx})" title="댓글삭제"><b>x</b></a>)
										</c:if>
									</td>
									<td>${fn:replace(replyVo.content, newLine, "<br/>")}</td>
									<td class="text-center">${fn:substring(replyVo.wDate,0,10)}</td>
									<td class="text-center">${replyVo.hostIp}</td>
								</tr>
							</c:forEach>
							</table>
						</div>
					
					<!-- 댓글 입력창 -->
						<form name="replyForm">
							<table class="table tbale-center">
								<tr>
									<td style="width:85%" class="text-left">
										글내용 :
										<textarea rows="4" name="content" id="content" class="form-control"></textarea>
									</td>
									<td style="width:15%">
										<br/>
										<p>작성자 : ${sNickName}</p>
										<p><input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-info btn-sm"/></p>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>