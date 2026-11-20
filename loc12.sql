-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 20 nov. 2026 à 13:17
-- Version du serveur : 8.0.31
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `loc12`
--

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `id_location` int NOT NULL,
  `date_location` date NOT NULL,
  `nbre_jour` int NOT NULL,
  `num_client` int NOT NULL,
  `immatriculation` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `location`
--

INSERT INTO `location` (`id_location`, `date_location`, `nbre_jour`, `num_client`, `immatriculation`) VALUES
(12, '2026-11-18', 5, 201, 'DZ 204 DZ'),
(13, '2026-11-16', 4, 200, 'NS 239 NS');

-- --------------------------------------------------------

--
-- Structure de la table `table client`
--

CREATE TABLE `table client` (
  `num_client` int NOT NULL,
  `num_permis` int NOT NULL,
  `adresse` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `nom_prenom` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `table client`
--

INSERT INTO `table client` (`num_client`, `num_permis`, `adresse`, `nom_prenom`) VALUES
(200, 1234, 'paris', 'mohamed'),
(201, 4321, 'clammart', 'amar');

-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE `voitures` (
  `immatriculation` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `marque` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `couleur` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `kilometrage` int NOT NULL,
  `date_circulation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `voitures`
--

INSERT INTO `voitures` (`immatriculation`, `marque`, `couleur`, `kilometrage`, `date_circulation`) VALUES
('DZ 204 DZ', 'bmw', 'ROUGE', 10000, '2026-11-20'),
('NS 239 NS', 'mercedes', 'blanc', 20000, '2026-11-20');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`),
  ADD KEY `num_client` (`num_client`),
  ADD KEY `immatriculation` (`immatriculation`);

--
-- Index pour la table `table client`
--
ALTER TABLE `table client`
  ADD PRIMARY KEY (`num_client`);

--
-- Index pour la table `voitures`
--
ALTER TABLE `voitures`
  ADD PRIMARY KEY (`immatriculation`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`num_client`) REFERENCES `table client` (`num_client`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
