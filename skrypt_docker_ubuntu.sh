#!/bin/bash

set -e

echo "==> Aktualizacja listy pakietów..."
sudo apt update
echo "Lista pakietów zaktualizowana."
sleep 1

echo "==> Instalacja wymaganych pakietów..."
sudo apt install -y ca-certificates curl gnupg unzip wget entr
echo "Zależności zainstalowane."
sleep 1

echo "==> Dodawanie klucza GPG Dockera..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "Klucz GPG dodany."
sleep 1

echo "==> Dodawanie repozytorium Dockera..."
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "Repozytorium dodane."
sleep 1

echo "==> Aktualizacja listy pakietów z repozytorium Dockera..."
sudo apt update
echo "Lista pakietów ponownie zaktualizowana."
sleep 1

echo "==> Instalacja Dockera i Docker Compose..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "Docker i Docker Compose zainstalowane."
sleep 1

echo "==> Dodawanie użytkownika '$USER' do grupy 'docker'..."
sudo usermod -aG docker $USER
echo "Użytkownik dodany do grupy docker (wymaga ponownego zalogowania lub 'newgrp docker')."
sleep 1

echo "==> Sprawdzenie czy snap jest zainstalowany..."
if ! command -v snap &> /dev/null; then
  echo "==> Instalacja snapd..."
  sudo apt install -y snapd
fi
echo "snap jest dostępny."
sleep 1

echo "==> Instalacja IntelliJ IDEA Community Edition..."
sudo snap install intellij-idea-community --classic
echo "IntelliJ IDEA Community Edition zainstalowany."
sleep 1

echo "==> Rozpakowywanie projektu my-docker-java-mysql.zip..."
unzip -o my-docker-java-mysql.zip -d ~/projekty/
cd ~/projekty/my-docker-java-mysql || exit
echo "Projekt rozpakowany."
sleep 1

echo "==> Uruchamianie kontenerów Docker Compose..."
sudo docker compose up --build -d
echo "Kontenery uruchomione w tle."

echo
echo "Wszystko gotowe!"
echo "Projekt: ~/projekty/my-docker-java-mysql"
echo "Możesz wejść do katalogu i wpisać: docker compose logs -f"
echo "IntelliJ uruchom: intellij-idea-community &"
echo "Jeśli nie chcesz się wylogowywać, wpisz teraz: newgrp docker"
