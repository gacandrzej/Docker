# Docker + Java + MySQL: Przykład aplikacji

Ten projekt demonstruje jak uruchomić prostą aplikację Java korzystającą z bazy danych MySQL za pomocą `docker-compose`.

## Struktura projektu:
![img.png](img.png)

## Funkcjonalność

- Kontener MySQL 8.0 z bazą danych `sklep`, użytkownikiem `sprzedawca` i przykładową tabelą `TOWARY`.
- Kontener Java budujący i uruchamiający klasę `TestJDBC`, która łączy się z MySQL i wypisuje dane z tabeli.

## Kroki na ćwiczenia:

1. Zaktualizuj listę repozytoriów i zainstaluj git:
    ```bash
   sudo apt update &&
   sudo apt install git
    ```
2. Sklonuj repo:
   ```bash
   git clone git@github.com:gacandrzej/Docker.git
   ```

3. Uruchom skrypt (skrypt w tym samym folderze co zip):
   ```bash
   sudo ./skrypt_docker_ubuntu.sh
   ```


# Przebudowa projektu
1) sudo docker compose down -v  # usuń wolumen z danymi
2) sudo docker compose up --build -d
3) lub instalacja pluginu Docker
4) lub docker exec -it java_app bash
5) Pobierz sterownik lokalnie:
   Z oficjalnej strony:
   https://dev.mysql.com/downloads/connector/j/

Lub poleceniem:

wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.33/mysql-connector-java-8.0.33.jar -P lib/
B. Zmień Dockerfile, aby skopiować plik JAR:
dockerfile

FROM openjdk:17-slim

WORKDIR /usr/src/myapp

# Skopiuj źródła i sterownik
COPY ./src /usr/src/myapp
COPY ./lib/mysql-connector-java-8.0.33.jar /usr/src/myapp/lib/

# Kompiluj z dołączonym sterownikiem
   ```bash
   javac -cp .:/usr/src/myapp/lib/mysql-connector-java-9.3.0.jar pad/sql/simple/TestJDBC.java
   ```

C. Zmień docker-compose.yml, aby uruchomić z klaspath:

   ```bash
   bash -c "java -cp .:/usr/src/myapp/lib/mysql-connector-java-9.3.0.jar pad.sql.simple.TestJDBC"
   ```
