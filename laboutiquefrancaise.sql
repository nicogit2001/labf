-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 14 fév. 2025 à 18:28
-- Version du serveur : 5.7.24
-- Version de PHP : 8.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `laboutiquefrancaise`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `firstname`, `lastname`, `address`, `postal`, `city`, `country`, `phone`) VALUES
(7, 10, 'nicolas', 'macarez', 'rue', '75015', 'Paris', 'FR', '222222222222222222'),
(8, 11, 'Vincent', 'de Rosny', '16 rue de l\'abbé Groult', '75015', 'Paris', 'FR', '0606060606');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

CREATE TABLE `carrier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'Colissimo', 'Ceci est Colissimo', 4.9),
(2, 'Chronopost', 'Ceci est Chronopost', 9.9);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`) VALUES
(1, 'Sacs', 'sacs'),
(2, 'Bijoux', 'bijoux'),
(3, 'Casquettes', 'casquettes');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250102175535', '2025-01-02 17:56:41', 55),
('DoctrineMigrations\\Version20250102180932', '2025-01-02 18:09:45', 43),
('DoctrineMigrations\\Version20250108043857', '2025-01-08 04:39:13', 30),
('DoctrineMigrations\\Version20250108050803', '2025-01-08 05:08:17', 132),
('DoctrineMigrations\\Version20250125171521', '2025-01-25 17:15:50', 68),
('DoctrineMigrations\\Version20250128065414', '2025-01-28 06:54:30', 34),
('DoctrineMigrations\\Version20250129183345', '2025-01-29 18:34:17', 97),
('DoctrineMigrations\\Version20250210065628', '2025-02-10 07:09:20', 75);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `state` int(11) NOT NULL,
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `stripe_session_id` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `created_at`, `state`, `carrier_name`, `carrier_price`, `delivery`, `user_id`, `stripe_session_id`) VALUES
(4, '2025-02-06 05:27:42', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(5, '2025-02-07 05:31:36', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(6, '2025-02-08 18:12:12', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(7, '2025-02-09 06:50:17', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(8, '2025-02-09 07:16:30', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(9, '2025-02-09 07:18:12', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(10, '2025-02-09 07:19:36', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(11, '2025-02-09 10:23:08', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(12, '2025-02-09 10:37:37', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(13, '2025-02-09 10:39:22', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(14, '2025-02-09 10:44:59', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(15, '2025-02-09 10:47:21', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(16, '2025-02-09 10:49:57', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(17, '2025-02-09 10:51:48', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(18, '2025-02-09 10:54:03', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(19, '2025-02-09 10:56:27', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(20, '2025-02-09 11:00:39', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(21, '2025-02-09 11:06:50', 1, 'Chronopost', 9.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(22, '2025-02-09 11:09:06', 1, 'Chronopost', 9.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(23, '2025-02-09 11:10:00', 1, 'Chronopost', 9.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(24, '2025-02-09 11:50:55', 1, 'Chronopost', 9.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(25, '2025-02-09 11:56:10', 1, 'Chronopost', 9.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(26, '2025-02-09 11:56:35', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(27, '2025-02-09 11:59:07', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(28, '2025-02-09 12:00:07', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(29, '2025-02-09 12:45:47', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(30, '2025-02-09 12:46:23', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(31, '2025-02-09 12:47:29', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(32, '2025-02-09 12:47:46', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(33, '2025-02-09 12:48:12', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(34, '2025-02-09 12:50:46', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(35, '2025-02-09 12:51:59', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(36, '2025-02-09 13:02:21', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(37, '2025-02-09 13:03:53', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(38, '2025-02-09 13:05:44', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(39, '2025-02-09 13:06:57', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(40, '2025-02-09 13:08:04', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(41, '2025-02-09 13:09:43', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(42, '2025-02-09 13:11:55', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(43, '2025-02-09 13:18:48', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(44, '2025-02-09 17:32:01', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(45, '2025-02-09 17:35:32', 1, 'Chronopost', 9.9, 'Vincent de Rosny<br/>16 rue de l\'abbé Groult<br/>75015 Paris<br/>FR<br/>0606060606', 11, NULL),
(46, '2025-02-09 17:42:56', 1, 'Chronopost', 9.9, 'Vincent de Rosny<br/>16 rue de l\'abbé Groult<br/>75015 Paris<br/>FR<br/>0606060606', 11, NULL),
(47, '2025-02-09 18:01:33', 1, 'Chronopost', 9.9, 'Vincent de Rosny<br/>16 rue de l\'abbé Groult<br/>75015 Paris<br/>FR<br/>0606060606', 11, NULL),
(48, '2025-02-09 18:03:49', 1, 'Chronopost', 9.9, 'Vincent de Rosny<br/>16 rue de l\'abbé Groult<br/>75015 Paris<br/>FR<br/>0606060606', 11, NULL),
(49, '2025-02-09 18:09:44', 1, 'Chronopost', 9.9, 'Vincent de Rosny<br/>16 rue de l\'abbé Groult<br/>75015 Paris<br/>FR<br/>0606060606', 11, NULL),
(50, '2025-02-09 18:12:18', 1, 'Chronopost', 9.9, 'Vincent de Rosny<br/>16 rue de l\'abbé Groult<br/>75015 Paris<br/>FR<br/>0606060606', 11, NULL),
(51, '2025-02-09 18:12:53', 1, 'Chronopost', 9.9, 'Vincent de Rosny<br/>16 rue de l\'abbé Groult<br/>75015 Paris<br/>FR<br/>0606060606', 11, NULL),
(52, '2025-02-09 18:16:03', 1, 'Chronopost', 9.9, 'Vincent de Rosny<br/>16 rue de l\'abbé Groult<br/>75015 Paris<br/>FR<br/>0606060606', 11, NULL),
(53, '2025-02-09 19:24:34', 1, 'Colissimo', 4.9, 'Vincent de Rosny<br/>16 rue de l\'abbé Groult<br/>75015 Paris<br/>FR<br/>0606060606', 11, NULL),
(54, '2025-02-09 19:25:43', 1, 'Colissimo', 4.9, 'Vincent de Rosny<br/>16 rue de l\'abbé Groult<br/>75015 Paris<br/>FR<br/>0606060606', 11, NULL),
(55, '2025-02-10 06:46:52', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, NULL),
(56, '2025-02-10 07:17:19', 1, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, 'cs_test_b1wtyLHWW4hKBnkyi4LS6yNTerwZvgRXueB86OutFY5yJXqgcoYTFcm6qm'),
(57, '2025-02-11 04:30:16', 2, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, 'cs_test_b1eZtheRhIRhOXqjYUXRwkU08gcuSM08ouxLrTaqlARRzCwyeBzFhy24pR'),
(58, '2025-02-11 04:46:10', 2, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, 'cs_test_b1JLyyRx8DrtXF1PEq4eXtlacuOzt6iJk9OwoZAEurV7B8cU1dVW7niC02'),
(59, '2025-02-11 05:34:51', 2, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, 'cs_test_b1IqlzvFDOhEzpvj8gORFddMuGzMYZpnNecwWCP5uK7LRKsLYkEqELh6bL'),
(60, '2025-02-11 05:38:58', 2, 'Colissimo', 4.9, 'nicolas macarez<br/>rue<br/>75015 Paris<br/>FR<br/>222222222222222222', 10, 'cs_test_b16g8Gd3RjfUnwikaY0BdBVrZfyCE5ogMMUc64G9Jwv41B0wnzJ3ywvFTA');

-- --------------------------------------------------------

--
-- Structure de la table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `my_order_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `product_tva` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_detail`
--

INSERT INTO `order_detail` (`id`, `my_order_id`, `product_name`, `product_illustration`, `product_quantity`, `product_price`, `product_tva`) VALUES
(7, 4, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(8, 4, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(9, 5, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(10, 5, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(11, 6, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(12, 6, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(13, 7, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(14, 7, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(15, 8, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(16, 8, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(17, 9, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(18, 9, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(19, 10, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(20, 10, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(21, 11, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(22, 11, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(23, 12, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(24, 12, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(25, 13, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(26, 13, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(27, 14, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(28, 14, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(29, 15, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(30, 15, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(31, 16, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(32, 16, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(33, 17, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(34, 17, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(35, 18, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(36, 18, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(37, 18, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(38, 19, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(39, 19, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(40, 19, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(41, 20, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(42, 20, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(43, 20, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(44, 21, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(45, 21, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(46, 22, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(47, 22, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(48, 23, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(49, 23, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(50, 24, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(51, 24, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(52, 25, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(53, 25, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(54, 26, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(55, 26, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(56, 26, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(57, 27, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(58, 27, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(59, 27, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(60, 28, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(61, 28, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(62, 28, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(63, 29, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(64, 29, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(65, 29, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(66, 30, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(67, 30, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(68, 30, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(69, 31, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(70, 31, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(71, 31, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(72, 32, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(73, 32, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(74, 32, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(75, 33, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(76, 33, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(77, 33, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(78, 34, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(79, 34, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(80, 34, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(81, 35, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(82, 35, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(83, 35, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(84, 36, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(85, 36, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(86, 36, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(87, 37, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(88, 37, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(89, 37, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(90, 38, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(91, 38, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(92, 38, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(93, 39, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(94, 39, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(95, 39, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(96, 40, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(97, 40, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(98, 40, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(99, 41, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(100, 41, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(101, 41, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(102, 42, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(103, 42, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(104, 42, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(105, 43, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(106, 43, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(107, 43, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(108, 44, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(109, 44, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(110, 44, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(111, 45, 'sac2', 'sac2.jpg', 3, 15, 5.5),
(112, 45, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(113, 46, 'sac2', 'sac2.jpg', 3, 15, 5.5),
(114, 46, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(115, 47, 'sac2', 'sac2.jpg', 3, 15, 5.5),
(116, 47, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(117, 48, 'sac2', 'sac2.jpg', 3, 15, 5.5),
(118, 48, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(119, 49, 'sac2', 'sac2.jpg', 3, 15, 5.5),
(120, 49, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(121, 50, 'sac2', 'sac2.jpg', 3, 15, 5.5),
(122, 50, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(123, 51, 'sac2', 'sac2.jpg', 3, 15, 5.5),
(124, 51, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(125, 52, 'sac2', 'sac2.jpg', 3, 15, 5.5),
(126, 52, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(127, 53, 'sac2', 'sac2.jpg', 3, 15, 5.5),
(128, 53, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(129, 54, 'sac2', 'sac2.jpg', 3, 15, 5.5),
(130, 54, 'sac numéro quatre', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 1, 30, 20),
(131, 55, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(132, 55, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(133, 56, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(134, 56, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(135, 57, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(136, 57, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(137, 58, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(138, 58, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(139, 59, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(140, 59, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20),
(141, 60, 'sac2', 'sac2.jpg', 1, 15, 5.5),
(142, 60, 'Sac numéro 3', 'sac3.jpg', 1, 50, 20);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `tva` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `description`, `illustration`, `price`, `tva`) VALUES
(2, 1, 'sac2', 'sac2', '<div>sac2 jkjkjkjk</div>', 'sac2.jpg', 15, 5.5),
(3, 1, 'Sac numéro 3', 'sac-numero-3', '<div>Sac numéro 3</div>', 'sac3.jpg', 50, 20),
(4, 1, 'sac numéro quatre', 'sac-numero-quatre', '<div>sac numéro quatre</div>', '2025-01-08-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 30, 20);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(1, 'jj@hh.fr', '[]', 'jj', 'jj', 'jj'),
(4, 'macarez2@hotmail.com', '[]', '123456789', 'Nicolas', 'Macarez'),
(5, 'toto@mail.fr', '[]', '$2y$13$9uHsv/evtE7Ezulz5rqAA.LTMLx8NxXnZEqRofQT5xfhTslKRAJT2', 'John', 'Doe'),
(6, 'emailok@mail.com', '[]', '$2y$13$MJlVaRlLSZqjXkir6To8sO0pAS8H0Deok0OA6YeD/AZB.IJuqoia2', 'John', 'Doe'),
(7, 'emailok2@mail.fr', '[]', '$2y$13$q5SKZwIqoKuDWTL3nBQ7surgPp4HB7GgPCqkILK0iDC2NmyWf08jW', 'John', 'Doe'),
(8, 'emailok3@mail.fr', '[]', '$2y$13$dsgHnuBrjUT0FSEJ1pw3SuOND5CurOGXdjoSp.6ot5liPr8Plq2RK', 'John', 'Doe'),
(9, 'emailok4@mail.fr', '[]', '$2y$13$5.7nFKTE.ZpFVigqCZoqROtlc5M2y6N2pRyvqiSmvwNjavMrW3du.', 'John', 'Doe'),
(10, 'macarez1@hotmail.com', '[]', '$2y$13$5.R5jWKUWkMIKLg94.GxQ.roGbpWEE6SR4B95Vbd/VF7sPk3ETYJi', 'Nicolas', 'Macarez'),
(11, 'vderosny@gmail.com', '[]', '$2y$13$6QyZeYC1Jh6b8sfMHYEjEeaTSB0SNFmBpAfDrXsIjfSEzChdCaade', 'Vicent', 'de Rosny'),
(13, 'macarez@hotmail.com', '[]', '$2y$13$BCdsu6q2QruXH3iEdS89jeDBSQwQNV9wTq5sImHr8M589l3ZbvyBK', 'Nicolas', 'Macarez');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D4E6F81A76ED395` (`user_id`);

--
-- Index pour la table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_ED896F46BFCDF877` (`my_order_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK_ED896F46BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
