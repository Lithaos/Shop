<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

		<c:import url="./menu.jsp" />
		<div class="row">
		<sec:authorize access="hasAuthority('ADMIN')">
			<div class="form">
				<form:form action="/addCategory" modelAttribute="categories"
					method="post">


					<div class="form-group">
						<label for="categoryName">Nazwa kategorii:</label>
						<form:input path="categoryName" id="categoryName"
							class="form-control" value=''></form:input>
					</div>

					<div class="form-group">
						<label for="descriptionOfCategory">Opis kategorii:</label>
						<form:textarea path="descriptionOfCategory"
							id="descriptionOfCategory" class="form-control" value='' />
					</div>



					<input type="submit" class="btn btn-default" value="Zapisz zmiany" />
				</form:form>
				<form action="/categories">
					<input type="submit" class="btn btn-default" value="Wróć" />
				</form>
			</div>
		</sec:authorize>
</div>