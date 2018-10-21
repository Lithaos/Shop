<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<base href="/">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<sec:authentication var="user" property="principal" />
<sec:authorize access="isAuthenticated()">
	<ul class="topnav">
		<li><span>Witaj ${user.username} dziś jest: <jsp:useBean
					id="now" class="java.util.Date" /> <fmt:formatDate value="${now}"
					dateStyle="long" /></span></li>
		<li><a href="<c:url value="/users" />">Lista użytkowników</a></li>
		<li><a href="<c:url value="/categories" />">Kategorie</a></li>
		<li><a href="<c:url value="/products" />">Produkty</a></li>
		<li class="right"><a href="<c:url value="/logout" />">Wyloguj</a></li>
	</ul>
</sec:authorize>
<sec:authorize access="!isAuthenticated()">
	<ul class="topnav">
		<li><a class="active" href="/">Strona główna</a></li>
		<li><a href="/register">Rejestracja</a></li>
		<li><a href="/categories">Kategorie</a></li>
		<li class="right"><a href="/login">Zaloguj</a></li>
	</ul>
</sec:authorize>

