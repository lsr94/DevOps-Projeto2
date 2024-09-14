## 2º Trabalho Prático de DevOps 🛳️ - 2024/1 ##

### Gerenciador de livros virtual

![image](https://github.com/user-attachments/assets/1668084d-2c1d-4fad-9222-a1e03c0fa0f6)

![image](https://github.com/user-attachments/assets/23c5a658-fe3b-47df-9428-0a1d79830728)

### :bangbang:  :warning: OBSERVAÇÃO :warning: :bangbang:

Grande parte do projeto foi desenvolvido no github codespaces, logo, isso **AFETA** grande parte do funcionamento, exemplo:

1 - após executar o arquivo minikube-up.sh, devemos conectar as portas com as esperadas pelo codespaces:
```
 kubectl port-forward service/backend-site 8080:8080
```
& 
```
kubectl port-forward service/backend-capas-livros 8081:8081
```

Isso permite o acesso à aplicação por meio de uma URL fornecida pelo próprio codespaces, *exemplo no nosso caso:*

![image](https://github.com/user-attachments/assets/9c8bce5a-1d83-4a93-8a2c-2cc00a618f81)

Perceba como a aplicação foi acessada pela URL:

```
https://laughing-computing-machine-7x95p9q6g4qhpxx-8080.app.github.dev/
```

Ou seja, mesmo não usando NodePort e configurando o Ingress corretamente, o acesso se deu a partir dessa URL.

<br>
<hr>

2 - Visualização de capas dos livros

![image](https://github.com/user-attachments/assets/fefc3ebc-d2a6-425f-8b24-194fb8f2e893)

Para visualizar as capas dos livros, acessar a URL /capas definido no Ingress não funcionava, muito provavelmente pelas configurações do codespaces,
visto que não permite sequer acessarmos "http://Livraria.k8s.local"

Para contornar esse problema, no controller LivroController.java, localizado em:

```
cd src/main/java/br/ufscar/dc/dsw/Controller/
```

definimos o seguinte código:

```java
    private void pegarCapa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Capa capa = dao.getCapaLivro(new Livro(id));
        
        // Verifique se o valor está sendo definido corretamente
        System.out.println("Caminho da Capa: " + capa.getCaminho());
        // !!!!!!!!!!! LINHA IMPORTANTE !!!!!!!!!!!
        String baseURL = "https://laughing-computing-machine-7x95p9q6g4qhpxx-8081.app.github.dev/";
        // !!!!!!!!!!! LINHA IMPORTANTE !!!!!!!!!!!
        request.setAttribute("caminhoCapa", baseURL + "capa" + id + ".jpg");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/livro/capaLivro.jsp");
        dispatcher.forward(request, response);
    }
```

a URL base representa a URL padrão gerada pelo codespaces quando a porta 8081 é conectada, como dito anteriormente, pelo comando:
```
kubectl port-forward service/backend-capas-livros 8081:8081
```

Logo, o que seria:
"http://Livraria.k8s.local/capas/capa1.jpg"

acabou se tornando:
URL_BASE (fornecida pelo codespaces) + "capa" + ID_CAPA_LIVRO + ".jpg"

URL_BASE/capa1.jpg

Ou seja, mudando de codespaces, a URL_BASE necessitaria também ser modificada... :(

## Integrantes ##
Este trabalho foi desenvolvido pelas alunos:
- Christian Coronel da Silva Polli, RA  798083
- Lara Santiago Rodrigues, RA 769701

### Veja o arquivo abaixo (.pdf) para ver as informações completas sobre o desenvolvimento do projeto e como executá-lo ###
![Documentação - T2](https://github.com/lsr94/DevOps-Projeto2-Livraria/blob/vaiCorinthians/Documenta%C3%A7%C3%A3o%20-%20T2.pdf).
