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
<script type="text/javascript"
	src='<c:url value="/js/jquery-3.1.1.min.js"/>'></script>
<script type="text/javascript" src="<c:url value="/js/postagem.js"/>"></script>
</head>
<body class="formoid-flat-green">
	<fieldset class='themeDesktopColor'>
		<h1 style="text-align: center;">${titulo}</h1>
	</fieldset>
	<c:import url="../menu.jsp" />
	<br>
	<c:url var="save" value="/postagem/ajax/save" />
	<form id="save-ajax" >
		<security:csrfInput/>
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
				<label for="titulo">Título</label>
				<br>
				 <input name="titulo" type="text" size="60" />
				 <br>
				 <span style="display: none" id="titulo-error" class="error"></span>
			</div>
			<br>
			<div>
				<label for="texto">Texto do Post</label> <br>
				<!-- <textarea cols="80" name="editor1" rows="20">ss</textarea> -->
				<textarea name="texto" cols="80" rows="15" ></textarea>
				<br>
				<span style="display: none" id="texto-error" class="error"></span>
			</div>
			<div class="campo">
				<label for="categorias">Selecione a(s) Categoria(s)</label> <select
					name="categorias" multiple>
					<c:forEach var="c" items="${categorias}">
						<option value="${c.id}">${c.descricao }</option>
					</c:forEach>
				</select>

			</div>

			<div>
				<input type="submit" value="Salvar"> <input type="reset"
					value="Limpar">
			</div>
			<div id="info"></div>
		</fieldset>
	</form>
	
</body>
</html>