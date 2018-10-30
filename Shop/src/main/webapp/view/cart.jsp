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
		<sec:authorize access="isAuthenticated()">

			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Img</th>
						<th scope="col">Nazwa produktu:</th>
						<th scope="col">Cena</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="productsInCart" items="${productsInCart}"
						varStatus="myIndex">
						<tr>
							<td>${myIndex.index+1}</td>
							<td><img class="mini" src="${productsInCart.getImgLink()}"></td>
							<td>${productsInCart.getProductName()}</td>
							<td>${productsInCart.getPriceOfProduct()}</td>
							<td><form action="/deleteFromCart/${productsInCart.getId()}">
									<input type="submit" class="btn btn-default" value="Usuń" />
								</form></td>
						</tr>
					</c:forEach>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td>Suma: ${valeOfCart} zł</td>
						<td></td>
					</tr>
				</tbody>
			</table>


		</sec:authorize>

	</div>
</body>
</html>