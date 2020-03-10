<%@ include file="/WEB-INF/jsp/common/IncludeTop.jsp"%>
<div id="Content">
<div id="Catalog">
	<form action="newAccountForm" method="post">
		<h3>User Information</h3>

		<table>
			<tr>
				<td>User ID:</td>
				<td>
					<input type="text" name="username" id="username"  onblur="usernameIsExist();"/>
					<div id="usernameMsg"></div>
					<script type="text/javascript" src="${pageContext.request.contextPath}/js/register.js"></script>
				</td>
			</tr>
			<tr>
				<td> password:</td>
				<td>
					<input type="text" name="password">
				</td>
			</tr>
			<tr>
				<td>Repeat password:</td>
				<td>
					<input type="text" name="repeatedPassword">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${sessionScope.message != null}">
						<h4 color="red">${sessionScope.message}</h4>>
					</c:if>
				</td>
			</tr>
		</table>


		<input type="submit" name="newAccount" value="Save Account Information">

	</form>
</div>

</div>

<%@ include file="/WEB-INF/jsp/common/IncludeBottom.jsp"%>