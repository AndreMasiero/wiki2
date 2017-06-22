<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Perfil</title>
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
	<fieldset class="formoid-flat-green">
		<legend>Perfil</legend>
		<table width="100%" style="background-color: #ffffff;"
			class="table table-striped">
			<tr>
				<th>Avatar</th>
				<th>Nome do Usuário</th>
				<th>E-mail</th>
				<th>Data de Cadastro</th>
				<th>Perfil</th>
				<th>Ação</th>
			</tr>
			<tr>
				<td><a
					href='<c:url value="/avatar/update/${usuario.avatar.id}" />'><img
						src="<c:url value="/avatar/load/${usuario.avatar.id}" />"
						style="width: 25px; height: 25px;" /></a></td>
				<td>${usuario.nome}</td>
				<td>${usuario.email}</td>
				<td>${usuario.dataCadastro}</td>
				<td>${usuario.perfil}</td>
				<td><c:url var="update" value="/usuario/update/${usuario.id}" />
					<a href="${update}" title="Editar">&#9445</a> <c:url var="deletar"
						value="/usuario/deletar/${usuario.id}" /> <a href="${deletar}"
					title="Excluir">&#9447</a></td>
			</tr>
		</table>
	</fieldset>
</body>
</html>