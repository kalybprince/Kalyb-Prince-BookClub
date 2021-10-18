<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) --> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Functions --> 
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="d-flex flex-column">
			<div class="d-flex flex-row justify-content-between">
				<h1>Welcome Someone!</h1>
				<a href="/logout">Logout</a>
			</div>
			<div class="d-flex flex-row justify-content-between">
				<p>Books from everyone's shelves:</p>	
				<a href="/books/new">+ Add a book to my bookshelf</a>		
			</div>
		</div>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Title</th>
						<th>Author Name</th>
						<th>Posted By</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ allBooks }" var="book">
						<tr>
							<td><c:out value="${ book.id }"></c:out></td>
							<td><a href="books/${ book.id }"><c:out value="${ book.title }"></c:out></a></td>
							<td><c:out value="${ book.author }"></c:out></td>
							<td><c:out value="${ book.user.userName }"></c:out></td>
							<td>
								<form action="/books/${ book.id }/delete" method="post">
									<input type="hidden" name="_method" value="delete">
									<input type="submit" value="Delete">
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>