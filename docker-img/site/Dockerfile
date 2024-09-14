# Use a imagem base do Tomcat
FROM tomcat:9.0.75

LABEL maintainer="christianpolli@estudante.ufscar.br"

# Caminho para o arquivo .war
ADD Livraria.war /usr/local/tomcat/webapps/ROOT.war

# Porta padrão de comunicação do Tomcat-
EXPOSE 8080

RUN chmod a+x /usr/local/tomcat/bin/catalina.sh

CMD ["catalina.sh", "run"]