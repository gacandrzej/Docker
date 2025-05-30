# Docker + Java + MySQL: Przykład aplikacji

Ten projekt demonstruje jak uruchomić prostą aplikację Java korzystającą z bazy danych MySQL za pomocą `docker-compose`.

## Struktura projektu:
![img.png](img.png)

## Funkcjonalność

- Kontener MySQL 8.0 z bazą danych `sklep`, użytkownikiem `sprzedawca` i przykładową tabelą `TOWARY`.
- Kontener Java budujący i uruchamiający klasę `TestJDBC`, która łączy się z MySQL i wypisuje dane z tabeli.

## Jak uruchomić?

1. Upewnij się, że masz zainstalowanego Dockera i `docker-compose`.
2. W terminalu przejdź do katalogu projektu:
   ```bash
   cd my-docker-java-mysql
3. Uruchom kontenery: docker-compose up --build
4. W konsoli powinna pojawić się lista towarów z bazy danych.

Użytkownik bazy danych
Nazwa bazy: sklep

Użytkownik: sprzedawca

Hasło: ...

Pliki
init.sql: skrypt inicjalizujący tabelę i przykładowe dane.

TestJDBC.java: prosty program łączący się z MySQL i wypisujący dane z tabeli.

## Kroki na ćwiczenia:
### 1) sklonuj repo:
git clone git@github.com:gacandrzej/Docker.git
### 2) Uruchom skrypt (skrypt w tym samym folderze co zip):
./skrypt_docker_ubuntu.sh