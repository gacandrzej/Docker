#!/bin/bash

echo "==> Sprawdzanie statusu kontenerów..."

containers=("mysql_sklep" "phpmyadmin_sklep" "java_app")
for container in "${containers[@]}"; do
  if sudo docker ps --format '{{.Names}}' | grep -q "$container"; then
    echo "[OK] Kontener '$container' działa."
  else
    echo "[BŁĄD] Kontener '$container' NIE działa!"
    exit 1
  fi
done

echo "==> Sprawdzanie czy MySQL odpowiada i zawiera bazę 'sklep'..."
sudo docker exec -i mysql_sklep mysql -usprzedawca -p'S1sqbIdPH2i*qX_]' -e "SHOW DATABASES;" | grep -q sklep
if [ $? -eq 0 ]; then
  echo "[OK] Baza danych 'sklep' istnieje."
else
  echo "[BŁĄD] Nie znaleziono bazy 'sklep'."
  exit 1
fi

echo "==> Sprawdzanie logów z java_app..."
sudo docker logs java_app 2>&1 | grep -q "Połączenie udane"
if [ $? -eq 0 ]; then
  echo "[OK] java_app połączył się z MySQL."
else
  echo "[UWAGA] Nie znaleziono 'Połączenie udane' w logach java_app. Sprawdź ręcznie:"
  sudo docker logs java_app
  exit 1
fi

echo "==> Sprawdzanie dostępności phpMyAdmin na porcie 8080..."
if curl -s http://localhost:8080 | grep -qi phpmyadmin; then
  echo "[OK] phpMyAdmin jest dostępny na http://localhost:8080"
else
  echo "[BŁĄD] phpMyAdmin nie jest dostępny na porcie 8080."
  exit 1
fi

echo
echo "✅ Wszystko działa prawidłowo!"
