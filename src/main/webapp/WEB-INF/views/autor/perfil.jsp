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
	href="<c:url value="/css/style.css" />">
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
	<fieldset class='themeDesktopColor'>
		<legend>Perfil</legend>
		<table class="themeDesktopColor table">
			<tr>
				<th>Nome do Autor</th>
				<th>E-mail</th>
				<th>Data de Cadastro</th>
				<th>Biografia</th>
				<th>Ação</th>
			</tr>
			<c:forEach var="autor"
				items="${page.content != null ? page.content : autores}"
				varStatus="i">
				<tr bgcolor="${i.count % 2 != 0 ? '#f1f1f1' : 'white'}">
					<td>${autor.nome}</td>
					<td>${autor.usuario.email}</td>
					<td>
					<fmt:parseDate var="date" value="${autor.usuario.dataCadastro}"
							pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${date}" type="date" /></td>
					<td>${autor.biografia}</td>
					<td><c:url var="update" value="/autor/update/${autor.id}" /> <a
						href="${update}" title="Editar">&#9445</a> <c:url var="delete"
							value="/autor/delete/${autor.id}" /> <a href="${delete}"
						title="Excluir">&#9447</a></td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${page != null}">
			<c:import url="../paginacao.jsp"></c:import>
		</c:if>
	</fieldset>
</body>
</html>