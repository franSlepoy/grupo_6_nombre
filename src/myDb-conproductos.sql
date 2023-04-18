-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 19-04-2023 a las 00:54:52
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodegas`
--

CREATE TABLE `bodegas` (
  `idBodega` int(11) NOT NULL,
  `bodegaNombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `bodegas`
--

INSERT INTO `bodegas` (`idBodega`, `bodegaNombre`) VALUES
(1, 'Chanchito F'),
(2, 'Umeni');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cepas`
--

CREATE TABLE `cepas` (
  `idCepa` int(11) NOT NULL,
  `nombreCepa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cepas`
--

INSERT INTO `cepas` (`idCepa`, `nombreCepa`) VALUES
(1, 'Tinto'),
(2, 'Blanco'),
(3, 'Espumante'),
(4, 'Especiales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `IntPedidosVinos`
--

CREATE TABLE `IntPedidosVinos` (
  `idIntPedidosVinos` int(11) NOT NULL,
  `pedidos_idPedidos` int(11) NOT NULL,
  `vinos_idVino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas`
--

CREATE TABLE `lineas` (
  `idLinea` int(11) NOT NULL,
  `lineascol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `lineas`
--

INSERT INTO `lineas` (`idLinea`, `lineascol`) VALUES
(1, 'Celebrar'),
(2, 'Descubrir'),
(3, 'Regalar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maridaje`
--

CREATE TABLE `maridaje` (
  `idmaridaje` int(11) NOT NULL,
  `maridaje` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `maridaje`
--

INSERT INTO `maridaje` (`idmaridaje`, `maridaje`) VALUES
(1, 'Carnes rojas'),
(2, 'Caviar'),
(3, 'Carnes blancas'),
(4, 'Aperitivo'),
(5, 'Postres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedidos` int(11) NOT NULL,
  `usuarios_idUsuarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contrasenia` varchar(200) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vinos`
--

CREATE TABLE `vinos` (
  `idVino` int(11) NOT NULL,
  `nombreBodega_idBodega` int(11) NOT NULL,
  `lineas_idLineas` int(11) NOT NULL,
  `cepas_idCepa` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  `maridaje_idmaridaje` int(11) NOT NULL,
  `potencialGuardado` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `volumen` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `vinos`
--

INSERT INTO `vinos` (`idVino`, `nombreBodega_idBodega`, `lineas_idLineas`, `cepas_idCepa`, `anio`, `maridaje_idmaridaje`, `potencialGuardado`, `descripcion`, `volumen`, `precio`, `nombre`, `imagen`) VALUES
(1, 1, 1, 1, 2022, 1, 5, 'Es un tinto de color rojo violáceo brillante.', 75, 4000, 'Catena Zapata', '/images/catena-zapata.jpg'),
(2, 2, 2, 2, 2020, 2, 8, 'Es un tinto de color rojo violáceo brillante, de aromas muy expresivos que recuerdan a frutas rojas y especias. Su paladar es franco y fluido, con taninos incipientes. ', 75, 2500, 'Rutini', '/images/rutini.jpg'),
(3, 1, 1, 3, 2021, 3, 6, 'De Sangre White Blend es un corte blanco de color amarillo con reflejos dorados y verdes. ', 75, 5500, 'Dom perignon', '/images/dom-perignon.jpg'),
(4, 2, 3, 4, 2023, 4, 3, 'Aromas frescos y paladar compacto, con taninos algo granulosos. Paladar fresco, con notas ahumadas y con suaves dejos de incienso.', 75, 3800, 'Salentein', '/images/salentein.jpeg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  ADD PRIMARY KEY (`idBodega`);

--
-- Indices de la tabla `cepas`
--
ALTER TABLE `cepas`
  ADD PRIMARY KEY (`idCepa`);

--
-- Indices de la tabla `IntPedidosVinos`
--
ALTER TABLE `IntPedidosVinos`
  ADD PRIMARY KEY (`idIntPedidosVinos`),
  ADD KEY `fk_IntPedidosVinos_pedidos1_idx` (`pedidos_idPedidos`),
  ADD KEY `fk_IntPedidosVinos_vinos1_idx` (`vinos_idVino`);

--
-- Indices de la tabla `lineas`
--
ALTER TABLE `lineas`
  ADD PRIMARY KEY (`idLinea`);

--
-- Indices de la tabla `maridaje`
--
ALTER TABLE `maridaje`
  ADD PRIMARY KEY (`idmaridaje`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedidos`),
  ADD KEY `fk_pedidos_usuarios1_idx` (`usuarios_idUsuarios`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuarios`);

--
-- Indices de la tabla `vinos`
--
ALTER TABLE `vinos`
  ADD PRIMARY KEY (`idVino`),
  ADD KEY `fk_vinos_nombreBodega_idx` (`nombreBodega_idBodega`),
  ADD KEY `fk_vinos_lineas1_idx` (`lineas_idLineas`),
  ADD KEY `fk_vinos_cepas1_idx` (`cepas_idCepa`),
  ADD KEY `fk_vinos_maridaje1_idx` (`maridaje_idmaridaje`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `vinos`
--
ALTER TABLE `vinos`
  MODIFY `idVino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `IntPedidosVinos`
--
ALTER TABLE `IntPedidosVinos`
  ADD CONSTRAINT `fk_IntPedidosVinos_pedidos1` FOREIGN KEY (`pedidos_idPedidos`) REFERENCES `pedidos` (`idPedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_IntPedidosVinos_vinos1` FOREIGN KEY (`vinos_idVino`) REFERENCES `vinos` (`idVino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_usuarios1` FOREIGN KEY (`usuarios_idUsuarios`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vinos`
--
ALTER TABLE `vinos`
  ADD CONSTRAINT `fk_vinos_cepas1` FOREIGN KEY (`cepas_idCepa`) REFERENCES `cepas` (`idCepa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vinos_lineas1` FOREIGN KEY (`lineas_idLineas`) REFERENCES `lineas` (`idLinea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vinos_maridaje1` FOREIGN KEY (`maridaje_idmaridaje`) REFERENCES `maridaje` (`idmaridaje`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vinos_nombreBodega` FOREIGN KEY (`nombreBodega_idBodega`) REFERENCES `bodegas` (`idBodega`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
