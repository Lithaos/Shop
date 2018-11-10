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
