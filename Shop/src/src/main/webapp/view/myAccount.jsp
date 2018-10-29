<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edytuj konto</title>
</head>
<body>
	<c:import url="./menu.jsp" />
	<h1>Dane konta:</h1>
	<ul>
		<li>Login: ${user.getUserName()}</li>
		<li>Email: ${user.getEmail()}</li>
		<li>Uprawnienia: ${user.getRole()}</li>
	</ul>
	<a href="/editaccount"><input type="submit" class="btn btn-default"
		value="Zmien dane konta" /></a>
	<a href="/editaddress"><input type="submit" class="btn btn-default"
		value="Zmien adres" /> </a>

	<c:if test="${created}">
		<h1>Poprawnie zmieniono dane!</h1>
	</c:if>
</body>
</html>