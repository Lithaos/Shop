<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="pl">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
</head>
<body>
	<div>
		<c:import url="./menu.jsp" />
		<sec:authorize access="hasAuthority('ADMIN')">
			<div class="form">
				<form:form action="/addProduct" modelAttribute="products"
					method="post">

					<div class="form-group">
						<label for="productName">Nazwa produktu:</label>
						<form:input path="productName" id="productName"
							class="form-control" value=''></form:input>
						<span><form:errors path="productName" cssclass="error" /></span>
					</div>

					<div class="form-group">
						<label for="descriptionOfProduct">Opis produktu:</label>
						<form:input path="descriptionOfProduct" id="descriptionOfProduct"
							class="form-control" value=''></form:input>
					</div>

					<div class="form-group">
						<label for="priceOfProduct">Cena produktu:</label>
						<form:input path="priceOfProduct" type="number"
							id="priceOfProduct" class="form-control" value=''></form:input>
						<span><form:errors path="priceOfProduct" cssclass="error" /></span>
					</div>

					<div class="form-group">
						<label for="imgLink">Link do zdjęcia::</label>
						<form:input path="imgLink" id="imgLink" class="form-control"
							value=''></form:input>
					</div>

					<div class="form-group">
						<label for="category">Kategoria produktu:</label>
						<form:select path="category" id="category">
							<c:forEach var="categories" items="${categories}"
								varStatus="myIndex">
								<option value='${categories.getCategoryName()}'>${categories.getCategoryName()}</option>
							</c:forEach>
						</form:select>
					</div>
					<input type="submit" class="btn btn-default" value="Zapisz zmiany" />
				</form:form>
				<form action="/products">
					<input type="submit" class="btn btn-default" value="Wróć" />
				</form>
			</div>
		</sec:authorize>





	</div>
	<c:import url="./footer.jsp" />
</body>
</html>