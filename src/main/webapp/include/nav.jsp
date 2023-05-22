<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>
<style>
  #log {
    width: auto;
    margin-left: auto;
    z-index : 1;
  }
  #miso{
  z-index : 2;
  }
</style>

<div id="miso" style="margin-left: 10.2%; margin-top: 13px; margin-right: 10.2%; padding: 0;">
  <img src="${ctp}/images/bg_1.jpg" width="200px" height="60px" style="margin-bottom: 2px">
  
</div>
<hr style="height: 0px; margin: 5px auto;">
<nav class="navbar navbar-expand-lg navbar-light" style="margin-left: 10%; margin-right: 10%; margin-bottom: 2px;  padding: 0;">
  <!-- <a class="navbar-brand" href="http://localhost:9090/javaweb/">Home</a> -->
  <a class="navbar-brand" href="http://192.168.50.85:9090/javaweb5J/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/GuestList.gu">전체상품</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/BoardList.bo">신상품</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${ctp}/GuestList.gu">방명록</a>
      </li>
      
      <c:if test="${level < 5}">
      <li>
			  <div class="dropdown">
			    <button type="button" class="btn text-dark dropdown-toggle" data-toggle="dropdown">커뮤니티</button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="${ctp}/study/0428_database/login.jsp">로그인연습</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/mapping/Test1">URL매핑(디렉토리패턴)</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/mapping/Test5.do">URL매핑(확장자패턴1)</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/mapping2/Test5.mi">URL매핑(확장자패턴2)</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/study/0428_database/Login.re">로그인연습2</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/Password.st">암호화 연습</a>
			    </div>
			  </div>  
      </li>   
      <li>
			  <div class="dropdown">
			    <button type="button" class="btn text-dark dropdown-toggle" data-toggle="dropdown">Study2</button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="#">URL매핑(디렉토리패턴)</a>
			      <a class="dropdown-item" href="#">로그인연습3</a>
			      <a class="dropdown-item" href="#">Link 3</a>
			    </div>
			  </div>  
      </li>   
      <li>
			  <div class="dropdown">
			    <button type="button" class="btn text-dark dropdown-toggle" data-toggle="dropdown">MyPage</button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="${ctp}/MemberMyPage.mem">내 정보</a>
			      <a class="dropdown-item" href="#">회원정보수정</a>
			      <a class="dropdown-item" href="#">회원리스트</a>
			      <a class="dropdown-item" href="#">회원탈퇴</a>
			    </div>
			  </div>  
      </li>
	  </c:if>
    </ul>
  </div>
  
  	<div id="log" >	
      <ul class="navbar-nav collapse navbar-collapse " id="collapsibleNavbar">
			 <li id="nav-item1">
        <c:if test="${level > 5}"> <a class="nav-link" href="${ctp}/MemberJoin.mem">로그인 / 회원가입</a></c:if>
        <c:if test="${level < 5}"> <a class="nav-link" href="${ctp}/MemberLogout.mem"> 로그아웃 </a></c:if>
      </li>
    </ul>
	</div>
</nav>
	<hr style="height: 0px; margin: 5px auto;">