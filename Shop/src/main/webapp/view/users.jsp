<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<c:import url="./menu.jsp" />

<div class="row">
	<div class="col-2">
		<c:import url="./categoryBar.jsp" />
	</div>
	<div class="col-10 tableofusers">

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