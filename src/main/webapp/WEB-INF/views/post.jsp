<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${postagem.titulo}</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value="/css-bootstrap/bootstrap.css" />">
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

<style type="text/css">
.post {
	padding: 0px;
	margin-left: 200px;
}
</style>

<body>
	<fieldset class='themeDesktopColor'>
		<h1 style="text-align: center;">${titulo}</h1>
	</fieldset>

	<c:import url="menu.jsp" />

	<div id="cssmenu">
		<div id="mains">
			<c:import url="menuLateral.jsp" />
		</div>
	</div>
	<br>
	<div class="post">
		<fieldset class="comentarios">
			<div >
				<div>
					<h2>${postagem.titulo}</h2>
					<p>
						Autor:ss <a
							href="<c:url value="/autor/${postagem.autor.id}/page/1"/>">${postagem.autor.nome}</a>
						|
						<fmt:parseDate var="date" value="${postagem.dataPostagem}"
							pattern="yyyy-MM-dd'T'HH:mm:ss" />
						Data:
						<fmt:formatDate value="${date}" type="both" />
					</p>
				</div>
				<div class="post-texto">
					<p>${postagem.texto}</p>
				</div>
				<div>
					<p class="post-categ">
						<span>Categorias: </span>
						<c:forEach var="c" items="${postagem.categorias}">
							<a href="<c:url value="/categoria/${c.permalink}/page/1"/>"
								title="${c.descricao}"> ${c.descricao}</a>
						</c:forEach>
					</p>
				</div>
				<div class="post-autor">
					<img style="width: 50px; height: 50px;" class="post-avatar"
						src="<c:url value="/avatar/load/${postagem.autor.usuario.avatar.id}"/>" />
					<p>
						<strong>${postagem.autor.nome}</strong>
					</p>
					<p>${postagem.autor.biografia}</p>
				</div>
			</div>
			<c:import url="comments.jsp" />
		</fieldset>
	</div>
</body>
</html>