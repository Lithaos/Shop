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
			<form:form action="/addProduct" modelAttribute="products"
				method="post">
	Nazwa produktu: 
		<form:input path="productName" id="productName" class="form-control"
					value=''></form:input>
				<span><form:errors path="productName" cssclass="error" /></span>
				<br />	
	Opis produktu 
		<form:input path="descriptionOfProduct" id="descriptionOfProduct"
					class="form-control" value=''></form:input>
				<br /> 
	Cena produktu: 
		<form:input path="priceOfProduct" id="priceOfProduct"
					class="form-control" value=''></form:input>
				<span><form:errors path="priceOfProduct" cssclass="error" /></span>
				<br />
	Kategoria produktu:
					<form:select path="category" id="category">
					<c:forEach var="categories" items="${categories}"
						varStatus="myIndex">
						<option value='${categories.getCategoryName()}'>${categories.getCategoryName()}</option>
					</c:forEach>
				</form:select>
				<input type="submit" class="btn btn-default" value="Zapisz zmiany" />
			</form:form>
			<form action="/products">
				<input type="submit" class="btn btn-default" value="Wróć" />
			</form>
		</sec:authorize>







	</div>
</body>
</html>