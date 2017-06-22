<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Editar Avatar</title>
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
	<c:import url="../menu.jsp"/>		
	
	<c:url var="save" value="/avatar/update?${_csrf.parameterName}=${_csrf.token}"/>
	<form:form modelAttribute="avatar" action="${save}" method="post" 
														enctype="multipart/form-data" class="formoid-flat-green">
		<form:hidden path="id"/>
		<fieldset class="grupo" class='themeDesktopColor'>
			<legend>Editar Avatar</legend>
			<div class="campo">
				<form:label path="file">Avatar</form:label>
				<form:input type="file" path="file"/>
				<br>
				<form:errors path="file" cssClass="error"/>
			</div>
			<div>
				<input type="submit" value="Salvar">
				<input type="reset" value="Limpar">
			</div>
		</fieldset>
	</form:form>		
</body>
</html>