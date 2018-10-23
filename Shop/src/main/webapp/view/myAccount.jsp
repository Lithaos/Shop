<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="pl">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
</head>
<body>
		<c:import url="./menu.jsp" />
		
	<div class="form-group form">
			<form:form action="/myaccount" modelAttribute="principal"
				method="post">
	Login: 
		<form:input path="userName" id="userName" class="form-control"
					value=''></form:input>
					<form:errors path="userName" cssclass="error" />
				<br />	
	Adres email: 
		<form:input path="email" id="email" class="form-control"></form:input>
			<form:errors path="email" cssclass="error" />
				<br />
				<input type="submit" class="btn btn-default" value="Zapisz zmiany" />
				<form:hidden path="password" id="password"/>
			</form:form>
	


	</div>
</body>
</html>