<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="pl">
<head>
<base href="/">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="css/product.css" rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${productDetail.getProductName()}</title>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700"
	rel="stylesheet">
</head>
<body>

	<c:import url="./menu.jsp" />

	<c:import url="./categoryBar.jsp" />
	<div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="main" id="pic-1">
						<img src="${productDetail.getImgLink()}" />
					</div>
					<div class="details col-md-6">
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
	<c:import url="./footer.jsp" />
</body>
</html>
