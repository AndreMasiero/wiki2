<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div align="center">
<ul class="pagination">
<c:forEach var="p" begin="1" end="${page.totalPages}">
	<c:choose>
		<c:when test="${ (p - 1) eq page.number }">
			<li class="disabled"><a href="#">
					${p}
				</a></li>
		</c:when>
		<c:otherwise>
			<li>
				<a href="<c:url value="${urlPagination}/${p}"/>">
					${p}
				</a>
			</li>
		</c:otherwise>
	</c:choose>
</c:forEach>
</ul>
</div>