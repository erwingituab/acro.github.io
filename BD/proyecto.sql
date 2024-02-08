-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-02-2024 a las 22:35:47
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_activar_usuario` (`_idUsuario` INT, `_status` INT)  UPDATE usuario SET status=_status WHERE idUsuario=_idUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_mostrar_usuario` (IN `_valor` VARCHAR(20))  SELECT idUsuario,ci,nombre,apellidos,telefono,direccion,usuario,rol,status FROM usuario
WHERE ci LIKE CONCAT('%', _valor, '%') OR nombre LIKE CONCAT('%', _valor, '%') OR usuario LIKE CONCAT('%', _valor, '%') ORDER BY 1 DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_usuario` (IN `_idUsuario` INT)  SELECT * FROM usuario WHERE idUsuario=_idusuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_denegar_usuario` (`_idUsuario` INT, `_status` INT)  UPDATE usuario SET status=_status WHERE idUsuario=_idUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_socio` (`_id` INT)  DELETE FROM socio WHERE idSocio=_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_usuario` (`_ci` VARCHAR(12), `_nombre` VARCHAR(80), `_apellidos` VARCHAR(80), `_telefono` INT, `_direccion` VARCHAR(100), `_usuario` VARCHAR(30), `_clave` TEXT, `_rol` INT)  INSERT INTO usuario(ci,nombre,apellidos,telefono,direccion,usuario,clave,rol)VALUES(_ci,_nombre,_apellidos,_telefono,_direccion,_usuario,_clave,_rol)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificar_socio` (`_id` INT, `_ci` VARCHAR(12), `_nombre` VARCHAR(80), `_apellidos` VARCHAR(80), `_telefono` INT, `_usuarioID` INT)  UPDATE socio SET ci=_ci,nombre=_nombre,apellidos=_apellidos,telefono=_telefono,usuarioID=_usuarioID WHERE idSocio=_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificar_usuario` (`_idUsuario` INT, `_ci` VARCHAR(12), `_nombre` VARCHAR(80), `_apellidos` VARCHAR(80), `_telefono` INT, `_direccion` VARCHAR(100), `_usuario` VARCHAR(30), `_clave` TEXT, `_rol` INT)  UPDATE usuario SET ci=_ci,nombre=_nombre,apellidos=_apellidos,telefono=_telefono,direccion=_direccion,usuario=_usuario,clave=_clave,rol=_rol WHERE idUsuario=_idUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_ingreso` (`_usuario` VARCHAR(30), `_clave` TEXT)  SELECT * FROM usuario WHERE usuario=_usuario AND clave=_clave$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animal`
--

CREATE TABLE `animal` (
  `idAnimal` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `fecha_nac` date NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `caracteristica` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` int(1) NOT NULL,
  `fincaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL,
  `clave` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `descricpion` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `finca`
--

CREATE TABLE `finca` (
  `idFinca` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ubicacion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `socioID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia`
--

CREATE TABLE `historia` (
  `idHIstoria` int(11) NOT NULL,
  `fecha` int(11) NOT NULL,
  `diagnostico` int(11) NOT NULL,
  `animalID` int(11) NOT NULL,
  `eventoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `idSocio` int(11) NOT NULL,
  `ci` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(11) NOT NULL,
  `usuarioID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `idTratamiento` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `recomendacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `eventoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `ci` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `clave` text COLLATE utf8_spanish_ci NOT NULL,
  `rol` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `ci`, `nombre`, `apellidos`, `telefono`, `direccion`, `usuario`, `clave`, `rol`, `status`) VALUES
(1, '1010', 'admin', 'admin', 123, 'admin', 'admin', '202cb962ac59075b964b07152d234b70', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`idAnimal`),
  ADD KEY `finca-animal` (`fincaID`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idEvento`);

--
-- Indices de la tabla `finca`
--
ALTER TABLE `finca`
  ADD PRIMARY KEY (`idFinca`),
  ADD KEY `Socio-finca` (`socioID`);

--
-- Indices de la tabla `historia`
--
ALTER TABLE `historia`
  ADD PRIMARY KEY (`idHIstoria`),
  ADD KEY `animal-historia` (`animalID`),
  ADD KEY `tratamiento-historia` (`eventoID`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`idSocio`),
  ADD KEY `usuario-socio` (`usuarioID`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`idTratamiento`),
  ADD KEY `evento-tratamiento` (`eventoID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `animal`
--
ALTER TABLE `animal`
  MODIFY `idAnimal` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `finca`
--
ALTER TABLE `finca`
  MODIFY `idFinca` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `historia`
--
ALTER TABLE `historia`
  MODIFY `idHIstoria` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `idSocio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `idTratamiento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `finca-animal` FOREIGN KEY (`fincaID`) REFERENCES `finca` (`idFinca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `finca`
--
ALTER TABLE `finca`
  ADD CONSTRAINT `socio-finca` FOREIGN KEY (`socioID`) REFERENCES `socio` (`idSocio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historia`
--
ALTER TABLE `historia`
  ADD CONSTRAINT `animal-historia` FOREIGN KEY (`animalID`) REFERENCES `animal` (`idAnimal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `evento-historia` FOREIGN KEY (`eventoID`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `socio`
--
ALTER TABLE `socio`
  ADD CONSTRAINT `usuario-socio` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD CONSTRAINT `evento-tratamiento` FOREIGN KEY (`eventoID`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
