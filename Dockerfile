# Use a imagem oficial do OpenJDK como base
FROM openjdk:17-jdk-slim

# Defina o diretório de trabalho
WORKDIR /app

# Copie o arquivo de build Maven e o diretório de código-fonte para o contêiner
COPY .mvn/ .mvn
COPY mvnw .
COPY pom.xml .
COPY src ./src

# Construa o projeto
RUN ./mvnw clean package -DskipTests

# Copie o jar gerado para o contêiner
COPY target/API_PRIMEIRO_EXEMPLO-0.0.1-SNAPSHOT.jar app.jar

# Exponha a porta que a aplicação Spring Boot usa
EXPOSE 8080

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
