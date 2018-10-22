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
		<sec:authorize access="hasAuthority('USER')">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Nick</th>
						<th scope="col">Email</th>
						<th scope="col">Role</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${productDetail.getProductName()}</td>
						<td>${productDetail.getDescriptionOfProduct()}</td>
						<td>${productDetail.getPriceOfProduct()}</td>
					</tr>

				</tbody>
			</table>
			<form action="/users">
				<input type="submit" class="btn btn-default" value="Wróć" />
			</form>
		</sec:authorize>
		<sec:authorize access="hasAuthority('ADMIN')">
			<form:form action="/products/${productId}"
				modelAttribute="productDetail" method="post">
	Nazwa: 
		<form:input path="productName" id="productName" class="form-control"
					value=''></form:input>
				<br />	
	Opis: 
		<form:input path="descriptionOfProduct" id="descriptionOfProduct"
					class="form-control" value=''></form:input>
				<br />	
	Cena: 
		<form:input path="priceOfProduct" id="priceOfProduct"
					class="form-control" value=''></form:input>
				<br />
	Kategoria: 
	
	<form:select path="category" id="category">
					<c:forEach var="categories" items="${categories}"
						varStatus="myIndex">
						<option value='${categories.getCategoryName()}'>${categories.getCategoryName()}</option>
					</c:forEach>
				</form:select>
				<br />
				<br />

				<input type="submit" class="btn btn-default" value="Zapisz zmiany" />
			</form:form>
			<form action="/users">
				<input type="submit" class="btn btn-default" value="Wróć" />
			</form>
		</sec:authorize>


	</div>
</body>
</html>