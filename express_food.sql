-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 04 mai 2023 à 17:04
-- Version du serveur : 5.7.33
-- Version de PHP : 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `express_food`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

CREATE TABLE `adresses` (
  `id` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `adresse_complement` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `adresses`
--

INSERT INTO `adresses` (`id`, `id_client`, `numero`, `adresse`, `adresse_complement`, `code_postal`, `ville`, `type`) VALUES
(1, 1, 66, 'rue de Peron', NULL, 60893, 'Rodrigues', 1),
(2, 1, 7, 'rue Marty', NULL, 116, 'Hernandez', 0),
(3, 2, 127, 'rue Delannoy', NULL, 95876, 'BertinBourg', 1),
(4, 3, 83, 'rue Maryse Pinto', NULL, 83189, 'Evrard', 0);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `nom`, `prenom`, `email`, `mot_de_passe`, `telephone`) VALUES
(1, 'Asimov', 'Isaac', 'isaac.asimov@hotmail.com', '75abf34d45f25ade860e3a8577d4529dab1b3658028ef82584b5ba1a393a4d65', '06 54 82 47 53'),
(2, 'Kojima', 'Hideo', 'hideo.kojima1@gmail.com', 'e17982cba285729e436dc2fae1d281471617afdef73b4832971aa87b7a7fdbc5', '07 95 75 35 15'),
(3, 'Cameron', 'James', 'james.cameron@20thcenturystudios.com', '2a3acca9455afc49f75b92497b4e44db8f25c3a154b0b086acd4bc3a86ee6f61', '01 48 86 62 24');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_livreur` int(11) DEFAULT NULL,
  `id_adresse` int(11) DEFAULT NULL,
  `dateCommander` datetime DEFAULT NULL,
  `statut` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `id_client`, `id_livreur`, `id_adresse`, `dateCommander`, `statut`) VALUES
(1, 1, 3, 3, '2023-05-04 11:27:13', 3),
(2, 3, 2, 4, '2023-05-02 16:13:56', 4);

-- --------------------------------------------------------

--
-- Structure de la table `commandes_produits`
--

CREATE TABLE `commandes_produits` (
  `id` int(11) NOT NULL,
  `id_commande` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `commandes_produits`
--

INSERT INTO `commandes_produits` (`id`, `id_commande`, `id_produit`, `quantite`) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `livreurs`
--

CREATE TABLE `livreurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `livreurs`
--

INSERT INTO `livreurs` (`id`, `nom`, `prenom`, `email`, `mot_de_passe`, `telephone`, `latitude`, `longitude`, `etat`) VALUES
(1, 'Villeneuve', 'Denis', 'denis.villeneuve@gmail.com', '552651b491edfa29a9577e14d0cf21f720e2a47da67eb4ac3e58a3bb4b5688b4', '01 32 74 98 36', 22.3195, 114.19, 0),
(2, 'Druckmann', 'Neil', 'neil.druckmann@naughtydog.com', 'e809ed992662c8bf1234c4a1f846281280e3a46db19337ab528ed02a70dca841', '06 59 54 51 53', 48.8584, 2.29448, 2),
(3, 'Santaolalla', 'Gustavo', 'gustavo.santaolalla@naughtydog.com', '7b5a5a2f29cb6d9c2da12441f5518eedb69b0d25feeb956be21e90527944931b', '07 79 93 31 17', 38.8899, -77.009, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `illustration`, `prix`, `type`, `etat`) VALUES
(1, 'Muffins aux pépites de chocolat', 'Ces muffins sont bien croustillants à l\'extérieur grâce à une cuisson forte au départ, et moelleux à l\'intérieur, légers, bien chocolatés, le top !', '245cec57256bb287d81623d598b7595c53e4b4fa5a612205ba06a50701c930d4.jpg', 4.99, 1, 1),
(2, 'Pâtes à la carbonara', 'Les pâtes à la carbonara sont une spécialité culinaire traditionnelle de la cuisine italienne.', 'b1d53b9acf23d0342ffa96611f55d15d58d3a494f5bd22780f5b48816456dfd5.jpg', 12.99, 0, 0),
(3, 'Chili con carne', 'Le chili con carne appelé aussi chili, notamment aux États Unis est une sorte de ragout à base de viande de boeuf hachée ou non, de tomates, oignons et d’haricots rouges. C’est une recette emblématique de la cuisine tex-mex originaire du Texas.', '00cbc7e84f52803c006bf03ef0f9895a75d44a5f357e3695ab081c4456917932.jpg', 14.49, 0, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_livreur` (`id_livreur`),
  ADD KEY `id_adresse` (`id_adresse`);

--
-- Index pour la table `commandes_produits`
--
ALTER TABLE `commandes_produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_commande` (`id_commande`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Index pour la table `livreurs`
--
ALTER TABLE `livreurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD CONSTRAINT `adresses_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`);

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`id_livreur`) REFERENCES `livreurs` (`id`),
  ADD CONSTRAINT `commandes_ibfk_3` FOREIGN KEY (`id_adresse`) REFERENCES `adresses` (`id`);

--
-- Contraintes pour la table `commandes_produits`
--
ALTER TABLE `commandes_produits`
  ADD CONSTRAINT `commandes_produits_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id`),
  ADD CONSTRAINT `commandes_produits_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
