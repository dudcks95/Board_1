<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="container">
<h3>"${member.username }" 수정하기</h3>
<input type="hidden" name="id" id="id" value="${member.id }" />
		<div class="form-group">
				<label for="username">회원아이디:</label> <input type="text"
					class="form-control" id="username" value="${member.username }" name="username" readonly="readonly">
			</div>
			
		<div class="form-group">
				<label for="password">비밀번호:</label> <input type="text"
					class="form-control" id="password" value="" name="password">
			</div>
			
		<div class="form-group">
				<label for="email">Email:</label> <input type="text"
					class="form-control" id="email" value="" name="email" >
					<!-- #을쓰지 않는 이상 name으로 넘어감, jQuery는 id를 사용함 -->
			</div>

			
			<div class="form-group text-right">
			<button type="button" class="btn btn-secondary btn-sm" id="btnModify">수정하기</button>
			</div>
			
	</div>

	<script>
	$("#btnModify").click(function(){
		data = {
				"id" : $("#id").val(),
				"username" : $("#username").val(),
				"password" : $("#password").val(),
				"email" : $("#email").val()
		}
		 $.ajax({
			 type:"put",
			 url : "/memberUpdate",
			 contentType : "application/json;charset=utf-8",
			 data : JSON.stringify(data),
			 success: function(resp){
				 alert("수정완료")
				 location.href="/memberList";
			 },
			 error : function(e){
				 alert("수정실패 : " + e);
			 }
		 }) //ajax
	})  //btnModify 
	</script>