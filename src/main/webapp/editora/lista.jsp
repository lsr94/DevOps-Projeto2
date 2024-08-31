<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Livraria Virtual</title>
</head>
<body>
	<div align="center">
		<h1>Gerenciamento de Editoras</h1>
		<h2>
			<a href="/${requestScope.contextPath}">Menu Principal</a> &nbsp;&nbsp;&nbsp; <a
				href="/${requestScope.contextPath}/editoras/cadastro">Adicione Nova Editora</a>
		</h2>
	</div>

	<div align="center">
		<table border="1">
			<caption>Lista de Editoras</caption>
			<tr>
				<th>ID</th>
				<th>CNPJ</th>
				<th>Nome</th>
				<th>Autor</th>
				<th>Acões</th>
			</tr>
			<c:forEach var="editora" items="${requestScope.listaLivros}">
				<tr>
					<td>${editora.id}</td>
					<td>${editora.CNPJ}</td>
					<td>${editora.nome}</td>
					<td><a href="/${requestScope.contextPath}/editoras/edicao?id=${editora.id}">Edição</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="/${requestScope.contextPath}/editoras/remocao?id=${editora.id}"
						onclick="return confirm('Tem certeza de que deseja excluir este item?');">
							Remoção </a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>