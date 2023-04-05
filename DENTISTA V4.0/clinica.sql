-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para clinica
CREATE DATABASE IF NOT EXISTS `clinica` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `clinica`;

-- Volcando estructura para tabla clinica.cita
CREATE TABLE IF NOT EXISTS `cita` (
  `idcita` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_` varchar(45) NOT NULL,
  `otro_` varchar(45) DEFAULT NULL,
  `estatus` enum('activo','inactivo') NOT NULL,
  `servicio_idservicio` int(11) NOT NULL,
  `horario_idhorario` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idcita`,`servicio_idservicio`,`horario_idhorario`),
  KEY `fk_cita_servicio_idx` (`servicio_idservicio`),
  KEY `fk_cita_horario1_idx` (`horario_idhorario`),
  CONSTRAINT `fk_cita_horario1` FOREIGN KEY (`horario_idhorario`) REFERENCES `horario` (`idhorario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cita_servicio` FOREIGN KEY (`servicio_idservicio`) REFERENCES `servicio` (`idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica.cita: ~0 rows (aproximadamente)
INSERT INTO `cita` (`idcita`, `descripcion_`, `otro_`, `estatus`, `servicio_idservicio`, `horario_idhorario`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Mal aliento', NULL, 'activo', 1, 1, NULL, NULL, NULL),
	(2, 'Me faltan 3 dientes', NULL, 'activo', 2, 5, NULL, NULL, NULL),
	(3, 'Olor de boca feo', NULL, 'activo', 1, 4, NULL, NULL, NULL);

-- Volcando estructura para tabla clinica.horario
CREATE TABLE IF NOT EXISTS `horario` (
  `idhorario` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora_inicio` varchar(15) NOT NULL,
  `hora_fin` varchar(15) NOT NULL,
  `estatus` enum('activo','inactivo') NOT NULL,
  `horario` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idhorario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica.horario: ~6 rows (aproximadamente)
INSERT INTO `horario` (`idhorario`, `fecha`, `hora_inicio`, `hora_fin`, `estatus`, `horario`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, NULL, '08:00 am', '09:00 am', 'activo', NULL, NULL, NULL, NULL),
	(2, NULL, '09:00 am', '10:00 am', 'activo', NULL, NULL, NULL, NULL),
	(3, NULL, '10:00 am', '11:00 am', 'activo', NULL, NULL, NULL, NULL),
	(4, NULL, '11:00 am', '12:00 pm', 'activo', NULL, NULL, NULL, NULL),
	(5, NULL, '12:00 pm', '01:00 pm', 'activo', NULL, NULL, NULL, NULL),
	(6, NULL, '01:00 pm', '02:00 pm', 'activo', NULL, NULL, NULL, NULL);

-- Volcando estructura para tabla clinica.servicio
CREATE TABLE IF NOT EXISTS `servicio` (
  `idservicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `costo` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idservicio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica.servicio: ~2 rows (aproximadamente)
INSERT INTO `servicio` (`idservicio`, `nombre_`, `descripcion`, `costo`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Limpieza', 'Limpieza bucal para prevencion de caries', 500, NULL, NULL, NULL),
	(2, 'Corona', 'Remplazo de dientes', 1200, NULL, NULL, NULL);

-- Volcando estructura para tabla clinica.users
CREATE TABLE IF NOT EXISTS `users` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `celular` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `estatus` enum('0','1') DEFAULT NULL,
  `rol` enum('1','2','3') DEFAULT NULL,
  `terminos` enum('0','1') DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idusers`,`usuario_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `celular_UNIQUE` (`celular`),
  KEY `fk_users_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_users_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica.users: ~0 rows (aproximadamente)
INSERT INTO `users` (`idusers`, `email`, `celular`, `password`, `estatus`, `rol`, `terminos`, `usuario_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'daniel@gmail.com', '9191061467', 'danipro6000', NULL, NULL, NULL, 1, NULL, NULL, NULL);

-- Volcando estructura para tabla clinica.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_` varchar(100) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `genero` enum('Hombre','Mujer') NOT NULL,
  `sangre` enum('A+','B+','AB+','O+','A-','B-','AB-','O-') NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `rfc` varchar(45) NOT NULL,
  `curp` varchar(45) NOT NULL,
  `padecimiento` varchar(255) DEFAULT NULL,
  `estado` enum('Agualientes','Baja California','Baja California Sur','Campeche','Chiapas','Chihuahua','Coahuila','Colima','Cuidad de Mexico','Durango','Estado de Mexico','Guanajuato','Guerreo','Hidalgo','Jalisco','Michoacan','Morelos','Nayarit','Nuevo Leon','Oaxaca','Puebla','Queretaro','Quintana Roo','San Luis Potosi','Sinaloa','Sonora','Tabo','Tamaulipas','Tlaxcala','Veracruz','Yucatan','Zacatecas') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica.usuario: ~0 rows (aproximadamente)
INSERT INTO `usuario` (`id`, `nombre_`, `apellidos`, `direccion`, `genero`, `sangre`, `telefono`, `fecha_nacimiento`, `rfc`, `curp`, `padecimiento`, `estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Daniel', 'Moreno', 'Ocosingo', 'Hombre', 'A+', '915446465', '2002-02-12', 'dasd', 'asdasd', NULL, 'Chiapas', NULL, '2023-03-09 00:04:10', '2023-03-09 00:04:10');

-- Volcando estructura para tabla clinica.usuario_has_cita
CREATE TABLE IF NOT EXISTS `usuario_has_cita` (
  `usuario_id` int(11) NOT NULL,
  `cita_idcita` int(11) NOT NULL,
  `cita_servicio_idservicio` int(11) NOT NULL,
  `diagnostico` varchar(255) NOT NULL,
  `tratamiento` varchar(255) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `archivos` blob DEFAULT NULL,
  PRIMARY KEY (`usuario_id`,`cita_idcita`,`cita_servicio_idservicio`),
  KEY `fk_usuario_has_cita_cita1_idx` (`cita_idcita`,`cita_servicio_idservicio`),
  KEY `fk_usuario_has_cita_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_usuario_has_cita_cita1` FOREIGN KEY (`cita_idcita`, `cita_servicio_idservicio`) REFERENCES `cita` (`idcita`, `servicio_idservicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_cita_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla clinica.usuario_has_cita: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
