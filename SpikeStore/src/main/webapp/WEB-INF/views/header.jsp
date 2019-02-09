<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="form-inline" style="padding-left: 0px">
	<div class="container-fluid">
		<a href="${pageContext.request.contextPath}/Homepage"> <img
			style="width: 300px; height: 65px"
			src="${pageContext.request.contextPath}/resources/images/logo.jpg" />
		</a>
		<div class="float-right" style="margin-top: 5px;margin-bottom:5px; width: 30%">
			<div>
				<c:choose>
					<c:when test="${loggedIn!=true}">
						<a style="text-decoration: none; font-size: 13px"
							href="${pageContext.request.contextPath}/login">Login/SignUp</a>
					</c:when>
					<c:when test="${loggedIn==true}">
						<a style="text-decoration: none; font-size: 13px"
							href="${pageContext.request.contextPath}/logout">Logout</a>
						<h6>Welcome,${user.name}</h6>
					</c:when>
				</c:choose>
			</div>
			<div>
				<form action="search" method="POST">
					<input class="form-control mr-sm-2 form-control-sm" type="search"
						placeholder="Search" aria-label="Search" name="s">
					<button class="btn btn-outline-default my-2 my-sm-0 btn-sm"
						type="submit">Search</button>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="sticky" style="z-index: +2">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<c:forEach items="${Categorylst}" var="catlst">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/searchById/${catlst.categoryID}">${catlst.categoryname}</a></li>
				</c:forEach>
			</ul>
			<div style="float: right">
				<a href="${pageContext.request.contextPath}/Cart"
					class="btn btn-light btn-lg">CART<i
					class="fas fa-shopping-cart"> ${size}</i>
				</a>
			</div>
		</div>
	</nav>
</div>