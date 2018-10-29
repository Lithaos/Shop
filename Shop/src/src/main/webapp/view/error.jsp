<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


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
			<h1>Nie masz dostępu do tej strony!!</h1>
			<h3>
				<a href="/"> Wróć na strone główną!</a>
			</h3>
		</div>
	</div>
</body>
</html>