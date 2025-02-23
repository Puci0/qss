
# Quick Service Sasha

## Windows:
### Włączamy powershell i wklejamy:
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

### następnie:
choco install make

### następnie: 
pobieramy Docker Desktop:
https://www.docker.com/products/docker-desktop/ i włączamy.

## Linux:
### Włączamy terminal i wklejamy:
apt-get update && apt install make

### Instalacja dockera:
curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh ./get-docker.sh --dry-run



# Proces uruchomienia projektu:
### Przy wersji na windowsa zaleca się użycie terminala git bash

### pierwszy pull (cd quick-service-sash):
make first

### uruchomienie z zastosowaniem zmian:

make build && make run

### uruchomienie, kiedy nie nastąpiły zmiany w kodzie:
make run

### restart aplikacji:
make restart

### wczytanie bazy danych:
make launch

### Zatrzymanie działania aplikacji:
make down

### wyczyszczenie całych mikroserwisów:
docker system prune -a