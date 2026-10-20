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

## 📑 Historia konfiguracji Gita dla tego projektu

Poniżej znajduje się chronologiczny zapis komend użytych do skonfigurowania tego repozytorium na systemie EndeavourOS i powiązania go z kontem GitHub.

### 1. Konfiguracja tożsamości autora
Ustawienie globalnych danych dla programu Git na komputerze:
```bash
git config --global user.email "uderzane@gmail.com"
git config --global user.name "Tomek Dobry"
```

### 2. Ochrona danych (Ignorowanie plików)
Dodanie folderu z bazą danych Portainera do pliku `.gitignore`, aby nie został wysłany na publiczne repozytorium:
```bash
echo "data/" >> .gitignore
```

### 3. Przygotowanie i zatwierdzenie plików (Commit)
Zgłoszenie plików projektu do śledzenia i wykonanie pierwszego lokalnego zapisu w historii:
```bash
git add docker-compose.yml .gitignore README.md 
git commit -m "Pierwsza konfiguracja - Portainer"
```

### 4. Zarządzanie gałęziami i połączeniem zdalnym
Ustawienie domyślnej gałęzi na `main`, usunięcie wcześniejszego błędnego odnośnika oraz podpięcie właściwego adresu URL do profilu `pldenity`:
```bash
# Zmiana nazwy gałęzi na standard GitHub
git branch -M main

# Czyszczenie złego adresu i dodanie poprawnego linku do repozytorium
git remote remove origin
git remote add origin https://github.com/pldenity/moj-docker-home.git
```

### 5. Pierwsze wypchnięcie kodu na serwer (Push)
Wysłanie lokalnej historii i plików bezpośrednio na platformę GitHub:
```bash
git push -u origin main
```

---

### 💡 Ściągawka: Jak aktualizować to repozytorium w przyszłości?
Jeśli dokonasz jakichkolwiek zmian w plikach na komputerze (np. dodasz nowy kontener do pliku compose), zaktualizuj repozytorium tymi trzema komendami:
```bash
git add README.md
git commit -m "add README.md"
git push
```

```
