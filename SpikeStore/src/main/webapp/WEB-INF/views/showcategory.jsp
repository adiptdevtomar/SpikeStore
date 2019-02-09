<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css"
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B"
	crossorigin="anonymous">
</head>
<body>
	<h1>Category</h1>
	<hr />
	<c:if test="${userclickededit==true}">
		<c:set var="url" value="UpdateCategory" />
	</c:if>

	<c:if test="${userclickededit!=true}">
		<c:set var="url" value="SaveCategory" />
	</c:if>

	<form:form modelAttribute="category"
		action="${pageContext.request.contextPath}/${url}" method="POST">
		<div class="form-row">
			<div class="form-group col-md-4">
				<label for="catID">CategoryID</label>
				<form:input class="form-control" id="catID" path="CategoryID" />
			</div>
			<div class="form-group col-md-4">
				<label for="catname">Category name</label>
				<form:input path="categoryname" class="form-control" id="catname" />
			</div>
			<div class="form-group col-md-4">
				<label for="desc">Description</label>
				<form:input path="description" class="form-control" id="desc" />
			</div>
		</div>

		<c:if test="${userclickededit==true}">
			<input type="submit" value="Update Category" />
		</c:if>
		<c:if test="${userclickededit!=true}">
			<input type="submit" value="Save Category" />
		</c:if>

	</form:form>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>DISCRIPTION</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${catlist}" var="cat">
				<tr>
					<td>${cat.categoryID}</td>
					<td>${cat.categoryname}</td>
					<td>${cat.description}</td>
					<td><a
						href="${pageContext.request.contextPath}/editcat/${cat.categoryID}">Edit</a> /
						<a
						href="${pageContext.request.contextPath}/deletecat/${cat.categoryID}">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"
		integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em"
		crossorigin="anonymous"></script>
</body>
</html>