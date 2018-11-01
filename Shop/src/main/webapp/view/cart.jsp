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
		<c:set var="cartItems" value="${productsInCart.size()}" scope="session" />
		<c:import url="./menu.jsp" />
		<sec:authorize access="isAuthenticated()">
			<c:if test="${productsInCart.isEmpty()==false}">
			<div class="row">
					<div class="col-md-3 col-md-offset-5">
						<h1>Produkty w koszyku:</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10 col-md-offset-1">
						<table class="table table-striped">
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
										<td><img class="mini"
											src="${productsInCart.getImgLink()}"></td>
										<td>${productsInCart.getProductName()}</td>
										<td>${productsInCart.getPriceOfProduct()}</td>
										<td><form
												action="/deleteFromCart/${productsInCart.getId()}">
												<input type="submit" class="btn btn-danger" value="Usuń" />
											</form></td>
									</tr>
								</c:forEach>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td><b>Suma: ${valeOfCart} zł</b></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>

			<c:if test="${productsInCart.isEmpty()}">

				<div class="row">
					<div class="col-md-3 col-md-offset-5">
						<h1>Koszyk jest pusty!</h1>
					</div>
				</div>

			</c:if>
		</sec:authorize>

	</div>
</body>
</html>