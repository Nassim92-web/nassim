-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 25 nov. 2026 à 11:02
-- Version du serveur : 8.0.44
-- Version de PHP : 8.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `agence_loc2`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id_client` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `numero_permis` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `date_permis` date NOT NULL,
  `code_postal` varchar(5) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `prenom`, `date_naissance`, `email`, `telephone`, `ville`, `numero_permis`, `date_permis`, `code_postal`) VALUES
(1, 'Benali', 'Karim', '1990-04-12', 'k.benali@exemple.fr', '+33 6 01 02 03 04', 'Paris', '12AB34567', '2010-06-20', '92500'),
(2, 'Martin', 'Sophie', '1985-09-30', 's.martin@exemple.fr', '0611223344', 'Versailles', '23CD45678', '2005-03-14', NULL),
(3, 'Haddad', 'Yasmine', '1998-01-15', 'y.haddad@exemple.fr', '0622334455', 'Rueil-Malmaison', '34EF56789', '2017-09-02', NULL),
(4, 'Dubois', 'Lucas', '2001-07-08', 'l.dubois@exemple.fr', '0633445566', 'Saint-Denis', '45GH67890', '2020-01-27', '93200');

-- --------------------------------------------------------

--
-- Structure de la table `garages`
--

CREATE TABLE `garages` (
  `id_garage` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE `locations` (
  `id_location` int NOT NULL,
  `id_client` int NOT NULL,
  `id_voiture` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `km_depart` int NOT NULL,
  `km_retour` int DEFAULT NULL,
  `montant_total` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `locations`
--

INSERT INTO `locations` (`id_location`, `id_client`, `id_voiture`, `date_debut`, `date_fin`, `km_depart`, `km_retour`, `montant_total`) VALUES
(1, 1, 1, '2026-09-01', '2026-09-05', 37800, 38200, 159.60),
(2, 2, 2, '2026-09-10', '2026-09-18', 51200, 51900, 280.00),
(3, 3, 4, '2026-10-02', '2026-10-04', 28500, 28800, 90.00),
(4, 4, 3, '2026-11-14', '2026-11-21', 21000, 21480, 483.00),
(5, 1, 5, '2026-10-20', '2026-10-23', 73500, 73900, 127.50);

-- --------------------------------------------------------

--
-- Structure de la table `reparations`
--

CREATE TABLE `reparations` (
  `id_reparation` int NOT NULL,
  `id_voiture` int NOT NULL,
  `date_reparation` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cout` decimal(8,2) NOT NULL,
  `id_garage` int DEFAULT NULL,
  `garage` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reparations`
--

INSERT INTO `reparations` (`id_reparation`, `id_voiture`, `date_reparation`, `description`, `cout`, `id_garage`, `garage`) VALUES
(1, 2, '2026-02-10', 'Remplacement des plaquettes de frein', 180.00, NULL, 'Garage Central'),
(2, 5, '2026-03-18', 'Vidange et changement des filtres', 120.50, NULL, 'Garage Central'),
(3, 3, '2026-05-05', 'Remplacement du pare-brise', 450.00, NULL, 'Auto Vitre Plus');

-- --------------------------------------------------------

--
-- Structure de la table `type_voiture`
--

CREATE TABLE `type_voiture` (
  `id_type` int NOT NULL,
  `designation` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_voiture`
--

INSERT INTO `type_voiture` (`id_type`, `designation`) VALUES
(1, 'TOURSIME'),
(2, 'luxe'),
(3, 'utilitaire');

-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE `voitures` (
  `id_voiture` int NOT NULL,
  `kilometrage` int NOT NULL,
  `immatriculation` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `marque` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `modele` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `tarif_jour` decimal(44,0) NOT NULL,
  `couleur` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `annee_circulation` smallint NOT NULL,
  `carburant` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `id_type` int DEFAULT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT '1',
  `nombre_places` tinyint NOT NULL,
  `boite_vitesse` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `voitures`
--

INSERT INTO `voitures` (`id_voiture`, `kilometrage`, `immatriculation`, `marque`, `modele`, `tarif_jour`, `couleur`, `annee_circulation`, `carburant`, `id_type`, `disponible`, `nombre_places`, `boite_vitesse`) VALUES
(1, 38500, 'AB-123-CD', 'Peugeot', '208', 40, 'Blanc', 2022, 'Essence', NULL, 1, 5, 'manuelle'),
(2, 52000, 'EF-456-GH', 'Renault', 'Clio', 35, 'Rouge', 2021, 'Diesel', NULL, 1, 5, 'manuelle'),
(3, 21480, 'IJ-789-KL', 'Mercedes', 'Classe A', 69, 'Noir', 2023, 'Hybride', NULL, 1, 5, 'Auto'),
(4, 29000, 'MN-012-OP', 'Renault', 'Zoé', 45, 'Bleu', 2022, 'Électrique', NULL, 1, 5, 'Auto'),
(5, 74000, 'QR-345-ST', 'Peugeot', '308', 43, 'Gris', 2020, 'Diesel', NULL, 1, 5, 'Manuelle');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `numero_permis` (`numero_permis`);

--
-- Index pour la table `garages`
--
ALTER TABLE `garages`
  ADD PRIMARY KEY (`id_garage`),
  ADD KEY `id_garage` (`id_garage`);

--
-- Index pour la table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id_location`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_voiture` (`id_voiture`);

--
-- Index pour la table `reparations`
--
ALTER TABLE `reparations`
  ADD PRIMARY KEY (`id_reparation`),
  ADD KEY `id_voiture` (`id_voiture`),
  ADD KEY `id_garage` (`id_garage`);

--
-- Index pour la table `type_voiture`
--
ALTER TABLE `type_voiture`
  ADD PRIMARY KEY (`id_type`);

--
-- Index pour la table `voitures`
--
ALTER TABLE `voitures`
  ADD PRIMARY KEY (`id_voiture`),
  ADD UNIQUE KEY `immatriculation` (`immatriculation`),
  ADD KEY `id_type` (`id_type`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `locations`
--
ALTER TABLE `locations`
  MODIFY `id_location` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `reparations`
--
ALTER TABLE `reparations`
  MODIFY `id_reparation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `voitures`
--
ALTER TABLE `voitures`
  MODIFY `id_voiture` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `garages`
--
ALTER TABLE `garages`
  ADD CONSTRAINT `garages_ibfk_1` FOREIGN KEY (`id_garage`) REFERENCES `reparations` (`id_garage`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`id_voiture`) REFERENCES `voitures` (`id_voiture`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `reparations`
--
ALTER TABLE `reparations`
  ADD CONSTRAINT `reparations_ibfk_1` FOREIGN KEY (`id_voiture`) REFERENCES `voitures` (`id_voiture`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Contraintes pour la table `voitures`
--
ALTER TABLE `voitures`
  ADD CONSTRAINT `voitures_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_voiture` (`id_type`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
