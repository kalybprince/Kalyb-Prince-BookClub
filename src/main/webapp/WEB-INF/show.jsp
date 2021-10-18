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
		<div>
			<div class="d-flex justify-content-between">
				<h1><c:out value="${ book.title }"></c:out></h1>
				<a href="/books">Back to the shelves</a>
			</div>
			<p><c:out value="${ user.userName }"></c:out> read <c:out value="${ book.title }"></c:out> by <c:out value="${ book.author }"></c:out></p>
			<p>Here are <c:out value="${ user.userName }"></c:out>'s thoughts:</p>
			<hr />
			<p><c:out value="${ book.thoughts }"></c:out></p>
			<hr />
			<a class="btn btn-link" href="/books/${ book.id }/edit">Edit</a>
		</div>
	</div>
</body>
</html>