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

			<h2 class="text-center">Lista użytkowników:</h2>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Nick</th>
						<th scope="col">Email</th>
						<th scope="col">Role</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${users}" varStatus="myIndex">
						<tr>
							<th scope="row">${myIndex.index+1}</th>
							<td>${user.getUserName()}</td>
							<td>${user.getEmail()}</td>
							<td>${user.getRole()}</td>
							<sec:authorize access="hasAuthority('USER')">
								<td><form action="user/${user.getId()}">
										<input type="submit" class="btn btn-default" value="Wyświetl" />
									</form></td>
							</sec:authorize>
							<sec:authorize access="hasAuthority('ADMIN')">
								<td><form action="/deleteUser/${user.getId()}">
										<input type="submit" class="btn btn-danger" value="Usuń" />
									</form></td>
								<td>
									<form action="user/${user.getId()}">
										<input type="submit" class="btn btn-info" value="Edytuj" />
									</form>
								</td>
							</sec:authorize>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>