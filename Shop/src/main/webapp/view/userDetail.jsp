<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<c:import url="./menu.jsp" />

<div class="container">
	<sec:authorize access="hasAuthority('USER')">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Nick</th>
					<th scope="col">Email</th>
					<th scope="col">Role</th>
					<th scope="col">Miasto</th>
					<th scope="col">Adres</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${userDetail.getUserName()}</td>
					<td>${userDetail.getEmail()}</td>
					<td>${userDetail.getRole()}</td>
					<td>${userDetail.getAddress().getCity()}</td>
					<td>${userDetail.getAddress().getStreet()}
						${userDetail.getAddress().getNumber()}</td>
				</tr>

			</tbody>
		</table>
		<form action="/users">
			<input type="submit" class="btn btn-default" value="Wróć" />
		</form>
	</sec:authorize>
	<sec:authorize access="hasAuthority('ADMIN')">
		<form:form action="/user/${userId}" modelAttribute="userDetail"
			method="post">
	Login: 
		<form:input path="userName" id="userName" class="form-control"
				value=''></form:input>
			<br />	
	Adres email: 
		<form:input path="email" id="email" class="form-control" value=''></form:input>
			<br />
	Uprawnienia: 
	
	<form:select path="role" id="role">
				<option value="USER">USER</option>
				<option value="ADMIN">ADMIN</option>

			</form:select>
			<br />
			<br />

			<input type="submit" class="btn btn-default" value="Zapisz zmiany" />
		</form:form>
		<form action="/users">
			<input type="submit" class="btn btn-default" value="Wróć" />
		</form>
	</sec:authorize>
</div>
