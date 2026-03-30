# 📋 Copie-RPA — Copie automatique de fichiers RPA

![Batch](https://img.shields.io/badge/Batch-Windows-0078D6?style=for-the-badge)
![Windows](https://img.shields.io/badge/Windows-10%2F11-0078D6?style=for-the-badge)
![Licence](https://img.shields.io/badge/Licence-MIT-green?style=for-the-badge)

Script batch Windows de copie automatique de fichiers liés à des processus RPA (Robotic Process Automation). Automatise le transfert de fichiers entre répertoires source et destination.

---

## Fonctionnalités

- Copie automatique de fichiers vers un répertoire cible
- Horodatage des copies
- Journalisation des opérations

---

## Prérequis

- Windows 10 / 11
- Accès en lecture/écriture aux répertoires source et destination

---

## Installation

```batch
git clone https://github.com/titithen00b/Copie-RPA.git
cd Copie-RPA
```

---

## Configuration

Ouvrir `copie.bat` et modifier les variables en début de fichier :

```batch
SET SOURCE=C:\chemin\source
SET DESTINATION=C:\chemin\destination
SET LOG=C:\logs\copie_rpa.log
```

---

## Utilisation

### Lancement manuel

Double-cliquer sur `copie.bat` ou l'exécuter depuis une invite de commandes :

```batch
copie.bat
```

### Automatisation via le Planificateur de tâches Windows

1. Ouvrir le Planificateur de tâches (`taskschd.msc`)
2. Créer une nouvelle tâche
3. Définir le déclencheur (heure, événement, etc.)
4. Action : démarrer le programme `copie.bat`

---

## Fichiers du projet

| Fichier | Description |
|---------|-------------|
| `copie.bat` | Script principal de copie |

---

## Licence

MIT © Titithen00b
