#!/bin/bash

# Demander le mot de passe administrateur
sudo -v

# Ajouter l'architecture i386
sudo dpkg --add-architecture i386

# Mettre à jour la liste des paquets
sudo apt update

# Télécharger la clé WineHQ
wget -nc https://dl.winehq.org/wine-builds/winehq.key

# Importer la clé WineHQ
gpg -n -a --batch --import winehq.key
gpg --no-default-keyring --keyring ./winehq.key.gpg --import winehq.key
gpg --no-default-keyring --keyring ./winehq.key.gpg --export > /usr/share/keyrings/winehq-archive.keyring

# Ajouter le dépôt WineHQ
echo "deb [signed-by=/usr/share/keyrings/winehq-archive.keyring] https://dl.winehq.org/wine-builds/debian/ bookworm main" | sudo tee /etc/apt/sources.list.d/winehq.list

# Mettre à jour la liste des paquets à nouveau
sudo apt update

# Installer WineHQ stable
sudo apt install --install-recommends winehq-stable