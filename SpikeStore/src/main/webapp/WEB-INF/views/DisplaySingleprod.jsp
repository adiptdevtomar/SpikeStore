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
	<div class="imgcontainer"
		style="width: 120px; float: left; margin-top: 25px">
		<img
			style="width: 100px; margin-left: 10px; margin-top: 10px; border: 1px solid #e0e0e0"
			src="${pageContext.request.contextPath}/resources/images/${productlist.code}/1.jpg" />
		<img
			style="width: 100px; margin-top: 20px; margin-left: 10px; border: 1px solid #e0e0e0"
			src="${pageContext.request.contextPath}/resources/images/${productlist.code}/2.jpg" />
		<img
			style="width: 100px; margin-top: 20px; margin-left: 10px; border: 1px solid #e0e0e0"
			src="${pageContext.request.contextPath}/resources/images/${productlist.code}/3.jpg" />
		<img
			style="width: 100px; margin-top: 20px; margin-left: 10px; border: 1px solid #e0e0e0"
			src="${pageContext.request.contextPath}/resources/images/${productlist.code}/4.jpg" />
	</div>
	<div class="prodcontainer" style="width: 90%">
		<div style="width: 50%; float: left; border: 1px solid #e0e0e0">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="${pageContext.request.contextPath}/resources/images/${productlist.code}/1.jpg"
							alt="Los Angeles" style="width: 100%;">
					</div>

					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/resources/images/${productlist.code}/2.jpg"
							alt="Chicago" style="width: 100%;">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/resources/images/${productlist.code}/3.jpg"
							alt="New york" style="width: 100%;">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/resources/images/${productlist.code}/4.jpg"
							alt="New york" style="width: 100%;">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#myCarousel" role="button"
					data-slide="prev"> <span class="carousel-control-prev-icon"
					aria-hidden="true"></span> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#myCarousel" role="button"
					data-slide="next"> <span class="carousel-control-next-icon"
					aria-hidden="true"></span> <span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div style="float: left; margin-top: 50px; width: 35%">
			<ul style="list-style-type: none">
				<li><span style="font-size: 30px; font-weight: bold">${productlist.productname}</span></li>
				<li><span style="font-size: 50px; color: red">$${productlist.price}</span></li>
				<li><span style="font-size: 20px"><span
						style="font-size: 20px; font-weight: bold">Availability :</span>
						${productlist.stock}</span></li>
				<li><span style="font-size: 20px"><span
						style="font-size: 20px; font-weight: bold">Description :</span>
						${productlist.description}</span></li>
				<li style="margin-top: 30px"><a
					href="${pageContext.request.contextPath}/addBill/${productlist.productID}?qty=1"
					style="width: 150px" class="btn btn-danger" type="submit">Buy
						Now</a></li>
				<li style="margin-top: 10px"><a
					href="${pageContext.request.contextPath}/addcart/${productlist.productID}?qty=1"
					style="width: 150px" class="btn btn-primary" type="submit">Add
						To Cart</a></li>
			</ul>
		</div>
	</div>
	<div style="margin-top: 50%">
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