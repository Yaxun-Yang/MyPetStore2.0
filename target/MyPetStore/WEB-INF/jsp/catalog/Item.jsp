<%@ include file="/WEB-INF/jsp/common/IncludeTop.jsp" %>
<div id="Content">
<div id="BackLink">
	<a href="viewProduct?productId=${sessionScope.product.productId}">Return to ${sessionScope.product.name}</a>
</div>


<div id="Catalog">

<table>
	<tr>
		<td>${sessionScope.product.description}</td>
	</tr>
	<tr>
		<td><b> ${sessionScope.item.itemId} </b></td>
	</tr>
	<tr>
		<td>
			<b>
					${sessionScope.item.attribute1}
					${sessionScope.item.attribute2}
					${sessionScope.item.attribute3}
					${sessionScope.item.attribute4}
					${sessionScope.item.attribute5}
					${sessionScope.product.name}
			</b>
		</td>
	</tr>
	<tr>
		<td>${sessionScope.product.name}</td>
	</tr>
	<tr>
		<td>
			<c:if test="${sessionScope.item.quantity <= 0}">
        		Back ordered.
			</c:if>

			<c:if test="${sessionScope.item.quantity > 0}">
      			${sessionScope.item.quantity} in stock.
			</c:if>
		</td>
	</tr>
	<tr>
		<td><fmt:formatNumber value="${sessionScope.item.listPrice}"
			pattern="$#,##0.00" /></td>
	</tr>

	<tr>
		<td>
			<a class = "Button" href="addItemCart?workingItemId=${sessionScope.item.itemId}">Add to Cart</a>
		</td>
	</tr>
</table>

</div>
</div>

<%@ include file="/WEB-INF/jsp/common/IncludeBottom.jsp" %>


