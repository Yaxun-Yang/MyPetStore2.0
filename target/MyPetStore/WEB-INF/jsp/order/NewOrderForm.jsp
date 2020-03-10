<%@ include file="/WEB-INF/jsp/common/IncludeTop.jsp"%>
<div id="Content">
	<div id="Catalog">
		<form action="shippingForm" method="post">

			<table>
				<tr>
					<th colspan=2>Payment Details</th>
				</tr>
				<tr>
					<td>Card Type:</td>
					<td>
						<select name="cardType">
							<option value="visa">Visa</option>
							<option value="chinese">Chinese</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Card Number:</td>
					<td>
						<input type="text" name="creditCard" value="12345">* Use a fake number!
					</td>
				</tr>
				<tr>
					<td>Expiry Date (MM/YYYY):</td>
					<td>
						<input class="text" name="expiryDate" value=" 12/2019" />
					</td>
				</tr>
				<tr>
					<th colspan=2>Billing Address</th>
				</tr>

				<tr>
					<td>First name:</td>
					<td>
						<input class="text" name="billToFirstName"  value="${account.firstName}"/>
					</td>
				</tr>
				<tr>
					<td>Last name:</td>
					<td>
						<input class="text" name="billToLastName" value="${account.lastName}"/>
					</td>
				</tr>
				<tr>
					<td>Address 1:</td>
					<td>
						<input class="text" name="billAddress1" value="${account.address1}" />
					</td>
				</tr>
				<tr>
					<td>Address 2:</td>
					<td>
						<input type="text" name="billAddress2" value="${account.address2}"/>
					</td>
				</tr>
				<tr>
					<td>City:</td>
					<td>
						<input type="text" name="billCity" value="${account.city}"/>
					</td>
				</tr>
				<tr>
					<td>State:</td>
					<td>
						<input type="text" name="billState" value="${account.state}""/>
					</td>
				</tr>
				<tr>
					<td>Zip:</td>
					<td>
						<input type="text" name="billZip" value="${account.zip}"/>
					</td>
				</tr>
				<tr>
					<td>Country:</td>
					<td>
						<input type="text" name="billCountry" value="English" />
					</td>
				</tr>

				<tr>
					<td colspan=2>
						<input type="checkbox" onclick="showOrHidden()" name="shippingAddressRequired">Ship to different address...
					</td>
				</tr>

			</table>




			<table align="center" style="display:none" id="tb">
				<tr>
					<th colspan=2>Shipping Address</th>
				</tr>

				<tr>
					<td>First name:</td>
					<td>
						<input type="text" name="shipToFirstName" />
					</td>
				</tr>
				<tr>
					<td>Last name:</td>
					<td>
						<input type="text" name="shipToLastName" />
					</td>
				</tr>
				<tr>
					<td>Address 1:</td>
					<td>
						<input type="text" name="shipAddress1" />
					</td>
				</tr>
				<tr>
					<td>Address 2:</td>
					<td>
						<input type="text" name="shipAddress2" />
					</td>
				</tr>
				<tr>
					<td>City:</td>
					<td>
						<input type="text" name="shipCity" />
					</td>
				</tr>
				<tr>
					<td>State:</td>
					<td>
						<input type="text" name="shipState" />
					</td>
				</tr>
				<tr>
					<td>Zip:</td>
					<td>
						<input type="text" name="shipZip">
					</td>
				</tr>
				<tr>
					<td>Country:</td>
					<td>
						<input type="text" name="shipCountry">
					</td>
				</tr>


			</table>

			<input type="submit" name="newOrder" value="Continue">

		</form>

		<script>
			function showOrHidden(){
				var tb=document.getElementById('tb');
				if(tb.style.display=='none'){
					tb.style.display='block';
				}else{
					tb.style.display='none';
				}
			}
		</script>


	</div>
</div>
<%@ include file="/WEB-INF/jsp/common/IncludeBottom.jsp"%>