<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="cartItems" value="${productsInCart.size()}" scope="session" />
<c:import url="./menu.jsp" />
	<sec:authorize access="isAuthenticated()">
		<c:if test="${cartItems!=0}">
			<div class="container">
					<h1 class="text-center">Produkty w koszyku:</h1>
				<div class="row">
					<div class="col-sm-12 col-md-12 col-md-offset-1">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Produkt</th>
									<th></th>
									<th class="text-center"></th>
									<th class="text-center">Łącznie</th>
									<th> </th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="productsInCart" items="${productsInCart}"
									varStatus="myIndex">
									<tr>
										<td class="col-sm-8 col-md-6">
											<div class="media">
												<a class="thumbnail pull-left" href="#"> <img
													class="media-object" src="${productsInCart.getImgLink()}"
													style="width: 72px; height: 72px;">
												</a>
												<div class="media-body">
													<h4 class="media-heading">
														<a href="/products/${productsInCart.getId()}">${productsInCart.getProductName()}</a>
													</h4>
												</div>
											</div>
										</td>
										<td class="col-sm-1 col-md-1" style="text-align: center">

										</td>
										<td class="col-sm-1 col-md-1 text-center"><strong></strong></td>
										<td class="col-sm-1 col-md-1 text-center"><strong>
												${productsInCart.getPriceOfProduct()}zł</strong></td>
										<td class="col-sm-2 col-md-2">
											<form action="/deleteFromCart/${productsInCart.getId()}">
												<input type="submit" class="btn btn-danger" value="Usuń" />
											</form>
										</td>
									</tr>
								</c:forEach>
								<tr>
									<td> </td>
									<td> </td>
									<td><h3>Suma:</h3> </td>
									<td class="text-right"><h3>
											<strong>${valeOfCart}zł</strong>
										</h3></td>
									<td></td>
								</tr>
								<tr>
									<td> </td>
									<td> </td>
									<td> </td>
									<td></td>
									<td>
										<form action="/order">
											<input type="submit" class="btn btn-info"
												value="Złóż zamówienie" />
										</form>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${cartItems==0}">

			<div class="row">
				<div class="col-md-3 col-md-offset-5">
					<h1>Koszyk jest pusty!</h1>
				</div>
			</div>

		</c:if>
	</sec:authorize>