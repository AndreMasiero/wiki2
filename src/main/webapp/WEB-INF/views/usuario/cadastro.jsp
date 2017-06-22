<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Usuário</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value="/css-bootstrap/bootstrap.css" />">
<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/style.css"/>">
<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/formoid-flat-green.css"/>">
<script type="text/javascript"
	src="<c:url value="/css/tinymce.min.js"/>"></script>
<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/estiloMenu.css" />">
<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/estiloPaginas.css" />">
</head>
<body>
	<fieldset class='themeDesktopColor'>
		<h1 style="text-align: center;">${titulo}</h1>
	</fieldset>
	<c:import url="../menu.jsp" />
	<br>
	<c:url var="save" value="/usuario/save?${_csrf.parameterName}=${_csrf.token}" />
	<form:form modelAttribute="usuario" action="${save}" method="post"
		enctype="multipart/form-data" class="formoid-flat-green">
		<form:hidden path="id" />
		<fieldset>
			<legend> Cadastro de Usuário</legend>
			<div>
				<form:label path="nome">Nome do Usuário</form:label>
				<br>
				<form:input path="nome" type="text" />
				<br>
				<form:errors path="nome" cssClass="alert-danger" />
			</div>
			<br>
			<div>
				<form:label path="email">E-mail</form:label>
				<br>
				<form:input path="email" type="text" />
				<br>
				<form:errors path="email" cssClass="alert-danger" />
			</div>
			<br>
			<div>
				<form:label path="senha">Senha</form:label>
				<br>
				<form:password path="senha"/>
				<br>
				<form:errors path="senha" cssClass="alert-danger" />
			</div>
			<br>
			<div>
				<form:label path="file">Avatar</form:label>
				<br>
				<form:input type="file" path="file" />
			</div>
			<form:errors path="file" cssClass="alert-danger" />
			<br>
			
			<div>
				<input type="submit" value="Salvar"> <input type="reset"
					value="Limpar">
			</div>
		</fieldset>
	</form:form>
</body>
</html>