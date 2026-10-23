#!/bin/bash

# Przerwij skrypt w przypadku jakiegokolwiek błędu
set -e

echo "=== 1. Aktualizacja systemu i instalacja Dockera oraz Docker Compose ==="
sudo pacman -Syu --noconfirm docker docker-compose

echo "=== 2. Uruchamianie i włączanie usługi Docker przy starcie systemu ==="
sudo systemctl start docker.service
sudo systemctl enable docker.service

echo "=== 3. Dodawanie użytkownika do grupy docker ==="
sudo usermod -aG docker "$USER"

echo "=== 4. Instalacja Visual Studio Code z AUR ==="
yay -S --noconfirm visual-studio-code-bin

echo "=== 5. Przygotowanie katalogu i klonowanie repozytorium ==="
# -p upewni się, że cała ścieżka katalogów zostanie utworzona bez błędów
mkdir -p /home/igor/Pulpit/docker/portainer
cd /home/igor/Pulpit/docker/portainer

# Klonowanie projektu (jeśli katalog jest pusty)
if [ ! -d ".git" ]; then
    git clone https://github.com/pldenity/portainer .
fi

echo "=== 6. Uruchamianie kontenera Portainer za pomocą Docker Compose ==="
# Wywołanie przez 'newgrp' pozwala na natychmiastowe użycie dockera bez restartu komputera
newgrp docker <<EONG
docker compose up -d
EONG

echo "=== 7. Otwieranie Portainera w Google Chrome Unstable ==="
# Odczekanie 3 sekund, aby kontener zdążył zainicjować porty przed otwarciem przeglądarki
sleep 3
/opt/google/chrome-unstable/google-chrome-unstable "https://localhost:9443" > /dev/null 2>&1 & disown

echo -e "\n=== INSTALACJA ZAKOŃCZONA POMYŚLNIE! ==="
echo "Przełączam bieżący terminal na grupę docker..."

# Ostateczne odświeżenie grupy w obecnym oknie konsoli
exec newgrp docker
