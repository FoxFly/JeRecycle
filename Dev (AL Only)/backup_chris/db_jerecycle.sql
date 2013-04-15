-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le: Ven 01 Mars 2013 à 17:46
-- Version du serveur: 5.5.27-log
-- Version de PHP: 5.4.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `db_jerecycle`
--

-- --------------------------------------------------------

--
-- Structure de la table `announcement`
--

CREATE TABLE IF NOT EXISTS `announcement` (
  `idAnnouncement` int(11) NOT NULL AUTO_INCREMENT,
  `priceAnnoucement` int(11) NOT NULL,
  `refIdProduct` int(11) NOT NULL,
  `statutAnnoucement` int(11) NOT NULL,
  `commentAnnoucement` text,
  PRIMARY KEY (`idAnnouncement`),
  KEY `fk_product` (`refIdProduct`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `announcement`
--

INSERT INTO `announcement` (`idAnnouncement`, `priceAnnoucement`, `refIdProduct`, `statutAnnoucement`, `commentAnnoucement`) VALUES
(6, 900, 18, 1, ''),
(7, 500, 19, 1, 'Bonjour\r\n\r\nje vends un galaxy s2 blanc 16go bloquer sfr très propres toujours protéger dans sa housse. il est vendu dans sa boite d''origine avec tous les accessoires.\r\n\r\nContactez moi'),
(8, 2400, 20, 1, ''),
(9, 850, 21, 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
  `idBrand` int(11) NOT NULL AUTO_INCREMENT,
  `libBrand` varchar(50) NOT NULL,
  PRIMARY KEY (`idBrand`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Contenu de la table `brand`
--

INSERT INTO `brand` (`idBrand`, `libBrand`) VALUES
(1, 'Apple'),
(2, 'Samsung'),
(3, 'HTC'),
(4, 'Nokia'),
(5, 'Motorolla'),
(6, 'Hewlett Packard'),
(7, 'Dell'),
(8, 'Lenovo'),
(9, 'Asus'),
(10, 'Acer'),
(11, 'Android'),
(12, 'Google'),
(13, 'Windows'),
(14, 'Linux'),
(15, 'Blackberry'),
(16, 'Essentiel B'),
(17, 'Packard Bell'),
(18, 'Toshiba'),
(19, 'Sony'),
(20, 'MSI'),
(21, 'Alcatel'),
(22, 'Fujitsu'),
(23, 'LDLC'),
(24, 'Archos'),
(25, 'Logicom'),
(26, 'Fnac'),
(27, 'Memup');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `libCategory` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`idCategory`, `libCategory`) VALUES
(1, 'Ordinateur portable'),
(2, 'smartphone'),
(3, 'tablette'),
(4, 'Ordinateur de bureau'),
(5, 'Ordinateur de type tour'),
(6, 'Ordinateur monobloc'),
(7, 'Ordinateur de poche');

-- --------------------------------------------------------

--
-- Structure de la table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `idGroup` int(11) NOT NULL AUTO_INCREMENT,
  `libGroup` varchar(50) NOT NULL,
  PRIMARY KEY (`idGroup`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `group`
--

INSERT INTO `group` (`idGroup`, `libGroup`) VALUES
(1, 'particulier'),
(2, 'entrepreneur'),
(3, 'administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `model`
--

CREATE TABLE IF NOT EXISTS `model` (
  `idModel` int(11) NOT NULL AUTO_INCREMENT,
  `refIdBrand` int(11) NOT NULL,
  `refIdCategory` int(11) NOT NULL,
  `libModel` varchar(50) NOT NULL,
  PRIMARY KEY (`idModel`),
  KEY `fk_category` (`refIdCategory`),
  KEY `fk_brand` (`refIdBrand`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `model`
--

INSERT INTO `model` (`idModel`, `refIdBrand`, `refIdCategory`, `libModel`) VALUES
(1, 1, 2, 'iPhone 4'),
(2, 2, 2, 'Galaxy S3'),
(3, 3, 2, 'Sensation'),
(4, 1, 1, 'iMac'),
(5, 7, 1, 'AlienWare');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `idProduct` int(11) NOT NULL AUTO_INCREMENT,
  `stateProduct` varchar(15) NOT NULL,
  `colorProduct` varchar(15) NOT NULL,
  `refIdModel` int(11) NOT NULL,
  `refIdUser` int(11) NOT NULL,
  PRIMARY KEY (`idProduct`),
  KEY `fk_model` (`refIdModel`),
  KEY `refIdUser` (`refIdUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `product`
--

INSERT INTO `product` (`idProduct`, `stateProduct`, `colorProduct`, `refIdModel`, `refIdUser`) VALUES
(1, 'Neuf', 'noir', 1, 1),
(11, 'Neuf', 'noir', 1, 1),
(16, 'Occasion', 'orange', 1, 1),
(17, 'Neuf', 'vert', 1, 1),
(18, 'Neuf', 'vert', 1, 1),
(19, 'Neuf', 'Blanc', 2, 1),
(20, 'Neuf', 'Noir', 5, 1),
(21, 'Neuf', 'blanc', 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `serviceprovider`
--

CREATE TABLE IF NOT EXISTS `serviceprovider` (
  `idServiceProvider` int(11) NOT NULL AUTO_INCREMENT,
  `nameServiceProvider` varchar(50) NOT NULL,
  `addressServiceProvider` varchar(100) NOT NULL,
  `postCodeServiceProvider` varchar(5) NOT NULL,
  `repairer` int(11) NOT NULL,
  `recycler` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`idServiceProvider`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `serviceprovider`
--

INSERT INTO `serviceprovider` (`idServiceProvider`, `nameServiceProvider`, `addressServiceProvider`, `postCodeServiceProvider`, `repairer`, `recycler`, `latitude`, `longitude`) VALUES
(2, 'Agence Orange', '58, rue Lecourbe', '75015', 1, 0, 48.8439244, 2.3067511),
(3, 'Syctom', '35, boulevard de Sébastopol', '75001', 0, 1, 48.8605674, 2.3493238);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `lastNameUser` varchar(50) NOT NULL,
  `firstNameUser` varchar(50) NOT NULL,
  `addressUser` varchar(100) NOT NULL,
  `postCodeUser` varchar(5) NOT NULL,
  `mailUser` varchar(100) NOT NULL,
  `numberUser` varchar(10) DEFAULT NULL,
  `pwdUser` varchar(50) NOT NULL,
  `statutUser` int(11) NOT NULL,
  `refIdGroup` int(11) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `mailUser` (`mailUser`),
  KEY `refIdGroup` (`refIdGroup`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`idUser`, `lastNameUser`, `firstNameUser`, `addressUser`, `postCodeUser`, `mailUser`, `numberUser`, `pwdUser`, `statutUser`, `refIdGroup`) VALUES
(1, 'Barreto', 'Christophe', '26, rue de la papeterie', '91610', 'barreto.christophe@gmail.com', '0671361731', '098f6bcd4621d373cade4e832627b4f6', 1, 3);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`refIdProduct`) REFERENCES `product` (`idProduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`refIdCategory`) REFERENCES `category` (`idCategory`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `model_ibfk_2` FOREIGN KEY (`refIdBrand`) REFERENCES `brand` (`idBrand`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`refIdModel`) REFERENCES `model` (`idModel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`refIdUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`refIdGroup`) REFERENCES `group` (`idGroup`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
