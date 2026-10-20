# Moja Konfiguracja Środowiska (EndeavourOS)

Repozytorium zawiera konfigurację mojego lokalnego środowiska deweloperskiego.

## 1. Instalacja Dockera i Docker Compose
W dystrybucji EndeavourOS (Arch) Docker oraz rozszerzenie Compose znajdują się w oficjalnych repozytorium.

```bash
# Aktualizacja systemu i instalacja wymaganych pakietów
sudo pacman -Sy
sudo pacman -S docker docker-compose

# Uruchomienie i włączenie automatycznego startu usługi Docker
sudo systemctl start docker.service
sudo systemctl enable docker.service

# Dodanie użytkownika do grupy docker (wymaga ponownego zalogowania lub komendy 'newgrp docker')
sudo usermod -aG docker $USER
```

## 2. Instalacja Visual Studio Code
W EndeavourOS najwygodniej jest zainstalować otwartoźródłową wersję VS Code (`code`) z oficjalnego repozytorium, bądź wersję ze wszystkimi zastrzeżonymi dodatkami Microsoftu (`visual-studio-code-bin`) z repozytorium AUR.


### Opcja B: Wersja od Microsoftu (z repozytorium AUR przez menedżer yay)
```bash
yay -S visual-studio-code-bin
```

## 3. Uruchomienie Portainera
Po instalacji Dockera, przejdź do katalogu z plikiem `docker-compose.yml` i wpisz:
```bash
docker compose up -d
```
