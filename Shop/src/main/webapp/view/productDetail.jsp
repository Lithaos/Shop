<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:import url="./menu.jsp" />
<div class="container">

	<sec:authorize access="hasAuthority('ADMIN')">
		<div class="row">
			<form:form action="/productedit/${productId}"
				modelAttribute="productDetail" method="post">
				<div class="form-group">
					<label for="productName">Nazwa:</label>
					<form:input path="productName" id="productName"
						class="form-control" value=''></form:input>
				</div>
				<div class="form-group">
					<label for="descriptionOfProduct">Opis:</label>
					<form:input path="descriptionOfProduct" id="descriptionOfProduct"
						class="form-control" value=''></form:input>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Cena:</label>
					<form:input path="priceOfProduct" id="priceOfProduct"
						class="form-control" value=''></form:input>
				</div>
				<div class="form-group">
					<label for="imgLink">Link do zdjęcia:</label>
					<form:input path="imgLink" id="imgLink" class="form-control"
						value=''></form:input>
				</div>
				<div class="form-group">
					<label for="category">Kategoria:</label>
					<form:select path="category" id="category">
						<c:forEach var="categories" items="${categories}"
							varStatus="myIndex">
							<option value='${categories.getCategoryName()}'>${categories.getCategoryName()}</option>
						</c:forEach>
					</form:select>
				</div>
				<input type="submit" class="btn btn-default" value="Zapisz zmiany" />
			</form:form>
			<br>


		</div>

		<form action="/products">
			<input type="submit" class="btn btn-default" value="Wróć" />
		</form>
	</sec:authorize>
</div>

