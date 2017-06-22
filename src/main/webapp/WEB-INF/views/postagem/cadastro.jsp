<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Postagem</title>
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
<body class="formoid-flat-green">
	<fieldset class='themeDesktopColor'>
		<h1 style="text-align: center;">${titulo}</h1>
	</fieldset>
	<c:import url="../menu.jsp" />
	<br>
	<c:url var="save" value="/postagem/save" />
	<form:form modelAttribute="postagem" action="${save}" method="post">

		<form:hidden path="id" />
		<script type="text/javascript">
			tinymce
					.init({
						selector : "textarea",
						editor_deselector : "mceNoEditor",
						height : 400,
						plugins : [
								"advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
								"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
								"save table contextmenu directionality emoticons template paste textcolor" ],
						paste_data_images : true,
						language : 'pt_BR',
						toolbar : "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l  link image | print preview media fullpage | forecolor backcolor emoticons",
					});
		</script>
		<fieldset>
			<legend> Cadastro de Postagem</legend>
			<div>
				<form:label path="titulo">Título</form:label>
				<br>
				<form:input path="titulo" type="text" size="60" />
				<br>
				<form:errors path="titulo" cssClass="error"/>
			</div>
			<br>
			<div>
				<form:label path="texto">Texto do Post</form:label>
				<br>
				<!-- <textarea cols="80" name="editor1" rows="20">ss</textarea> -->
				<form:textarea path="texto" cols="80" rows="15" />
				<form:errors path="texto" cssClass="error"/>
			</div>
			<div class="campo">
				<form:label path="categorias">Selecione a(s) Categoria(s)</form:label>
				<form:select path="categorias" multiple="true">
					<form:options items="${categorias}" itemValue="id"
						itemLabel="descricao" />
				</form:select>

			</div>

			<div>
				<input type="submit" value="Salvar"> <input type="reset"
					value="Limpar">
			</div>
		</fieldset>
	</form:form>
</body>
</html>