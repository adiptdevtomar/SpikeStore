<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.min.css.map">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css"
	integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/StyleSpike.css">


</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container-fluid" style="width: 25%; margin-top: 20px; float: left">
		<h3>Price</h3>
		<hr>
		<div class="col-lg-6" style="padding-left:0px">
			<a href="" style="text-decoration:none">High to Low <i class="fas fa-sort"></i></a>
		</div>
		<div class="col-lg-6" style="padding-left:0px">
			<a href="#" style="text-decoration:none">Low to High <i class="fas fa-sort"></i></a>
		</div>
		<br/>
		<br/>
		<h3>Name</h3>
		<hr>
		<div class="col-lg-6" style="padding-left:0px">
			<a href="" style="text-decoration:none">Ascending <i class="fas fa-sort"></i></a>
		</div>
		<div class="col-lg-6" style="padding-left:0px">
			<a href="" style="text-decoration:none">Descending <i class="fas fa-sort"></i></a>
		</div>
	</div>
	<div class="prodcontainer anyClass" style="margin-top: 20px">
		<c:forEach items="${prolist}" var="product">
			<a style="text-decoration: none"
				href="${pageContext.request.contextPath}/DisplaySingleprod/${product.productID}"
				class="singleprod"> <img class="imgprop"
				src="${pageContext.request.contextPath}/resources/images/${product.code}/1.jpg" />
				<div class="textbox">
					<span class="infodisplay a" style="font-weight: bold">${product.productname}</span>
				</div>
				<div class="textbox">
					<span class="infodisplay" style="font-size: 20px; color: red;">$${product.price}</span>
				</div>
			</a>
		</c:forEach>
	</div>
	<div style="margin-top: 90%">
		<%@include file="footer.jsp"%>
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
