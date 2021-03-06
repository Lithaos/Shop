<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="products" items="${products}" varStatus="myIndex">
	<c:if test="${products.getCategory() == category}">
		<div class="block span3">
			<a href="/products/${products.getId()}"></a>
			<div class="product">
				<a href="/products/${products.getId()}"> <img
					class="imgOfProduct img-rounded" src="${products.getImgLink()}">
				</a>
			</div>
			<div class="info">
				<h4><a href="/products/${products.getId()}">${products.getProductName()}</a></h4>
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
	</c:if>
</c:forEach>