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
		<div class="leftBar">
			<c:import url="./categoryBar.jsp" />
		</div>
		<div class="center">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Nazwa</th>
						<th scope="col">Opis</th>
						<th scope="col">Cena</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="products" items="${products}" varStatus="myIndex">
						<c:if test="${products.getCategory() == category}">
							<tr>
								<td>${products.getProductName()}</td>
								<td>${products.getDescriptionOfProduct()}</td>
								<td>${products.getPriceOfProduct()}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>