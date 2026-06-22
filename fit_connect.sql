-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 22 juin 2026 à 16:16
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fit_connect`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonnement`
--

CREATE TABLE `abonnement` (
  `id_abonnement` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime NOT NULL,
  `statut` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `abonnement`
--

INSERT INTO `abonnement` (`id_abonnement`, `type`, `date_debut`, `date_fin`, `statut`) VALUES
(1, 'Mensuel', '2026-01-01 00:00:00', '2026-02-01 00:00:00', 'actif'),
(2, 'Trimestriel', '2026-01-01 00:00:00', '2026-04-01 00:00:00', 'actif'),
(3, 'Annuel', '2026-01-01 00:00:00', '2027-01-01 00:00:00', 'actif');

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE `adherent` (
  `id_adherent` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `date_inscription` datetime NOT NULL,
  `id_abonnement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `adherent`
--

INSERT INTO `adherent` (`id_adherent`, `nom`, `prenom`, `email`, `telephone`, `date_inscription`, `id_abonnement`) VALUES
(1, 'Ali', 'Benali', 'ali@gmail.com', '0611111111', '2026-01-01 00:00:00', 1),
(2, 'Sara', 'El Amrani', 'sara@gmail.com', '0622222222', '2026-01-02 00:00:00', 1),
(3, 'Youssef', 'Khalfi', 'youssef@gmail.com', '0633333333', '2026-01-03 00:00:00', 2),
(4, 'Imane', 'Zahraoui', 'imane@gmail.com', '0644444444', '2026-01-04 00:00:00', 2),
(5, 'Omar', 'Bennani', 'omar@gmail.com', '0655555555', '2026-01-05 00:00:00', 3),
(6, 'Nadia', 'Haddad', 'nadia@gmail.com', '0666666666', '2026-01-06 00:00:00', 3);

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

CREATE TABLE `equipement` (
  `id_equipement` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `equipement`
--

INSERT INTO `equipement` (`id_equipement`, `nom`, `type`) VALUES
(1, 'Tapis de course', 'Cardio'),
(2, 'Haltères', 'Musculation'),
(3, 'Vélo', 'Cardio'),
(4, 'Barre de traction', 'Musculation'),
(5, 'Tapis yoga', 'Fitness');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `id_salle` int(11) NOT NULL,
  `nom_salle` varchar(50) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id_salle`, `nom_salle`, `ville`) VALUES
(1, 'Salle Musculation', 'Beni Mellal'),
(2, 'Salle Cardio', 'Beni Mellal');

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `id_seance` int(11) NOT NULL,
  `date_seance` datetime NOT NULL,
  `duree` time NOT NULL,
  `type_activite` varchar(50) NOT NULL,
  `id_adherent` int(11) DEFAULT NULL,
  `id_salle` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id_seance`, `date_seance`, `duree`, `type_activite`, `id_adherent`, `id_salle`) VALUES
(1, '2026-01-10 10:00:00', '01:00:00', 'Musculation', 1, 1),
(2, '2026-01-10 11:00:00', '01:00:00', 'Cardio', 2, 2),
(3, '2026-01-11 10:00:00', '01:00:00', 'Fitness', 3, 1),
(4, '2026-01-11 11:00:00', '01:00:00', 'Yoga', 4, 2),
(5, '2026-01-12 10:00:00', '01:00:00', 'Crossfit', 5, 1),
(6, '2026-01-12 11:00:00', '01:00:00', 'Cardio', 6, 2);

-- --------------------------------------------------------

--
-- Structure de la table `seance_equipement`
--

CREATE TABLE `seance_equipement` (
  `id_seance` int(11) NOT NULL,
  `id_equipement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `seance_equipement`
--

INSERT INTO `seance_equipement` (`id_seance`, `id_equipement`) VALUES
(1, 2),
(2, 1),
(3, 5),
(4, 5),
(5, 4),
(6, 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonnement`
--
ALTER TABLE `abonnement`
  ADD PRIMARY KEY (`id_abonnement`);

--
-- Index pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`id_adherent`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telephone` (`telephone`),
  ADD KEY `id_abonnement` (`id_abonnement`);

--
-- Index pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD PRIMARY KEY (`id_equipement`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id_salle`),
  ADD UNIQUE KEY `nom_salle` (`nom_salle`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id_seance`),
  ADD KEY `id_adherent` (`id_adherent`),
  ADD KEY `id_salle` (`id_salle`);

--
-- Index pour la table `seance_equipement`
--
ALTER TABLE `seance_equipement`
  ADD PRIMARY KEY (`id_seance`,`id_equipement`),
  ADD KEY `id_equipement` (`id_equipement`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD CONSTRAINT `adherent_ibfk_1` FOREIGN KEY (`id_abonnement`) REFERENCES `abonnement` (`id_abonnement`);

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`id_adherent`) REFERENCES `adherent` (`id_adherent`),
  ADD CONSTRAINT `seance_ibfk_2` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`);

--
-- Contraintes pour la table `seance_equipement`
--
ALTER TABLE `seance_equipement`
  ADD CONSTRAINT `seance_equipement_ibfk_1` FOREIGN KEY (`id_seance`) REFERENCES `seance` (`id_seance`),
  ADD CONSTRAINT `seance_equipement_ibfk_2` FOREIGN KEY (`id_equipement`) REFERENCES `equipement` (`id_equipement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
