<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edytuj adres</title>
</head>
<body>
	<c:import url="./menu.jsp" />

	<div class="row">

		<div class="col-md-10 col-md-offset-1">
			<h1 class="text-center">Dane do zamówienia</h1>
			<div class="form-group form">
				<form:form action="/ordered" modelAttribute="orderDetail"
					method="post">
					<div class="form-group">
						<label class="control-label col-sm-4" for="street">Ulica:</label>
						<div class="col-sm-8">
							<form:input path="street" id="street" class="form-control"></form:input>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="number">Numer
							domu:</label>
						<div class="col-sm-8">
							<form:input path="number" id="number" class="form-control"></form:input>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-4" for="city">Miasto:</label>
						<div class="col-sm-8">
							<form:input path="city" id="city" class="form-control"></form:input>
						</div>
					</div>
				</form:form>
			</div>
			<br>
			<h1 class="text-center">List produktów</h1>

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
							<td><img class="mini" src="${productsInCart.getImgLink()}"></td>
							<td>${productsInCart.getProductName()}</td>
							<td>${productsInCart.getPriceOfProduct()}zł</td>
						</tr>
					</c:forEach>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><b>Suma: ${valeOfCart} zł</b></td>
					</tr>
				</tbody>
			</table>
			<form action="/ordered">
				<input type="submit" class="btn btn-info" value="Złóż zamówienie" />
			</form>
			<form action="/cart">
				<input type="submit" class="btn btn-default" value="Wróć" />
			</form>
		</div>

	</div>
</body>
</html>