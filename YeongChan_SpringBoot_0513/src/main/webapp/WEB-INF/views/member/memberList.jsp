<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>Insert title here</title>

<div class="container">
	<h2>회원관리 (${count})</h2>
	<table class="table table-hover">
		<thead>
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>이메일</td>
				<td>권한</td>
				<td>삭제</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${members.content }" var="member">
			<tr>
				<td>${member.id }</td>
				<td><a href="memberView/${member.id}"> ${member.username }</a></td>
				<td>${member.email }</td>
				<td>${member.role }</td>
				<td><a href="javascript:mdel(${member.id })">삭제</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="d-flex justify-content-between mt-5 mr-auto">
		<ul class="pagination">
			<c:if test="${members.first==false }">
				<li class="page-item"><a class="page-link"
					href="?page=${members.number-1 }">이전</a></li>
			</c:if>
			<c:if test="${members.last==false }">
				<li class="page-item"><a class="page-link"
					href="?page=${members.number+1 }">다음</a></li>
			</c:if>
		</ul>
	</div>
</div>
<script>
function mdel(id){
	if(!confirm("삭제하시겠습니까")){
		return;
	}
	$.ajax({
		type:"DELETE",
		url:"/delete/"+id
	})
	.done(function(resp){
		alert("삭제성공")
		location.href="/memberList"
	})
	.fail(function(e){
		alert("삭제실패")
	})
}
</script>
</html>