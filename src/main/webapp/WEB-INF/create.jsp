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
<title>Insert title here</title>
</head>
<body>
	<div class="bg-dark py-3">
		<div
			class="container d-flex justify-content-between align-items-center">
			<h1 class="text-white mb-0">Add a Book to Your Shelf!</h1>
			<div>
				<a href="/dashboard" class="btn btn-light me-2">Home</a> <a
					href="/logout" class="btn btn-danger">Logout</a>
			</div>
		</div>
	</div>

	<div class="container mt-3">
		<form:form action="/create/new" method="post"
			modelAttribute="book">
			<form:hidden path="user" value="${user.id}" />
			<c:if test="${bindingResult.hasErrors()}">
				<div class="alert alert-danger mt-3">
					<h3>
						<strong>Validation Error:</strong>
					</h3>
					<div class="mb-3">
						<form:errors path="title" class="text-danger" />
					</div>
					<div class="mb-3">
						<form:errors path="author" class="text-danger" />
					</div>
					<div class="mb-3">
						<form:errors path="thoughts" class="text-danger" />
					</div>
				</div>
			</c:if>
			<div class="mb-3">
				<form:label path="title" class="form-label">Title:</form:label>
				<form:input path="title" class="form-control" type="text" />
			</div>
			<div class="mb-3">
				<form:label path="author" class="form-label">Author:</form:label>
				<form:input path="author" class="form-control" type="text" />
			</div>
			<div class="mb-3">
				<form:label path="thoughts" class="form-label">Thoughts:</form:label>
				<form:textarea path="thoughts" class="form-control" rows="5"
					cols="50"></form:textarea>
			</div>
			<input type="submit" value="Submit" class="btn btn-primary" />
		</form:form>
	</div>

</body>
</html>