<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="./menu.jsp" />
<div class="row">
	<div class="form">
		<form:form action="/register" class="form-horizontal"
			modelAttribute="user" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2" for="userName">Login:</label>
				<div class="col-sm-10">
					<form:input path="userName" id="userName" class="form-control"></form:input>
					<span><form:errors path="userName" cssclass="error" /></span>
				</div>
			</div>

			<br />
			<div class="form-group">
				<label class="control-label col-sm-2" for="password">Hasło:</label>
				<div class="col-sm-10">
					<form:input path="password" id="password" class="form-control"
						type="password"></form:input>
					<form:errors path="password" cssclass="error" />
				</div>
			</div>
			<br />
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Email:</label>
				<div class="col-sm-10">
					<form:input path="email" id="email" class="form-control"></form:input>
					<form:errors path="email" cssclass="error" />
				</div>
			</div>
			<br />
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-success"
					value="Wyślij formularz" />
			</div>
		</form:form>
	</div>
</div>
