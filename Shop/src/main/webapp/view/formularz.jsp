<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dodaj konto</title>
</head>
<body>
	<form:form action="/formularz" modelAttribute="user" method="post">
	Imię: 
		<form:input path="userName" id="userName"></form:input>
		<span><form:errors path="userName" cssclass="error" /></span>
		<br />	
	Hasło: 
		<form:input path="password" id="password" type="password"></form:input>
		<form:errors path="password" cssclass="error" />
		<br />
	Adres email: 
		<form:input path="email" id="email"></form:input>
		<form:errors path="email" cssclass="error" />
		<br /> 
		<input type="submit" value="Wyślij formularz" />
	</form:form>
</body>
</html>