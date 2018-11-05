<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="pl">
<head>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
</head>
<body>
	<div>
		<c:import url="./menu.jsp" />
		<c:import url="./categoryBar.jsp" />
		<div class="tableofusers">

			<h2 class="text-center">Lista kategorii:</h2>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Nazwa</th>
						<th scope="col">Opis</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="categories" items="${categories}"
						varStatus="myIndex">
						<tr>
							<th scope="row">${myIndex.index+1}</th>
							<td>${categories.getCategoryName()}</td>
							<td>${categories.getDescriptionOfCategory()}</td>
							<sec:authorize access="hasAuthority('ADMIN')">
								<td><form action="/deleteCategory/${categories.getId()}">
										<input type="submit" class="btn btn-danger" value="Usuń" />
									</form></td>
							</sec:authorize>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<sec:authorize access="hasAuthority('ADMIN')">
				<td><form action="/addCategory">
						<input type="submit" class="btn btn-success"
							value="Dodaj kategorie" />
					</form></td>
			</sec:authorize>
		</div>
	</div>
	<c:import url="./footer.jsp" />
</body>
</html>