<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:import url="./menu.jsp" />

<sec:authorize access="isAuthenticated()">
		<h1 class="text-center">Historia zamówień</h1>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Data zamówienia:</th>
							<th scope="col">Wartość zamówienia</th>
							<th scope="col">Zamówione produkty:</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="listOfOrders" items="${listOfOrders}"
							varStatus="myIndex">
							<tr>
								<td>${myIndex.index+1}</td>
								<td>${listOfOrders.getOrderDate().getDayOfMonth()}.${listOfOrders.getOrderDate().getMonthValue() }.${listOfOrders.getOrderDate().getYear()}</td>
								<td>${listOfOrders.getValueOfOrder()}zł</td>
								<td>${listOfOrders.getCartId().getProducts().size()}</td>
								<td><form action="/order/${listOfOrders.getId()}">
										<input type="submit" class="btn btn-info" value="Więcej" />
									</form></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<form action="/myaccount">
					<input type="submit" class="btn btn-danger" value="Wróć" />
				</form>
			</div>
		</div>
	</div>
</sec:authorize>