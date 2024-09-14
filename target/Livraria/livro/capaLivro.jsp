<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>Capa do Livro</title>
</head>
<body>
    <div align="center">
        <h1>Capa do Livro</h1>
        <!-- Supondo que 'caminhoCapa' contenha o nome da imagem, como 'capa1.jpg' -->
        <img src="${caminhoCapa}" alt="Capa do Livro" />
        <br><br>
        <a href="${caminhoCapa}">Ver Imagem</a>
        <br><br>
        <a href="javascript:history.back()">Voltar</a>
    </div>
</body>
</html>
