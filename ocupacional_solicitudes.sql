-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para ocupacional_solicitudes
CREATE DATABASE IF NOT EXISTS `ocupacional_solicitudes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `ocupacional_solicitudes`;

-- Volcando estructura para tabla ocupacional_solicitudes.baterias
CREATE TABLE IF NOT EXISTS `baterias` (
  `id_baterias` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_baterias` varchar(50) NOT NULL,
  `precio_base` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_baterias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla ocupacional_solicitudes.baterias: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ocupacional_solicitudes.bateria_examenes
CREATE TABLE IF NOT EXISTS `bateria_examenes` (
  `id_bateria_examenes` int(11) NOT NULL AUTO_INCREMENT,
  `id_baterias` int(11) NOT NULL,
  `id_examenes` int(11) NOT NULL,
  PRIMARY KEY (`id_bateria_examenes`),
  KEY `FK__baterias` (`id_baterias`),
  KEY `FK__examenes` (`id_examenes`),
  CONSTRAINT `FK__baterias` FOREIGN KEY (`id_baterias`) REFERENCES `baterias` (`id_baterias`),
  CONSTRAINT `FK__examenes` FOREIGN KEY (`id_examenes`) REFERENCES `examenes` (`id_examenes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla ocupacional_solicitudes.bateria_examenes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ocupacional_solicitudes.empresa_data
CREATE TABLE IF NOT EXISTS `empresa_data` (
  `id_empresa_data` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(150) NOT NULL,
  `rut_empresa` varchar(10) NOT NULL,
  `telefono_empresa` varchar(9) NOT NULL,
  PRIMARY KEY (`id_empresa_data`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla ocupacional_solicitudes.empresa_data: ~0 rows (aproximadamente)
INSERT INTO `empresa_data` (`id_empresa_data`, `nombre_empresa`, `rut_empresa`, `telefono_empresa`) VALUES
	(1, 'IGMA DESIGN', '72342212-5', '987643273');

-- Volcando estructura para tabla ocupacional_solicitudes.examenes
CREATE TABLE IF NOT EXISTS `examenes` (
  `id_examenes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_examenes` varchar(150) NOT NULL,
  PRIMARY KEY (`id_examenes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla ocupacional_solicitudes.examenes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ocupacional_solicitudes.horarios
CREATE TABLE IF NOT EXISTS `horarios` (
  `id_horarios` int(11) NOT NULL AUTO_INCREMENT,
  `horas_agenda` time NOT NULL,
  `limite` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_horarios`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla ocupacional_solicitudes.horarios: ~4 rows (aproximadamente)
INSERT INTO `horarios` (`id_horarios`, `horas_agenda`, `limite`) VALUES
	(1, '08:20:00', 2),
	(2, '08:40:00', 2),
	(3, '09:00:00', 2),
	(4, '09:20:00', 2),
	(5, '09:40:00', 2);

-- Volcando estructura para tabla ocupacional_solicitudes.postulantes
CREATE TABLE IF NOT EXISTS `postulantes` (
  `id_postulantes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_postulante` varchar(50) NOT NULL,
  `rut_postulante` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono_postulante` varchar(50) NOT NULL,
  `cargo_postulante` varchar(50) NOT NULL,
  `licencia_conducir` varchar(50) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_postulantes`),
  KEY `FK_postulantes_empresa_data` (`id_empresa`),
  CONSTRAINT `FK_postulantes_empresa_data` FOREIGN KEY (`id_empresa`) REFERENCES `empresa_data` (`id_empresa_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla ocupacional_solicitudes.postulantes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ocupacional_solicitudes.solicitantes
CREATE TABLE IF NOT EXISTS `solicitantes` (
  `id_solicitantes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_solicitante` varchar(150) NOT NULL,
  `correo_solicitante` varchar(255) NOT NULL,
  `password_solicitante` varchar(255) NOT NULL,
  `empresa_solicitante` int(11) NOT NULL,
  PRIMARY KEY (`id_solicitantes`),
  UNIQUE KEY `Índice 3` (`correo_solicitante`),
  KEY `FK_solicitantes_empresa_data` (`empresa_solicitante`),
  CONSTRAINT `FK_solicitantes_empresa_data` FOREIGN KEY (`empresa_solicitante`) REFERENCES `empresa_data` (`id_empresa_data`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla ocupacional_solicitudes.solicitantes: ~0 rows (aproximadamente)
INSERT INTO `solicitantes` (`id_solicitantes`, `nombre_solicitante`, `correo_solicitante`, `password_solicitante`, `empresa_solicitante`) VALUES
	(1, 'JOEL ESPINOZA', 'e.nejo@outlook.com', 'passIgma', 1);

-- Volcando estructura para tabla ocupacional_solicitudes.solicitudes
CREATE TABLE IF NOT EXISTS `solicitudes` (
  `id_solicitudes` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_solicitud` int(11) NOT NULL,
  `id_postulantes` int(11) NOT NULL,
  `id_baterias` int(11) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `hora_solicitud` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_solicitudes`),
  KEY `FK_solicitudes_tipo_solicitud` (`id_tipo_solicitud`),
  KEY `FK_solicitudes_postulantes` (`id_postulantes`),
  KEY `FK_solicitudes_baterias` (`id_baterias`),
  KEY `FK_solicitudes_horarios` (`hora_solicitud`),
  CONSTRAINT `FK_solicitudes_baterias` FOREIGN KEY (`id_baterias`) REFERENCES `baterias` (`id_baterias`),
  CONSTRAINT `FK_solicitudes_horarios` FOREIGN KEY (`hora_solicitud`) REFERENCES `horarios` (`id_horarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_solicitudes_postulantes` FOREIGN KEY (`id_postulantes`) REFERENCES `postulantes` (`id_postulantes`),
  CONSTRAINT `FK_solicitudes_tipo_solicitud` FOREIGN KEY (`id_tipo_solicitud`) REFERENCES `tipo_solicitud` (`id_tipo_solicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla ocupacional_solicitudes.solicitudes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla ocupacional_solicitudes.tipo_solicitud
CREATE TABLE IF NOT EXISTS `tipo_solicitud` (
  `id_tipo_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `name_tipo` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tipo_solicitud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla ocupacional_solicitudes.tipo_solicitud: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
