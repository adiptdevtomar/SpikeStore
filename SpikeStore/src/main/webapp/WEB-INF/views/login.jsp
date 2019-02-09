<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page session="true"%>
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
<body onload='document.loginForm.username.focus();'>
	<div class="container"
		style="background: white; width: 32%; border: 1px solid #ccc; border-radius: 3%">
		<form class="form-signin" method="POST" name='loginForm'
			action="perform_login">
			<div class="text-center mb-2">
				<img class="mb-3"
					src="${pageContext.request.contextPath}/resources/images/logo.jpg"
					alt="#" width="300" height="65">
				<h1 class="h3 mb-3 font-weight-normal">Login</h1>
				<c:if test="${not empty error}">
					<div class="error" style="color:red">${error}</div>
				</c:if>
				<c:if test="${not empty msg}">
					<div class="msg">${msg}</div>
				</c:if>
			</div>
			<div class="form-label-group">
				<input type="text" id="mobile" class="form-control" name="username" />
				<label for="mobile">Mobile</label>
			</div>

			<div class="form-label-group">
				<input type="password" id="pass" class="form-control"
					name="password" /> <label for="pass">Password</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit"
				name="submit">Log in</button>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<hr />
		<div>
			<p>
				Don't have an account.? <a
					href="${pageContext.request.contextPath}/SignUp"
					style="text-decoration: none; width: 20%"><i>Sign up</i></a>
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