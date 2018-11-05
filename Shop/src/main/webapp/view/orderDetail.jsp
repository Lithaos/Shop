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
			<div class="row">
				<div class="col-md-3 col-md-offset-5">
					<h1>Szczegóły zamówienia:</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Data zamówienia:</th>
								<th scope="col">Wartość zamówienia</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${myIndex.index+1}</td>
								<td>${order.getOrderDate().getDayOfMonth()}.${order.getOrderDate().getMonthValue() }.${order.getOrderDate().getYear()}</td>
								<td>${order.getValueOfOrder()}zł</td>
							</tr>

						</tbody>
					</table>
					<h1>Zamówione produkty:</h1>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Img:</th>
								<th scope="col">Nazwa produktu:</th>
								<th scope="col">Cena produktu:</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="order" items="${order.getCartId().getProducts()}"
								varStatus="myIndex">
								<tr>
									<td>${myIndex.index+1}</td>
									<td><img class="mini" src="${order.getImgLink()}"></td>
									<td>${order.getProductName()}</td>
									<td>${order.getPriceOfProduct()}zł</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<form action="/history">
						<input type="submit" class="btn btn-danger" value="Wróć" />
					</form>
				</div>
			</div>
		</sec:authorize>

	</div>
	<c:import url="./footer.jsp" />
</body>
</html>