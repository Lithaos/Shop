
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<base href="/">
<head>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="js/rating.js"></script>
<link href="css/style.css" rel="stylesheet">

</head>
<body>
	<sec:authentication var="user" property="principal" />
	<sec:authorize access="isAuthenticated()">
		<ul class="topnav">
			<li><a class="active" href="<c:url value="/" />">Strona
					główna</a></li>
			<li><a href="<c:url value="/users" />">Lista użytkowników</a></li>
			<li><a href="<c:url value="/categories" />">Kategorie</a></li>
			<li><a href="<c:url value="/products" />">Produkty</a></li>

			<li class="right"><a href="<c:url value="/logout" />">Wyloguj</a></li>
			<li class="right"><a href="<c:url value="/myaccount" />">Moje
					konto</a></li>
			<li class="right"><span>Witaj ${user.username} dziś jest:
					<jsp:useBean id="now" class="java.util.Date" /> <fmt:formatDate
						value="${now}" dateStyle="long" />
			</span></li>
			<li class="right "><a id="cart" href="/cart"><img
					src=css/cart.png></a> <c:if test="${cartItems!=0}">
					<div id="carts" data-content="${cartItems}"></div>
				</c:if></li>
			<li class="right">
				<div class="search-container">
					<form action="/search" method="POST">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
						<input type="text" placeholder="Szukaj produktu..." name="search"></input>

					</form>
				</div>
			</li>
		</ul>
	</sec:authorize>
	<sec:authorize access="!isAuthenticated()">
		<ul class="topnav">
			<li><a class="active" href="/">Strona główna</a></li>
			<li><a href="/register">Rejestracja</a></li>
			<li><a href="/categories">Kategorie</a></li>

			<li class="right"><a href="/login">Zaloguj</a></li>
			<li class="right">
				<div class="search-container">
					<form action="/search" method="POST">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
						<input type="text" placeholder="Szukaj produktu..." name="search"></input>

					</form>
				</div>
			</li>
		</ul>
	</sec:authorize>