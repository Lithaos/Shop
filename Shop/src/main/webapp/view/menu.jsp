<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authentication var="user" property="principal" />
		<sec:authorize access="isAuthenticated()">
Witaj ${user.username} <a href="<c:url value="/logout" />">Wyloguj</a>
</sec:authorize>

