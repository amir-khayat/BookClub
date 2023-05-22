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
			<h1 class="text-white mb-0">
				<em><c:out value="${book.title}" /></em>
			</h1>
			<div>
				<a href="/dashboard" class="btn btn-light me-2">Home</a> <a
					href="/logout" class="btn btn-danger">Logout</a>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row mt-3">
			<div class="col">
				<div class="card bg-light mb-3">
					<div class="card-body">
						<h4 class="card-title">
							<c:choose>
								<c:when test="${user.id == book.user.id}">
								You read <c:out value="${book.title}" /> by <c:out
										value="${book.author}" />.
							</c:when>
								<c:otherwise>
									<c:out value="${book.user.userName}" /> read <c:out
										value="${book.title}" /> by <c:out value="${book.author}" />.
							</c:otherwise>
							</c:choose>
						</h4>
						<hr>
						<h4 class="card-title">Thoughts:</h4>
						<p class="card-text overflow-auto">
							<c:out value="${book.thoughts}" />
						</p>
					</div>
					<div class="card-footer d-flex justify-content-end">
						<c:if test="${user.id == book.user.id}">
							<form action="/delete/${book.id}" method="post">
								<input type="hidden" name="_method" value="delete"> <input
									type="submit" value="Delete" class="btn btn-danger">
							</form>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>