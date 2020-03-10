<%@ include file="/WEB-INF/jsp/common/IncludeTop.jsp" %>
<div id="Content">
<div id="BackLink">
	<a href="main">Return to Main Menu</a>
</div>

<div id="Catalog">

<table>
	<tr>
		<th>&nbsp;</th>
		<th>Product ID</th>
		<th>Name</th>
	</tr>
	<c:forEach var="product" items="${sessionScope.productList}">
		<tr>
			<td>
				<a href="viewProduct?productId=${product.productId}">
						${product.description}
				</a>
			</td>
			<td>
				<b>
					<a href="viewProduct?productId=${product.productId}">
					<h4 color="BLACK"> ${product.productId} </h4>
					</a>
				</b>
			</td>
			<td>${product.name}</td>
		</tr>
	</c:forEach>
	<tr>
		<td></td>
	</tr>

</table>

</div>
</div>


<%@ include file="/WEB-INF/jsp/common/IncludeBottom.jsp" %>



