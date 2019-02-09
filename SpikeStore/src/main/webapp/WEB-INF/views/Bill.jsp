<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<div class="container">
		<div>
			<center>
				<img style="width: 40%"
					src="${pageContext.request.contextPath}/resources/images/logo.jpg">
			</center>
		</div>
		<div class="row">
			<div
				class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
						<address style="width: 100px">
							${U1.address} <br /> <abbr title="Phone Number">P:</abbr>
							${U1.mobile}
						</address>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 text-right">
						<p>
							<strong><em>${U1.name}</em></strong>
						</p>
						<p>
							<em>Order #: ${U2}</em>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="text-center">
						<h1>Order Details</h1>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Product</th>
								<th>#</th>
								<th class="text-center">Price</th>
								<th class="text-center">Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${C1}" var="Cart1">
								<tr>
									<td class="col-md-9"><em>${Cart1.product.productname}</em>
									</td>
									<td class="col-md-1" style="text-align: center">${Cart1.productCount}</td>
									<td class="col-md-1 text-center">${Cart1.product.price}</td>
									<td class="col-md-1 text-center">${Cart1.product.price * Cart1.productCount}</td>
								</tr>
							</c:forEach>
							<tr>
								<td> </td>
								<td> </td>
								<td class="text-right">
									<p>
										<strong>Subtotal: </strong>
									</p>
									<p>
										<strong>Tax: </strong>
									</p>
								</td>
								<td class="text-center">
									<p>
										<strong>$${U3}</strong>
									</p>
									<p>
										<strong>$0</strong>
									</p>
								</td>
							</tr>
							<tr>
								<td> </td>
								<td> </td>
								<td class="text-right"><h4>
										<strong>Total: </strong>
									</h4></td>
								<td class="text-center text-danger"><h4>
										<strong>$${U3}</strong>
									</h4></td>
							</tr>
						</tbody>
					</table>
					<a href="ThankYou" type="button" class="btn btn-success btn-lg btn-block">
						Confirm Order   <span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>