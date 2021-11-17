/*
SQLyog Community v13.1.8 (64 bit)
MySQL - 8.0.24 : Database - santarosa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`santarosa` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `santarosa`;

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `cod_cate` int NOT NULL,
  `nom_cate` varchar(45) DEFAULT NULL,
  `descrip_cate` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cod_cate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `categoria` */

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `cod_cliente` int NOT NULL,
  `nom_cliente` varchar(50) DEFAULT NULL,
  `dni_cliente` int DEFAULT NULL,
  `direccion_cliente` varchar(100) DEFAULT NULL,
  `telefono_cliente` int DEFAULT NULL,
  `email_cliente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cod_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `cliente` */

/*Table structure for table `empleado` */

DROP TABLE IF EXISTS `empleado`;

CREATE TABLE `empleado` (
  `cod_emp` int NOT NULL,
  `dni_emp` int DEFAULT NULL,
  `nom_emp` varchar(50) DEFAULT NULL,
  `ape_emp` varchar(50) DEFAULT NULL,
  `direccion_emp` varchar(100) DEFAULT NULL,
  `telefono_emp` int DEFAULT NULL,
  `contra_emp` varchar(45) DEFAULT NULL,
  `email_emp` varchar(50) DEFAULT NULL,
  `estado_emp` tinyint(1) DEFAULT NULL,
  `cod_rol` int NOT NULL,
  `cod_sede` int NOT NULL,
  PRIMARY KEY (`cod_emp`,`cod_rol`,`cod_sede`),
  KEY `cod_rol_idx` (`cod_rol`),
  KEY `cod_sede_idx` (`cod_sede`),
  CONSTRAINT `cod_rol` FOREIGN KEY (`cod_rol`) REFERENCES `rol` (`cod_rol`),
  CONSTRAINT `cod_sede` FOREIGN KEY (`cod_sede`) REFERENCES `sede` (`cod_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `empleado` */

insert  into `empleado`(`cod_emp`,`dni_emp`,`nom_emp`,`ape_emp`,`direccion_emp`,`telefono_emp`,`contra_emp`,`email_emp`,`estado_emp`,`cod_rol`,`cod_sede`) values 
(1,98765432,'admi','nistrador','Av.Codigo, Lima',963852741,'123','codigo@gmail.com',1,1000,20);

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `cod_produc` int NOT NULL,
  `nom_produc` varchar(45) DEFAULT NULL,
  `precio_produc` float DEFAULT NULL,
  `stock_produc` int DEFAULT NULL,
  `descrip_produc` varchar(200) DEFAULT NULL,
  `cod_prove` int NOT NULL,
  `cod_cate` int NOT NULL,
  PRIMARY KEY (`cod_produc`,`cod_prove`,`cod_cate`),
  KEY `cod_prove_idx` (`cod_prove`),
  KEY `cod_cate_idx` (`cod_cate`),
  CONSTRAINT `cod_cate` FOREIGN KEY (`cod_cate`) REFERENCES `categoria` (`cod_cate`),
  CONSTRAINT `cod_prove` FOREIGN KEY (`cod_prove`) REFERENCES `proveedor` (`cod_prove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `producto` */

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `cod_prove` int NOT NULL,
  `nom_prove` varchar(50) DEFAULT NULL,
  `direccion_prove` varchar(100) DEFAULT NULL,
  `telefono_prove` int DEFAULT NULL,
  PRIMARY KEY (`cod_prove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `proveedor` */

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `cod_rol` int NOT NULL,
  `nom_rol` varchar(50) DEFAULT NULL,
  `descrip_rol` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cod_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `rol` */

insert  into `rol`(`cod_rol`,`nom_rol`,`descrip_rol`) values 
(1000,'AdministradorBD','administra la base de datos');

/*Table structure for table `sede` */

DROP TABLE IF EXISTS `sede`;

CREATE TABLE `sede` (
  `cod_sede` int NOT NULL,
  `direccion_sede` varchar(100) DEFAULT NULL,
  `nom_sede` varchar(50) DEFAULT NULL,
  `telefono_sede` int DEFAULT NULL,
  PRIMARY KEY (`cod_sede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `sede` */

insert  into `sede`(`cod_sede`,`direccion_sede`,`nom_sede`,`telefono_sede`) values 
(20,'Lima','SantaRosa',741852963);

/*Table structure for table `venta` */

DROP TABLE IF EXISTS `venta`;

CREATE TABLE `venta` (
  `cod_venta` int NOT NULL,
  `tipo_venta` tinyint DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `cantidad_venta` int DEFAULT NULL,
  `precio_venta` float DEFAULT NULL,
  `impuesto_venta` float DEFAULT NULL,
  `total_venta` float DEFAULT NULL,
  `cod_produc` int NOT NULL,
  `cod_cliente` int NOT NULL,
  `cod_emp` int NOT NULL,
  PRIMARY KEY (`cod_venta`,`cod_produc`,`cod_cliente`,`cod_emp`),
  KEY `cod_produc_idx` (`cod_produc`),
  KEY `cod_cliente_idx` (`cod_cliente`),
  KEY `cod_emp_idx` (`cod_emp`),
  CONSTRAINT `cod_cliente` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`),
  CONSTRAINT `cod_emp` FOREIGN KEY (`cod_emp`) REFERENCES `empleado` (`cod_emp`),
  CONSTRAINT `cod_produc` FOREIGN KEY (`cod_produc`) REFERENCES `producto` (`cod_produc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `venta` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
