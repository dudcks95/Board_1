<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="container">
<h3>"${member.username }"의 정보</h3>
		<div class="form-group">
				<label for="username">회원아이디:</label> <input type="text"
					class="form-control" id="username" value="${member.username }" name="username" readonly="readonly">
			</div>
			
		<div class="form-group">
				<label for="password">비밀번호:</label> <input type="text"
					class="form-control" id="password" value="" name="password" readonly="readonly">
			</div>
			
		<div class="form-group">
				<label for="email">Email:</label> <input type="text"
					class="form-control" id="email" value="${member.email }" name="email" readonly="readonly">
					<!-- #을쓰지 않는 이상 name으로 넘어감, jQuery는 id를 사용함 -->
			</div>

			
			<div class="form-group text-right">
			<button type="button" class="btn btn-secondary btn-sm" id="btnUpdate">수정하기</button>
			</div>
			
	</div>

	<script>
		 $("#btnUpdate").click(function(){
			if(confirm("정말 수정할까요?")){
				location.href="/memberUpdate/${member.id}"
			}
		}) 
	</script>