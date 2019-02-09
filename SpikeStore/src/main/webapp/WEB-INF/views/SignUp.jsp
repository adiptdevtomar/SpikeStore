<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/StyleSpike.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css"
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B"
	crossorigin="anonymous">
<link href="resources/css/floating-labels.css" rel="stylesheet">
</head>
<body>
	<div class="container" style="background: white; width: 32%;border: 1px solid #ccc;border-radius:3%">
		<form:form class="form-signin" modelAttribute="user" action="regUser" method="POST">
			<div class="text-center mb-2">
				<img class="mb-3"
					src="${pageContext.request.contextPath}/resources/images/logo.jpg"
					alt="#" width="300" height="65">
					<h1 class="h3 mb-3 font-weight-normal">Create an account</h1>
			</div>
			<div class="form-label-group">
				<form:input type="text" id="name" path="name" class="form-control" required=""/>
				<label for="name">Name</label>
			</div>

			<div class="form-label-group">
				<form:input type="email" id="email" path="email" class="form-control" required=""/>
				<label for="email">Email Address</label>
			</div>
			<div class="form-label-group">
				<form:input type="password" id="Password" path="password" class="form-control" required=""/>
				<label for="Password">Password </label>
			</div>
			<div class="form-label-group">
				<form:input type="text" id="mobile" path="mobile" class="form-control" required=""/>
				<label for="mobile">Mobile </label>
			</div>
			<div class="form-label-group">
				<form:input type="text" id="address" path="address" class="form-control" required=""/>
				<label for="address">Address </label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
				up</button>
		</form:form>
		<hr />
		<div>
			<p>
				Already have an account.? <a href="${pageContext.request.contextPath}/login" style="text-decoration:none;width:20%"><i>Sign in</i></a>
			</p>
		</div>
	</div>

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