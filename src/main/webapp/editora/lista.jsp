<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livraria Virtual</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 text-gray-900">
    <div class="max-w-7xl mx-auto py-8">
        <div class="text-center mb-8">
            <h1 class="text-4xl font-bold mb-4">Gerenciamento de Editoras</h1>
            <h2 class="text-xl">
                <a href="/${requestScope.contextPath}" class="text-blue-500 hover:text-blue-700 transition-colors">Menu Principal</a>
                &nbsp;&nbsp;&nbsp;
                <a href="/${requestScope.contextPath}/editoras/cadastro" class="text-blue-500 hover:text-blue-700 transition-colors">Adicione Nova Editora</a>
            </h2>
        </div>

        <div class="overflow-x-auto">
            <table class="min-w-full bg-white border border-gray-300">
                <caption class="text-lg font-semibold mb-4 text-left">Lista de Editoras</caption>
                <thead>
                    <tr class="bg-gray-200 text-gray-600 uppercase text-sm leading-normal">
                        <th class="py-3 px-6 text-left">ID</th>
                        <th class="py-3 px-6 text-left">CNPJ</th>
                        <th class="py-3 px-6 text-left">Nome</th>
                        <th class="py-3 px-6 text-left">Ações</th>
                    </tr>
                </thead>
                <tbody class="text-gray-700 text-sm font-light">
                    <c:forEach var="editora" items="${requestScope.listaLivros}">
                        <tr class="border-b border-gray-200 hover:bg-gray-100">
                            <td class="py-3 px-6 text-left whitespace-nowrap">${editora.id}</td>
                            <td class="py-3 px-6 text-left">${editora.CNPJ}</td>
                            <td class="py-3 px-6 text-left">${editora.nome}</td>
                            <td class="py-3 px-6 text-left">
                                <a href="/${requestScope.contextPath}/editoras/edicao?id=${editora.id}" class="text-yellow-500 hover:text-yellow-700 transition-colors">Edição</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="/${requestScope.contextPath}/editoras/remocao?id=${editora.id}"
                                    onclick="return confirm('Tem certeza de que deseja excluir este item?');"
                                    class="text-red-500 hover:text-red-700 transition-colors">
                                    Remoção
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
