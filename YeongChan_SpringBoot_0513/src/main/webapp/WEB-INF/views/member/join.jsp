<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container mt-5">

	<div class="form-group">
		<label for="username">아이디:</label> <input type="text"
			class="form-control" placeholder="Enter username" id="username" name="username">
	</div>

	<div class="form-group">
		<label for="password">비밀번호:</label> <input type="text"
			class="form-control" placeholder="Enter password" id="password" name="password">
	</div>

	<div class="form-group">
		<label for="email">주소:</label> <input type="text"
			class="form-control" placeholder="Enter email" id="email" name="email">
	</div>
	
	<div class="form-group">
		<label for="role">권한:</label> <br>
		일반회원 : <input type="radio" name="role" value="ROLE_USER" checked="checked">
		관리자 : <input type="radio" name="role" value="ROLE_ADMIN">
	</div>
	
	<button type="button" class="btn btn-primary" id="btnJoin">회원가입</button>
	</div>
</body>
<script>
$("#btnJoin").click(function(){
	if($("#username").val()==""){
		alert("아이디를 입력하세요");
		$("#username").focus();
		return false;
	}
	if($("#password").val()==""){
		alert("비밀번호를 입력하세요");
		$("#password").focus();
		return false;
	}
	if($("#email").val()==""){
		alert("이메일을 입력하세요");
		$("#email").focus();
		return false;
	}
	

	var dataPa={
			"username" : $("#username").val(),
			"password" : $("#password").val(),
			"email" : $("#email").val(),
			"role" : $("input[name='role']:checked").val()
			
	}
	$.ajax({
		type:"POST",
		url:"/join",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(dataPa)
	})
	.done(function(resp){
		if(resp=="success"){
			alert("회원가입 성공")
			location.href="/"
		}else if(resp=="fail"){
			alert("아이디 중복")
			$("#username").val("")
		}
	})
	.fail(function(){
		alert("회원가입 실패")
	})
	
})
</script>

</html>