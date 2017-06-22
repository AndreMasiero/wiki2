<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/style.css" />">
<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/estiloMenu.css" />">
<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/estiloPaginas.css" />">

<script type="text/javascript"
	src="<c:url value="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/menuLateral/jquery.easing.1.3.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/menuLateral/script.js"/>"></script>

<link type="text/css" rel="stylesheet"
	href="<c:url value="/menuLateral/menuLateral.css" />">
</head>
<body>

	<fieldset class='themeDesktopColor'>
		<h1 style="text-align: center;">Wiki TI - Powered by André
			Masiero</h1>
	</fieldset>

	<c:import url="menu.jsp" />
	<br>

	<fieldset>
		<c:url value="/auth/login" var="loginUrl" />
		<form action="${loginUrl}" method="post">
			<c:if test="${error != null}">
				<p class="error">${error}</p>
			</c:if>
			<c:if test="${logout != null}">
				<p class="error">${logout}</p>
			</c:if>
			<p>
				<label for="username">Username</label> <input type="text"
					id="username" name="j_username" />
			</p>
			<p>
				<label for="password">Password</label> <input type="password"
					id="password" name="j_password" />
			</p>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<button type="submit" class="btn">Log in</button>
		</form>
	</fieldset>
</body>
</html>