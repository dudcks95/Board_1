<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<sec:authorize access="isAuthenticated()"> <!-- 인증받게 되면 -->
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
<body>
<div class="jumbotron text-center" style="margin-bottom: 0">
<h1>Security JPA Board</h1>
</div>
	<nav class="navbar navbar-expand-sm bg-success navbar-dark mb-3">
		<div class='container'>
			<!-- 왼쪽 -->
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="navbar-brand" href="/">HOME</a></li>
			</ul>
			<sec:authorize access="hasRole('ADMIN')">
  					<li class="nav-item"><a class="navbar-brand" href="/memberList">회원리스트</a></li>
			</sec:authorize>
			<!-- 오른쪽 -->
			<sec:authorize access="isAnonymous()">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="navbar-brand" href="/join">회원가입</a></li>
				<li class="nav-item"><a class="navbar-brand" href="/login">로그인</a></li>
			</ul>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item"><a class="navbar-brand" href="/logout">
				로그아웃(${principal.member.username })
				/<sec:authentication property="principal.member.username"/> </a></li>
			</sec:authorize>
			<sec
		</div>
	</nav>
	