<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<c:import url="./menu.jsp" />
<div class="row">
	<div class="col-2">
		<c:import url="./categoryBar.jsp" />
	</div>
	<div class="col-10">
		<c:if test="${products.size() != 0}">
		<c:forEach var="products" items="${products}" varStatus="myIndex">

			<div class="block span3">
				<a href="/products/${products.getId()}"></a>
				<div class="product">
					<a href="/products/${products.getId()}"> <img
						class="imgOfProduct img-rounded" src="${products.getImgLink()}">
					</a>
				</div>
				<div class="info">
					<h4>
						<a href="/products/${products.getId()}">${products.getProductName()}</a>
					</h4>
					<span class="description">
						${products.getDescriptionOfProduct()} </span> <span class="price">${products.getPriceOfProduct()}
						zł</span>
					<sec:authorize access="isAuthenticated()">
						<a class="btn btn-info pull-right"
							href="/addToCart/${products.getId()}"><i
							class="icon-shopping-cart"></i>Dodaj</a>
					</sec:authorize>
				</div>
			</div>
		</c:forEach>
		</c:if>
		<c:if test="${products.size() == 0}">
			<h1 class="text-center">Nie mamy czegoś takiego!</h1>
		</c:if>
	</div>
</div>
