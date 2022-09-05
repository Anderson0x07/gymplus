-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-07-2022 a las 18:17:48
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `loginjsp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carro_compras`
--

DROP TABLE IF EXISTS `carro_compras`;
CREATE TABLE IF NOT EXISTS `carro_compras` (
  `id_pedido` int(30) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(50) NOT NULL,
  `id_producto` int(10) NOT NULL,
  `documento_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `pedido_plan_id_fk` (`id_producto`),
  KEY `pedido_docusuario_fk` (`documento_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

DROP TABLE IF EXISTS `facturacion`;
CREATE TABLE IF NOT EXISTS `facturacion` (
  `id_factura` int(11) NOT NULL,
  `fecha_factura` date NOT NULL,
  `total_pagar` double NOT NULL,
  `id_pedido` int(30) NOT NULL,
  `id_plan` int(11) NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `facturacion_pedido_idpedido_fk` (`id_pedido`),
  KEY `plan` (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

DROP TABLE IF EXISTS `plan`;
CREATE TABLE IF NOT EXISTS `plan` (
  `id_plan` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`id_plan`, `descripcion`, `precio`) VALUES
(1, 'Plan Nutricional', 49990),
(2, 'Plan Básico', 59990),
(3, 'Plan Avanzado', 79990),
(4, 'Ninguno', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `cantidad` int(30) NOT NULL,
  `costo` double NOT NULL,
  `img` varchar(500) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `producto_proveedoorr_fk` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `cantidad`, `costo`, `img`, `id_proveedor`) VALUES
(1, 'Acido Arachidonic', 50, 75000, 'https://cdn.shopify.com/s/files/1/0050/1537/1811/products/acido_arachidonic_2_mutantest_320x.png?v=1615409456', 1),
(2, 'Adrenal Core', 50, 140000, 'https://cdn.shopify.com/s/files/1/0050/1537/1811/products/revive_adrenal_Core_mutantest_320x.png?v=1636779955', 1),
(3, 'Amino Shredder', 50, 180000, 'https://cdn.shopify.com/s/files/1/0050/1537/1811/products/aminoshareed_mutantest_320x.png?v=1593288219', 1),
(4, 'Arim-RX - Antiestrogenico', 50, 110000, 'https://cdn.shopify.com/s/files/1/0050/1537/1811/products/arimrx_enhanced_mutantest_320x.png?v=1627764645', 1),
(5, 'Ashwagandha', 50, 110000, 'https://cdn.shopify.com/s/files/1/0050/1537/1811/products/revive_aswhawanda_mutantest_320x.png?v=1636779986', 1),
(6, 'Basic Training Serie BCAA', 50, 80000, 'https://cdn.shopify.com/s/files/1/0050/1537/1811/products/bcaa_basic_trainer_redcon1_mutantest_320x.png?v=1634663506', 1),
(7, 'Bcaa Fix', 50, 80000, 'https://cdn.shopify.com/s/files/1/0050/1537/1811/products/bcaafix_darkness_mutantest_320x.png?v=1645137217', 1),
(8, 'Bergamot', 50, 140000, 'https://cdn.shopify.com/s/files/1/0050/1537/1811/products/Bergamot_revive_mutantest_320x.png?v=1624038257', 1),
(9, 'Bipro 2Lbs', 50, 170000, 'https://cdn.shopify.com/s/files/1/0050/1537/1811/products/Bipro_chocolate_mutantest_320x.jpg?v=1583193633', 1),
(10, 'Bipro 6Lbs', 50, 450000, 'https://cdn.shopify.com/s/files/1/0050/1537/1811/products/Bipro_classic_mutantest_6lbs_320x.png?v=1583180498', 1),
(54, 'prueba', 123, 150, 'https://cdn.shopify.com/s/files/1/0050/1537/1811/products/346A3727_baja_320x.jpg?v=1652496586', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id_proveedor` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre_empresa`, `telefono`, `direccion`) VALUES
(1, 'Empresa Gimnasio', '3212323322', 'Av 3A #12-22 La Playa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `documento` int(20) NOT NULL,
  `tipodocumento` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `id_plan` int(11) DEFAULT NULL,
  PRIMARY KEY (`documento`),
  KEY `usuarioplan_fk` (`id_plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`documento`, `tipodocumento`, `nombre`, `apellido`, `telefono`, `fecha_nacimiento`, `email`, `password`, `id_plan`) VALUES
(123, 'CC', 'juamn', 'jaja', '123', '2022-06-14', 'juan@gmail.com', 'juanjuan', NULL),
(1452, 'CC', 'MiguelA', 'Pere', '123', '2016-06-01', 'migue@gmail.com', '1234', 3),
(9999, 'CC', 'Admin', 'X', '99999999', '2022-01-01', 'admin@gymplus.com', 'admin', NULL),
(1004926016, 'CC', 'Anderson', 'Orozco', '3219238493', '2022-06-29', 'anderson07rolon@gmail.com', '123', 2);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carro_compras`
--
ALTER TABLE `carro_compras`
  ADD CONSTRAINT `pedido_docusuario_fk` FOREIGN KEY (`documento_usuario`) REFERENCES `usuario` (`documento`),
  ADD CONSTRAINT `pedido_producto_id_fk` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `facturacion_pedido_idpedido_fk` FOREIGN KEY (`id_pedido`) REFERENCES `carro_compras` (`id_pedido`),
  ADD CONSTRAINT `plan` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_proveedoorr_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuarioplan_fk` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
