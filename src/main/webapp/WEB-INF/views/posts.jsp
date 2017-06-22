<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
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
	<div class="post">
		<fieldset class="panel-body">

			<div class="form-group">
				<form class="navbar-form navbar-left"
					action="<c:url value="/search"/>" method="get">
					<div class="form-group">
						<input name="texto" type="search" placeholder="Pesquisar">
						<input class="btn btn-default" type="submit" value="Localizar">
					</div>
				</form>
			</div>
			
			<br><br><br>

			<c:forEach var="p" items="${page.content}">
				<div class="thumbnail ">
					<div class="panel-primary tituloPost">
						<h2>
							<a href="<c:url value="/${p.permalink}" />" title="${p.titulo}">${p.titulo}</a>
						</h2>
						<p>
							Autor: <a href="<c:url value="/autor/${p.autor.id}/page/1"/>">${p.autor.nome}</a>
							|
							<fmt:parseDate var="date" value="${p.dataPostagem}"
								pattern="yyyy-MM-dd'T'HH:mm:ss" />
							Data:
							<fmt:formatDate value="${date}" type="both" />
							| # ${fn:length(p.comentarios)} Comentário(s)
						</p>
					</div>
					<div class="panel-body comentarios">
						
							<c:forTokens var="resumo" items="${p.texto}" delims=" " begin="0"
								end="60">
					${resumo}
				</c:forTokens>
							<a href="<c:url value="/${p.permalink}" />">[Leia Mais]</a>
						
					</div>
					<div class="post-categ tituloPost">
						<p>
							<span>Categorias: </span>
							<c:forEach var="c" items="${p.categorias}">
								<a href="<c:url value="/categoria/${c.permalink}/page/1"/>"
									title="${c.descricao}"> ${c.descricao}</a>
							</c:forEach>
						</p>
					</div>
				</div>
				<hr color=navi size=5>
			</c:forEach>
			<c:import url="paginacao.jsp"></c:import>
		</fieldset>
	</div>

</body>
</html>