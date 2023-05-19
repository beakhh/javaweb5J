<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>memberJoin.jsp</title>
		<jsp:include page="/include/bs4.jsp"/>
	<style>
	body{
	  margin:0;
	  color:#000;
	  background:#white;
	  font:600 16px/18px 'Open Sans',sans-serif;
	}
	*,:after,:before{box-sizing:border-box}
	.clearfix:after,.clearfix:before{content:'';display:table}
	.clearfix:after{clear:both;display:block}
	a{color:inherit;text-decoration:none}
	
	.login-wrap{
	  width:100%;
	  margin:auto;
	  max-width:525px;
	  min-height:670px;
	  position:relative;
	  box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
	}
	.login-html{
	  width:100%;
	  height:100%;
	  position:absolute;
	  padding:90px 70px 50px 70px;
	  background:rgba(160,160,160,.2);
	}
	.login-html .sign-in-htm,
	.login-html .sign-up-htm{
	  top:0;
	  left:0;
	  right:0;
	  bottom:0;
	  position:absolute;
	  transform:rotateY(180deg);
	  backface-visibility:hidden;
	  transition:all .4s linear;
	}
	.login-html .sign-in,
	.login-html .sign-up,
	.login-form .group .check{
	  display:none;
	}
	.login-html .tab,
	.login-form .group .label,
	.login-form .group .button{
	  text-transform:uppercase;
	}
	.login-html .tab{
	  font-size:22px;
	  margin-right:15px;
	  padding-bottom:5px;
	  margin:0 15px 10px 0;
	  display:inline-block;
	  border-bottom:2px solid transparent;
	}
	.login-html .sign-in:checked + .tab,
	.login-html .sign-up:checked + .tab{
	  border-color: #000;
	  color: #fff;
	  text-shadow: 1px 1px 2px #000;
	}
	.login-form{
	  min-height:345px;
	  position:relative;
	  perspective:1000px;
	  transform-style:preserve-3d;
	}
	.login-form .group{
	  margin-bottom:15px;
	}
	.login-form .group .label,
	.login-form .group .input,
	.login-form .group .button{
	  width:100%;
	  display:block;
	}
	.login-form .group .input,
	.login-form .group .button{
	  border:none;
	  padding:15px 20px;
	  border-radius:25px;
	}
	.login-form .group input[data-type="password"]{
	  text-security:circle;
	  -webkit-text-security:circle;
	}
	.login-form .group .label{
	  color:#000;
	  font-size:12px;
	}
	.login-form .group .button{
	 background: #EEE5A2;
	}
	.login-form .group label .icon{
	  width:15px;
	  height:15px;
	  border-radius:2px;
	  position:relative;
	  display:inline-block;
	  
	}
	.login-form .group label .icon:after,
	.login-form .group label .icon:before{
	  content:'';
	  width:10px;
	  height:2px;
	  background:#000;
	  position:absolute;
	  transition:all .2s ease-in-out 0s;
	}
	.login-form .group label .icon:before{
	  left:3px;
	  width:5px;
	  bottom:6px;
	  transform:scale(0) rotate(0);
	}
	.login-form .group label .icon:after{
	  top:6px;
	  right:0;
	  transform:scale(0) rotate(0);
	}
	.login-form .group .check:checked + label{
	  color:#000;
	}
	.login-form .group .check:checked + label .icon{
	  background:rgba(80,80,80,.5);
	}
	.login-form .group .check:checked + label .icon:before{
	  transform:scale(1) rotate(45deg);
	}
	.login-form .group .check:checked + label .icon:after{
	  transform:scale(1) rotate(-45deg);
	}
	.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
	  transform:rotate(0);
	}
	.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
	  transform:rotate(0);
	}
	
	.hr{
	  height:2px;
	  margin:60px 0 50px 0;
	}
	.foot-lnk{
	  text-align:center;
	}
	</style>
	
	
	<script>
	function fCheck() {
    	// 유효성 검사.....
    	// 아이디,닉네임,성명,이메일,홈페이지,전화번호,비밀번호 등등....
    	
    	let regMid = /^[a-zA-Z0-9_]{4,20}$/;
    	let regPwd = /(?=.*[0-9a-zA-Z]).{4,20}$/;
      let regNickName = /^[가-힣]+$/;
      let regName = /^[가-힣a-zA-Z]+$/;
      
    	let mid = myform.mid.value.trim();
    	let pwd = myform.pwd.value;
    	let nickName = myform.nickName.value;
    	let name = myform.name.value;
      
    	/*
      let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      let regURL = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/;
    	let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
    	
    	let email1 = myform.email1.value.trim();
    	let email2 = myform.email2.value;
    	let email = email1 + "@" + email2;
    	let homePage = myform.homePage.value;
    	let tel1 = myform.tel1.value;
    	let tel2 = myform.tel2.value.trim();
    	let tel3 = myform.tel3.value.trim();
    	let tel = tel1 + "-" + tel2 + "-" + tel3;
	*/
    	let submitFlag = 0;		// 모든 체크가 정상으로 종료되게되면 submitFlag는 1로 변경처리될수 있게 한다.
    	
    	if(!regMid.test(mid)) {
    		alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
    		myform.mid.focus();
    		return false;
    	}
    	else if(!regPwd.test(pwd)) {
        alert("비밀번호는 1개이상의 문자와 특수문자 조합의 6~24 자리로 작성해주세요.");
        myform.pwd.focus();
        return false;
      }
      else if(!regName.test(name)) {
        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
        myform.name.focus();
        return false;
      }
      else if(!regNickName.test(nickName)) {
        alert("닉네임은 한글만 사용가능합니다.");
        myform.nickName.focus();
        return false;
      }
      else {
    	  submitFlag = 1;
      }
    	
    	if(submitFlag == 1) {
    		
	    	myform.submit();
    	}
    	else {
    		alert("회원가입 실패~~ 폼의 내용을 확인하세요.");
    	}
	}
    	
	</script>
</head>

<body>
<jsp:include page="/include/nav.jsp" />

<div class="login-wrap">
  <div class="login-html">
    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
    <div class="login-form">
      <div class="sign-in-htm">
      
        <div class="group">
          <label for="user" class="label">Username</label>
          <input id="user" type="text" class="input">
        </div>
        
        <div class="group">
          <label for="pass" class="label">Password</label>
          <input id="pass" type="password" class="input" data-type="password">
        </div>
        
        <div class="group">
          <input id="check" type="checkbox" class="check" checked>
          <label for="check"><span class="icon"></span> Keep me Signed in</label>
        </div>
        
        <div class="group">
          <input type="submit" class="button" value="Sign In">
        </div>
        
        <div class="hr"></div>
        <div class="foot-lnk">
          <a href="#forgot">Forgot Password?</a>
        </div>
      </div>
      
      <form name="myform" method="post" action="${ctp}/MemberJoinOk.mem">
	      <div class="sign-up-htm">
	        <div class="group">
	          <label for="mid" class="label">아이디</label>
	          <input id="mid" name="mid" type="text" class="input" required autofocus>
	        </div>
	        
	        <div class="group">
	          <label for="pwd" class="label">비밀번호</label>
	          <input id="pwd" name="pwd" type="password" class="input" data-type="password" required>
	        </div>
	        
	        <div class="group">
	          <label for="name" class="label">성명</label>
	          <input id="name" name="name" type="text" class="input" required>
	        </div>

	        <div class="group">
	          <label for="nickName" class="label">닉네임</label>
	          <input id="nickName" name="nickName" type="text" class="input"  required>
	        </div>
	        
	        <div class="group">
	          <label for="date" class="label">생년월일</label>
	          <input type="date" id="birthday" name="birthday" value="" class="input" required/>
	        </div>
	        
	        <div class="group">
	        <button type="button" class="button" onclick="fCheck()">SING UP</button>
	          <!-- <input type="submit" class="button" value="가 입"> -->
	        </div>
	        
	        <div class="hr"></div>
	        <div class="foot-lnk">
	          <label for="tab-1">Already Member?</label>
	        </div>
        </div>
       </form>
      </div>
    </div>
  </div>
</body>
</html>