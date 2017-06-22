<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Postagens</title>
<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/style.css" />">
<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/estiloMenu.css" />">
<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/estiloPaginas.css" />">
<script type="text/javascript"
	src='<c:url value="/js/jquery-3.1.1.min.js"/>'></script>
<script type="text/javascript" src="<c:url value="/js/postagem.js"/>"></script>
</head>
<body>
	<fieldset class='themeDesktopColor'>
		<h1 style="text-align: center;">${titulo}</h1>
	</fieldset>
	<c:import url="../menu.jsp" />
	<fieldset class='themeDesktopColor'>
		<legend>Lista de Postagens</legend>
		<div>
			<input id="search" type="search" placeholder="Busca por título"
				value="">
		</div>
		<table id="table-ajax" class='themeDesktopColor'
			title="${autorId != null ? autorId : 0}">
			<jsp:include page="table-rows.jsp" />
		</table>
		<div align="center"></div>
		<div id="info"></div>

	</fieldset>
</body>
</html>