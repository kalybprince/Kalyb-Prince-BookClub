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
				<h1>Add a Book to Your Shelf!</h1>
				<a href="/books">Back to the shelves</a>			
			</div>
			<form:form action="/books" method="post" modelAttribute="book">
				<form:hidden path = "user" value = "${ user_id }" />
			    <p>
			        <form:label path="title">Title</form:label>
			        <form:input path="title"/>
			    </p>
			    <p>
			        <form:errors path="title"/>		    
			    </p>
			    <p>
			        <form:label path="author">Author</form:label>
			        <form:input path="author"/>
			    </p>
			    <p>		    
			        <form:errors path="author"/>
			    </p>
			    <p>
			        <form:label path="thoughts">My Thoughts</form:label>
			        <form:input path="thoughts"/>
			    </p>
			    <p>
			        <form:errors path="thoughts"/>     		    
			    </p>
			    <input type="submit" value="Submit"/>
			</form:form>    
		</div>
	</div>
</body>
</html>