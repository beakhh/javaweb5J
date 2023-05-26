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
    
      table {
        border-collapse: collapse;
        border-radius: 10px;
        overflow: hidden; /* 모서리를 둥글게 만들기 위해 추가 */
    }

    th, td {
        padding: 10px;
        border: 1px solid #ccc;
    }
	
  </style>
  <script>
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp" />

<div class="table">
	<div class="row" style="width:100%;">
		<div class="col-8" style="width:80%; margin-left:10%">
			<div class="asdf" style="width:100%; margin-left:5%;  ">
				<div class="card">
				  <form>
				    <div class="card-header ">
					  	<h2 class="text-center">이벤트</h2>
					  	<div style="text-align: center;">
						  	<div >
						  		<img src="${ctp}/images/member/event1.jpg"/>
						  	</div >
						  	<div>
						  		<img src="${ctp}/images/member/event2.jpg"/>
						  	</div>
						  	<div>
						  		<img src="${ctp}/images/member/event3.jpg"/>
						  	</div>
					  	</div>
					  </div>
				  </form>
			  </div>
			</div>
		</div>
		
		<div >
			</div>
		
		<div class = "" style="margin-right:12%; position: fixed;right: 20px;">
			광고 넣을거야
			<table>
		    <tr>
		        <th colspan="3">[담은] 마음을 담은 한잔</th>
		    </tr>
		    <tr>
		        <td colspan="3"> 선착순 5명</td>
		    </tr>
		    <tr>
		        <td>내용 4</td>
		        <td>내용 5</td>
		        <td>내용 6</td>
		    </tr>
		</table>
		</div>
		
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>