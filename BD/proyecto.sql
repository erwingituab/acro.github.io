--
-- Base de datos: `proyecto`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_activar_usuario` (`_idusuario` INT)  UPDATE usuario SET status=1 WHERE idUsuario=_idusuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_bloquear_usuario` (IN `_idusuario` INT)  UPDATE usuario SET status=2 WHERE idUsuario=_idusuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_finca` (`_idFinca` INT)  SELECT * FROM finca WHERE idFinca=_idFinca$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_mostrar_usuario` (IN `_valor` VARCHAR(20))  SELECT idUsuario,ci,nombre,apellidos,telefono,direccion,usuario,rol,status FROM usuario
WHERE ci LIKE CONCAT('%', _valor, '%') OR nombre LIKE CONCAT('%', _valor, '%') OR usuario LIKE CONCAT('%', _valor, '%') AND status=1 AND status=2 ORDER BY 1 DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_usuario` (IN `_idUsuario` INT)  SELECT * FROM usuario WHERE idUsuario=_idusuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_finca` (IN `_numero_propietario` INT, IN `_propietario` VARCHAR(80), IN `_nro_tacho` INT, IN `_nombre_finca` VARCHAR(50), IN `_telefono` INT, IN `_direccion` VARCHAR(100), IN `_UsuarioID` INT)  INSERT INTO finca(nroPropietario,propietario,nroTacho,nombre_finca,telefono,direccion,UsuarioID)VALUES
(_numero_propietario,
 _propietario,
 _nro_tacho,
 _nombre_finca,_telefono,_direccion,_UsuarioID)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cretae_reproductor` (`_hba` INT, `_apodo` VARCHAR(50), `_nombre` VARCHAR(50), `_rp` INT, `_naab` VARCHAR(50), `_raza` INT, `_tiposervicio` INT, `_UsuarioID` INT)  INSERT INTO reproductor(hba,apodo,nombre,rp,naab,raza,tiposervicio,UsuarioID)VALUES(_hba,_apodo,_nombre,_rp,_naab,_raza,_tiposervicio,_UsuarioID)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_finca` (`_idFinca` INT)  DELETE FROM finca WHERE idFinca = _idFinca$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_reproductor` (`_idReproductor` INT)  DELETE FROM reproductor WHERE idReproductor=_idReproductor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_denegar_usuario` (`_idUsuario` INT, `_status` INT)  UPDATE usuario SET status=_status WHERE idUsuario=_idUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_usuario` (`_ci` VARCHAR(12), `_nombre` VARCHAR(80), `_apellidos` VARCHAR(80), `_telefono` INT, `_direccion` VARCHAR(100), `_usuario` VARCHAR(30), `_clave` TEXT, `_rol` INT)  INSERT INTO usuario(ci,nombre,apellidos,telefono,direccion,usuario,clave,rol)VALUES(_ci,_nombre,_apellidos,_telefono,_direccion,_usuario,_clave,_rol)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificar_usuario` (`_idUsuario` INT, `_ci` VARCHAR(12), `_nombre` VARCHAR(80), `_apellidos` VARCHAR(80), `_telefono` INT, `_direccion` VARCHAR(100), `_usuario` VARCHAR(30), `_clave` TEXT, `_rol` INT)  UPDATE usuario SET ci=_ci,nombre=_nombre,apellidos=_apellidos,telefono=_telefono,direccion=_direccion,usuario=_usuario,clave=_clave,rol=_rol WHERE idUsuario=_idUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_buscar_finca` (IN `_valor` VARCHAR(20))  SELECT * FROM finca WHERE propietario LIKE CONCAT('%', _valor, '%') OR nombre_finca LIKE CONCAT('%', _valor, '%') ORDER BY 1 DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_buscar_reproductor` (`_valor` VARCHAR(20))  SELECT * FROM reproductor WHERE hba LIKE CONCAT('%', _valor, '%') OR apodo LIKE CONCAT('%', _valor, '%') OR naab LIKE CONCAT('%', _valor, '%') ORDER BY 1 DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_finca` (`_idFinca` INT, `_numero_propietario` INT, `_propietario` VARCHAR(80), `_nro_tacho` INT, `_nombre_finca` VARCHAR(50), `_telefono` INT, `_direccion` VARCHAR(100), `_UsuarioID` INT)  UPDATE finca SET nroPropietario=_numero_propietario,propietario=_propietario,nroTacho=_nro_tacho,nombre_finca=_nombre_finca,telefono=telefono,direccion=_direccion,UsuarioID=_UsuarioID WHERE idFinca=_idFinca$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_reproductor` (`_idReproductor` INT, `_hba` INT, `_apodo` VARCHAR(50), `_nombre` VARCHAR(50), `_rp` INT, `_naab` VARCHAR(50), `_raza` INT, `_tiposervicio` INT, `_UsuarioID` INT)  UPDATE reproductor SET hba=_hba,apodo=_apodo,nombre=_nombre,rp=_rp,naab=_naab,raza=_raza,tiposervicio=_tiposervicio,UsuarioID=_UsuarioID WHERE idReproductor=_idReproductor$$

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
  `descricpion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipoEventoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `finca`
--

CREATE TABLE `finca` (
  `idFinca` int(11) NOT NULL,
  `nroPropietario` int(11) NOT NULL,
  `propietario` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `nroTacho` int(11) NOT NULL,
  `nombre_finca` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `UsuarioID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `finca`
--

INSERT INTO `finca` (`idFinca`, `nroPropietario`, `propietario`, `nroTacho`, `nombre_finca`, `telefono`, `direccion`, `UsuarioID`) VALUES
(1, 1, 'JUAN JORGE AITKEN CASTEDO', 1, 'CAYARA', 73869195, 'CARR. ORURO KM 20', 1),
(2, 2, 'F.U.S.I.P', 2, 'PAIRUMANI', 4260082, 'PAIRUMANI', 1),
(3, 3, 'DANIELA COCA ROCHA', 3, 'EL CRUCERO', 75913676, 'SANTIVAÃ‘EZ', 1),
(4, 4, 'ORLANDO VALLEJOS ARNEZ', 4, 'MARIA FLORENCIA', 4365936, 'PURGATORIO', 1),
(5, 5, 'HNOS SAAVEDRA STRUNK', 5, 'SAAVEDRA', 69570113, 'APOTE, TIQUIPAYA', 1),
(6, 6, 'VITALIANA FERNANDEZ', 6, 'CIUDAD DEL NIÃ‘O', 69570113, 'ITAPAYA, CAPINOTA', 1),
(7, 7, 'TEOFILA MONTAÃ‘O', 7, 'MONTAÃ‘O', 79778489, 'VILLA ROSARIO, PUNATA', 1),
(8, 8, 'ISABEL CARDOZO', 8, 'CARDOZO', 71734118, 'AV. REDUCTO, TIQUIPAYA', 2),
(9, 9, 'GUIDO TORRICO', 9, 'SIVINGANI', 4571046, 'SIVINGANI, PUNATA', 2),
(10, 10, 'MARIA CRISTINA VERA ZERDA', 10, 'YEPES', 75494242, 'MAICA CENTRAL', 2),
(11, 11, 'MARTHA GARCIA', 11, 'HUERTO SOFIA', 4575870, 'HUERTO SOFIA, TOLATA', 2),
(12, 12, 'MICHAEL STEPHENSON HOLME', 12, 'PLAYA ANCHA', 4388188, 'PLAYA ANCHA, CAPINOTA', 2),
(13, 13, 'NICOLAS MERIDA', 13, 'MERIDA', 67427889, 'CABILOMA, SIPE SIPE', 2),
(14, 14, 'TEOFILO AYALA FERNÃNDEZ', 14, 'TAPIA', 76417392, 'PAMPA GRANDE, PUNATA', 2),
(15, 15, 'MARISOL HERBAS, RENE CARLOS ORELLANA', 15, 'MARISOL', 68474000, 'CAMACHO RANCHO, PUNATA', 2),
(16, 16, 'HUMBERTO MONTAN', 16, 'SAN JULIAN', 72231077, 'KOACHACA, VINTO', 2),
(17, 17, 'CARLOS ALBINO LOBATON', 17, 'MARÃA', 4264984, 'MACHAJMARKA', 2),
(18, 18, 'NELLY VIDAL', 18, 'VIÃ‘A NUEVA', 68472408, 'C. VITALIANO L., CAPINOTA', 2);

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
(1, '1010', 'admin', 'admin', 123, 'admin', 'admin', '202cb962ac59075b964b07152d234b70', 1, 1),
(2, '10780686', 'Erwin', 'Apace Fabricano', 73751692, 'Av. Blanco Galindo km 4', 'erwin', '202cb962ac59075b964b07152d234b70', 1, 1),
(3, '8002614', 'Nelci Janeth', 'Mornate Rivera', 71607106, 'Av. Petrolera km 4', 'nelci', 'caf1a3dfb505ffed0d024130f58c5cfa', 3, 1);

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
  ADD PRIMARY KEY (`idEvento`),
  ADD KEY `evento-tipo` (`tipoEventoID`);

--
-- Indices de la tabla `finca`
--
ALTER TABLE `finca`
  ADD PRIMARY KEY (`idFinca`),
  ADD KEY `usuario-finca` (`UsuarioID`);

--
-- Indices de la tabla `historia`
--
ALTER TABLE `historia`
  ADD PRIMARY KEY (`idHIstoria`),
  ADD KEY `animal-historia` (`animalID`),
  ADD KEY `tratamiento-historia` (`eventoID`);

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
  MODIFY `idFinca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `historia`
--
ALTER TABLE `historia`
  MODIFY `idHIstoria` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `idTratamiento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `finca-animal` FOREIGN KEY (`fincaID`) REFERENCES `finca` (`idFinca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento-tipo` FOREIGN KEY (`tipoEventoID`) REFERENCES `tipo_evento` (`idTipoevento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `finca`
--
ALTER TABLE `finca`
  ADD CONSTRAINT `usuario-finca` FOREIGN KEY (`UsuarioID`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historia`
--
ALTER TABLE `historia`
  ADD CONSTRAINT `animal-historia` FOREIGN KEY (`animalID`) REFERENCES `animal` (`idAnimal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `evento-historia` FOREIGN KEY (`eventoID`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD CONSTRAINT `evento-tratamiento` FOREIGN KEY (`eventoID`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
