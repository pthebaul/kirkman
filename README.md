Voici le répertoire GitHub de notre projet de 2MIC à l'INSA Toulouse.
Nous travaillons à 8 sur un problème mélant mathématiques et informatique :

# Les demoiselles du Révérend Kirkman

Voici l'énoncé de ce problème :
```
Fifteen young ladies in a school walk out three abreast for seven days in succession:
it is required to arrange them daily so that no two shall walk twice abreast.
```

# Utilité de ce répertoire GitHub

Sur ce répertoire, nous hébergeons les spécifications et les programmes, écrits en Ada, qui nous serviront à trouver et comprendre des solutions. Il nous permet de centraliser et de versionner le code.

## Installation

Vous aurez besoin d'un poste avec le logiciel Git installé, sur lequel vous pouvez compiler des programmes Ada, comme une machine (physique ou virtuelle) de l'INSA.

1. Positionnez-vous dans un dossier qui contiendra le projet. Exemple : Si vous vous positionnez sur le bureau, après l'importation, le projet sera dans ~/Bureau/kirkman/
2. Exécutez la commande suivante :

```bash
$ git clone https://github.com/pthebaul/kirkman.git
```
Voilà ! Vous devez avoir le code présent sur votre poste.

## Récupération des mises à jour

Pour récupérer la dernière version du code, vous pouvez exécuter la commande suivante :

```bash
$ git pull
```

Cela posera problème si vous avez modifié les fichiers qui ont changé.
Vous avez alors deux choix :
### Annuler vos modifications

La commande `$ git status` vous permet de voir les fichiers ajoutés, modifiés ou supprimés par rapport à la dernière version que vous avez importé.
Elle vous indique comment annuler vos modifications : avec la commande `$ git checkout`.
Exemple : Si vous avez modifié le fichier kirkman.adb, vous pouvez annuler ces modifications avec la commande suivante :
```bash
$ git checkout kirkman.adb
```

Vous pourrez ensuite retenter d'exécuter la commande `$ git pull`.

### Fusionner vos modifications avec celles du répertoire

Bientôt disponible.

## Proposer des mises à jour

Bientôt disponible (on utilisera sûrement la procédure des *pull requests*).
