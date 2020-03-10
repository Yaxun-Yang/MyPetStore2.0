<%--
  Created by IntelliJ IDEA.
  User: yyx
  Date: 2019/10/18
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/WEB-INF/jsp/common/IncludeTop.jsp"%>

<div id="Content">

    <div id="BackLink">
        <a href="viewCategory?categoryId=${sessionScope.product.categoryId}">
            Return to ${sessionScope.category.name}
        </a>
    </div>

    <div id="Catalog">

        <h2>${sessionScope.product.name}</h2>

        <table>
            <tr>
                <th>Item ID</th>
                <th>Product ID</th>
                <th>Description</th>
                <th>List Price</th>
                <th>&nbsp;</th>
            </tr>
            <c:forEach var="item" items="${sessionScope.itemList}">

            <tr>
                <td>
                    <a href="viewItem?itemId=${item.itemId}">${item.itemId}</a>
                </td>
                <td>
                      ${item.product.productId}
                </td>
                <td>
                      ${item.attribute1} ${item.attribute2} ${item.attribute3}
                      ${item.attribute4} ${item.attribute5} ${product.name}
                </td>
                <td>
                    <fmt:formatNumber value="${item.listPrice}" pattern="$#,##0.00" />
                </td>
                <td>
                    <a class="Button" href="addItemCart?workingItemId=${item.itemId}">Add to Cart</a>
                </td>
            </tr>
            </c:forEach>

        </table>

    </div>


<%@include file="/WEB-INF/jsp/common/IncludeBottom.jsp"%>