-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Client: 127.0.0.1
-- Généré le: Jeu 28 Février 2013 à 11:16
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
  `refIdProduct` int(11) NOT NULL,
  `refIdUser` int(11) NOT NULL,
  `statutAnnoucement` int(11) NOT NULL,
  PRIMARY KEY (`idAnnouncement`),
  KEY `refIdProduct` (`refIdProduct`,`refIdUser`),
  KEY `refIdUser` (`refIdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
  `idBrand` int(11) NOT NULL AUTO_INCREMENT,
  `libBrand` varchar(50) NOT NULL,
  PRIMARY KEY (`idBrand`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
-- Structure de la table `model`
--

CREATE TABLE IF NOT EXISTS `model` (
  `idModel` int(11) NOT NULL AUTO_INCREMENT,
  `refIdBrand` int(11) NOT NULL,
  `libModel` varchar(50) NOT NULL,
  PRIMARY KEY (`idModel`),
  KEY `refIdMarque` (`refIdMarque`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `idProduct` int(11) NOT NULL AUTO_INCREMENT,
  `refIdCategory` int(11) NOT NULL,
  `refIdBrand` int(11) NOT NULL,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`idServiceProvider`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `pwdUser` varchar(10) NOT NULL,
  `statutUser` int(11) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `mailUser` (`mailUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`refIdUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `announcement_ibfk_2` FOREIGN KEY (`refIdProduct`) REFERENCES `product` (`idProduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`refIdMarque`) REFERENCES `brand` (`idBrand`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`refIdCategory`) REFERENCES `category` (`idCategory`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`refIdBrand`) REFERENCES `brand` (`idBrand`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
