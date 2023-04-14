CREATE DATABASE  IF NOT EXISTS `euro_fit_anne_sophie` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `euro_fit_anne_sophie`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: euro_fit_anne_sophie
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abonnements`
--

DROP TABLE IF EXISTS `abonnements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abonnements` (
  `id_abonnement` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL,
  `tarif` float DEFAULT NULL,
  `bilan_corporel_offert` tinyint(1) DEFAULT NULL,
  `duree` int DEFAULT NULL,
  `fk_id_connexions` int DEFAULT NULL,
  `fk_id_parrainage` int DEFAULT NULL,
  `fk_id_club` int DEFAULT NULL,
  `fk_id_finance` int DEFAULT NULL,
  PRIMARY KEY (`id_abonnement`),
  KEY `fk_id_connexions` (`fk_id_connexions`),
  KEY `fk_id_parrainage` (`fk_id_parrainage`),
  KEY `fk_id_finance` (`fk_id_finance`),
  KEY `fk_id_club` (`fk_id_club`),
  CONSTRAINT `fk_id_club` FOREIGN KEY (`fk_id_club`) REFERENCES `clubs` (`id_club`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_id_connexions` FOREIGN KEY (`fk_id_connexions`) REFERENCES `connexions` (`id_connexion`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_id_finance` FOREIGN KEY (`fk_id_finance`) REFERENCES `finances` (`id_finance`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_id_parrainage` FOREIGN KEY (`fk_id_parrainage`) REFERENCES `parrainages` (`id_parrainage`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonnements`
--

LOCK TABLES `abonnements` WRITE;
/*!40000 ALTER TABLE `abonnements` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonnements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `achats`
--

DROP TABLE IF EXISTS `achats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achats` (
  `id_achat` int NOT NULL AUTO_INCREMENT,
  `facture` varchar(50) DEFAULT NULL,
  `livraison` tinyint(1) DEFAULT NULL,
  `id_produits` int DEFAULT NULL,
  PRIMARY KEY (`id_achat`),
  KEY `id_produits` (`id_produits`),
  CONSTRAINT `id_produits` FOREIGN KEY (`id_produits`) REFERENCES `produits` (`id_produits`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achats`
--

LOCK TABLES `achats` WRITE;
/*!40000 ALTER TABLE `achats` DISABLE KEYS */;
/*!40000 ALTER TABLE `achats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrateurs`
--

DROP TABLE IF EXISTS `administrateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrateurs` (
  `id_administrateur` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `statut` varchar(50) DEFAULT NULL,
  `fk_id_connexion` int DEFAULT NULL,
  PRIMARY KEY (`id_administrateur`),
  KEY `fk_id_connexion` (`fk_id_connexion`),
  CONSTRAINT `fk_id_connexion` FOREIGN KEY (`fk_id_connexion`) REFERENCES `connexions` (`id_connexion`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrateurs`
--

LOCK TABLES `administrateurs` WRITE;
/*!40000 ALTER TABLE `administrateurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresses` (
  `id_adresse` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `id_code_postal` int DEFAULT NULL,
  PRIMARY KEY (`id_adresse`),
  KEY `id_code_postal` (`id_code_postal`),
  CONSTRAINT `id_code_postal` FOREIGN KEY (`id_code_postal`) REFERENCES `codes_postaux` (`id_code_postal`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresses`
--

LOCK TABLES `adresses` WRITE;
/*!40000 ALTER TABLE `adresses` DISABLE KEYS */;
INSERT INTO `adresses` VALUES (1,'30 Rue de la Fontaine',NULL),(2,'123 rue du Paradis',NULL),(3,'123 rue du Paradis',NULL),(4,'123 rue du Paradis',NULL),(5,'123 rue du Paradis',NULL),(6,'30 Rue de la Fontaine',1),(7,'Stadhouderskade 78,',1),(8,'42 Rue de Lattre de Tassigny,',1),(9,'Stadhouderskade 56,',2),(10,'Stadhouderskade 56,',2),(11,'42 Rue de Lattre de Tassigny,',1),(12,'Stadhouderskade 56',2),(13,'42 Rue de Lattre de Tassigny',1);
/*!40000 ALTER TABLE `adresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assurances`
--

DROP TABLE IF EXISTS `assurances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assurances` (
  `id_assurance` int NOT NULL AUTO_INCREMENT,
  `numero_de_contrat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_assurance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assurances`
--

LOCK TABLES `assurances` WRITE;
/*!40000 ALTER TABLE `assurances` DISABLE KEYS */;
/*!40000 ALTER TABLE `assurances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs` (
  `id_club` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `numero_de_telephone` varchar(30) DEFAULT NULL,
  `id_assurance` int DEFAULT NULL,
  `id_salle` int DEFAULT NULL,
  `id_donnee_sante` int DEFAULT NULL,
  `id_connexion` int DEFAULT NULL,
  PRIMARY KEY (`id_club`),
  KEY `id_assurance` (`id_assurance`),
  KEY `id_salle` (`id_salle`),
  KEY `id_donnee_sante` (`id_donnee_sante`),
  KEY `id_connexion` (`id_connexion`),
  CONSTRAINT `id_assurance` FOREIGN KEY (`id_assurance`) REFERENCES `assurances` (`id_assurance`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_connexion` FOREIGN KEY (`id_connexion`) REFERENCES `connexions` (`id_connexion`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_donnee_sante` FOREIGN KEY (`id_donnee_sante`) REFERENCES `donnees_sante` (`id_donnee_sante`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_salle` FOREIGN KEY (`id_salle`) REFERENCES `salles` (`id_salle`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'Nutella',NULL,NULL,NULL,NULL,NULL),(2,'Chocolat',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codes_postaux`
--

DROP TABLE IF EXISTS `codes_postaux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codes_postaux` (
  `id_code_postal` int NOT NULL AUTO_INCREMENT,
  `code_postal` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_code_postal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codes_postaux`
--

LOCK TABLES `codes_postaux` WRITE;
/*!40000 ALTER TABLE `codes_postaux` DISABLE KEYS */;
INSERT INTO `codes_postaux` VALUES (1,'85590'),(2,'1072 AE');
/*!40000 ALTER TABLE `codes_postaux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connexions`
--

DROP TABLE IF EXISTS `connexions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connexions` (
  `id_connexion` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `question_secrete` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_connexion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connexions`
--

LOCK TABLES `connexions` WRITE;
/*!40000 ALTER TABLE `connexions` DISABLE KEYS */;
/*!40000 ALTER TABLE `connexions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corbeille_membre`
--

DROP TABLE IF EXISTS `corbeille_membre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corbeille_membre` (
  `id_membre` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `genre` varchar(15) DEFAULT NULL,
  `date_de_naissance` date DEFAULT NULL,
  `bilan_corporel_effectue` tinyint(1) DEFAULT NULL,
  `numero_de_telephone` varchar(30) DEFAULT NULL,
  `fk_id_connection` int DEFAULT NULL,
  `fk_id_adresses` int DEFAULT NULL,
  `fk_id_abonnement` int DEFAULT NULL,
  `fk_id_donnee_medicale` int DEFAULT NULL,
  PRIMARY KEY (`id_membre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corbeille_membre`
--

LOCK TABLES `corbeille_membre` WRITE;
/*!40000 ALTER TABLE `corbeille_membre` DISABLE KEYS */;
INSERT INTO `corbeille_membre` VALUES (1,'coach','Clinton','Nicolas','musclefit@yahoo.com','homme','1995-04-20',1,'+336.42.06.97.55',NULL,1,NULL,7);
/*!40000 ALTER TABLE `corbeille_membre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donnees_medicales`
--

DROP TABLE IF EXISTS `donnees_medicales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donnees_medicales` (
  `id_donnee_medicale` int NOT NULL AUTO_INCREMENT,
  `date_certificat_medical` date DEFAULT NULL,
  `id_medecin` int DEFAULT NULL,
  PRIMARY KEY (`id_donnee_medicale`),
  KEY `fk_id_medecin` (`id_medecin`),
  CONSTRAINT `fk_id_medecin` FOREIGN KEY (`id_medecin`) REFERENCES `medecins` (`id_medecin`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donnees_medicales`
--

LOCK TABLES `donnees_medicales` WRITE;
/*!40000 ALTER TABLE `donnees_medicales` DISABLE KEYS */;
INSERT INTO `donnees_medicales` VALUES (7,'2022-11-25',3),(8,'2023-01-15',1),(9,'2022-10-21',2);
/*!40000 ALTER TABLE `donnees_medicales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donnees_sante`
--

DROP TABLE IF EXISTS `donnees_sante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donnees_sante` (
  `id_donnee_sante` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `id_machine` int DEFAULT NULL,
  PRIMARY KEY (`id_donnee_sante`),
  KEY `id_machine` (`id_machine`),
  CONSTRAINT `id_machine` FOREIGN KEY (`id_machine`) REFERENCES `machines` (`id_machines`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donnees_sante`
--

LOCK TABLES `donnees_sante` WRITE;
/*!40000 ALTER TABLE `donnees_sante` DISABLE KEYS */;
/*!40000 ALTER TABLE `donnees_sante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etablissements_bancaires`
--

DROP TABLE IF EXISTS `etablissements_bancaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etablissements_bancaires` (
  `id_etablissement` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_etablissement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etablissements_bancaires`
--

LOCK TABLES `etablissements_bancaires` WRITE;
/*!40000 ALTER TABLE `etablissements_bancaires` DISABLE KEYS */;
/*!40000 ALTER TABLE `etablissements_bancaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finances`
--

DROP TABLE IF EXISTS `finances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finances` (
  `id_finance` int NOT NULL AUTO_INCREMENT,
  `rib` varchar(50) DEFAULT NULL,
  `cotisation_a_jour` tinyint(1) DEFAULT NULL,
  `id_etablissement` int DEFAULT NULL,
  PRIMARY KEY (`id_finance`),
  KEY `id_etablissement` (`id_etablissement`),
  CONSTRAINT `id_etablissement` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissements_bancaires` (`id_etablissement`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finances`
--

LOCK TABLES `finances` WRITE;
/*!40000 ALTER TABLE `finances` DISABLE KEYS */;
/*!40000 ALTER TABLE `finances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fournisseurs` (
  `id_fournisseur` int NOT NULL AUTO_INCREMENT,
  `facture` varchar(50) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `id_produit` int DEFAULT NULL,
  `id_adresse` int DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur`),
  KEY `id_produit` (`id_produit`),
  KEY `id_adresse` (`id_adresse`),
  CONSTRAINT `id_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresses` (`id_adresse`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produits`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseurs`
--

LOCK TABLES `fournisseurs` WRITE;
/*!40000 ALTER TABLE `fournisseurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `fournisseurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machines`
--

DROP TABLE IF EXISTS `machines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machines` (
  `id_machines` int NOT NULL AUTO_INCREMENT,
  `date_badge_debut` date DEFAULT NULL,
  `date_badge_fin` date DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_machines`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machines`
--

LOCK TABLES `machines` WRITE;
/*!40000 ALTER TABLE `machines` DISABLE KEYS */;
/*!40000 ALTER TABLE `machines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magasins`
--

DROP TABLE IF EXISTS `magasins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magasins` (
  `id_magasin` int NOT NULL AUTO_INCREMENT,
  `numero_de_telephone` varchar(30) DEFAULT NULL,
  `livraison` tinyint(1) DEFAULT NULL,
  `id_achat` int DEFAULT NULL,
  `id_adresse` int DEFAULT NULL,
  PRIMARY KEY (`id_magasin`),
  KEY `id_achat` (`id_achat`),
  KEY `fk_id_adresse` (`id_adresse`),
  CONSTRAINT `fk_id_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresses` (`id_adresse`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `id_achat` FOREIGN KEY (`id_achat`) REFERENCES `achats` (`id_achat`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magasins`
--

LOCK TABLES `magasins` WRITE;
/*!40000 ALTER TABLE `magasins` DISABLE KEYS */;
/*!40000 ALTER TABLE `magasins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medecins`
--

DROP TABLE IF EXISTS `medecins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medecins` (
  `id_medecin` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_medecin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medecins`
--

LOCK TABLES `medecins` WRITE;
/*!40000 ALTER TABLE `medecins` DISABLE KEYS */;
INSERT INTO `medecins` VALUES (1,'Martinez','Sacha','Doctor 2'),(2,'Jonas Busch','Karim','Doctor 3'),(3,'Dugan','Agatha','Doctor 1');
/*!40000 ALTER TABLE `medecins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `medical`
--

DROP TABLE IF EXISTS `medical`;
/*!50001 DROP VIEW IF EXISTS `medical`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `medical` AS SELECT 
 1 AS `libelle`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `membre_medical`
--

DROP TABLE IF EXISTS `membre_medical`;
/*!50001 DROP VIEW IF EXISTS `membre_medical`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `membre_medical` AS SELECT 
 1 AS `nom`,
 1 AS `prenom`,
 1 AS `date_certificat_medical`,
 1 AS `libelle`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `membres`
--

DROP TABLE IF EXISTS `membres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membres` (
  `id_membre` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `genre` varchar(15) DEFAULT NULL,
  `date_de_naissance` date DEFAULT NULL,
  `bilan_corporel_effectue` tinyint(1) DEFAULT NULL,
  `numero_de_telephone` varchar(30) DEFAULT NULL,
  `fk_id_connection` int DEFAULT NULL,
  `fk_id_adresses` int DEFAULT NULL,
  `fk_id_abonnement` int DEFAULT NULL,
  `fk_id_donnee_medicale` int DEFAULT NULL,
  PRIMARY KEY (`id_membre`),
  KEY `fk_id_connection` (`fk_id_connection`),
  KEY `fk_id_adresses` (`fk_id_adresses`),
  KEY `fk_id_abonnement` (`fk_id_abonnement`),
  KEY `fk_id_donnee_medicale` (`fk_id_donnee_medicale`),
  CONSTRAINT `fk_id_abonnement` FOREIGN KEY (`fk_id_abonnement`) REFERENCES `abonnements` (`id_abonnement`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_id_adresses` FOREIGN KEY (`fk_id_adresses`) REFERENCES `adresses` (`id_adresse`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_id_connection` FOREIGN KEY (`fk_id_connection`) REFERENCES `connexions` (`id_connexion`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_id_donnee_medicale` FOREIGN KEY (`fk_id_donnee_medicale`) REFERENCES `donnees_medicales` (`id_donnee_medicale`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membres`
--

LOCK TABLES `membres` WRITE;
/*!40000 ALTER TABLE `membres` DISABLE KEYS */;
INSERT INTO `membres` VALUES (2,'premium international','Bellic','Lamar','imporage@gmail.com','homme','1978-04-19',1,'+45.11.52.75.63',NULL,12,NULL,8),(3,'VIP','Jakowski','Franklin','frajaski@aol.com','inconnu','1970-04-10',0,'+336.35.48.75.65',NULL,13,NULL,9),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `membres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parrainages`
--

DROP TABLE IF EXISTS `parrainages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parrainages` (
  `id_parrainage` int NOT NULL AUTO_INCREMENT,
  `parrain` varchar(50) DEFAULT NULL,
  `filleule` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_parrainage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parrainages`
--

LOCK TABLES `parrainages` WRITE;
/*!40000 ALTER TABLE `parrainages` DISABLE KEYS */;
/*!40000 ALTER TABLE `parrainages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pays` (
  `id_pays` int NOT NULL AUTO_INCREMENT,
  `pays` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pays`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES (1,'Pays Bas'),(2,'France');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produits` (
  `id_produits` int NOT NULL AUTO_INCREMENT,
  `prix` float DEFAULT NULL,
  PRIMARY KEY (`id_produits`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salles`
--

DROP TABLE IF EXISTS `salles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salles` (
  `id_salle` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL,
  `id_machines` int DEFAULT NULL,
  PRIMARY KEY (`id_salle`),
  KEY `id_machines` (`id_machines`),
  CONSTRAINT `id_machines` FOREIGN KEY (`id_machines`) REFERENCES `machines` (`id_machines`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salles`
--

LOCK TABLES `salles` WRITE;
/*!40000 ALTER TABLE `salles` DISABLE KEYS */;
/*!40000 ALTER TABLE `salles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villes`
--

DROP TABLE IF EXISTS `villes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `villes` (
  `id_ville` int NOT NULL AUTO_INCREMENT,
  `ville` varchar(30) DEFAULT NULL,
  `id_code_postal` int DEFAULT NULL,
  `id_pays` int DEFAULT NULL,
  PRIMARY KEY (`id_ville`),
  KEY `fk_id_code_postal` (`id_code_postal`),
  KEY `fk_id_pays` (`id_pays`),
  CONSTRAINT `fk_id_code_postal` FOREIGN KEY (`id_code_postal`) REFERENCES `codes_postaux` (`id_code_postal`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_id_pays` FOREIGN KEY (`id_pays`) REFERENCES `pays` (`id_pays`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villes`
--

LOCK TABLES `villes` WRITE;
/*!40000 ALTER TABLE `villes` DISABLE KEYS */;
INSERT INTO `villes` VALUES (1,'les epesses',1,2),(2,'Saint-Mars-la-Réorthe',1,2),(3,'amsterdam',2,1);
/*!40000 ALTER TABLE `villes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `medical`
--

/*!50001 DROP VIEW IF EXISTS `medical`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `medical` AS select `medecins`.`libelle` AS `libelle` from `medecins` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `membre_medical`
--

/*!50001 DROP VIEW IF EXISTS `membre_medical`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `membre_medical` AS select `membres`.`nom` AS `nom`,`membres`.`prenom` AS `prenom`,`donnees_medicales`.`date_certificat_medical` AS `date_certificat_medical`,`medecins`.`libelle` AS `libelle` from ((`membres` join `donnees_medicales` on((`donnees_medicales`.`id_donnee_medicale` = `membres`.`fk_id_donnee_medicale`))) join `medecins` on((`donnees_medicales`.`id_medecin` = `donnees_medicales`.`id_medecin`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 12:24:52
