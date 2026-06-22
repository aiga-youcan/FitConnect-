# 💪 FitConnect

FitConnect est une application backend développée en **PHP Orienté Objet**, **MySQL** et **PDO** permettant de gérer un réseau de salles de sport. Le projet respecte une architecture en couches (Entities, Repositories, Services, Controllers) afin de garantir un code propre, maintenable et évolutif.

---

# 📌 Objectif

Le projet a pour objectif de remplacer la gestion manuelle des séances (Excel) par une application centralisée capable de gérer :

- Les adhérents
- Les abonnements
- Les séances
- Les salles de sport
- Les activités
- Les équipements

Le développement suit les étapes de conception **Merise (MCD → MLD → Base de données)** avant toute implémentation PHP.

---

# 🚀 Fonctionnalités

## 👤 Gestion des adhérents

- Ajouter un adhérent
- Modifier un adhérent
- Supprimer un adhérent (si aucune séance ni abonnement actif)
- Consulter la liste des adhérents

## 📄 Gestion des abonnements

- Ajouter un abonnement
- Modifier un abonnement
- Supprimer un abonnement
- Vérifier la validité de l'abonnement
- Un seul abonnement actif par adhérent

## 🏋️ Gestion des séances

- Enregistrer une séance
- Associer une salle
- Choisir une activité
- Définir la durée
- Associer un équipement (optionnel)
- Vérifier automatiquement que l'abonnement est valide

## 📊 Dashboard

- Nombre total d'adhérents
- Nombre d'abonnements actifs
- Nombre de séances
- Statistiques générales

---

# 🏛 Architecture du projet

Le projet suit une architecture en couches :

```
Utilisateur
      │
      ▼
Controllers
      │
      ▼
Services
      │
      ▼
Repositories
      │
      ▼
Base de données (MySQL)
```

Chaque couche possède une responsabilité unique.

---

# 🛠 Technologies utilisées

- PHP 8 (POO)
- MySQL
- PDO
- HTML5
- CSS3
- Bootstrap 5
- XAMPP
- phpMyAdmin
- Merise (MCD / MLD)
- Git
- GitHub
- Jira

---

# 📂 Structure du projet

```
FitConnect/

│
├── app/
│   ├── Controllers/
│   │     ├── AdherentController.php
│   │     ├── AbonnementController.php
│   │     └── SeanceController.php
│   │
│   ├── Entities/
│   │     ├── Adherent.php
│   │     ├── Abonnement.php
│   │     └── Seance.php
│   │
│   ├── Repositories/
│   │     ├── AdherentRepository.php
│   │     ├── AbonnementRepository.php
│   │     └── SeanceRepository.php
│   │
│   └── Services/
│         ├── AdherentService.php
│         ├── AbonnementService.php
│         └── SeanceService.php
│
├── config/
│     └── Database.php
│
├── database/
│     └── fitconnect.sql
│
├── public/
│     ├── index.php
│     └── test.php
│
├── views/
│     ├── adherents/
│     ├── abonnements/
│     ├── seances/
│     └── dashboard/
│
├── README.md
└── .gitignore
```

---

# 🗄 Base de données

Les principales tables :

- adherents
- abonnements
- seances
- salles
- activites
- equipements

Les contraintes utilisées :

- PRIMARY KEY
- FOREIGN KEY
- UNIQUE
- NOT NULL
- ON DELETE RESTRICT
- ON UPDATE CASCADE

La base de données est réalisée uniquement après validation du **MCD** et du **MLD**.

---

# 📖 Règles de gestion

- Chaque adhérent est inscrit dans une seule salle.
- Un adhérent possède un seul abonnement actif.
- Un abonnement possède une date de début et une date de fin.
- Une séance ne peut être enregistrée que si l'abonnement est valide.
- Une séance appartient à un seul adhérent.
- Une séance possède une activité.
- Une séance peut utiliser un équipement.
- Un adhérent ne peut pas être supprimé s'il possède des séances ou un abonnement actif.
- Toutes les relations respectent l'intégrité référentielle.

---

# 🔒 Sécurité

Le projet applique plusieurs bonnes pratiques :

- Requêtes préparées PDO
- Protection contre les injections SQL
- Validation des données côté serveur
- Encapsulation des attributs privés
- Séparation stricte des responsabilités
- Gestion des exceptions
- Messages d'erreur explicites

---

# 💻 Installation

## 1. Cloner le projet

```bash
git clone https://github.com/votre-compte/FitConnect.git
```

---

## 2. Copier le projet dans

```
xampp/htdocs/
```

---

## 3. Créer la base de données

Créer une base :

```
fitconnect
```

Importer ensuite :

```
database/fitconnect.sql
```

---

## 4. Configurer la connexion PDO

Modifier :

```
config/Database.php
```

```php
<?php

class Database
{
    private $host = "localhost";
    private $dbname = "fitconnect";
    private $username = "root";
    private $password = "";

    public function connect()
    {
        try {
            $pdo = new PDO(
                "mysql:host={$this->host};dbname={$this->dbname};charset=utf8",
                $this->username,
                $this->password
            );

            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            return $pdo;

        } catch (PDOException $e) {
            die("Erreur : " . $e->getMessage());
        }
    }
}
```

---

## 5. Lancer XAMPP

Démarrer :

- Apache
- MySQL

Puis ouvrir :

```
http://localhost/FitConnect/public
```

---

# 🧪 Tests

Le fichier

```
public/test.php
```

permet de tester :

- Les entités
- Les repositories
- Les services
- La connexion PDO

sans passer par l'interface utilisateur.

---

# 📸 Captures d'écran

À ajouter :

- Dashboard
- Liste des adhérents
- Gestion des abonnements
- Gestion des séances
- Structure du projet

---

# 📋 Livrables

- ✔ Backlog Jira
- ✔ User Stories
- ✔ MCD (Merise)
- ✔ MLD
- ✔ Script SQL
- ✔ Jeu de données de test
- ✔ Architecture en couches
- ✔ Connexion PDO
- ✔ Repositories
- ✔ Services
- ✔ Controllers
- ✔ Vues HTML/PHP
- ✔ public/index.php
- ✔ public/test.php
- ✔ README.md
- ✔ .gitignore

---

# 📚 Concepts appliqués

- Programmation Orientée Objet (POO)
- Encapsulation
- Architecture en couches
- PDO
- Requêtes préparées
- Merise (MCD / MLD)
- Normalisation (1NF, 2NF, 3NF)
- Intégrité référentielle
- CRUD
- MVC simplifié

---

# 👨‍💻 Auteur

Projet réalisé dans le cadre de la formation **Développeur Web et Web Mobile (DWWM)** chez **DevAcademy**.

---

Binôme :

- SABRAR Rida

---

# 📄 Licence

Projet pédagogique réalisé uniquement dans le cadre de la formation.
