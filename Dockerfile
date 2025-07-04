FROM openjdk:17-slim
WORKDIR /usr/src/myapp

# Pobierz i wypakuj sterownik JDBC
RUN apt-get update && apt-get install -y wget entr unzip \
  && mkdir -p /usr/src/libs \
  && cd /usr/src/libs \
  && wget --no-check-certificate https://downloads.mysql.com/archives/get/p/3/file/mysql-connector-j-9.2.0.zip \
  && unzip -q mysql-connector-j-9.2.0.zip \
  && cp mysql-connector-j-9.2.0/mysql-connector-j-9.2.0.jar ./ \
  && rm -rf mysql-connector-j-9.2.0.zip mysql-connector-j-9.2.0


# Skopiuj źródła (jeśli nie montujesz ich przez wolumen)
COPY ./src /usr/src/myapp