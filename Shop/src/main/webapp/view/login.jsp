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
	<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
		<font color="red"> Niepoprawne dane! Spróbuj ponownie!<br /> <br />
		</font>
	</c:if>
	<div class="loginTab center-block">
		<form name='f' action="login" class="" method='POST'>
			<div class="form-group">
				<label for="name">Login:</label> <input type="text"
					class="form-control" name='username' id="name">
				<div class="form-group">
					<label for="pwd">Password:</label> <input type="password"
						class="form-control" name='password' id="pwd"> <input
						name="submit" type="submit" value="submit" />
				</div>
			</div>
		</form>
	</div>
</body>
</html>