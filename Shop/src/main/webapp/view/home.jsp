<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="AllCategories" value="${categories}" scope="session" />
<c:set var="cartItems" value="${productsInCart.size()}" scope="session" />

<c:import url="./menu.jsp" />


<div class="row">
	<div class="col-2">
		<c:import url="./categoryBar.jsp" />
	</div>
	<div class="col-10 text-center">

		<div id="carousel" class="carousel slide" data-ride="carousel">

			<ul class="carousel-indicators">
				<li data-target="#carousel" data-slide-to="0" class="active"></li>
				<li data-target="#carousel" data-slide-to="1"></li>
				<li data-target="#carousel" data-slide-to="2"></li>
			</ul>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://www.trashedgraphics.com/wp-content/uploads/2014/02/banner_02.jpg"
						alt="Laptop" width="100%" height="352px">
				</div>
				<div class="carousel-item">
					<img
						src="http://www.vortez.net/news_file/4425_bitfenix%20flo%20headset%20banner.jpg"
						alt="Headsets" width="100%" height="352px">
				</div>
				<div class="carousel-item">
					<img
						src="https://www.evetech.co.za/repository/ProductImages/gaming-chair-deals-banner-980px-v1.jpg"
						alt="Gaming chairs" width="100%" height="352px">
				</div>
			</div>
		</div>
		<h1>Witaj na moim sklepie!</h1>
		<h2>Zarejestruj się by zyskać dostęp do systemu!</h2>
		<h3>

			<a href="/register"> Wypełnij fomularz!</a>
		</h3>
		<h2>
			Jeśli masz konto, przejdz do<a href="/login"> logowania!</a>
		</h2>
	</div>


</div>
<c:import url="./footer.jsp" />


