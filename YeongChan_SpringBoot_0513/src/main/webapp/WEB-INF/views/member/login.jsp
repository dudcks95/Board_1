<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="container">
<c:if test="${not empty errorMsg }">
	${errorMsg}
</c:if>
<form action="/login" method="post">
	<div class="form-group">
		<label for="username">아이디:</label> <input type="text" class="form-control"
			id="username" placeholder="Enter id" name="username">
	</div>
	<div class="form-group">
		<label for="password">비밀번호:</label> <input type="password"
			class="form-control" id="password" placeholder="Enter password"
			name="password">
	</div>
	<button class="btn btn-secondary" id="loginBtn">LOGIN</button>
	</form>
</div>

<script>
$("#loginBtn").click(function(){
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
})
</script>