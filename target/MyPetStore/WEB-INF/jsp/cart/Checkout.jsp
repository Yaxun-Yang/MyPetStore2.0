<%@ include file="/WEB-INF/jsp/common/IncludeTop.jsp"%>
<div id="Content">
<div id="BackLink">
	<a href="viewCart">Return to Shopping Cart</a>
</div>

<div id="Catalog">

<table>
	<tr>
		<td>
		<h2>Checkout Summary</h2>

		<table>

			<tr>
				<td><b>Item ID</b></td>
				<td><b>Product ID</b></td>
				<td><b>Description</b></td>
				<td><b>In Stock?</b></td>
				<td><b>Quantity</b></td>
				<td><b>List Price</b></td>
				<td><b>Total Cost</b></td>
			</tr>

			<c:forEach var="cartItem" items="${sessionScope.cartShow.cartItemShowList}">
				<tr>
					<td>
						<a href="viewItem?itemId=${cartItem.item.itemId}">
				  			${cartItem.item.itemId}
						</a>
			    	</td>
					<td>${cartItem.item.product.productId}</td>
					<td>
						${cartItem.item.attribute1} ${cartItem.item.attribute2}
						${cartItem.item.attribute3} ${cartItem.item.attribute4}
						${cartItem.item.attribute5} ${cartItem.item.product.name}
					</td>
					<td>${cartItem.inStock}</td>
					<td>${cartItem.quantity}</td>
					<td>
						<fmt:formatNumber value="${cartItem.item.listPrice}" pattern="$#,##0.00" />
					</td>
					<td>
						<fmt:formatNumber value="${cartItem.totalCost}" pattern="$#,##0.00" />
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7">Sub Total:
					<fmt:formatNumber value="${sessionScope.cartShow.subTotal}" pattern="$#,##0.00" />
				</td>
			</tr>
		</table>

	</tr>
</table>

</div>

<%@ include file="/WEB-INF/jsp/common/IncludeBottom.jsp"%>