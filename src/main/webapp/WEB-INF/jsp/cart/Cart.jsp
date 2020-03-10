<%@ include file="/WEB-INF/jsp/common/IncludeTop.jsp"%>

<script type="text/javascript" src="js/updateCart.js"></script>
<div id="Content">
<div id="BackLink">
	<a href="main">Return to Main Menu</a>
</div>

<div id="Catalog">
	<form action="newOrderForm"method="post">
	<h2>Shopping Cart</h2>
<%--	<form action="updateCart" method="post">--%>
		<table>
			<tr>
				<th>
					<input type="checkbox" id="allCheck">
					<b>Check Box</b>

				</th>
				<th><b>Item ID</b></th>
				<th><b>Product ID</b></th>
				<th><b>Description</b></th>
				<th><b>In Stock?</b></th>
				<th><b>Quantity</b></th>
				<th><b>List Price</b></th>
				<th><b>Total Cost</b></th>
				<th><b>Remove</b></th>


			<c:if test="${sessionScope.cartShow.numberOfItems == 0}">
				<tr>
					<td colspan="9"><b>Your cart is empty.</b></td>
				</tr>
			</c:if>

			<c:set var="judgeTemp" value="null"/>
			<c:set var="num" value="0"/>
			<c:set var="itemNum" value="0"/>
			<c:forEach var="cartItem" items="${sessionScope.cartShow.cartItemShowList}">

				<c:if test="${cartItem.item.product.categoryId != judgeTemp }">
					<tr>
						<td colspan="9">
<%--							<input type="checkbox" name="categoryCheck" class="cartItem.item.product.categoryId"/>--%>
							<b>
							Category:
								<a href="viewCategory?categoryId=${cartItem.item.product.categoryId}">${cartItem.item.product.categoryId}</a>
							</b>
						</td>

					</tr>
					<c:set var="judgeTemp" value ="${cartItem.item.product.categoryId}"/>
				</c:if>

				<tr>
					<td>
						<input type="checkbox" name="${cartItem.item.itemId}_check" class="${cartItem.item.product.categoryId}"/>
					</td>
<%--					<c:set var="${itemNum}" value="${itemNum+1}"/>--%>
					<td>
						<a href="viewItem?itemId=${cartItem.item.itemId}">
								${cartItem.item.itemId}
						</a>
					</td>
					<td>
							${cartItem.item.product.productId}
					</td>
					<td>
							${cartItem.item.attribute1} ${cartItem.item.attribute2}
							${cartItem.item.attribute3} ${cartItem.item.attribute4}
							${cartItem.item.attribute5} ${cartItem.item.product.name}
					</td>
					<td>
							${cartItem.inStock}
					</td>

					<td>
<%--						<input type="text" name="${cartItem.item.itemId}" value="${cartItem.quantity}"/>--%>

						<span>
<%--							<input type="button" value="+"/>--%>

							<input type="text" class="quantity" id="${cartItem.item.itemId} " name="${num}" value="${cartItem.quantity}" />
<%--							<input type="button" value="-"/>--%>
							<c:set var="num" value="${num+1}"/>
						</span>
						</input>

					</td>
					<td>
                        <span >$${cartItem.item.listPrice}</span>
					</td>
					<td>
<%--						<c:set var="${cartItem.totalCost}" value="${cartItemPrice}"/>--%>
<%--						<fmt:formatNumber value="" pattern="$#,##0.00" />--%>

							$<span class="total" id="${cartItem.item.itemId}">${cartItem.totalCost}</span>

					</td>
					<td>
						<a href="removeItemCart?workingItemId=${cartItem.item.itemId}" class="Button">Remove</a>
					</td>
				</tr>


			</c:forEach>
			<tr>
				<td colspan="9">Sub Total:
					<%--					<fmt:formatNumber value="" pattern="$#,##0.00" />--%>
					$<span id="subTotal">${sessionScope.cartShow.subTotal}</span>
				</td>

			</tr>

		</table>
<%--	</form>--%>

	<c:if test="${sessionScope.cartShow.numberOfItems > 0}">
<%--		<a href="newOrderForm" ></a>--%>
		<input type="submit" value="Proceed to Checkout">
	</c:if>
	</form>
</div>
<%--<div id="MyList">--%>
<%--  <c:if test="${sessionScope.accountBean != null}">--%>
<%--	<c:if test="${!sessionScope.accountBean.authenticated}">--%>
<%--	  <c:if test="${!empty sessionScope.accountBean.account.listOption}">--%>
<%--	    <%@ include file="IncludeMyList.jsp"%>--%>
<%--      </c:if>--%>
<%--	</c:if>--%>
<%--  </c:if>--%>
<%--</div>--%>

<div id="Separator">&nbsp;</div>
</div>

<%@ include file="/WEB-INF/jsp/common/IncludeBottom.jsp"%>