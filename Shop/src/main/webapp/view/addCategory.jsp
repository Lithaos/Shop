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
	<div>
		<c:import url="./menu.jsp" />
		<sec:authorize access="hasAuthority('ADMIN')">
			<form:form action="/addCategory" modelAttribute="categories"
				method="post">
	Nazwa kategorii: 
		<form:input path="categoryName" id="categoryName" class="form-control"
					value=''></form:input>
				<span><form:errors path="categoryName" cssclass="error" /></span>
				<br />	
	Opis kategorii 
		<form:input path="descriptionOfCategory" id="descriptionOfCategory"
					class="form-control" value=''></form:input>
				<br />
				<input type="submit" class="btn btn-default" value="Zapisz zmiany" />
			</form:form>
			<form action="/categories">
				<input type="submit" class="btn btn-default" value="Wróć" />
			</form>
		</sec:authorize>


	</div>
</body>
</html>