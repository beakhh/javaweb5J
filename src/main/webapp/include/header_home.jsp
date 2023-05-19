<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<head>
	<style>
	</style>
</head>
<div class=" text-center" style="margin-top:0; height:300px; width:100% ">
	<div class="">
	  <div id="demo" class="carousel slide" data-ride="carousel">
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active"></li>
		    <li data-target="#demo" data-slide-to="1"></li>
		    <li data-target="#demo" data-slide-to="2"></li>
		  </ul>
		  
			 <div id="img" class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="${ctp}/images/bg_1.jpg" alt="Los Angeles" width=100% height=300px>
		      <div class="carousel-caption">
		        <h3>이벤트</h3>
		        <p>마감 임박</p>
		      </div>   
		    </div>
		    
		    <div class="carousel-item">
		      <img src="${ctp}/images/bg_1.jpg" alt="Chicago" width="100%" height="300px">
		      <div class="carousel-caption">
		        <h3>이벤트</h3>
		        <p>마감 임박</p>
		      </div>   
		    </div>
		    
		    <div class="carousel-item">
		      <img src="${ctp}/images/bg_1.jpg" alt="New York" width="100%" height="300px">
		      <div class="carousel-caption">
		        <h3>이벤트</h3>
		        <p>마감 임박</p>
		      </div>   
		    </div>
		    
		  </div>
		  
		  <a class="carousel-control-prev" href="#demo" data-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </a>
		  
		  <a class="carousel-control-next" href="#demo" data-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </a>
		</div>
	  
	  
  </div> 
</div>