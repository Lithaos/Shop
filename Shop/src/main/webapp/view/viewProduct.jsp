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
	<div class="container">
		<div class="col-10 card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="main col-md-7" id="pic-1">
						<img src="${productDetail.getImgLink()}" />
					</div>
					<div class="details col-md-5">
						<h3 class="product-title">${productDetail.getProductName()}</h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span> <span
									class="fa fa-star checked"></span> <span
									class="fa fa-star checked"></span> <span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no">41 ocen</span>
						</div>
						<p class="product-description">${productDetail.getDescriptionOfProduct()}</p>
						<h4 class="price">
							Cena: <span>${productDetail.getPriceOfProduct()} zł</span>
						</h4>
						<div class="action">
							<sec:authorize access="isAuthenticated()">
								<a href="/addToCart/${productDetail.getId()}"><button
										class="add-to-cart btn btn-default" type="button">Dodaj</button></a>
							</sec:authorize>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>