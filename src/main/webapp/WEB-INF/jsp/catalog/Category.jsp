<%--
  Created by IntelliJ IDEA.
  User: yyx
  Date: 2019/10/14
  Time: 0:38
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/WEB-INF/jsp/common/IncludeTop.jsp"%>

<div id="Content">

    <div id="BackLink">
        <a href="main">Return to Main Menu</a>
    </div>

    <div id="Catalog">

        <h2>${sessionScope.category.name}</h2>

        <table>
            <tr>
                <th>Product ID</th>
                <th>Name</th>
            </tr>

            <c:forEach var="product" items = "${sessionScope.productList}">
            <tr>
                <td>
                    <a href="viewProduct?productId=${product.productId}">${product.productId}</a>
                </td>
                <td>
                    ${product.name}
                </td>
            </tr>
            </c:forEach>
        </table>

    </div>
</div>
<%@include file="/WEB-INF/jsp/common/IncludeBottom.jsp"%>
