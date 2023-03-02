-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 02 mars 2023 à 10:35
-- Version du serveur :  5.7.33
-- Version de PHP : 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
                           `id_articles` int(10) UNSIGNED NOT NULL,
                           `titre` varchar(45) NOT NULL,
                           `nom_articles` varchar(45) NOT NULL,
                           `users_id_user` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Article`
--

INSERT INTO `articles` (`id_articles`, `titre`, `nom_articles`, `users_id_user`) VALUES
                          (1, 'Les jointures en SQL.', 'SQL', 1),
                          (2, 'LeSQL facile !', 'SQL', 2),
                          (3, 'Deuxième article de Jane', 'CSS', 3);

-- --------------------------------------------------------

--
-- Structure de la table `Auteur`
--

CREATE TABLE `users` (
                          `id_user` int(10) UNSIGNED NOT NULL,
                          `nom` varchar(45) DEFAULT NULL,
                          `prenom` varchar(45) DEFAULT NULL,
                          `pseudo` varchar(45) DEFAULT NULL,
                          `roles_id_roles` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `nom`, `prenom`, `pseudo`, `roles_id_roles`) VALUES
                                                         (1, 'John', 'Doe', 'azerty', 1),
                                                         (2, 'Jane', 'Doe', 'azerty2', 2),
                                                         (3, 'Sarah', 'Conor', 'azerty3', 2),
                                                         (4, 'Luc', 'Skywalker', 'azerty4', 3);
-- --------------------------------------------------------

--
-- Structure de la table `Commentaire`
--

CREATE TABLE `Commentaire` (
                               `id_commentaires` int(10) UNSIGNED NOT NULL,
                               `commentaires` longtext NOT NULL,
                               `articles_id_articles` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
                               `id_roles` int(10) UNSIGNED NOT NULL,
                               `roles` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`id_roles`, `roles`) VALUES
                          (1, 'admin'),
                          (2, 'ecrivain'),
                          (3, 'visiteurs');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_articles`),
  ADD KEY `fk_articles_users1_idx` (`users_id_user`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
    ADD PRIMARY KEY (`id_roles`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id_user`),
    ADD KEY `fk_users_roles_idx` (`roles_id_roles`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
    ADD PRIMARY KEY (`id_commentaires`),
   ADD KEY `fk_commentaires_articles1_idx` (`articles_id_articles`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
    MODIFY `id_articles` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
    MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
    MODIFY `id_commentaires` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
    MODIFY `id_roles` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;