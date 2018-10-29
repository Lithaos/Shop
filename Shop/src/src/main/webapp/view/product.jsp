<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="products" items="${products}" varStatus="myIndex">
	<c:if test="${products.getCategory() == category}">
		<div class="block span3">
			<div class="product">
				<img src="http://placehold.it/295x190/333333/FFFFFF">
			</div>
			<div class="info">
				<h4>${products.getProductName()}</h4>
				<span class="description">
					${products.getDescriptionOfProduct()} </span> <span class="price">${products.getPriceOfProduct()}
					zł</span> <a class="btn btn-info pull-right" href="/addToCart/${products.getId()}"><i
					class="icon-shopping-cart"></i>Dodaj</a>
			</div>
		</div>
	</c:if>
</c:forEach>