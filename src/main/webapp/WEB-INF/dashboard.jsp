<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>dashboard</title>
</head>
<body>
	<div class="bg-dark py-3">
		<div
			class="container d-flex justify-content-between align-items-center">
			<h1 class="text-white mb-0">
				Welcome <c:out value="${user.userName}" />.
			</h1>
			<div>
				<a href="/create" class="btn btn-light me-2">Create Book</a> <a
					href="/logout" class="btn btn-danger">Logout</a>
			</div>
		</div>
	</div>

	<div class="container mt-4">
		<h3 class="mb-2">Books from shelves:</h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Title</th>
					<th scope="col">Author Name</th>
					<th scope="col">Posted By</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${books}">
					<tr>
						<td><c:out value="${book.id}" /></td>
						<td><a href="/show/${book.id}"><c:out
									value="${book.title}" /></a></td>
						<td><c:out value="${book.author}" /></td>
						<td><c:out value="${book.user.userName}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</html>