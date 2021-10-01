-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 30 sep. 2021 à 21:57
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tresor_bdd`
--


-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `libelle` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `libelle`) VALUES
(1, 'bdd'),
(2, 'reseau'),
(3, 'developpement'),
(4, 'genielogiciel');

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id` int(11) NOT NULL,
  `libelle` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
(1, 'todoliste'),
(2, 'done'),
(3, 'inprogress');

-- --------------------------------------------------------

--
-- Structure de la table `taches`
--

CREATE TABLE `taches` (
  `id` int(11) NOT NULL,
  `libelle` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  `idTodo` int(11) NOT NULL,
  `idEtat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `taches`
--

INSERT INTO `taches` (`id`, `libelle`, `description`, `idTodo`, `idEtat`) VALUES
(1, 'tache1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse enim quam, finibus eu dignissim vitae, fringilla nec neque. ', 3, 1),
(2, 'tache2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse enim quam, finibus eu dignissim vitae, fringilla nec neque. ', 4, 1),
(3, 'tache3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse enim quam, finibus eu dignissim vitae, fringilla nec neque. ', 3, 1),
(4, 'tache4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse enim quam, finibus eu dignissim vitae, fringilla nec neque. ', 4, 2),
(5, 'tache5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse enim quam, finibus eu dignissim vitae, fringilla nec neque. ', 3, 3),
(6, 'tache6', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse enim quam, finibus eu dignissim vitae, fringilla nec neque. ', 4, 3),
(7, 'tache7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse enim quam, finibus eu dignissim vitae, fringilla nec neque. ', 3, 3),
(8, 'tache8', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse enim quam, finibus eu dignissim vitae, fringilla nec neque. ', 4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `taches-categorie`
--

CREATE TABLE `taches-categorie` (
  `id` int(11) NOT NULL,
  `idTache` int(11) NOT NULL,
  `idCategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `taches-categorie`
--

INSERT INTO `taches-categorie` (`id`, `idTaches`, `idCategorie`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2),
(6, 6, 3),
(7, 7, 4),
(8, 8, 2);

-- --------------------------------------------------------

--
-- Structure de la table `todoliste`
--

CREATE TABLE `todoliste` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `utilisateur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `todoliste`
--

INSERT INTO `todoliste` (`id`, `libelle`, `utilisateurs_id`) VALUES
(3, 'developper front end', 2),
(4, 'developper back end', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `pseudo`) VALUES
(1, 'Alice'),
(2, 'Bob');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `taches`
--
ALTER TABLE `taches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtodoliste` (`idTodoliste`),
  ADD KEY `FKetat` (`idEtat`);

--
-- Index pour la table `taches-categorie`
--
ALTER TABLE `taches-categorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtaches` (`idTaches`),
  ADD KEY `FKcategorie` (`idCategorie`);

--
-- Index pour la table `todoliste`
--
ALTER TABLE `todoliste`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKutilisateur` (`utilisateurs_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `etat`
--
ALTER TABLE `etat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tache`
--
ALTER TABLE `taches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `taches-categorie`
--
ALTER TABLE `taches-categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `todoliste`
--
ALTER TABLE `todoliste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tache`
--
ALTER TABLE `taches`
  ADD CONSTRAINT `FKetat` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `FKtodolist` FOREIGN KEY (`idTodo`) REFERENCES `todo` (`id`);

--
-- Contraintes pour la table `tache-categorie`
--
ALTER TABLE `taches-categorie`
  ADD CONSTRAINT `FKcategorie` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `FKtaches` FOREIGN KEY (`idTaches`) REFERENCES `tache` (`id`);

--
-- Contraintes pour la table `todoliste`
--
ALTER TABLE `todoliste`
  ADD CONSTRAINT `FKutilisateurs` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;