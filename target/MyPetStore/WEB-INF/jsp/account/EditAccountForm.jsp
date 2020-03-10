<%@ include file="/WEB-INF/jsp/common/IncludeTop.jsp"%>
<div id="Content">

<div id="Catalog">
	<form action="editAccountForm" method="post">
	<h3>User Information</h3>

	<table>
		<tr>
			<td>User ID:</td>
			<td>${sessionScope.account.username} </td>
		</tr>
		<tr>
			<td>New password:</td>
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

		<c:if test="${sessionScope.message != null}">
		<tr>
			<td colspan="2">

					<h4 color="red">${sessionScope.message}</h4>>

			</td>
		</tr>
		</c:if>

	</table>

		<h3>Account Information</h3>

		<table>
			<tr>
				<td>First name:</td>
				<td>
					<input type="text" name="firstName" value="${sessionScope.account.firstName}">

				</td>
			</tr>
			<tr>
				<td>Last name:</td>
				<td>
					<input type="text" name="lastName" value="${sessionScope.account.lastName}"/>

				</td>
			</tr>
			<tr>
				<td>Email:</td>
				<td>
					<input type="text" name="email" value="${sessionScope.account.email}"/>

				</td>
			</tr>
			<tr>
				<td>Phone:</td>
				<td>
					<input type="text" name="phone" value="${sessionScope.account.phone}"/>

				</td>
			</tr>
			<tr>
				<td>Address 1:</td>
				<td>
					<input type="text" name="address1" value="${sessionScope.account.address1}"/>

				</td>
			</tr>
			<tr>
				<td>Address 2:</td>
				<td>
					<input type="text" name="address2" value="${sessionScope.account.address2}"/>

				</td>
			</tr>
			<tr>
				<td>City:</td>
				<td>
					<input type="text" name="city" value="${sessionScope.account.city}"/>

				</td>
			</tr>
			<tr>
				<td>State:</td>
				<td>
					<input type="text" name="state" value="${sessionScope.account.state}"/>

				</td>
			</tr>
			<tr>
				<td>Zip:</td>
				<td>
					<input type="text" name="zip" value="${sessionScope.account.zip}"/>

				</td>
			</tr>
			<tr>
				<td>Country:</td>
				<td>
					<input type="text" name="country" value="${sessionScope.account.country}"/>

				</td>
			</tr>
		</table>

		<h3>Profile Information</h3>

		<table>
			<tr>
				<td>Language Preference:</td>
				<td>
					<select name="languagePreference">
						<option value="Chinese">Chinese</option>
						<option value="English" selected = "selected">English</option>
						<option value="Japanese">Japanese</option>
					</select></td>
			</tr>
			<tr>
				<td>Favourite Category:</td>
				<td><select name="favouriteCategoryId">
					<option value="FISH">FISH</option>
					<option selected="selected" value="DOGS">DOGS</option>
					<option value="REPTILES">REPTILES</option>
					<option value="CATS">CATS</option>
					<option value="BIRDS">BIRDS</option>
				</select></td>
			</tr>

			<tr>
				<td>Enable MyList</td>
				<td><input type="checkbox" name="listOption" checked /></td>
			</tr>
			<tr>
				<td>Enable MyBanner</td>
				<td><input type="checkbox" name="account.bannerOption" checked/></td>
			</tr>

		</table>

	<input type="submit" name="editAccount" value="Save Account Information">

	</form>
		<a href="#">My Orders</a>
	</div>
</div>

<%@ include file="/WEB-INF/jsp/common/IncludeBottom.jsp"%>
