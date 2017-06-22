
<ul >
	<c:forEach var="c" items="${menuCategorias}">
		<li class="menu">
			<ul>
				<li class="button"><a href="#" class="blue">${c.descricao}
						<span></span>
				</a></li>
				<li class="dropdown">
					<ul >
						<li><a href="/wiki/categoria/${c.permalink}/page/1"><font color="#ffffff">TODOS</font></a></li>

					</ul> <c:forEach var="p" items="${c.postagens}">

						<ul>
							<li><a href="/wiki/${p.permalink}"><font color="#ffffff">${p.titulo}</font></a></li>

						</ul>
					</c:forEach>
				</li>

			</ul>
		</li>
	</c:forEach>
</ul>
<div class="clear"></div>
