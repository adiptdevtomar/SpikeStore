<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SpikeStore</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.min.css.map">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
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
	<div id="myCarousel" class="carousel slide" data-ride="carousel"
		data-interval="2000">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100"
					src="${pageContext.request.contextPath}/resources/images/Carousel img/nike-justdoit.jpg"
					alt="Los Angeles">
			</div>

			<div class="carousel-item">
				<img class="d-block w-100"
					src="${pageContext.request.contextPath}/resources/images/Carousel img/Adidas_mundial.jpg"
					alt="Chicago">
			</div>

			<div class="carousel-item">
				<img class="d-block w-100"
					src="${pageContext.request.contextPath}/resources/images/Carousel img/1920x492-(Tiga-01).jpg"
					alt="New York">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="${pageContext.request.contextPath}/resources/images/Carousel img/nike-neymar.jpg"
					alt="New York">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="${pageContext.request.contextPath}/resources/images/Carousel img/puma-illuminate-pack-v2.jpg"
					alt="New York">
			</div>
		</div>
	</div>
	<div>
		<div class="d-flex justify-content-center" style="padding-top: 50px">
			<div class="p-2" style="width: 27%">
				<h3>The Boots of your Idols</h3>
			</div>
		</div>
		<hr style="border-width: 3px; width: 89%; border-color: black"></hr>
		<div class="d-flex flex-row justify-content-around"
			style="margin: auto; margin-bottom: 5%; width: 95%">
			<div class="p-2">
				<a style="text-decoration: none"
					href="${pageContext.request.contextPath}/searchByIdol/Messi"
					style="width: 90%"> <img class="imgidol"
					src="${pageContext.request.contextPath}/resources/images/Idols/1523439723messi.jpg" />
					<div class="textbox">
						<span class="infodisplay"
							style="font-weight: bold; font-size: 20px; color: black">Messi</span>
					</div>
				</a>
			</div>
			<div class="p-2">
				<a style="text-decoration: none"
					href="${pageContext.request.contextPath}/searchByIdol/Ronaldo"
					style="width: 90%"> <img class="imgidol"
					src="${pageContext.request.contextPath}/resources/images/Idols/1523441359cristiano.jpg" />
					<div class="textbox">
						<span class="infodisplay"
							style="font-weight: bold; font-size: 20px; color: black">Ronaldo</span>
					</div>
				</a>
			</div>
			<div class="p-2">
				<a style="text-decoration: none"
					href="${pageContext.request.contextPath}/searchByIdol/Neymar"
					style="width: 90%"> <img class="imgidol"
					src="${pageContext.request.contextPath}/resources/images/Idols/1507283100neymar2-botas.jpg" />
					<div class="textbox">
						<span class="infodisplay"
							style="font-weight: bold; font-size: 20px; color: black">Neymar</span>
					</div>
				</a>
			</div>
			<div class="p-2">
				<a style="text-decoration: none"
					href="${pageContext.request.contextPath}/searchByIdol/Suarez"
					style="width: 90%"> <img class="imgidol"
					src="${pageContext.request.contextPath}/resources/images/Idols/suarez.jpg" />
					<div class="textbox">
						<span class="infodisplay"
							style="font-weight: bold; font-size: 20px; color: black">Suarez</span>
					</div>
				</a>
			</div>
		</div>
	</div>
	<div class="container">
		<div>
			<h3>Most Viewed Product</h3>
		</div>
		<hr></hr>
		<div>
			<c:forEach begin="0" end="3" items="${productList}" var="LargeProd">
				<a style="text-decoration: none"
					href="${pageContext.request.contextPath}/DisplaySingleprod/${LargeProd.productID}"
					class="singleprod"> <img class="imgprop"
					src="${pageContext.request.contextPath}/resources/images/${LargeProd.code}/1.jpg" />
					<div class="textbox">
						<span class="infodisplay" style="font-weight: bold">${LargeProd.productname}</span>
					</div>
					<div class="textbox">
						<span class="infodisplay" style="font-size: 20px; color: red;">$${LargeProd.price}</span>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
	<%@include file="footer.jsp"%>
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