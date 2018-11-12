<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="./menu.jsp" />
<div class="row">
	<div class="form-group form">
		<form:form action="/editaddress" modelAttribute="newAddress"
			method="post">
	Ulica: 
		<form:input path="street" id="street" class="form-control"></form:input>
			<br />	
	Numer domu: 
		<form:input path="number" id="number" class="form-control"></form:input>
			<br />
	Miasto: 
		<form:input path="city" id="city" class="form-control"></form:input>
			<br />
			<input type="submit" class="btn btn-default" value="Zapisz zmiany" />
		</form:form>
	</div>
</div>