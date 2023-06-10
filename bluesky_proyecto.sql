-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bluesky_proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL,
  `Nom_cargo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idCargo`, `Nom_cargo`) VALUES
(1, 'Administrador'),
(2, 'Delivery');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) UNSIGNED NOT NULL,
  `Dni` varchar(9) DEFAULT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `Dni`, `Nombres`, `Direccion`, `Email`, `Password`) VALUES
(17, '78019778', 'Juanito Alcachofa', 'Lima - Perú', 'juan@gmail.com', 'juan123'),
(21, '76521488', 'Alberto Mendez', 'Lima - Perú', 'alberto@gmail.com', 'alberto123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompras` int(11) UNSIGNED NOT NULL,
  `idCliente` int(11) UNSIGNED NOT NULL,
  `idPago` int(11) UNSIGNED NOT NULL,
  `FechaCompras` varchar(11) DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idCompras`, `idCliente`, `idPago`, `FechaCompras`, `Monto`, `Estado`) VALUES
(7, 17, 16, '2021-12-05', 5900, 'Cancelado - Entregado'),
(8, 17, 17, '2021-12-07', 15.6, 'Cancelado - Entregado'),
(9, 17, 18, '2021-12-07', 21, 'Cancelado - En Proceso de Envio'),
(10, 21, 19, '2021-12-09', 13, 'Cancelado - En Proceso de Envio'),
(11, 17, 20, '2021-12-09', 25, 'Cancelado - En Proceso de Envio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `idDetalle` int(10) UNSIGNED NOT NULL,
  `idProducto` int(11) UNSIGNED NOT NULL,
  `idCompras` int(11) UNSIGNED NOT NULL,
  `Cantidad` int(11) UNSIGNED DEFAULT NULL,
  `PrecioCompra` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`idDetalle`, `idProducto`, `idCompras`, `Cantidad`, `PrecioCompra`) VALUES
(9, 20, 7, 2, 700),
(10, 21, 7, 3, 1500),
(11, 20, 8, 1, 15.6),
(12, 21, 9, 2, 10.5),
(13, 22, 10, 2, 6.5),
(14, 23, 11, 2, 12.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `DNI` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
  `Nombre_Emple` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Email` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `Password` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `idCargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `DNI`, `Nombre_Emple`, `Direccion`, `Email`, `Password`, `idCargo`) VALUES
(1001, '74806411', 'Pancho Suarez', 'Lima - Peru', 'pancho@gmail.com', 'pancho123', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idPago` int(11) UNSIGNED NOT NULL,
  `Monto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idPago`, `Monto`) VALUES
(16, 5900),
(17, 15.6),
(18, 21),
(19, 13),
(20, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) UNSIGNED NOT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Stock` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `Nombres`, `Foto`, `Descripcion`, `Precio`, `Stock`) VALUES
(20, 'A LO POBRE', 'A LO POBRE.jpg', 'Pan Pretzel, Burger 200gr de carne importada, platano palillo, huevo frito y chalaquito', 15.6, 99),
(21, 'CLASSIC BRO', 'CLASSIC BRO.jpg', 'Pan de papa, smash burger de carne importada, mayo de la casa, queso cheddar gratinado, lechuga y pickles', 10.5, 998),
(22, 'HOT BBQ', 'HOT BBQ.jpg', 'Pan Pretzel, Burger 200gr de carne importada, blend de quesos, lechuga, salsa Hot bbq ahumada a la leña y una coleslaw en vinagre balsámico.', 6.5, 98),
(23, 'BACON CREAM', 'BACON CREAM.jpg', 'Pan de papa, smash burger de carne importada, mayo de la casa, queso cheddar gratinado, crema de champiñones de parís con trocitos de tocino ahumado, lechuga y pickles', 12.5, 98);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompras`),
  ADD KEY `Compras_FKIndex1` (`idPago`),
  ADD KEY `Compras_FKIndex2` (`idCliente`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`idDetalle`,`idProducto`,`idCompras`),
  ADD KEY `Producto_has_Compras_FKIndex1` (`idProducto`),
  ADD KEY `Producto_has_Compras_FKIndex2` (`idCompras`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `FK_idCargo` (`idCargo`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompras` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `idDetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idPago` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_idCargo` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
