<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body>
	<h1>Product</h1>
	<hr />
	<c:if test="${userclickededit==true}">
		<c:set var="url" value="Updateproduct" />
	</c:if>

	<c:if test="${userclickededit!=true}">
		<c:set var="url" value="Saveproduct" />
	</c:if>

	<form:form modelAttribute="product"
		action="${pageContext.request.contextPath}/${url}" method="post"
		enctype="multipart/form-data">
		<c:if test="${userclickededit==true}">
			<form:hidden path="productID" />
		</c:if>
		<form:input path="productname" placeholder="productname" />
		<form:input path="price" placeholder="productprice" />
		<form:select path="categoryID" items="${catlist}"
			itemLabel="categoryname" itemValue="categoryID">
		</form:select>
		<form:input path="supplierID" placeholder="supplierID" />
		<form:input path="stock" placeholder="stock" />
		<form:input path="description" placeholder="description" />
		<div class="form-group">
			<form:select class="form-control" id="sel1" path="Idol" itemLabel="Select Idol">
				<option>Messi</option>
				<option>Ronaldo</option>
				<option>Neymar</option>
				<option>Suarez</option>
				<option>NONE</option>
			</form:select>
		</div>
		<input type="file" name="file1" />
		<input type="file" name="file2" />
		<input type="file" name="file3" />
		<input type="file" name="file4" />
		<c:if test="${userclickededit==true}">
			<input type="submit" value="Update product" />
		</c:if>
		<c:if test="${userclickededit!=true}">
			<input type="submit" value="Save product" />
		</c:if>
	</form:form>
	<h1>ADD PRODUCT</h1>
	<hr />
	<table style="align: center; width: 300px">
		<thead>
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>IDOL</th>
				<th>PRICE</th>
				<th>CATEGORY ID</th>
				<th>SUPPLIER ID</th>
				<th>STOCK</th>
				<th>DESCRIPTION</th>
				<th>IMAGE</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productlist}" var="product">
				<tr>
					<td>${product.productID}</td>
					<td>${product.productname}</td>
					<td>${product.idol}</td>
					<td>${product.price}</td>
					<td>${product.categoryID}</td>
					<td>${product.supplierID}</td>
					<td>${product.stock}</td>
					<td>${product.description}</td>
					<td><img src="resources/images/${product.code}/1.jpg"
						height="200px" width="200px" /></td>
					<td><img src="resources/images/${product.code}/2.jpg"
						height="200px" width="200px" /></td>
					<td><img src="resources/images/${product.code}/3.jpg"
						height="200px" width="200px" /></td>
					<td><img src="resources/images/${product.code}/4.jpg"
						height="200px" width="200px" /></td>
					<td><a
						href="${pageContext.request.contextPath}/editprod/${product.productID}">Edit</a></td>
					<td><a
						href="${pageContext.request.contextPath}/delprod/${product.productID}">delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>