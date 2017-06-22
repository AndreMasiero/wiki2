<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<ul id="menu" class="menu li">

	<li><a href="<c:url value="/"/>" style="font-size: 17px;"><font
			color="#ebebeb">Home</font></a></li>

	<security:authorize
		access="hasAnyAuthority('ADMIN', 'AUTOR', 'LEITOR')">
		<li><a href="<c:url value="/usuario/perfil/${logado.id}"/>"
			style="font-size: 17px;"><font color="#ebebeb">Perfil
					Usuário</font></a></li>
	</security:authorize>

	<li><a href="#" style="font-size: 17px;"><font color="#ebebeb">Usuário</font></a>
		<ul>
			<li><a href="<c:url value="/usuario/add"/>"
				style="font-size: 17px;"><font color="#ebebeb">Cadastrar
						Usuário</font></a></li>
			<security:authorize access="hasAuthority('ADMIN')">
				<li><a href="<c:url value="/usuario/list"/>"
					style="font-size: 17px;"><font color="#ebebeb">Listar
							Usuário</font></a></li>
			</security:authorize>
			<security:authorize access="hasAnyAuthority('AUTOR', 'LEITOR')">
				<li><a href="<c:url value="/usuario/update/${logado.id}"/>"
					style="font-size: 17px;"><font color="#ebebeb">Aditar
							Dados</font></a></li>
			</security:authorize>
		</ul></li>

	<security:authorize access="hasAnyAuthority('ADMIN','AUTOR')">
		<li><a href="#" style="font-size: 17px;"><font
				color="#ebebeb">Autor</font></a>
			<ul>
				<security:authorize access="hasAnyAuthority('ADMIN', 'AUTOR')">
					<li><a href="<c:url value="/autor/add"/>"
						style="font-size: 17px;"><font color="#ebebeb">Dados
								Autor</font></a></li>
				</security:authorize>
				<security:authorize access="hasAuthority('ADMIN')">
					<li><a href="<c:url value="/autor/list"/>"
						style="font-size: 17px;"><font color="#ebebeb">Listar
								Autores</font></a></li>
				</security:authorize>
			</ul></li>
	</security:authorize>

	<security:authorize access="hasAnyAuthority('ADMIN','AUTOR')">
		<li><a href="#" style="font-size: 17px;"><font
				color="#ebebeb">Postagem</font></a>
			<ul>
				<li><a href="<c:url value="/postagem/add"/>"
					style="font-size: 17px;"><font color="#ebebeb">Cadastrar
							Postagem</font></a></li>
				<li><a href="<c:url value="/postagem/ajax/add"/>"
					style="font-size: 17px;"><font color="#ebebeb">Cadastrar
							Postagem - AJAX</font></a></li>
				<security:authorize access="hasAuthority('ADMIN')">
					<li><a href="<c:url value="/postagem/list"/>"
						style="font-size: 17px;"><font color="#ebebeb">Listar
								Postagem</font></a></li>
				</security:authorize>

				<security:authorize access="hasAuthority('AUTOR')">
					<li><a href="<c:url value="/postagem/list/${logado.id }"/>"
						style="font-size: 17px;"><font color="#ebebeb">Listar
								Postagem</font></a></li>
				</security:authorize>

			</ul></li>
	</security:authorize>

	<security:authorize access="hasAnyAuthority('ADMIN','AUTOR')">
		<li><a href="<c:url value="/categoria/add"/>"
			style="font-size: 17px;"><font color="#ebebeb">Add
					Categoria</font></a></li>
	</security:authorize>

	<li><a href="#" style="font-size: 17px;"><font color="#ebebeb">LOGIN</font></a>
		<ul>
			<c:if test="${ logado == null }">
				<li><a href="<c:url value="/auth/form"/>"
					style="font-size: 17px;"><font color="#ebebeb">Entrar</font></a></li>
			</c:if>


			<security:authorize
				access="hasAnyAuthority('ADMIN','AUTOR','LEITOR')">
				<li>
					<form id="formSair" action="<c:url value="/logout"/>" method="post">
						<security:csrfInput />
						<a href="#" style="font-size: 17px;"
							onClick="document.getElementById('formSair').submit();"><font
							color="#ebebeb">SAIR</font></a>
					</form>
				</li>
			</security:authorize>

		</ul></li>


</ul>
