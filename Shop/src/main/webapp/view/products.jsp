<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="pl">
<head>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
</head>
<body>
	<div>
		<c:import url="./menu.jsp" />
		<div class="tableofusers">

			<h2 class="text-center">Lista produktów:</h2>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Nazwa</th>
						<th scope="col">Opis</th>
						<th scope="col">Cena</th>
						<th scope="col">Kategoria</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="products" items="${products}" varStatus="myIndex">
						<tr>
							<th scope="row">${myIndex.index+1}</th>
							<td>${products.getProductName()}</td>
							<td>${products.getDescriptionOfProduct()}</td>
							<td>${products.getPriceOfProduct()}zł</td>
							<td>${products.getCategory()}</td>
							<sec:authorize access="hasAuthority('ADMIN')">
								<td><form action="/deleteProduct/${products.getId()}">
										<input type="submit" class="btn btn-danger" value="Usuń" />
									</form></td>
								<td><form action="/products/${products.getId()}">
										<input type="submit" class="btn btn-info" value="Edytuj" />
									</form></td>
							</sec:authorize>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<sec:authorize access="hasAuthority('ADMIN')">
				<td><form action="/addProduct">
						<input type="submit" class="btn btn-success" value="Dodaj produkt" />
					</form></td>
			</sec:authorize>
		</div>
	</div>
</body>
</html>