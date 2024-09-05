# Use a imagem oficial do dockerhub do MySQL
FROM mysql:5.6.36

# Definir credenciais e variaveis de ambiente
ENV MYSQL_ROOT_PASSWORD=root_password

# Copia o arquivo de inicialização para o container
COPY create.sql /docker-entrypoint-initdb.d/

# Comando de inicialização
CMD ["mysqld", "--max-connections=500"]
