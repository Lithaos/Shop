<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<c:set var="cartItems" value="${productsInCart.size()}" scope="session" />

<c:import url="./menu.jsp" />
<div class="row">
	<div class="col-2">
		<c:import url="./categoryBar.jsp" />
	</div>
	<div class="col-10 tableofusers">
		<div class="container">
			<h2 class="text-center">Lista produktów:</h2>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">Img</th>
						<th scope="col">Nazwa</th>
						<th scope="col">Opis</th>
						<th scope="col">Cena</th>
						<th scope="col">Kategoria</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="products" items="${products}" varStatus="myIndex">
						<tr>
							<td><img class="mini" src="${products.getImgLink()}"></td>
							<td><a href="/products/${products.getId()}">${products.getProductName()}</a></td>
							<td><a href="/products/${products.getId()}">${products.getDescriptionOfProduct()}</a></td>
							<td>${products.getPriceOfProduct()}zł</td>
							<td>${products.getCategory()}</td>
							<sec:authorize access="hasAuthority('ADMIN')">
								<td><form action="/deleteProduct/${products.getId()}">
										<input type="submit" class="btn btn-danger" value="Usuń" />
									</form></td>
								<td><form action="/productedit/${products.getId()}">
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
</div>