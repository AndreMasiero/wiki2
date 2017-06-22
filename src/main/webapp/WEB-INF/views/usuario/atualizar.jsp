<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editar Usuário</title>
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

	<fieldset class="formoid-flat-green">
		<c:url var="save" value="/usuario/update/senha/" />
		<form:form modelAttribute="usuario" action="${save}" method="post">
			<form:hidden path="id" />
			<fieldset class="grupo">
				<legend>Editar Senha</legend>
				<div class="campo">
					<form:label path="senha">Senha</form:label>
					<form:password path="senha" />
					<br>
					<form:errors path="senha" cssClass="error" />
				</div>
				<div>
					<input type="submit" value="Salvar"> <input type="reset"
						value="Limpar">
				</div>
			</fieldset>
		</form:form>

		<c:url var="save" value="/usuario/update/" />
		<form:form modelAttribute="usuario" action="${save}" method="post">
			<form:hidden path="id" />
			<fieldset class="grupo">
				<legend> Editar Nome e/ou E-mail</legend>
				<div class="campo">
					<form:label path="nome">Nome do Usuário</form:label>
					<br>
					<form:input path="nome" type="text" value="${nome}" />
					<br>
					<form:errors path="nome" cssClass="error" />
				</div>
				<div class="campo">
					<form:label path="email">E-mail</form:label>
					<br>
					<form:input path="email" type="text" value="${email}" />
					<br>
					<form:errors path="email" cssClass="error" />
				</div>

				<br>
				<div>
					<input type="submit" value="Salvar"> <input type="reset"
						value="Limpar">
				</div>
			</fieldset>
		</form:form>

		
		<security:authorize access="hasAuthority('ADMIN')">
		<c:url var="save" value="/usuario/update/perfil"></c:url>
			<form:form modelAttribute="usuario" action="${save}" method="post">
				<form:hidden path="id" />
				<fieldset class="grupo">
					<legend>Editar Perfil</legend>
					<div>
						<form:label path="perfil">Perfil</form:label>
						<br>
						<form:select path="perfil" required="true">
							<form:option value="ADMIN" label="ADMIN" />
							<form:option value="AUTOR" label="AUTOR" />
							<form:option value="LEITOR" label="LEITOR" />
						</form:select>
					</div>
					<br>
					<div>
						<input type="submit" value="Salvar"> <input type="reset"
							value="Limpar">
					</div>
				</fieldset>

			</form:form>
		</security:authorize>

	</fieldset>
</body>
</html>