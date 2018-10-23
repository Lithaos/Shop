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
	<div class="form-group form">
			<form:form action="/myaccount" modelAttribute="principal" method="post">
	Login: 
		<form:input path="userName" id="userName" class="form-control"></form:input>
					<form:errors path="userName" cssclass="error" />
				<br />	
	Adres email: 
		<form:input path="email" id="email" class="form-control"></form:input>
			<form:errors path="email" cssclass="error" />
				<br />
				<input type="submit" class="btn btn-default" value="Zapisz zmiany" />
				<form:hidden path="password" id="password"/>
			</form:form>
					<c:if test="${created}" >
		<h1>Poprawnie zmieniono dane!</h1>
	</c:if>
	</div>
</body>
</html>