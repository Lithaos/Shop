<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="pl">
<head>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
</head>
<body class=text-center>
	<div>
	<c:import url="./menu.jsp" />
		<div>
			<h1>Witaj na moim sklepie!</h1>
			<h2>Zarejestruj się by zyskać dostęp do systemu!</h2>
			<h3>
				<a href="/formularz"> Wypełnij fomularz!</a>
			</h3>
			<h2>
				Jeśli masz konto, przejdz do<a href="/login"> logowania!</a>
			</h2>
		</div>
	</div>

</body>
</html>