<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">


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
	<div class="container">
		<table id="cart" class="table table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 50%">Product</th>
					<th style="width: 10%">Price</th>
					<th style="width: 8%">Quantity</th>
					<th style="width: 22%" class="text-center">Subtotal</th>
					<th style="width: 10%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartList}" var="cart">
					<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-3 hidden-xs">
									<img style="width: 100px"
										src="${pageContext.request.contextPath}/resources/images/${cart.product.code}/1.jpg"
										alt="..." class="img-responsive" />
								</div>
								<div class="col-sm-9">
									<h4 class="nomargin">${cart.product.productname}</h4>
									<p>${cart.product.description}</p>
								</div>
							</div>
						</td>
						<td data-th="Price">$${cart.product.price}</td>
						<td data-th="Quantity">
							<form method="POST" action="updatecart/${cart.id}">
								<div class="row">
									<div class="col-sm-6">
										<input style="width: 50px; text-align: center" name="qty"
											value="${cart.productCount}" />
									</div>
									<div class="col-sm-6">
										<button class="btn btn-default btn-sm" style="margin-left:5px" type="submit">update</button>
									</div>
								</div>
							</form>
						</td>
						<td data-th="Subtotal" class="text-center">$${cart.productCount
							* cart.product.price}</td>
						<td class="actions" data-th=""><a
							href="${pageContext.request.contextPath}/delCartLine/${cart.id}"
							class="btn btn-danger btn-lg"> <i class="fas fa-trash-alt"></i>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td><a href="${pageContext.request.contextPath}/Homepage"
						class="btn btn-warning"><i class="fa fa-angle-left"></i>
							Continue Shopping</a></td>
					<td colspan="2" class="hidden-xs"></td>
					<td class="hidden-xs text-center"><strong>$${grandTotal}</strong></td>
					<td><a href="${pageContext.request.contextPath}/Bill"
						class="btn btn-success btn-block">Checkout <i
							class="fa fa-angle-right"></i>
					</a></td>
				</tr>
			</tfoot>
		</table>
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