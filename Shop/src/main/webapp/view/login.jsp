<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html lang="pl">
<head>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
</head>
<body class=text-center>
	<c:import url="./menu.jsp" />
	<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
		<h1><font color="red"> Niepoprawne dane! Spróbuj ponownie!<br />
		</font></h1>
	</c:if>
	<h1>Zaloguj się:</h1>
	<div class="loginTab center-block">
		<form name='f' action="login" class="" method='POST'>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input id="name" type="text"
						class="form-control" name="username" placeholder="Login">
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-lock"></i></span> <input id="pwd"
						type="password" class="form-control" name="password"
						placeholder="Hasło">
				</div>

				<div class="form-group">
					<br> <input
						name="submit" class="btn btn-default" type="submit" value="Zaloguj" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>