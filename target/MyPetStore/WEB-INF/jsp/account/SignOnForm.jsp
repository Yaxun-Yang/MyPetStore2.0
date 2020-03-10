<%@ include file="/WEB-INF/jsp/common/IncludeTop.jsp"%>
<script type="text/javascript">
	//刷新验证码
	function changeImg(){
		document.getElementById("validateCodeImg").src="${pageContext.request.contextPath}/draw?"+Math.random();
	}
</script><div id="Content">

<div id="Catalog">

	<form action="signOnForm" method="post">
		<p>Please enter your username and password.</p>
		<p>Username:
			<input type="text" name="username" value="j2ee">
			<br />
			Password:
			<input type="password" name="password" value="j2ee">
			<br />
			<br/>
			<img alt="change" src="${pageContext.request.contextPath}/draw" id="validateCodeImg" onclick="changeImg()">
			<br/>
			<a href="javascript:void(0)" onclick="changeImg()">change</a>
			<br/>
			check &ensp;
			<input type="text" name="validateCode" />
			<br />
			<c:if test="${sessionScope.value != null}">
		<h4 color = "red">${sessionScope.value}</h4>
			</c:if>
		</p>

		<input type="submit" name="signOn" value="Login">
	</form>
	Need a user name and password?
	<a href="newAccount">Register Now!</a>>
</div>
</div>

<%@ include file="/WEB-INF/jsp/common/IncludeBottom.jsp"%>

