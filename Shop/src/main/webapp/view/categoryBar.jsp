<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="leftbar">
		<h5 class="text-center">Kategorie:</h5>
		<ul>
			<c:forEach var="categories" items="${AllCategories}" varStatus="myIndex">
				<li class="categoryItem"><a
					href="/categories/${categories.getCategoryName()}">${categories.getCategoryName()}</a></li>
			</c:forEach>
		</ul>
</div>