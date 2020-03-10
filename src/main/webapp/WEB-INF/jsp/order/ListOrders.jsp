<%@ include file="/WEB-INF/jsp/common/IncludeTop.jsp"%>
<div id="Content">
<h2>My Orders</h2>

<table>
	<tr>
		<th>Order ID</th>
		<th>Date</th>
		<th>Total Price</th>
	</tr>

	<c:forEach var="order" items="${sessionScope.orderList}">
		<tr>
			<td>
				<a href="viewItem?orderId=${order.orderId}">${order.orderId}</a>
			</td>
			<td>
				<fmt:formatDate value="${order.orderDate}" pattern="yyyy/MM/dd hh:mm:ss" />
			</td>
			<td>
				<fmt:formatNumber value="${order.totalPrice}" pattern="$#,##0.00" />
			</td>
		</tr>
	</c:forEach>
</table>
</div>

<%@ include file="/WEB-INF/jsp/common/IncludeBottom.jsp"%>


