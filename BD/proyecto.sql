--
-- Base de datos: `proyecto`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_activar_usuario` (`_idusuario` INT)  UPDATE usuario SET status=1 WHERE idUsuario=_idusuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_bloquear_usuario` (IN `_idusuario` INT)  UPDATE usuario SET status=2 WHERE idUsuario=_idusuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_animales` (IN `_idFinca` INT, IN `_valor` VARCHAR(50))  SELECT * FROM animal WHERE chb LIKE CONCAT('%', _valor, '%') AND fincaID = _idFinca$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_finca` (`_idFinca` INT)  SELECT * FROM finca WHERE idFinca=_idFinca$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_mostrar_animal` (IN `_idAnimal` INT)  SELECT * FROM animal WHERE idAnimal=_idAnimal OR chb=_idAnimal$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_mostrar_evento` (`_valor` VARCHAR(20))  SELECT * FROM evento WHERE clave LIKE CONCAT('%', _valor, '%') OR descripcion LIKE CONCAT('%', _valor, '%') ORDER BY 4 ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_mostrar_usuario` (IN `_valor` VARCHAR(20))  SELECT idUsuario,ci,nombre,apellidos,telefono,direccion,usuario,rol,status FROM usuario
WHERE ci LIKE CONCAT('%', _valor, '%') OR nombre LIKE CONCAT('%', _valor, '%') OR usuario LIKE CONCAT('%', _valor, '%') AND status=1 AND status=2 ORDER BY 1 DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_usuario` (IN `_idUsuario` INT)  SELECT * FROM usuario WHERE idUsuario=_idusuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_animal` (`_chb` INT, `_fnacimiento` DATE, `_nroregistro` INT, `_categoria` INT, `_raza` INT, `_nombre` VARCHAR(50), `_rp` INT, `_chbmadre` INT, `_naabpadre` VARCHAR(12), `_FincaID` INT)  INSERT INTO animal(chb,fecha_nacimiento,nro_registro,categoria,raza,nombre,rp,chbmadre,naabpadre,fincaID)VALUES(_chb,_fnacimiento,_nroregistro,_categoria,_raza,_nombre,_rp,_chbmadre,_naabpadre,_FincaID)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_evento` (IN `_clave` VARCHAR(10), IN `_descripcion` VARCHAR(50), IN `_tipoevento` INT)  INSERT INTO evento(clave,descripcion,tipoevento)VALUES(_clave,_descripcion,_tipoevento)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_finca` (IN `_numero_propietario` INT, IN `_propietario` VARCHAR(80), IN `_nro_tacho` INT, IN `_nombre_finca` VARCHAR(50), IN `_telefono` INT, IN `_direccion` VARCHAR(100), IN `_UsuarioID` INT)  INSERT INTO finca(nroPropietario,propietario,nroTacho,nombre_finca,telefono,direccion,UsuarioID)VALUES
(_numero_propietario,
 _propietario,
 _nro_tacho,
 _nombre_finca,_telefono,_direccion,_UsuarioID)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_reproductor` (`_hba` INT, `_apodo` VARCHAR(50), `_nombre` VARCHAR(50), `_rp` INT, `_naab` VARCHAR(50), `_raza` INT, `_tiposervicio` INT)  INSERT INTO reproductor(hba,apodo,nombre,rp,naab,raza,tiposervicio)VALUES(_hba,_apodo,_nombre,_rp,_naab,_raza,_tiposervicio)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_animal` (`_idAnimal` INT)  DELETE FROM animal WHERE idAnimal=_idAnimal$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_evento` (`_idEvento` INT)  DELETE FROM evento WHERE idEvento=_idEvento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_finca` (`_idFinca` INT)  DELETE FROM finca WHERE idFinca = _idFinca$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_reproductor` (IN `_idReproductor` INT)  DELETE FROM reproductor WHERE idReproductor=_idReproductor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_denegar_usuario` (`_idUsuario` INT, `_status` INT)  UPDATE usuario SET status=_status WHERE idUsuario=_idUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_usuario` (`_ci` VARCHAR(12), `_nombre` VARCHAR(80), `_apellidos` VARCHAR(80), `_telefono` INT, `_direccion` VARCHAR(100), `_usuario` VARCHAR(30), `_clave` TEXT, `_rol` INT)  INSERT INTO usuario(ci,nombre,apellidos,telefono,direccion,usuario,clave,rol)VALUES(_ci,_nombre,_apellidos,_telefono,_direccion,_usuario,_clave,_rol)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modificar_usuario` (`_idUsuario` INT, `_ci` VARCHAR(12), `_nombre` VARCHAR(80), `_apellidos` VARCHAR(80), `_telefono` INT, `_direccion` VARCHAR(100), `_usuario` VARCHAR(30), `_clave` TEXT, `_rol` INT)  UPDATE usuario SET ci=_ci,nombre=_nombre,apellidos=_apellidos,telefono=_telefono,direccion=_direccion,usuario=_usuario,clave=_clave,rol=_rol WHERE idUsuario=_idUsuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_buscar_finca` (IN `_valor` VARCHAR(20))  SELECT * FROM finca WHERE propietario LIKE CONCAT('%', _valor, '%') OR nombre_finca LIKE CONCAT('%', _valor, '%') ORDER BY 1 DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_buscar_reproductor` (IN `_valor` VARCHAR(20))  SELECT * FROM reproductor WHERE nombre LIKE CONCAT('%', _valor, '%') OR apodo LIKE CONCAT('%', _valor, '%') OR naab LIKE CONCAT('%', _valor, '%') ORDER BY 1 DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_datos_evento` (IN `_idEvento` INT)  SELECT * FROM evento WHERE idEvento=_idEvento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_reproductor` (`_idReproductor` INT)  SELECT * FROM reproductor WHERE idReproductor=_idReproductor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_animal` (`_idAnimal` INT, `_chb` INT, `_fnacimiento` DATE, `_nroregistro` INT, `_categoria` INT, `_raza` INT, `_nombre` VARCHAR(50), `_rp` INT, `_chbmadre` INT, `_naabpadre` VARCHAR(12), `_FincaID` INT)  UPDATE animal SET chb=_chb,fecha_nacimiento=_fnacimiento,nro_registro=_nroregistro,categoria=_categoria,raza=_raza,nombre=_nombre,rp=_rp,chbmadre=_chbmadre,naabpadre=_naabpadre
WHERE idAnimal=_idAnimal$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_evento` (`_idEvento` INT, `_clave` VARCHAR(20), `_descripcion` VARCHAR(50), `_tipoevento` INT)  UPDATE evento SET clave=_clave,descripcion=_descripcion,tipoevento=_tipoevento WHERE idEvento=_idEvento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_finca` (`_idFinca` INT, `_numero_propietario` INT, `_propietario` VARCHAR(80), `_nro_tacho` INT, `_nombre_finca` VARCHAR(50), `_telefono` INT, `_direccion` VARCHAR(100), `_UsuarioID` INT)  UPDATE finca SET nroPropietario=_numero_propietario,propietario=_propietario,nroTacho=_nro_tacho,nombre_finca=_nombre_finca,telefono=telefono,direccion=_direccion,UsuarioID=_UsuarioID WHERE idFinca=_idFinca$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_reproductor` (`_idReproductor` INT, `_hba` INT, `_apodo` VARCHAR(50), `_nombre` VARCHAR(50), `_rp` INT, `_naab` VARCHAR(50), `_raza` INT, `_tiposervicio` INT)  UPDATE reproductor SET hba=_hba,apodo=_apodo,nombre=_nombre,rp=_rp,naab=_naab,raza=_raza,tiposervicio=_tiposervicio WHERE idReproductor=_idReproductor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_ingreso` (`_usuario` VARCHAR(30), `_clave` TEXT)  SELECT * FROM usuario WHERE usuario=_usuario AND clave=_clave$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animal`
--

CREATE TABLE `animal` (
  `idAnimal` int(11) NOT NULL,
  `chb` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nro_registro` int(11) NOT NULL,
  `categoria` int(1) NOT NULL,
  `raza` int(1) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rp` int(11) NOT NULL,
  `chbmadre` int(11) NOT NULL,
  `naabpadre` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(1) NOT NULL DEFAULT '0',
  `fincaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `animal`
--

INSERT INTO `animal` (`idAnimal`, `chb`, `fecha_nacimiento`, `nro_registro`, `categoria`, `raza`, `nombre`, `rp`, `chbmadre`, `naabpadre`, `estado`, `fincaID`) VALUES
(1, 521718, '2017-09-07', 0, 4, 2, 'Yepes-Muleca', 521718, 0, '0', 0, 10),
(2, 521720, '2019-04-24', 0, 4, 4, 'Yepes-Parda', 0, 0, '0', 0, 10),
(3, 521721, '2019-12-28', 0, 4, 2, 'Yepes-Negrita', 0, 0, '0', 0, 10),
(4, 521765, '2018-02-09', 0, 4, 2, 'Yepes-Negrita', 0, 0, '0', 0, 10),
(5, 521870, '2019-09-23', 0, 4, 2, 'Yepes-Katy', 0, 0, '0', 0, 10),
(6, 521872, '2022-08-09', 64111, 7, 2, 'Yepes-Helen-LusterP-Hols', 521872, 368705, '7HO14160', 0, 10),
(7, 521950, '2020-02-20', 0, 4, 2, 'Yepes-Asly', 0, 0, '0', 0, 10),
(8, 521951, '2020-02-20', 0, 4, 2, 'Yepes-Betania', 0, 0, '0', 0, 10),
(9, 539025, '2018-12-27', 0, 4, 2, 'Yepes-Pastora', 0, 0, '0', 0, 10),
(10, 539099, '2021-06-10', 0, 4, 2, 'Yepes-Juanita', 0, 0, '0', 0, 10),
(11, 539107, '2023-06-15', 0, 4, 2, 'Yepes-Jovita', 0, 0, '0', 0, 10),
(12, 539128, '2023-07-10', 64112, 4, 1, 'Yepes-Paty-RainyRed-Parda', 0, 521720, '250HO15316', 0, 10),
(13, 539151, '2023-08-15', 64116, 1, 2, 'Yepes-Keyla-RustyRed-Katy', 539151, 521870, '7HO13826', 0, 10),
(14, 539251, '2023-12-19', 0, 4, 2, 'Yepes-Laura', 0, 0, '0', 0, 10),
(15, 539293, '2022-01-10', 0, 4, 2, 'Yepes-Flor', 0, 0, '0', 0, 10),
(16, 539294, '2023-10-26', 0, 4, 2, 'Yepes-Florita', 0, 539293, '0', 0, 10),
(17, 14884, '2015-01-19', 38037, 1, 2, 'Anita-Martha-Braxton-Estrellita', 0, 12893, '7HO9115', 0, 3),
(18, 14924, '2015-06-13', 0, 1, 2, 'Anita-Antonia-Defiant-Abril', 0, 12623, '7HO11596', 0, 3),
(19, 14963, '2017-10-06', 52206, 2, 2, 'Anita-Mariana-Kenyon-Monica', 0, 14925, '7HO12769', 0, 3),
(20, 14998, '2017-08-13', 0, 1, 2, 'Anita-Dominga-Kenyon-Adriana', 0, 13093, '7HO12769', 0, 3),
(21, 230435, '2017-07-23', 50956, 1, 2, 'Esperanza-Kailin-McCutchen-Alexa', 0, 774473, '7HO11477', 0, 3),
(22, 244345, '2015-12-19', 44798, 1, 2, 'Esperanza-Odeth-McCutchen-Hilaria', 0, 13294, '7HO11477', 0, 3),
(23, 277247, '2018-05-03', 53291, 1, 2, 'Esperanza-Benita-RagerRed-Arminda', 0, 774381, '7HO12344', 0, 3),
(24, 277248, '2018-05-23', 50996, 1, 2, 'Esperanza-Egla-RagerRed-Evelin', 0, 773333, '7HO12344', 0, 3),
(25, 279335, '2018-06-28', 53755, 3, 2, 'P.Ancha-Pegui-Drina', 0, 222639, '7HO11169', 0, 3),
(26, 279456, '2018-09-17', 54522, 1, 2, 'Esperanza-Magdalena-Kenyon-Wayra', 0, 244449, '7HO12769', 0, 3),
(27, 283043, '2018-10-05', 54640, 7, 2, 'P.Ancha-Kutiy-kingboy-Mogli', 0, 222993, '7HO12198', 0, 3),
(28, 283065, '2018-11-22', 50992, 1, 2, 'Esperanza-Helena-Heisenberg-Aldana', 0, 222604, '7HO12569', 0, 3),
(29, 318465, '2019-04-08', 53243, 3, 2, 'Esperanza-Claudia-Kenosha-CarmiÃ±a', 0, 773591, '7HO12773', 0, 3),
(30, 347981, '2019-06-24', 55773, 3, 2, 'P.Ancha-Play-Petrone-Drina', 0, 222639, '7HO11169', 0, 3),
(31, 348083, '2019-08-12', 55800, 7, 2, 'P.Ancha-Rasy-RagerRed-Mune', 0, 222522, '7HO12344', 0, 3),
(32, 368858, '2020-01-15', 0, 3, 2, 'Esperanza-Raiza-Doc-Alsira', 0, 204448, '250HO12961', 0, 3),
(33, 414045, '2020-08-04', 0, 4, 2, 'Esperanza-Ratona', 0, 0, '0', 0, 3),
(34, 431005, '2020-03-23', 53259, 1, 2, 'Esperanza-Luchita-Bradnick-Estela', 0, 230450, '7HO10999', 0, 3),
(35, 431107, '2020-05-13', 53276, 1, 2, 'Esperanza-Anita-Sterling-Iris', 0, 14992, '7HO11585', 0, 3),
(36, 431109, '2020-05-23', 53279, 1, 2, 'Esperanza-Hermosa-Bradnick-Bonita', 0, 277222, '7HO10999', 0, 3),
(37, 776100, '2020-08-25', 0, 4, 2, 'ElCrucero-Estrella', 0, 0, '0', 0, 3),
(38, 776101, '0020-09-22', 0, 4, 2, 'ElCrucero-Gargantilla', 0, 0, '0', 0, 3),
(39, 776102, '2020-03-22', 0, 4, 2, 'ElCrucero-Betty', 0, 0, '0', 0, 3),
(40, 776103, '0020-03-22', 0, 4, 2, 'ElCrucero-Yura', 0, 0, '0', 0, 3),
(41, 776104, '2020-07-10', 0, 4, 2, 'ElCrucero-Charo', 0, 0, '0', 0, 3),
(42, 776105, '2020-07-10', 0, 4, 2, 'ElCrucero-Leti', 0, 0, '0', 0, 3),
(43, 776107, '0020-07-10', 0, 4, 2, 'ElCrucero-Luz', 0, 0, '0', 0, 3),
(44, 776108, '2022-02-23', 0, 4, 2, 'ElCrucero-Rayito', 0, 0, '0', 0, 3),
(45, 776110, '0022-02-23', 0, 4, 2, 'ElCrucero-Lucy', 0, 0, '0', 0, 3),
(46, 776111, '2022-02-23', 0, 4, 2, 'ElCrucero-MuÃ±equita', 0, 0, '0', 0, 3),
(47, 776113, '0022-03-25', 0, 4, 2, 'ElCrucero-Luna', 0, 0, '0', 0, 3),
(48, 776115, '2022-04-24', 0, 4, 2, 'ElCrucero-Flor', 0, 0, '0', 0, 3),
(49, 776116, '2022-10-03', 65103, 4, 2, 'ElCrucero-Sol-Dayne-Betty', 0, 775102, '1HO15000', 0, 3),
(50, 776117, '2022-10-10', 61286, 1, 2, 'ElCrucero-Selena-Jules-Luchita', 0, 431005, '7HO15002', 0, 3),
(51, 776118, '2022-12-16', 61291, 1, 2, 'ElCrucero-Sarita-Taos-Wayra', 0, 244449, '7HO15112', 0, 3),
(52, 776119, '2023-01-04', 63603, 1, 2, 'ElCrucero-Alison-Tomek-Egla', 0, 277248, '7HO12657', 0, 3),
(53, 776121, '2023-02-03', 65115, 4, 2, 'ElCrucero-Adelita-Charo', 0, 776104, '0', 0, 3),
(54, 776122, '2023-02-21', 63610, 1, 2, 'ElCrucero-Ambar-Tomek-Kailin', 0, 230435, '7HO12657', 0, 3),
(55, 776123, '2023-04-22', 63622, 1, 2, 'ElCrucero-Amelia-Logistics-Antonia', 0, 14924, '250HO15208', 0, 3),
(56, 776125, '2023-06-05', 64038, 3, 2, 'ElCrucero-Alexa-Magnitude-Play', 0, 347981, '507HO14792', 0, 3),
(57, 776126, '2023-08-10', 0, 1, 2, 'ElCrucero-Anastacia-Bradnick-Martha', 0, 14884, '7HO10999', 0, 3),
(58, 776128, '2023-12-21', 65119, 3, 2, 'ElCrucero-Analuz-Bradnick-Raiza', 0, 368858, '7HO10999', 0, 3),
(59, 774129, '2023-12-26', 65120, 1, 2, 'ElCrucero-Almendra-House-Hermosa', 0, 431109, '7HO12978', 0, 3),
(60, 202998, '2020-02-06', 57873, 3, 2, 'Pairumani-4278-Chrome-4077', 4278, 244339, '7HO12464', 0, 2),
(61, 222915, '2016-09-23', 48773, 3, 2, 'Pairumani-4089-Halogen-3934', 4089, 773589, '7HO12008', 0, 2),
(62, 222984, '2016-11-01', 48794, 2, 2, 'Pairumani-4096-Dresser-3625', 48794, 12024, '7HO12177', 0, 2),
(63, 230418, '2017-07-24', 53643, 2, 2, 'Pairumani-4141Brokaw-3712', 4141, 230418, '7HO11118', 0, 2),
(64, 244475, '2016-02-05', 47886, 2, 2, 'Pairumani-4059-McCutchen-3582', 47886, 11692, '7HO11477', 0, 2),
(65, 272848, '2018-01-01', 53558, 1, 2, 'Pairumani-4162-Guthrie-4039', 53558, 774941, '7HO9420', 0, 2),
(66, 272875, '2018-01-19', 53573, 2, 2, 'Pairumani-4167-Taillight-3966', 4167, 774059, '7HO11591', 0, 2),
(67, 277165, '2016-02-07', 47893, 1, 2, 'Pairumani-4060-Goldchip-3898', 47893, 773361, '7HO10920', 0, 2),
(68, 277176, '2018-02-27', 42364, 3, 2, 'Pairumani-4173-Guthrie-4065', 4173, 222538, '7HO9420', 0, 2),
(69, 277256, '2018-05-20', 42394, 3, 2, 'Pairumani-4184-Guthrie-4067', 4184, 222540, '7HO9420', 0, 2),
(70, 279395, '2018-07-09', 53416, 2, 2, 'Pairumani-4193-Bradnick-3956', 4193, 773966, '7HO10999', 0, 2),
(71, 283008, '2018-10-07', 53456, 3, 2, 'Pairumani-4204-Guthrie-4057', 4204, 244473, '7HO9420', 0, 2),
(72, 283090, '2018-11-12', 53473, 2, 2, 'Pairumani-4209-Kingtut-4052', 4209, 244407, '7HO12726', 0, 2),
(73, 315974, '2018-12-29', 55002, 1, 2, 'Pairumani-4212-Wonka-3874', 4212, 773123, '7HO12175', 0, 2),
(74, 315979, '2019-01-09', 55006, 3, 2, 'Pairumani-4217-Wonka-3762', 4217, 315945, '7HO12175', 0, 2),
(75, 318415, '2019-03-08', 55054, 2, 2, 'Pairumani-4224-Deceiver-4048', 4224, 244340, '7HO12115', 0, 2),
(76, 318479, '2019-03-24', 55068, 3, 2, 'Pairumani-4228-Reflector-4119', 4228, 315954, '7HO12105', 0, 2),
(77, 318482, '2019-04-13', 55076, 3, 2, 'Pairumani-4231-Kenosha-3999', 4231, 277172, '7HO12773', 0, 2),
(78, 348034, '2019-06-27', 56528, 2, 2, 'Pairumani-4238-Reflector-4111', 4238, 315956, '7HO12105', 0, 2),
(79, 348072, '2019-08-02', 53554, 3, 2, 'Pairumani-4244-Chrome-3864', 4244, 315943, '7HO12464', 0, 2),
(80, 348097, '2019-09-23', 56577, 2, 2, 'Pairumani-4251-Kenosha-4096', 4251, 222984, '7HO12773', 0, 2),
(81, 368715, '2019-10-08', 56585, 1, 2, 'Pairumani-4255-Reflector-4121', 4255, 315951, '7HO12105', 0, 2),
(82, 368716, '2019-10-12', 56591, 2, 2, 'Pairumani-4256-Wonka-4141', 4256, 230418, '7HO12175', 0, 2),
(83, 368754, '2019-10-30', 57804, 3, 2, 'Pairumani-4258-Reflector-4152', 4258, 315938, '7HO12105', 0, 2),
(84, 368756, '2019-10-31', 57805, 3, 2, 'Pairumani-4260-Reflector-4102', 4260, 277168, '7HO12105', 0, 2),
(85, 368757, '2019-11-01', 57802, 1, 2, 'Pairumani-4261-Reflector-4138', 4261, 315932, '7HO12105', 0, 2),
(86, 368758, '2019-11-07', 57811, 3, 2, 'Pairumani-4262-Reflector-4124', 4262, 230061, '7HO12105', 0, 2),
(87, 368760, '2019-11-14', 57812, 3, 2, 'Pairumani-4264-Reflector-4153', 4264, 272814, '7HO12105', 0, 2),
(88, 368798, '2019-11-28', 57820, 2, 2, 'Pairumani-4265-KingTud-3806', 4265, 13634, '7HO12726', 0, 2),
(89, 368827, '2016-06-06', 48672, 3, 2, 'Pairumani-4072-Spur-3802', 4072, 244410, '7HO10723', 0, 2),
(90, 368840, '2017-03-07', 47372, 3, 2, 'Pairumani-4124-Brisco-3800', 4124, 13486, '7HO10908', 0, 2),
(91, 368842, '2017-08-29', 53675, 1, 2, 'Pairumani-4147-Mayfield-3558', 4147, 11549, '7HO11283', 0, 2),
(92, 368863, '2019-12-27', 57854, 2, 2, 'Pairumani-4270-Braxton-4103', 4270, 222991, '7HO9165', 0, 2),
(93, 368864, '2019-12-28', 57849, 2, 2, 'Pairumani-4271-Braxton-4069', 4271, 222875, '7HO9165', 0, 2),
(94, 368866, '0020-04-07', 57844, 2, 2, 'Pairumani-4275-Kingtut-4075', 4275, 368830, '7HO12726', 0, 2),
(95, 368867, '2020-01-18', 57862, 2, 2, 'Pairumani-4277-Kenosha-4052', 4277, 244407, '7HO12773', 0, 2),
(96, 368880, '2018-09-30', 53455, 1, 2, 'Pairumani-4202-Braxton-3963', 4202, 774056, '7HO9165', 0, 2),
(97, 414014, '2020-09-30', 59625, 3, 2, 'Pairumani-4321-Reflector-4142', 4321, 368873, '7HO12105', 0, 2),
(98, 414015, '2020-10-02', 59605, 1, 2, 'Pairumani-4322-Doc-4186', 4322, 277288, '250HO12961', 0, 2),
(99, 414016, '2020-10-08', 59626, 3, 2, 'Pairumani-4323-Reflector-4158', 4323, 272836, '7HO12105', 0, 2),
(100, 414018, '2020-10-13', 59628, 2, 2, 'Pairumani-4325-Doc-4081', 4325, 222868, '250HO12961', 0, 2),
(101, 414057, '2020-11-09', 59637, 3, 2, 'Pairumani-4326-Wonka-4211', 4326, 283092, '7HO12175', 0, 2),
(102, 414059, '2020-11-17', 59646, 3, 2, 'Pairumani-4328-Wonka-4204', 4328, 283008, '7HO12175', 0, 2),
(103, 414060, '2020-11-17', 59644, 2, 2, 'Pairumani-4329-Kingpin-4041', 4329, 775001, '7HO12228', 0, 2),
(104, 414096, '2020-11-29', 59659, 3, 2, 'Pairumani-4330-Doc-4102', 4330, 368836, '250HO12961', 0, 2),
(105, 414097, '2020-11-30', 59654, 2, 2, 'Pairumani-4331-Doc-4050', 4331, 244405, '250HO12961', 0, 2),
(106, 414100, '2020-12-19', 59665, 3, 2, 'Pairumani-4334-Deceiver-4144', 4334, 230474, '7HO12115', 0, 2),
(107, 414136, '2020-12-15', 59686, 2, 2, 'Pairumani-4335-Doc-4078', 4335, 315949, '250HO12961', 0, 2),
(108, 414137, '2020-12-31', 59693, 1, 2, 'Pairumani-4336-Deceiver-4200', 4336, 279468, '7HO12115', 0, 2),
(109, 414138, '2021-01-03', 59685, 1, 2, 'Pairumani-4337-Doc-4122', 4337, 230054, '250HO12961', 0, 2),
(110, 414139, '2021-01-04', 59692, 2, 2, 'Pairumani-4338-Deceiver-4178', 4338, 277230, '7HO12115', 0, 2),
(111, 414142, '2021-01-12', 59697, 3, 2, 'Pairumani-4341-Doc-4148', 4341, 272725, '250HO12961', 0, 2),
(112, 414144, '2021-01-14', 59699, 3, 2, 'Pairumani-4343-Reflector-4123', 4343, 230060, '7HO12105', 0, 2),
(113, 414176, '2021-02-13', 60125, 3, 2, 'Pairumani-4345-Scenario-4084', 4345, 368823, '7HO12615', 0, 2),
(114, 414178, '2021-02-21', 60118, 3, 2, 'Pairumani-4348-Doc-4217', 4348, 315979, '250HO12961', 0, 2),
(115, 414192, '2017-08-21', 53667, 3, 2, 'Pairumani-4144-Microsoft-3720', 4144, 12838, '7HO11748', 0, 2),
(116, 414196, '2019-07-03', 565332, 1, 2, 'Pairumani-4239-Braxton-4051', 4239, 244406, '7HO9165', 0, 2),
(117, 414197, '2019-07-19', 56543, 2, 2, 'Pairumani-4241-Refelctor-4130', 4241, 230195, '7HO12105', 0, 2),
(118, 414198, '2019-03-09', 55053, 3, 2, 'Pairumani-4226-Deceiver-4086', 4226, 222913, '7HO12115', 0, 2),
(119, 414201, '2021-02-25', 60117, 2, 2, 'Pairumani-4349-Doc-3987', 4349, 774193, '250HO12961', 0, 2),
(120, 414203, '2021-03-18', 60133, 2, 2, 'Pairumani-4351-Doc-4161', 4351, 368875, '250HO12961', 0, 2),
(121, 414204, '2021-03-21', 60140, 2, 2, 'Pairumani-4352-Braxton-4035', 4352, 774937, '7HO9165', 0, 2),
(122, 414229, '2021-03-24', 60139, 2, 2, 'Pairumani-4353-Reflector-4059', 4353, 244475, '7HO12105', 0, 2),
(123, 414230, '2021-04-13', 60194, 2, 2, 'Pairumani-4354-Wonka-4224', 4354, 318415, '7HO12175', 0, 2),
(124, 414231, '2021-04-20', 60153, 3, 2, 'Pairumani-4356-Doc-4226', 4356, 414198, '250HO12961', 0, 2),
(125, 414279, '2021-05-25', 60170, 2, 2, 'Pairumani-4362-Doc-4143', 4362, 368878, '250HO12961', 0, 2),
(126, 414299, '2021-06-09', 60180, 7, 2, 'Pairumani-4367-Reflector-4074', 4367, 222620, '7HO12105', 0, 2),
(127, 414336, '2021-07-13', 60213, 3, 2, 'Pairumani-4369-Zamboni-4244', 4369, 348072, '7HO12837', 0, 2),
(128, 414337, '2021-07-16', 60211, 2, 2, 'Pairumani-4370-BanjoP-4214', 414337, 315976, '7HO14694', 0, 2),
(129, 414339, '2021-07-19', 60209, 2, 2, 'Pairumani-4372-BanjoP-4052', 4372, 244407, '7HO14694', 0, 2),
(130, 414376, '2021-07-30', 60221, 2, 2, 'Pairumani-4373-Morgan-4241', 4373, 414197, '7HO11383', 0, 2),
(131, 414377, '2021-08-01', 60224, 2, 2, 'Pairumani-4374-Morgan-4215', 4374, 315977, '7HO11383', 0, 2),
(132, 414379, '2021-08-13', 60233, 1, 2, 'Pairumani-4376-Hause-4202', 4376, 368880, '7HO12978', 0, 2),
(133, 414381, '2021-08-18', 60227, 3, 2, 'Pairumani-4378-BanjoP-4146', 4378, 272723, '7HO14694', 0, 2),
(134, 414391, '2021-08-25', 60241, 3, 2, 'Pairumani-4379-Kingpin-4044', 4379, 775003, '7HO12228', 0, 2),
(135, 414392, '2021-09-18', 60253, 1, 2, 'Pairumani-4380-Trilogy-4060', 4380, 277165, '7HO14439', 0, 2),
(136, 414393, '2021-09-19', 60247, 2, 2, 'Pairumani-4381-Scenario-3882', 4381, 773153, '7HO12615', 0, 2),
(137, 414476, '2021-09-26', 60259, 1, 2, 'Pairumani-4382-Bradnick-4255', 4382, 368715, '7HO10999', 0, 2),
(138, 414477, '2021-09-27', 60262, 2, 2, 'Pairumani-4383-Bradnick-4256', 4383, 368716, '7HO10999', 0, 2),
(139, 414478, '2021-09-27', 60262, 2, 2, 'Pairumani-4384-Bradnick-4256', 4384, 368716, '7HO10999', 0, 2),
(140, 414480, '2021-10-08', 60263, 3, 2, 'Pairumani-4386-Reflector-4000', 4386, 774411, '7HO12105', 0, 2),
(141, 414482, '2021-10-17', 60266, 3, 2, 'Pairumani-4388-Kingpin-4204', 4388, 283008, '7HO12228', 0, 2),
(142, 414483, '2021-10-17', 60270, 1, 2, 'Pairumani-4389-Kingpin-4160', 4389, 272843, '7HO12228', 0, 2),
(143, 431041, '2020-03-01', 57884, 1, 2, 'Pairumani-4281-Chrome-3997', 4281, 774327, '7HO12464', 0, 2),
(144, 431042, '2020-03-01', 57887, 2, 2, 'Pairumani-4282-Reflector-4167', 4282, 272875, '7HO12105', 0, 2),
(145, 431045, '2020-03-18', 57895, 3, 2, 'Pairumani-4285-Deceiver-4173', 4285, 277176, '7HO12115', 0, 2),
(146, 431046, '2020-03-18', 57898, 3, 2, 'Pairumani-4286-Wonka-4146', 4286, 272723, '7HO12175', 0, 2),
(147, 431051, '2020-03-31', 58505, 1, 2, 'Pairumani-4291-Chrome-4030', 4291, 774782, '7HO12464', 0, 2),
(148, 431079, '2020-05-08', 58527, 3, 2, 'Pairumani-4297-Deceiver-4179', 4279, 277231, '7HO12115', 0, 2),
(149, 431082, '2020-05-18', 58533, 3, 2, 'Pairumani-4300-Doc-3979', 4300, 277171, '250HO12961', 0, 2),
(150, 431131, '2020-05-27', 58545, 3, 2, 'Pairumani-4303-Doc-4021', 4303, 774753, '250HO12961', 0, 2),
(151, 431132, '2020-06-07', 58555, 2, 2, 'Pairumani-4304-Loyalty-4185', 4304, 277257, '7HO12690', 0, 2),
(152, 431181, '2020-06-23', 431181, 2, 2, 'Pairumani-4305-Scenario-4111', 4305, 368824, '7HO12615', 0, 2),
(153, 431183, '2020-06-28', 431183, 1, 2, 'Pairumani-4307-Braxton-4068', 4307, 222574, '7HO9165', 0, 2),
(154, 431186, '2020-07-07', 58572, 1, 2, 'Pairumani-4310-Loyalty-4176', 4310, 277228, '7HO12690', 0, 2),
(155, 431207, '2020-07-31', 58583, 3, 2, 'Pairumani-4313-Reflector-4089', 4313, 222915, '7HO12105', 0, 2),
(156, 431210, '0020-08-23', 58589, 2, 2, 'Pairumani-4316-Deceiver-4193', 4316, 279395, '7HO12115', 0, 2),
(157, 474845, '2021-11-13', 60283, 2, 2, 'Pairumani-4390-Bradnick-4265', 4390, 368798, '7HO10999', 0, 2),
(158, 474846, '2021-11-13', 60288, 3, 2, 'Pairumani-4391-Morgan-4259', 4391, 368755, '7HO11383', 0, 2),
(159, 474847, '2021-11-16', 60294, 2, 2, 'Pairumani-4392-Zamboni-4254', 4392, 368714, '7HO12837', 0, 2),
(160, 474892, '2021-11-25', 60295, 3, 2, 'Pairumani-4393-Zamboni-4266', 4393, 414200, '7HO12837', 0, 2),
(161, 474893, '2021-11-27', 60293, 3, 2, 'Pairumani-4394-Reflector-4158', 4394, 272836, '507HO12105', 0, 2),
(162, 474895, '2021-12-13', 61802, 3, 2, 'Pairumani-4396-Bradnick-4262', 4396, 368758, '7HO10999', 0, 2),
(163, 474896, '2021-12-17', 60277, 2, 2, 'Pairumani-4397-Zamboni-4251', 4397, 348097, '7HO12837', 0, 2),
(164, 474902, '2021-12-23', 61808, 2, 2, 'Pairumani-4398-BanjoP-4238', 4398, 348034, '7HO14694', 0, 2),
(165, 474903, '2022-01-03', 61816, 3, 2, 'Pairumani-4399-Morgan-4258', 4399, 368754, '7HO11383', 0, 2),
(166, 474905, '2022-01-12', 61831, 3, 2, 'Pairumani-4401-Bradnick-4267', 4401, 368800, '7HO10999', 0, 2),
(167, 474906, '2022-01-24', 61833, 2, 2, 'Pairumani-4402-Zamboni-4277', 4402, 368867, '7HO12837', 0, 2),
(168, 474942, '2019-05-01', 55097, 1, 2, 'Pairumani-4235-Reflector-4077', 4235, 222622, '7HO12105', 0, 2),
(169, 474945, '2019-09-18', 56570, 7, 2, 'Pairumani-4250-Braxton-4101', 4250, 315941, '7HO9165', 0, 2),
(170, 474946, '2020-05-25', 58536, 1, 2, 'Pairumani-4301-Loyalty-4160', 4301, 272843, '7HO12690', 0, 2),
(171, 474950, '2020-10-09', 59613, 2, 2, 'Pairumani-4324-Refelctor-4177', 4324, 277229, '7HO12105', 0, 2),
(172, 474952, '2020-03-07', 57886, 1, 2, 'Pairumani-4284-Chrome-3960', 4284, 774053, '7HO12464', 0, 2),
(173, 474953, '2020-04-01', 58502, 2, 2, 'Pairumani-4293-Chrome-3987', 4293, 774193, '7HO12464', 0, 2),
(174, 474961, '2022-01-28', 61837, 1, 2, 'Pairumani-4403-Reflector-4212', 4403, 315974, '7HO12105', 0, 2),
(175, 474962, '2022-02-01', 61839, 3, 2, 'Pairumani-4404-Reflector-4086', 4404, 222913, '7HO12105', 0, 2),
(176, 474963, '2022-02-01', 61832, 2, 2, 'Pairumani-4405-House-4004', 4405, 774463, '7HO12978', 0, 2),
(177, 474964, '2022-02-09', 61844, 3, 2, 'Pairumani-4406-Wonka-4245', 4406, 348073, '7HO12175', 0, 2),
(178, 474965, '2022-02-17', 61845, 2, 2, 'Pairumani-4407-Morgan-4248', 4407, 348076, '7HO11383', 0, 2),
(179, 474966, '2022-02-21', 61846, 1, 2, 'Pairumani-4408-Zamboni-4284', 4408, 431044, '7HO12837', 0, 2),
(180, 474979, '2022-03-01', 61853, 2, 2, 'Pairumani-4409-Morgan-4293', 4409, 474953, '7HO11383', 0, 2),
(181, 474880, '2022-03-22', 61870, 1, 2, 'Pairumani-4410-Braxton-4198', 4410, 414006, '7HO9165', 0, 2),
(182, 490231, '2022-12-01', 62751, 2, 2, 'Pairumani-4450-Braxton-4035', 4450, 774937, '7HO9165', 0, 2),
(183, 490232, '2022-12-03', 62750, 3, 2, 'Pairumani-4451-Morgan-4262', 4451, 368758, '7HO11383', 0, 2),
(184, 490233, '2022-12-07', 62754, 2, 2, 'Pairumani-4452-LusterP-4325', 4452, 414018, '7HO14160', 0, 2),
(185, 503882, '2022-12-28', 62765, 3, 2, 'Pairumani-4453-Zamboni-4303', 4453, 431131, '7HO12837', 0, 2),
(186, 503883, '2022-12-29', 62776, 3, 2, 'Pairumani-4454-Pharo-4258', 4454, 368754, '250HO12975', 0, 2),
(187, 503884, '2022-12-29', 62773, 2, 2, 'Pairumani-4455-Zamboni-4331', 4455, 414097, '7HO12837', 0, 2),
(188, 503885, '2022-12-30', 62769, 2, 2, 'Pairumani-4456-Morgan-4277', 4456, 368867, '7HO11383', 0, 2),
(189, 503888, '2023-01-24', 62785, 2, 2, 'Pairumani-4460-Pharo-4059', 4460, 244475, '250HO12975', 0, 2),
(190, 503903, '2020-03-30', 57894, 3, 2, 'Pairumani-4290-KingTut-4066', 4290, 222539, '7HO12726', 0, 2),
(191, 503909, '2023-01-26', 62788, 1, 2, 'Pairumani-4461-Pharo-4212', 4461, 315974, '250HO12975', 0, 2),
(192, 503910, '2023-01-28', 62793, 3, 2, 'Pairumani-4462-Pharo-4257', 4462, 414195, '250HO12975', 0, 2),
(193, 503911, '2023-02-06', 62797, 3, 2, 'Pairumani-4463-Pharo-4144', 4463, 414192, '250HO12975', 0, 2),
(194, 503912, '2023-02-13', 63905, 3, 2, 'Pairumani-4464-Morgan-4334', 4464, 414100, '7HO11383', 0, 2),
(195, 503913, '2023-02-15', 63903, 3, 2, 'Pairumani-4465-Morgan-4326', 4465, 414057, '7HO11383', 0, 2),
(196, 503914, '2023-02-20', 63913, 1, 2, 'Pairumani-4466-Pharo-4202', 4466, 368880, '250HO12975', 0, 2),
(197, 503919, '2023-02-24', 63909, 3, 2, 'Pairumani-4467-LusterP-4294', 4467, 503907, '7HO14160', 0, 2),
(198, 503920, '2023-02-25', 63917, 2, 2, 'Pairumani-4468-Morgan-4293', 4468, 474953, '7HO11383', 0, 2),
(199, 503921, '2023-02-26', 63915, 3, 2, 'Pairumani-4469-Morgan-4123', 4469, 230060, '7HO11383', 0, 2),
(200, 503922, '2023-03-01', 63923, 2, 2, 'Pairumani-4470-Morgan-4335', 4470, 414136, '7HO11383', 0, 2),
(201, 503923, '2023-03-06', 63924, 3, 2, 'Pairumani-4471-LusterP-4328', 4471, 414059, '7HO14160', 0, 2),
(202, 503924, '2023-03-16', 63928, 1, 2, 'Pairumani-4472-Morgan-4336', 4472, 414137, '7HO11383', 0, 2),
(203, 503925, '0003-02-21', 63929, 2, 2, 'Pairumani-4473-Morgan-4316', 4473, 431210, '7HO11383', 0, 2),
(204, 521758, '2022-03-26', 61868, 2, 2, 'Pairumani-4411-House-4224', 4411, 318415, '7HO12978', 0, 2),
(205, 521759, '2022-04-01', 61873, 1, 2, 'Pairumani-4253-Zamboni-4253', 4412, 474951, '7HO12837', 0, 2),
(206, 521760, '2022-04-15', 61886, 2, 2, 'Pairumani-4413-Zamboni-4217', 4413, 368864, '7HO12837', 0, 2),
(207, 521761, '2022-04-18', 61887, 3, 2, 'Pairumani-4414-BanjoP-4217', 4414, 315979, '7HO14694', 0, 2),
(208, 521762, '2022-04-21', 61891, 3, 2, 'Pairumani-4415-Bradnick-4286', 4415, 431046, '7HO10999', 0, 2),
(209, 521763, '2022-04-23', 61888, 1, 2, 'Pairumani-4416-Morgan-4048', 4416, 244346, '7HO11383', 0, 2),
(210, 521788, '2022-05-28', 62620, 1, 2, 'Pairumani-4424-Morgan-4279', 4424, 202999, '507HO11383', 0, 2),
(211, 521789, '2022-06-05', 62621, 2, 2, 'Pairumani-4426-House-4143', 4426, 368878, '507HO12978', 0, 2),
(212, 521790, '2022-06-15', 62630, 1, 2, 'Pairumani-4427-Zamboni-4299', 4427, 431081, '507HO12837', 0, 2),
(213, 521791, '2022-06-22', 62636, 2, 2, 'Pairumani-4428-Zamboni-4305', 4428, 431181, '507HO12837', 0, 2),
(214, 521803, '2022-04-27', 61897, 1, 2, 'Pairumani-4418-Morgan-4287', 4418, 431047, '7HO11383', 0, 2),
(215, 521804, '2022-04-29', 62601, 3, 2, 'Pairumani-4419-Trilogy-4124', 4419, 368840, '7HO14439', 0, 2),
(216, 521805, '2022-05-06', 62603, 1, 2, 'Pairumani-4420-Zamboni-4147', 4420, 368842, '7HO12837', 0, 2),
(217, 521806, '2022-05-19', 62616, 2, 2, 'Pairumani-4422-Morgan-4282', 4422, 431042, '7HO11383', 0, 2),
(218, 521807, '2022-05-22', 521807, 3, 2, 'Pairumani-4423-Morgan-4297', 4423, 431079, '7HO11383', 0, 2),
(219, 521865, '2022-08-08', 62667, 2, 2, 'Pairumani-4431-Braxton-4141', 4431, 230418, '7HO9165', 0, 2),
(220, 521866, '2022-08-15', 62673, 1, 2, 'Pairumani-4432-Zamboni-4291', 4432, 431051, '7HO12837', 0, 2),
(221, 521867, '2022-08-16', 62671, 3, 2, 'Pairumani-4433-Zamboni-4312', 4433, 431206, '7HO12837', 0, 2),
(222, 521894, '2022-09-19', 62745, 2, 2, 'Pairumani-4435-Morgan-4256', 4435, 368716, '7HO11383', 0, 2),
(223, 521895, '2022-09-20', 62691, 3, 2, 'Pairumani-4436-Zamboni-4313', 7, 431207, '7HO12837', 0, 2),
(224, 521896, '2022-09-25', 62689, 2, 2, 'Pairumani-4437-House-4033', 4437, 414004, '7HO12978', 0, 2),
(225, 521938, '2022-09-30', 6269, 3, 2, 'Pairumani-4438-Zamboni-4314', 4438, 431208, '7HO12837', 0, 2),
(226, 521939, '2022-10-04', 63695, 3, 2, 'Pairumani-4439-Zamboni-4308', 4439, 431184, '7HO12837', 0, 2),
(227, 521940, '2022-10-06', 62699, 1, 2, 'Pairumani-4440-Zamboni-4306', 4440, 431182, '7HO12837', 0, 2),
(228, 521941, '2022-10-08', 62703, 2, 2, 'Pairumani-4441-Pharo-4241', 4441, 414197, '250HO12975', 0, 2),
(229, 521942, '2022-10-24', 62716, 1, 2, 'Pairumani-4442-Pharo-4162', 4442, 272848, '250HO12975', 0, 2),
(230, 521979, '2022-11-15', 62726, 3, 2, 'Pairumani-4444-Morgan-4278', 4444, 202998, '7HO11383', 0, 2),
(231, 521980, '2022-11-16', 62738, 2, 2, 'Pairumani-4445-Pharo-4214', 4445, 474943, '250HO12975', 0, 2),
(232, 521981, '2022-11-17', 62730, 3, 2, 'Pairumani-4446-Morgan-4317', 4446, 431241, '7HO11383', 0, 2),
(233, 521983, '2022-11-18', 62732, 3, 2, 'Pairumani-4448-Morgan-4321', 4448, 414014, '7HO11383', 0, 2),
(234, 521984, '2022-11-21', 62748, 2, 2, 'Pairumani-4449-LusterP-4324', 4449, 474950, '7HO14160', 0, 2),
(235, 539034, '2023-03-28', 63949, 2, 2, 'Pairumani-4475-Pharo-4270', 4475, 368863, '250HO12975', 0, 2),
(236, 539035, '2023-04-01', 63940, 2, 2, 'Pairumani-4476-Pharo-4096', 4476, 222984, '250HO12975', 0, 2),
(237, 539036, '2023-04-09', 63948, 1, 2, 'Pairumani-4477-LusterP-4307', 4477, 431183, '7HO14160', 0, 2),
(238, 539037, '2023-04-11', 63953, 1, 2, 'Pairumani-4478-Zamboni-4310', 4478, 431186, '7HO12837', 0, 2),
(239, 539038, '2023-04-11', 63954, 2, 2, 'Pairumani-4479-Pharo-4224', 4479, 318415, '250HO12975', 0, 2),
(240, 539039, '2023-04-15', 63966, 2, 2, 'Pairumani-4480-Pharo-4304', 4480, 431132, '250HO12975', 0, 2),
(241, 539068, '2023-04-28', 63971, 2, 2, 'Pairumani-4481-LusterP-4282', 4481, 431042, '7HO14160', 0, 2),
(242, 539069, '2023-05-01', 63969, 3, 2, 'Pairumani-4482-LusterP-4343', 4482, 414144, '7HO14160', 0, 2),
(243, 539070, '2023-05-03', 63970, 2, 2, 'Pairumani-4483-LusterP-4271', 4483, 368864, '7HO14160', 0, 2),
(244, 539081, '2023-03-01', 539081, 3, 2, 'Pairumani-4484-Pharo-4000', 4484, 503902, '250HO12975', 0, 2),
(245, 539082, '2023-06-05', 63994, 2, 2, 'Pairumani-4485-Pharo-4238', 4485, 348034, '50HO12975', 0, 2),
(246, 539083, '2023-06-07', 63993, 3, 2, 'Pairumani-4486-Morgan-4330', 4486, 414096, '7HO11383', 0, 2),
(247, 539138, '2023-06-23', 64701, 1, 2, 'Pairumani-4487-Morgan-4337', 4487, 414138, '7HO11383', 0, 2),
(248, 539139, '2023-06-30', 64704, 1, 2, 'Pairumani-4488-Morgan-4322', 4488, 414015, '7HO11383', 0, 2),
(249, 539140, '2023-07-07', 64705, 2, 2, 'Pairumani-4489-LusterP-4265', 4489, 368723, '7HO14160', 0, 2),
(250, 539141, '2023-07-08', 64716, 3, 2, 'Pairumani-4490-Pharo-4023', 4490, 774830, '250HO12975', 0, 2),
(251, 539143, '2023-07-16', 64722, 1, 2, 'Pairumani-4492-LusterP-4301', 4492, 474946, '7HO14160', 0, 2),
(252, 539144, '2023-07-19', 64723, 3, 2, 'Pairumani-4493-Morgan-4341', 4493, 414142, '7HO11383', 0, 2),
(253, 539168, '2023-07-26', 64727, 1, 2, 'Pairumani-4494-LusterP-4291', 4494, 431051, '7HO14160', 0, 2),
(254, 539170, '2023-08-06', 64741, 1, 2, 'Pairumani-4496-LusterP-4347', 4496, 414177, '7HO14160', 0, 2),
(255, 539171, '2023-08-07', 64738, 7, 2, 'Pairumani-4497-LusterP-4362', 4497, 414179, '7HO14160', 0, 2),
(256, 539172, '2023-08-21', 64749, 2, 2, 'Pairumani-4498-LusterP-4209', 4498, 283090, '7HO14160', 0, 2),
(257, 539205, '2023-09-08', 64754, 2, 2, 'Pairumani-4499-LusterP-4241', 4499, 414197, '7HO14160', 0, 2),
(258, 539209, '2023-09-11', 64762, 2, 2, 'Pairumani-4500-Pharo-4338', 4500, 414139, '250HO12975', 0, 2),
(259, 539210, '2023-09-20', 64763, 1, 2, 'Pairumani-4501-Logistics-4255', 4501, 368715, '250HO15208', 0, 2),
(260, 539211, '2023-09-21', 64756, 2, 2, 'Pairumani-4502-LusterP-4372', 4502, 414339, '7HO14160', 0, 2),
(261, 539212, '2023-09-22', 64761, 3, 2, 'Pairumani-4503-LusterP-4359', 4503, 414277, '7HO14160', 0, 2),
(262, 539214, '2023-09-25', 64766, 7, 2, 'Pairumani-4505-Logistics-4367', 4505, 414299, '250HO15208', 0, 2),
(263, 539218, '2023-10-03', 64772, 2, 2, 'Pairumani-4506-Logistics-4305', 4506, 431181, '250HO15208', 0, 2),
(264, 539219, '2023-10-03', 64776, 2, 2, 'Pairumani-4507-Roadster-4373', 4507, 414376, '250HO15026', 0, 2),
(265, 539220, '2023-10-05', 64778, 3, 2, 'Pairumani-4508-Pharo-4313', 4508, 431207, '250HO12975', 0, 2),
(266, 539229, '2023-12-28', 64632, 1, 2, 'Pairumani-4516-Logistics-4162', 4516, 272848, '250HO15208', 0, 2),
(267, 539230, '2024-01-01', 64634, 2, 2, 'Pairumani-4517-Roadster-4354', 4517, 414230, '250HO15026', 0, 2),
(268, 539258, '2023-10-25', 64788, 1, 2, 'Pairumani-4509-Logistics-4375', 4509, 414378, '250HO15208', 0, 2),
(269, 539259, '2023-10-26', 64789, 3, 2, 'Pairumani-4510-Logistics-4217', 4510, 315979, '250HO15208', 0, 2),
(270, 539260, '2023-11-02', 64793, 3, 2, 'Pairumani-4511-Logistics-4226', 4511, 414198, '250HO15208', 0, 2),
(271, 539261, '2023-11-07', 64792, 2, 2, 'Pairumani-4512-Logistics-4349', 4512, 414201, '250HO15208', 0, 2),
(272, 539262, '2023-11-09', 64603, 1, 2, 'Pairumani-4513-Roadster-4380', 4513, 414292, '250HO15026', 0, 2),
(273, 539263, '2023-11-17', 64799, 3, 2, 'Pairumani-4514-Logistics-4184', 4514, 277256, '250HO15208', 0, 2),
(274, 539270, '2023-12-03', 64618, 3, 2, 'Pairumani-4515-Roadster-4369', 4515, 414336, '250HO15026', 0, 2),
(275, 539278, '2020-02-24', 539278, 3, 2, 'Pairumani-4279-KingTut-4119', 4279, 315954, '7HO12627', 0, 2),
(276, 539279, '2019-10-02', 56583, 1, 2, 'Pairumani-4253-Kenosha-4122', 4253, 230054, '7HO12773', 0, 2),
(277, 539280, '2022-12-30', 62775, 3, 2, 'Pairumani-4457-Zamboni-4283', 4457, 431043, '7HO12837', 0, 2),
(278, 539281, '2022-11-01', 621712, 3, 2, 'Pairumani-4443-Braxton-4226', 4443, 414198, '7HO9165', 0, 2),
(279, 539282, '2019-10-30', 57806, 3, 2, 'Pairumani-4259-Reflector-4148', 4259, 272725, '7HO12105', 0, 2),
(280, 539283, '2020-03-19', 57891, 1, 2, 'Pairumani-4287-Deceiver-4163', 4287, 272849, '7HO12115', 0, 2),
(281, 539284, '2021-03-14', 60132, 2, 2, 'Pairumani-4350-Wonka-4213', 4350, 315975, '7HO12175', 0, 2),
(282, 539285, '2020-09-29', 59615, 1, 2, 'Pairumani-4320-Doc-4195', 4320, 279397, '7HO12961', 0, 2),
(283, 539286, '2021-01-05', 59700, 3, 2, 'Pairumani-4339-Kingpin-4023', 4339, 774830, '7HO12228', 0, 2),
(284, 539287, '2021-02-16', 60120, 1, 2, 'Pairumani-4347-Loyalty-4212', 4347, 315974, '7HO12690', 0, 2),
(285, 539288, '2021-08-07', 60216, 1, 2, 'Pairumani-4375-BanjoP-4051', 4375, 244406, '7HO14694', 0, 2),
(286, 539289, '2017-08-01', 53656, 2, 2, 'Pairumani-4143-Brokaw-3806', 4143, 13634, '7HO11118', 0, 2),
(287, 539290, '2022-07-16', 62650, 2, 2, 'Pairumani-4409-House-4209', 4429, 283090, '7HO12978', 0, 2),
(288, 539291, '2021-11-28', 60292, 2, 2, 'Pairumani-4395-Reflector-4096', 4395, 222984, '7HO12105', 0, 2),
(289, 539292, '2022-09-08', 62686, 1, 2, 'Pairumani-4434-Zamboni-4311', 4434, 431187, '7HO12837', 0, 2),
(290, 774463, '2015-02-10', 45230, 2, 2, 'Pairumani-4004-Graybil-3432', 4004, 10022, '7HO8444', 0, 2),
(291, 774937, '2015-09-23', 46596, 2, 2, 'Pairumani-4035-Sterling-3760', 4035, 13152, '7HO1158', 0, 2),
(292, 539142, '2023-07-13', 64719, 2, 2, 'Pairumani-4491-Morgan-4351', 4491, 414203, '7HO11383', 0, 2),
(293, 204311, '2013-10-18', 0, 4, 2, 'MontaÃ±o-Lulu', 0, 0, '0', 0, 7),
(294, 204326, '2016-02-10', 0, 4, 2, 'MontaÃ±o-Reynalda', 0, 0, '0', 0, 7),
(295, 204330, '2015-08-20', 0, 4, 2, 'MontaÃ±o-Ale-Chap-Angelica', 0, 204313, '0', 0, 7),
(296, 204336, '2016-04-27', 0, 4, 2, 'MontaÃ±o-Linda-Brisco-Lusrdes', 0, 204320, '0', 0, 7),
(297, 204342, '2016-11-16', 0, 4, 2, 'MontaÃ±o-Rosa-Chap-Roberta', 0, 204310, '0', 0, 7),
(298, 204476, '2016-12-04', 52501, 1, 2, 'MontaÃ±o-Marcia-Distance-Marcela', 0, 204321, '1HO10282', 0, 7),
(299, 204479, '2016-12-25', 52502, 1, 2, 'MontaÃ±o-Modesta-Sajac-Monica', 0, 204315, '1HO10497', 0, 7),
(300, 272738, '2013-01-11', 0, 4, 2, 'MontaÃ±o-Sandra', 0, 0, '0', 0, 7),
(301, 277179, '2018-03-01', 52524, 1, 2, 'MontaÃ±o-Rebeca-Mink-Roberta', 0, 204310, '1HO10690', 0, 7),
(302, 277212, '2018-03-14', 52569, 4, 2, 'MontaÃ±o-Issa', 0, 277211, '0', 0, 7),
(303, 277253, '2018-05-12', 52532, 1, 2, 'MontaÃ±o-Mery-Kenyon-Monica', 0, 204315, '7HO12769', 0, 7),
(304, 279369, '2018-06-29', 52543, 1, 2, 'MontaÃ±o-Anita-RudolphRed-Ale', 0, 204330, '7HO11497', 0, 7),
(305, 283003, '2018-09-23', 52548, 1, 2, 'MontaÃ±o-Lucia-Dresser-Luna', 0, 204303, '7HO12177', 0, 7),
(306, 283056, '2018-10-31', 52555, 1, 2, 'MontaÃ±o-Patricia-RagerRed-Pascuala', 0, 272737, '7HO12344', 0, 7),
(307, 315980, '2018-12-17', 52560, 1, 2, 'MontaÃ±o-Any-Dresser-Antonieta', 0, 204325, '7HO12177', 0, 7),
(308, 315981, '2019-01-03', 52566, 1, 2, 'MontaÃ±o-Renata-Heisenberg-Reyna', 0, 204328, '7HO12569', 0, 7),
(309, 347906, '2019-05-18', 52578, 1, 2, 'MontaÃ±o-Rafaela-KingTut-Roberta', 0, 204310, '7HO12726', 0, 7),
(310, 347974, '2019-06-17', 52580, 1, 2, 'MontaÃ±o-Mabel-Kenosha-Monica', 0, 204315, '7HO12773', 0, 7),
(311, 348068, '2019-08-06', 52583, 1, 2, 'MontaÃ±o-Susana-Doctor-Satuca', 0, 272739, '250HO11953', 0, 7),
(312, 348069, '2019-08-08', 52584, 1, 2, 'MontaÃ±o-Luciana-KingTut-Lupe', 0, 230046, '7HO12726', 0, 7),
(313, 368707, '2019-10-06', 52594, 1, 2, 'MontaÃ±o-Raquel-Chrome-Raynalda', 0, 204326, '7HO12464', 0, 7),
(314, 368717, '2019-11-15', 368717, 1, 2, 'MontaÃ±o-Eliza-Chrome-Eva', 0, 204319, '7HO12464', 0, 7),
(315, 414301, '2021-05-30', 58194, 1, 1, 'MontaÃ±o-Carlita-Bankit-Camila', 0, 204322, '7BS909', 0, 7),
(316, 414319, '2021-06-30', 58199, 1, 1, 'MontaÃ±o-Iris-Banckit-Issa', 0, 277212, '7BS909', 0, 7),
(317, 431022, '2020-04-19', 58134, 1, 2, 'MontaÃ±o-Regina-Kingpin-Reyna', 0, 204328, '7HO12228', 0, 7),
(318, 431025, '2020-05-20', 58137, 1, 2, 'MontaÃ±o-Rita-Reflector-Roberta', 0, 204310, '7HO12105', 0, 7),
(319, 431076, '2020-03-24', 58126, 1, 2, 'MontaÃ±o-Margarita-Bradnick-Mercedes', 0, 204324, '7HO10999', 0, 7),
(320, 431095, '2020-06-19', 58142, 1, 2, 'MontaÃ±o-Emma-Butler-Elena', 0, 204307, '7HO12195', 0, 7),
(321, 431244, '2020-08-30', 58158, 1, 2, 'MontaÃ±o-Telma-Scenario-Tatiana', 0, 204316, '7HO12615', 0, 7),
(322, 431245, '2020-08-31', 58149, 1, 2, 'MontaÃ±o-Sarita-CrownRed-Casandra', 0, 272738, '7HO14460', 0, 7),
(323, 431246, '2020-09-16', 58160, 1, 2, 'MontaÃ±o-Lola-Scenario-Laura', 0, 279320, '7HO12615', 0, 7),
(324, 474908, '2021-12-13', 61123, 1, 2, 'MontaÃ±o-Lidia-Mick-Linda', 0, 204336, '250HO14407', 0, 7),
(325, 503864, '2022-12-25', 65222, 1, 2, 'MontaÃ±o-Isabel-Thoreau-Issa', 0, 277212, '250HO12128', 0, 7),
(326, 503865, '2023-01-04', 61183, 1, 2, 'MontaÃ±o-Lucresia-Tomek-Lucia', 0, 283003, '7HO12657', 0, 7),
(327, 503866, '2023-01-07', 61184, 1, 2, 'MontaÃ±o-Luisa-ZkePRed-Lurdes', 0, 204320, '7HO13921', 0, 7),
(328, 503867, '2023-04-14', 61186, 1, 2, 'MontaÃ±o-Rosalia-Premium-Rosa', 0, 204342, '7HO13262', 0, 7),
(329, 503870, '2023-05-06', 65014, 1, 3, 'MontaÃ±o-Camila-Chauncy-Carlita', 0, 414301, '7JE1598', 0, 7),
(330, 503926, '2023-03-24', 61195, 1, 2, 'MontaÃ±o-Marisol-RainyRed-Mabel', 0, 347974, '250HO15316', 0, 7),
(331, 521868, '2022-08-23', 61157, 1, 2, 'MontaÃ±o-Albina-ZekePRed-Antonieta', 0, 204325, '7HO13921', 0, 7),
(332, 521928, '2022-10-15', 61171, 1, 2, 'MontaÃ±o-Mirian-RustyRed-Mery', 0, 277253, '7HO13826', 0, 7),
(333, 521929, '2022-10-16', 61170, 1, 2, 'MontaÃ±o-Ruby-Pharo-Rafaela', 0, 347906, '250HO12975', 0, 7),
(334, 521962, '2022-12-18', 65219, 1, 2, 'MontaÃ±o-Beatriz-Thoreau-Bonita', 0, 204334, '250HO12128', 0, 7),
(335, 539041, '2023-04-19', 61199, 1, 1, 'MontaÃ±o-Romina-Tank-Reynalda', 0, 204326, '9BS00924', 0, 7),
(336, 539084, '2023-05-22', 65012, 1, 2, 'MontaÃ±o-Ely-House-Elena', 0, 204311, '7HO12978', 0, 7),
(337, 539289, '2023-08-24', 65213, 1, 2, 'MontaÃ±o-Roberta-Tomek-Rita', 0, 431025, '7HO12657', 0, 7),
(338, 230404, '2017-04-28', 0, 4, 2, 'ViÃ±a-Eurora-Maycol-Cuatro', 0, 230376, '0', 0, 18),
(339, 272811, '2017-11-16', 54405, 4, 2, 'ViÃ±a-Lidia', 0, 230394, 'MAYCOL', 0, 18),
(340, 279500, '2018-10-12', 54494, 4, 2, 'ViÃ±a-Faby', 0, 279498, '0', 0, 18),
(341, 283059, '2016-04-24', 0, 4, 2, 'ViÃ±a-Carmen', 0, 0, '0', 0, 18),
(342, 315994, '2016-07-18', 0, 4, 2, 'ViÃ±a-Maritza', 0, 0, '0', 0, 18),
(343, 315995, '2016-07-20', 0, 4, 2, 'ViÃ±a-Julieta', 0, 0, '0', 0, 18),
(344, 318412, '2019-03-22', 54462, 1, 2, 'ViÃ±a-Lola-Wonka-Sheila', 0, 230405, '7HO12175', 0, 18),
(345, 318418, '2019-03-04', 54460, 3, 2, 'ViÃ±a-Linda-Wonka-SinaÃ­', 0, 773481, '7HO12175', 0, 18),
(346, 318419, '2019-03-05', 54466, 1, 2, 'ViÃ±a-Beni-Horizon-319', 0, 774245, '11HO11417', 0, 18),
(347, 318420, '2019-03-15', 54468, 1, 2, 'ViÃ±a-Luna-Petrone-Anita', 0, 230401, '7HO11169', 0, 18),
(348, 347914, '2019-04-29', 54483, 3, 2, 'ViÃ±a-Abril-Wonka-SinaiII', 0, 230397, '7HO12175', 0, 18),
(349, 348008, '2019-06-12', 54486, 1, 2, 'ViÃ±a-Nicol-Petrone-SorayaII', 0, 230403, '7HO11169', 0, 18),
(350, 348009, '2019-06-18', 54490, 1, 2, 'ViÃ±a-Dennis-Petrone-Quilla', 0, 272752, '7HO11169', 0, 18),
(351, 348010, '2019-06-22', 54488, 1, 2, 'ViÃ±a-Kingtut-Jhovana', 0, 230392, '7HO12726', 0, 18),
(352, 348011, '2019-07-12', 54492, 1, 2, 'ViÃ±a-Jhuli-Kenyon-Nueve', 0, 230381, '7HO12769', 0, 18),
(353, 348026, '2019-07-28', 54495, 1, 2, 'ViÃ±a-Turna-Kenyon-Blanca', 0, 230386, '7HO12769', 0, 18),
(354, 368721, '2019-10-12', 57505, 1, 2, 'ViÃ±a-Marguy-Kenyon-Andrea', 0, 230399, '7HO12769', 0, 18),
(355, 368787, '2019-12-08', 57515, 1, 2, 'ViÃ±a-Teresa-Kenyon-Margarita', 0, 230400, '7HO12769', 0, 18),
(356, 413039, '2020-10-07', 57566, 1, 3, 'ViÃ±a-Chusa-Albion-Faby', 0, 279500, '7JE1620', 0, 18),
(357, 414150, '2021-02-07', 57587, 1, 2, 'ViÃ±a-Luz-RagerRed-Cinthia', 0, 272754, '7HO12344', 0, 18),
(358, 414189, '2021-03-12', 57591, 1, 2, 'ViÃ±a-Betty-Morgan-Beni', 0, 318419, '507HO11383', 0, 18),
(359, 414268, '2021-06-10', 60807, 1, 2, 'ViÃ±a-Pamela-Morgan-Dennis', 0, 348009, '507HO11383', 0, 18),
(360, 414329, '2021-07-07', 60814, 1, 2, 'ViÃ±a-Lurdes-Morgan-Nicol', 0, 348008, '507HO11383', 0, 18),
(361, 414346, '2021-07-21', 60818, 1, 2, 'ViÃ±a-Gloria-Morgan-Gladi', 0, 348010, '507HO11383', 0, 18),
(362, 414347, '2021-07-24', 60821, 1, 2, 'ViÃ±a-Gilda-Deceiver-Jhuli', 0, 348011, '507HO12115', 0, 18),
(363, 414348, '2021-07-29', 60823, 1, 2, 'ViÃ±a-Anahi-Ascender-Astri', 0, 277268, '7HO12616', 0, 18),
(364, 414492, '2021-10-26', 60834, 1, 2, 'ViÃ±a-Charo-Morgan-Marguy', 0, 368721, '507HO11383', 0, 18),
(365, 414493, '2021-11-17', 60840, 1, 2, 'ViÃ±a-China-Escenario-Juani', 0, 230385, '7HO12615', 0, 18),
(366, 431036, '2017-12-30', 0, 4, 2, 'ViÃ±a-Glotona', 0, 0, '0', 0, 18),
(367, 431141, '0020-06-04', 57554, 1, 2, 'ViÃ±a-Yamel-RagerRed-Quilla', 0, 272752, '7HO12344', 0, 18),
(368, 431192, '2020-08-16', 0, 1, 2, 'ViÃ±a-Kinberli-KingPin-Sule', 0, 431191, '7HO12228', 0, 18),
(369, 474860, '2021-12-11', 60851, 3, 2, 'ViÃ±a-Esther-Ascender-Abril', 0, 347914, '7HO12616', 0, 18),
(370, 474871, '2021-12-16', 60852, 1, 2, 'ViÃ±a-Lucha-LusterP-Nissan', 0, 368786, '507HO14160', 0, 18),
(371, 474918, '2021-12-24', 60858, 1, 2, 'ViÃ±a-Kati-Ascender-Andrea', 0, 230399, '7HO12616', 0, 18),
(372, 474919, '2021-12-25', 60857, 1, 2, 'ViÃ±a-Emily-Samuri-Lissa', 0, 368785, '507HO12897', 0, 18),
(373, 474920, '2021-12-30', 608454, 1, 2, 'ViÃ±a-Gladis-Megapower-Faby', 0, 279500, '7JE5011', 0, 18),
(374, 474927, '2022-01-31', 60859, 1, 2, 'ViÃ±a-Dora-Ascender-Julieta', 0, 315995, '7HO12616', 0, 18),
(375, 474982, '2022-02-20', 60863, 1, 2, 'ViÃ±a-Jhane-Samuri-Luana', 0, 431038, '507HO12897', 0, 18),
(376, 474983, '2022-02-23', 60862, 1, 2, 'ViÃ±a-Perla-Samuri-Teresa', 0, 368787, '507HO12897', 0, 18),
(377, 503931, '2023-03-15', 63328, 1, 2, 'ViÃ±a-Pecas-Mick-Lidia', 0, 272811, '550HO14407', 0, 18),
(378, 521717, '2022-04-02', 60869, 3, 2, 'ViÃ±a-Cinda-Ascender-Sinai', 0, 773481, '7HO12616', 0, 18),
(379, 521779, '2022-05-23', 60878, 1, 2, 'ViÃ±a-Lulu-Ascender-Cinthia', 0, 272754, '7HO12616', 0, 18),
(380, 521853, '2022-06-10', 63335, 1, 2, 'ViÃ±a-Vilma-Ascender-Blanca', 0, 230386, '7HO12616', 0, 18),
(381, 521900, '2022-09-28', 60892, 1, 2, 'ViÃ±a-Nora-RustyRed-Jhuli', 0, 348011, '507HO13826', 0, 18),
(382, 521901, '2022-10-04', 60895, 1, 2, 'ViÃ±a-Nancy-Hancok-Kimberli', 0, 431192, '550HO14579', 0, 18),
(383, 521925, '2022-10-20', 63301, 1, 2, 'ViÃ±a-Naomi-Rusty-Red-Nicol', 0, 348008, '507HO13826', 0, 18),
(384, 521926, '2022-10-27', 63302, 1, 3, 'ViÃ±a-Celi-Respect-Chusca', 0, 413039, '507JE1638', 0, 18),
(385, 521971, '2022-11-24', 63307, 1, 2, 'ViÃ±a-Carol-RustyRed-Lola', 0, 318412, '507HO13826', 0, 18),
(386, 521972, '2022-12-12', 63312, 1, 2, 'ViÃ±a-Luzmi-RustyRed-Luz', 0, 414150, '507HO13826', 0, 18),
(387, 521998, '2022-12-13', 63314, 1, 2, 'ViÃ±a-Turca-Tomek-Turna', 0, 348026, '7HO12657', 0, 18),
(388, 522001, '2022-12-25', 63315, 1, 2, 'ViÃ±a-Wala-Tomek-Glotona', 0, 431036, '7HO12657', 0, 18),
(389, 522002, '2023-01-11', 63316, 1, 2, 'ViÃ±a-Leo-Tomek-Luna', 0, 318420, '7HO12657', 0, 18),
(390, 539015, '2023-03-21', 6331, 1, 2, 'ViÃ±a-Iris-Roadster-Julieta', 0, 315995, '250HO15026', 0, 18),
(391, 539016, '2023-04-07', 63334, 1, 2, 'ViÃ±a-Choca-RustyRed-Lily', 0, 414090, '507HO13826', 0, 18),
(392, 539017, '2023-04-15', 6333, 1, 2, 'ViÃ±a-Bea-Hancock-Betty', 0, 414189, '550HO14579', 0, 18),
(393, 539059, '2023-05-16', 63339, 1, 2, 'ViÃ±a-Negra-Bradnick-Juani', 0, 230385, '7HO10999', 0, 18),
(394, 539180, '2023-08-13', 63351, 1, 2, 'ViÃ±a-Rita-Roadster-Lurdes', 0, 414329, '550HO15026', 0, 18),
(395, 539186, '2023-09-05', 63352, 1, 2, 'ViÃ±a-Ilda-LusterP-Charo', 0, 414492, '7HO14160', 0, 18),
(396, 539187, '2023-09-08', 63354, 1, 2, 'ViÃ±a-Paty-Tomek-Gloria', 0, 414346, '7HO12657', 0, 18),
(397, 539188, '2023-09-09', 63353, 1, 2, 'ViÃ±a-Alta-Roadster-Aurora', 0, 230404, '250HO15026', 0, 18),
(398, 539239, '2023-10-22', 63360, 1, 2, 'ViÃ±a-Yesi-Roadster-Jhuli', 0, 348011, '250HO15026', 0, 18),
(399, 539240, '2023-10-27', 63361, 1, 2, 'ViÃ±a-Dany-RainyRed-Dennis', 0, 348009, '250HO15316', 0, 18),
(400, 539246, '2023-12-16', 63369, 1, 3, 'ViÃ±a-Tere-Graduate-Gladis', 0, 474920, '507JE1939', 0, 18),
(401, 539247, '2024-01-06', 63368, 1, 3, 'ViÃ±a-Mega-Respect-Chusa', 0, 413039, '507JE1638', 0, 18),
(402, 539248, '2024-01-16', 63375, 1, 2, 'ViÃ±a-Vero-LusterP-Kati', 0, 474918, '507HO14160', 0, 18),
(403, 539255, '2023-12-08', 63365, 3, 2, 'ViÃ±a-Naty-LusterP-Esther', 0, 474860, '7HO14160', 0, 18),
(404, 539256, '2023-12-09', 63367, 1, 2, 'ViÃ±a-Hade-LusterP-China', 0, 414493, '7HO14160', 0, 18),
(405, 773481, '2013-07-27', 0, 3, 2, 'P.Ancha-SinaÃ­-Search-PÃºrpura', 0, 11674, '7HO11102', 0, 18),
(406, 204378, '2016-09-09', 0, 4, 2, 'C.NiÃ±o-254-McCutchen-16490', 254, 222722, '250HO12155', 0, 6),
(407, 204381, '2016-09-25', 0, 4, 2, 'C.NiÃ±o-257-Beemer-166', 257, 230002, '0', 0, 6),
(408, 204424, '2017-01-07', 0, 4, 2, 'C.NiÃ±o-275-Braxton-16482', 275, 222688, '7HO9165', 0, 6),
(409, 222755, '2014-06-28', 0, 4, 2, 'C.NiÃ±o-119-Headliner-17149', 119, 2222, '7HO11419', 0, 6),
(410, 230015, '2016-05-14', 0, 4, 2, 'C.NiÃ±o-230-PMarty-22', 230, 222714, '0', 0, 6),
(411, 230020, '2016-06-13', 0, 4, 2, 'C.NiÃ±o-236-Geenway-29', 236, 222699, '0', 0, 6),
(412, 230116, '2017-04-27', 0, 4, 2, 'C.NiÃ±o-284-McDougal-16498', 284, 482318, '250HO12155', 0, 6),
(413, 230172, '2017-05-13', 0, 4, 2, 'C.NiÃ±o-286-Reflector-149', 286, 222770, '7HO12105', 0, 6),
(414, 230178, '2017-05-25', 0, 4, 2, 'C.NiÃ±o-292-Reflector-167', 292, 222777, '7HO12105', 0, 6),
(415, 230218, '2017-07-07', 0, 4, 2, 'C.NiÃ±o-303-Sly-17177', 303, 773118, '7HO11485', 0, 6),
(416, 230415, '2017-08-03', 0, 4, 2, 'C.NiÃ±o-308-Branch-181', 308, 222772, '7HO10277', 0, 6),
(417, 230486, '2017-09-08', 0, 4, 2, 'C.NiÃ±o-310-Branch-129', 310, 222759, '7HO10277', 0, 6),
(418, 272866, '2017-12-18', 52635, 4, 2, 'C.NiÃ±o-323-Kiko-21', 323, 222675, '0', 0, 6),
(419, 277227, '2018-04-16', 52976, 4, 2, 'C.NiÃ±o-337', 337, 230002, '0', 0, 6),
(420, 277286, '2018-06-20', 52759, 1, 2, 'C.NiÃ±o-341-Mainevent-156', 341, 222790, '250HO1127', 0, 6),
(421, 277299, '2018-06-25', 52767, 1, 2, 'C.NiÃ±o-344-Sly-203', 344, 222797, '7HO11485', 0, 6),
(422, 277301, '2018-07-11', 52784, 1, 2, 'C.NiÃ±o-347-Guthrie-212', 347, 222808, '7HO9420', 0, 6),
(423, 279430, '2018-07-30', 52809, 1, 2, 'C.NiÃ±o-350-Guthrie-215', 350, 222811, '7HO9420', 0, 6),
(424, 279450, '2018-08-20', 52835, 1, 2, 'C.NiÃ±o-355-Dresser-140', 355, 277193, '7HO12177', 0, 6),
(425, 279488, '2018-09-18', 52868, 1, 2, 'C.NiÃ±o-364-Dresser-93', 364, 222744, '7HO12177', 0, 6),
(426, 279491, '2018-09-28', 52870, 1, 2, 'C.NiÃ±o-367-Kenyon-254', 367, 204378, '7HO12769', 0, 6),
(427, 279494, '2018-10-06', 52883, 1, 2, 'C.NiÃ±o-370-Dresser-239', 370, 230023, '7HO12177', 0, 6),
(428, 283072, '2018-11-18', 52913, 1, 2, 'C.NiÃ±o-372-Braxton-232', 372, 230016, '7HO9165', 0, 6),
(429, 312926, '2018-12-21', 52942, 1, 2, 'C.NiÃ±o-377-Braxton-268', 377, 204392, '7HO9165', 0, 6),
(430, 315913, '2018-11-24', 52919, 1, 2, 'C.NiÃ±o-373-Braxton-264', 373, 204388, '7HO9165', 0, 6),
(431, 315914, '2018-11-26', 52918, 1, 2, 'C.NiÃ±o-374-Wonka-231', 374, 230015, '7HO12175', 0, 6),
(432, 315915, '2018-11-30', 52923, 1, 2, 'C.NiÃ±o-375-Wonka-240', 375, 230024, '7HO12175', 0, 6),
(433, 315933, '2019-01-11', 52940, 1, 2, 'C.NiÃ±o-380-Wonka-229', 380, 230013, '7HO12175', 0, 6),
(434, 315962, '2019-01-29', 52958, 1, 2, 'C.NiÃ±o-382-Kenyon-218', 382, 222813, '7HO12769', 0, 6),
(435, 318410, '2019-03-01', 52975, 1, 2, 'C.NiÃ±o-385-Wonka-192', 385, 222893, '7HO12175', 0, 6),
(436, 318453, '2019-03-20', 52967, 1, 2, 'C.NiÃ±o-387-Kenyon-124', 387, 222766, '7HO12769', 0, 6),
(437, 318456, '2019-04-07', 55313, 4, 2, 'C.NiÃ±o-390', 390, 222666, '0', 0, 6),
(438, 318457, '2019-04-11', 55316, 1, 2, 'C.NiÃ±o-391-Kenyon-52', 391, 277194, '7HO12769', 0, 6),
(439, 318491, '2019-05-01', 55324, 1, 2, 'C.NiÃ±o-395-Kenosha-173', 395, 222830, '7HO12773', 0, 6),
(440, 318492, '2019-05-03', 55325, 1, 2, 'C.NiÃ±o-396-Kenosha-116', 396, 230002, '7HO12773', 0, 6),
(441, 347910, '2019-05-13', 55347, 1, 2, 'C.NiÃ±o-399-RagerRed-286', 399, 230172, '7HO12344', 0, 6),
(445, 347948, '2019-05-15', 55359, 1, 2, 'C.NiÃ±o-400-Kenosha-200', 400, 222801, '7HO12773', 0, 6),
(446, 347950, '2019-05-28', 55349, 1, 2, 'C.NiÃ±o-402-RagerRed-295', 402, 230190, '7HO12344', 0, 6),
(447, 348000, '2019-07-03', 55382, 4, 2, 'C.NiÃ±o-408', 408, 222755, 'CHAVO', 0, 6),
(448, 348001, '2019-07-05', 55375, 1, 2, 'C.NiÃ±o-409-KingTut-156', 409, 222790, '7HO12726', 0, 6),
(449, 348002, '2019-07-07', 55385, 1, 2, 'C.NiÃ±o-410-RagerRed-306', 410, 230413, '7HO12344', 0, 6),
(450, 348066, '2019-08-20', 55416, 1, 2, 'C.NiÃ±o-418-Kenyon-310', 418, 230486, '7HO12769', 0, 6),
(451, 348067, '2019-09-06', 55431, 1, 2, 'C.NiÃ±o-420-Kenosha-318', 420, 272858, '7HO12773', 0, 6),
(452, 368712, '2019-10-11', 55473, 1, 2, 'C.NiÃ±o-424-Sterling-328', 424, 272896, '7HO11585', 0, 6),
(453, 368718, '2019-10-13', 55458, 1, 2, 'C.NiÃ±o-425-Bradnick-314', 425, 230496, '7HO10999', 0, 6),
(454, 368720, '2019-10-14', 55484, 1, 2, 'C.NiÃ±o-427-KingTut-190', 427, 222794, '7HO12726', 0, 6),
(455, 368768, '2019-10-18', 55474, 1, 3, 'C.NiÃ±o-428-Calypso-320', 428, 272860, '7JE1350', 0, 6),
(456, 368770, '2019-10-20', 55485, 1, 2, 'C.NiÃ±o-430-Kenosha-247', 430, 230031, '7HO12773', 0, 6),
(457, 368771, '2019-11-07', 57305, 1, 2, 'C.NiÃ±o-431-Sterling-166', 431, 222832, '7HO1585', 0, 6),
(458, 368772, '2019-11-11', 55478, 1, 2, 'C.NiÃ±o-432-Zamboni-321', 432, 272841, '7HO12837', 0, 6),
(459, 368784, '2019-12-11', 57322, 1, 2, 'C.NiÃ±o-434-Sterling-244', 434, 230028, '7HO11585', 0, 6),
(460, 368820, '2019-12-28', 57340, 1, 2, 'C.NiÃ±o-436-Kenyon-326', 436, 272894, '7HO12769', 0, 6),
(461, 368896, '2020-01-24', 57358, 4, 2, 'C.NiÃ±o-438', 438, 204373, 'CHAVO', 0, 6),
(462, 414038, '2020-09-30', 59045, 4, 2, 'C.NiÃ±o-462-Jose-316', 462, 230498, 'RG15385HO', 0, 6),
(463, 414049, '2020-11-08', 59090, 4, 2, 'C.NiÃ±o-464-Jose-331', 464, 272919, 'RG15385HO', 0, 6),
(464, 414050, '2020-11-11', 59086, 4, 2, 'C.NiÃ±o-465-Jose-323', 465, 272866, 'RG15385HO', 0, 6),
(465, 414068, '2020-11-17', 59094, 4, 2, 'C.NiÃ±o-467-Jose-257', 467, 204381, 'RG1385HO', 0, 6),
(466, 414069, '2020-11-18', 59099, 4, 2, 'C.NiÃ±o-468-Jose-359', 468, 279464, 'RG15385HO', 0, 6),
(467, 414070, '2020-11-26', 59100, 4, 2, 'C.NiÃ±o-469-Jose-367', 469, 279491, 'RG15385HO', 0, 6),
(468, 414087, '2020-12-05', 58705, 4, 2, 'C.NiÃ±o-471-Jose-326', 471, 272894, 'RG15385HO', 0, 6),
(469, 414123, '2020-12-18', 58722, 4, 2, 'C.NiÃ±o-473-Conan-181', 473, 222772, 'CONAN', 0, 6),
(470, 414124, '2020-12-27', 58731, 4, 2, 'C.NiÃ±o-474-Jose-370', 474, 279494, 'RG15385HO', 0, 6),
(471, 414126, '2021-01-03', 58723, 1, 2, 'C.NiÃ±o-476-Jose-348', 476, 279428, 'RG15385HO', 0, 6),
(472, 414127, '2021-01-04', 58733, 4, 2, 'C.NiÃ±o-477-Jose-363', 477, 279487, 'RG15385HO', 0, 6),
(473, 414128, '2021-01-09', 58740, 4, 2, 'C.NiÃ±o-478-Jose-249', 478, 204373, 'RG15385HO', 0, 6),
(474, 414129, '2021-01-09', 58737, 4, 2, 'C.NiÃ±o-479-Jose-372', 479, 283072, 'RG15385HO', 0, 6),
(475, 414130, '2021-01-14', 58744, 4, 3, 'C.NiÃ±o-480-Albino-317', 480, 230499, '7JE1620', 0, 6),
(476, 414147, '2021-01-19', 58755, 4, 2, 'C.NiÃ±o-481-Jose-322', 481, 272857, 'RG15385HO', 0, 6),
(477, 414148, '2021-01-27', 58763, 4, 2, 'C.NiÃ±o-482-Jose-380', 482, 315933, 'RG15385HO', 0, 6),
(478, 414149, '2021-02-04', 58745, 1, 2, 'C.NiÃ±o-483-Jose-336', 483, 277200, 'RG15385HO', 0, 6),
(479, 414186, '2021-02-24', 58780, 4, 2, 'C.NiÃ±o-484-Rafael-94', 484, 222761, 'RAFAEL', 0, 6),
(480, 414187, '2021-02-26', 58782, 4, 2, 'C.NiÃ±o-485-Jose-338', 485, 277243, 'RG15385HO', 0, 6),
(481, 414188, '2021-02-27', 58773, 4, 2, 'C.NiÃ±o-486-Jose-366', 486, 279490, 'RG15385HO', 0, 6),
(482, 414236, '2021-03-24', 58796, 4, 2, 'C.NiÃ±o-489-Jose-373', 489, 315913, 'RG15385HO', 0, 6),
(483, 414237, '2021-04-05', 58797, 4, 2, 'C.NiÃ±o-491-Jose-391', 491, 318457, 'RG15385HO', 0, 6),
(484, 414270, '2021-05-05', 59519, 1, 2, 'C.NiÃ±o-493-Jose-176', 493, 222831, 'RG15385HO', 0, 6),
(485, 414271, '2021-05-28', 59528, 1, 2, 'C.NiÃ±o-494-Cascade-408', 494, 348000, '7HO14401', 0, 6),
(486, 414273, '2021-06-14', 59546, 1, 2, 'C.NiÃ±o-496-House-389', 496, 318455, '7HO12978', 0, 6),
(487, 414274, '2021-06-17', 59556, 1, 2, 'C.NiÃ±o-497-House-386', 497, 318411, '7HO12978', 0, 6),
(488, 414322, '2021-06-23', 59565, 1, 2, 'C.NiÃ±o-498-Cascade-396', 498, 318492, '7HO14401', 0, 6),
(489, 414323, '2021-06-24', 59554, 1, 2, 'C.NiÃ±o-499-Cascade-332', 499, 272920, '7HO14401', 0, 6),
(490, 414325, '2021-06-30', 59557, 4, 2, 'C.NiÃ±o-501-Rafael-242', 501, 230026, 'RAFAEL', 0, 6),
(491, 414326, '2021-07-04', 61763, 4, 2, 'C.NiÃ±o-502-Conan-308', 502, 230415, 'CONAN', 0, 6),
(492, 414327, '2021-07-08', 59544, 1, 2, 'C.NiÃ±o-503-Hause-400', 503, 347948, '7HO12978', 0, 6),
(493, 414328, '2022-07-09', 59576, 1, 2, 'C.NiÃ±o-504-House-418', 504, 348066, '7HO12978', 0, 6),
(494, 414342, '2021-07-23', 61788, 1, 2, 'C.NiÃ±o-506-House-406', 506, 347998, '7HO12978', 0, 6),
(495, 414344, '2021-08-08', 31789, 1, 2, 'C.NiÃ±o-508-House-278', 508, 230072, 'HO12978', 0, 6),
(496, 414453, '2021-09-10', 60702, 4, 2, 'C.NiÃ±o-510-Conan-273', 510, 204421, 'CONAN', 0, 6),
(497, 414461, '2021-09-18', 60716, 1, 2, 'C.NiÃ±o-512-House-421', 512, 348088, '7HO12978', 0, 6),
(498, 414462, '2021-09-20', 60713, 1, 2, 'C.NiÃ±o-513-Cascade-309', 513, 230485, '7HO14401', 0, 6),
(499, 414463, '2021-09-25', 60720, 1, 2, 'C.NiÃ±o-514-KingPin-409', 514, 348001, '7HO12228', 0, 6),
(500, 414464, '2021-09-28', 60709, 1, 2, 'C.NiÃ±o-516-Cascade-417', 516, 348025, '7HO14401', 0, 6),
(501, 414465, '2021-09-28', 60725, 1, 2, 'C.NiÃ±o-517-KingPin-412', 517, 348021, '7HO12228', 0, 6),
(502, 414486, '2021-10-05', 60718, 1, 2, 'C.NiÃ±o-518-Ascender-399', 518, 347910, '7HO12616', 0, 6),
(503, 414490, '2021-11-08', 60728, 4, 2, 'C.NiÃ±o-519-Conan-174', 519, 222778, 'CONAN', 0, 6),
(504, 431027, '2020-04-05', 57415, 4, 2, 'C.NiÃ±o-442-Jose-176', 442, 222831, 'RG15385HO', 0, 6),
(505, 431118, '2020-05-26', 57441, 4, 2, 'C.NiÃ±o-447-Jose-295', 447, 230190, 'RG15385HO', 0, 6),
(506, 431119, '2020-05-27', 57451, 1, 2, 'C.NiÃ±o-448-Jose-332', 448, 272920, 'RG15385HO', 0, 6),
(507, 431121, '2020-05-30', 57452, 4, 2, 'C.NiÃ±o-450-Jose-235', 450, 204377, 'RG15385HO', 0, 6),
(508, 431143, '2020-07-07', 57494, 1, 2, 'C.NiÃ±o-452-Jose-188', 452, 222785, 'RG15385HO', 0, 6);
INSERT INTO `animal` (`idAnimal`, `chb`, `fecha_nacimiento`, `nro_registro`, `categoria`, `raza`, `nombre`, `rp`, `chbmadre`, `naabpadre`, `estado`, `fincaID`) VALUES
(509, 431193, '2020-07-19', 57497, 4, 2, 'C.NiÃ±o-453-Jose-294', 453, 230180, 'RG15385HO', 0, 6),
(510, 431194, '2020-07-28', 59548, 4, 2, 'C.NiÃ±o-454-Jose-343', 454, 277298, 'RG15385HO', 0, 6),
(511, 431211, '2020-09-01', 59022, 4, 2, 'C.NiÃ±o-456-Jose-299', 456, 230214, 'RG15385HO', 0, 6),
(512, 431212, '2020-09-12', 59026, 4, 2, 'C.NiÃ±o-458-Jose-247', 458, 230031, 'RG15385HO', 0, 6),
(513, 474805, '2021-12-04', 62245, 1, 2, 'C.NiÃ±o-521-KingPin-344', 521, 277299, '7HO12228', 0, 6),
(514, 474856, '2021-12-05', 60754, 1, 2, 'C.NiÃ±o-522-KingPin-426', 522, 368719, '7HO12228', 0, 6),
(515, 474858, '2021-12-09', 60756, 4, 2, 'C.NiÃ±o-524-Conan-230', 524, 230014, 'CONAN', 0, 6),
(516, 474859, '2021-12-13', 60771, 1, 2, 'C.NiÃ±o-525-JackPot-297', 525, 230213, '7HO12946', 0, 6),
(517, 474911, '2021-12-19', 60764, 1, 2, 'C.NiÃ±o-526-KingPin-331', 526, 272919, '7HO12228', 0, 6),
(518, 474912, '2021-12-20', 62264, 4, 2, 'C.NiÃ±o-527-Conan-25', 527, 773383, 'CONAN', 0, 6),
(519, 474913, '2021-12-28', 60773, 1, 2, 'C.NiÃ±o-528-JackPot-367', 528, 279491, '7HO12946', 0, 6),
(520, 474914, '2021-12-28', 62265, 4, 2, 'C.NiÃ±o-529-Toribio-156', 529, 222790, 'TORIBIO', 0, 6),
(521, 474915, '2022-01-06', 60777, 1, 2, 'C.NiÃ±o-530-Mocik-364', 530, 279488, '250HO14407', 0, 6),
(522, 474917, '2022-01-17', 60799, 1, 2, 'C.NiÃ±o-532-Mick-435', 532, 368819, '250HO14407', 0, 6),
(523, 474925, '2022-01-21', 61708, 4, 2, 'C.NiÃ±o-533-Conan-286', 533, 230172, 'CONAN', 0, 6),
(524, 474926, '2022-02-10', 61720, 4, 2, 'C.NiÃ±o-534-Conan-368', 534, 279492, 'CONAN', 0, 6),
(525, 474973, '2022-03-01', 61723, 4, 2, 'C.NiÃ±o-535-Conan-136', 535, 222764, 'CONAN', 0, 6),
(526, 474974, '2022-03-07', 62299, 1, 2, 'C.NiÃ±o-536-JackPot-380', 536, 315933, '7HO12946', 0, 6),
(527, 474975, '2020-11-15', 0, 4, 2, 'C.NiÃ±o-466-Rafael-25', 466, 773383, 'RAFAEL', 0, 6),
(528, 474990, '2022-04-02', 61748, 1, 2, 'C.NiÃ±o-538-Mick-449', 538, 431120, '250HO14407', 0, 6),
(529, 503875, '2023-01-30', 61523, 4, 2, 'C.NiÃ±o-571-Conan-347', 571, 277301, 'CONAN', 0, 6),
(530, 503876, '2023-01-30', 61526, 1, 2, 'C.NiÃ±o-572-Taos-364', 572, 279488, '7HO15112', 0, 6),
(531, 503877, '2023-02-10', 61540, 1, 2, 'C.NiÃ±o-573-RustyRed-466', 573, 474975, '7HO13826', 0, 6),
(532, 503880, '2023-02-20', 61538, 1, 2, 'C.NiÃ±o-574-RustyRed-483', 574, 414149, '7HO13826', 0, 6),
(533, 503881, '2023-02-22', 61541, 1, 2, 'C.NiÃ±o-576-Sunrisa-432', 576, 368772, '7HO15225', 0, 6),
(534, 503927, '2023-02-25', 61544, 1, 2, 'C.NiÃ±o-577-RustyRed-323', 577, 272866, '7HO13826', 0, 6),
(535, 503928, '2023-03-01', 61546, 1, 2, 'C.NiÃ±o-578-RustyRed-474', 578, 414124, '7HO13826', 0, 6),
(536, 503930, '2023-03-15', 61574, 1, 2, 'C.NiÃ±o-580-Tomek-478', 580, 414128, '7HO12657', 0, 6),
(537, 503936, '2023-03-18', 64364, 1, 2, 'C.NiÃ±o-581-Sunrise-486', 581, 414188, '7HO15225', 0, 6),
(538, 521713, '2022-04-03', 61750, 1, 2, 'C.NiÃ±o-539-Mick-431', 539, 368771, '250HO14407', 0, 6),
(539, 521714, '2022-04-08', 61751, 4, 2, 'C.NiÃ±o-540-Conan-234', 540, 230018, 'CONAN', 0, 6),
(540, 521715, '2022-04-10', 61756, 4, 2, 'C.NiÃ±o-541-Conan-293', 541, 230179, 'CONAN', 0, 6),
(541, 521716, '2022-04-14', 61753, 1, 2, 'C.NiÃ±o-542-JackPot-337', 542, 277227, '7HO12918', 0, 6),
(542, 521768, '2022-04-25', 61764, 1, 2, 'C.NiÃ±o-545-JackPot-447', 545, 431118, '7HO12946', 0, 6),
(543, 521769, '2022-05-09', 61784, 1, 2, 'C.NiÃ±o-546-Taos-451', 546, 431142, '7HO15112', 0, 6),
(544, 521776, '2022-05-15', 61558, 1, 2, 'C.NiÃ±o-547-Jules-338', 547, 277243, '7HO15002', 0, 6),
(545, 521777, '2022-05-15', 61790, 1, 2, 'C.NiÃ±o-548-Jules-450', 548, 431121, '7HO15002', 0, 6),
(546, 521778, '2022-05-17', 61781, 1, 2, 'C.NiÃ±o-549-Taos-444', 549, 431029, '7HO15112', 0, 6),
(547, 521838, '2022-06-17', 62208, 1, 2, 'C.NiÃ±o-550-Mick-176', 550, 222831, '250HO14407', 0, 6),
(548, 521839, '2022-06-17', 62212, 4, 2, 'C.NiÃ±o-551-Conan-181', 551, 222772, 'CONAN', 0, 6),
(549, 521840, '2022-06-26', 62214, 1, 2, 'C.NiÃ±o-552-Mick-400', 552, 347948, '250HO14407', 0, 6),
(550, 521841, '2022-07-06', 62215, 1, 2, 'C.NiÃ±o-553-Mick-336', 553, 277200, '250HO14407', 0, 6),
(551, 521842, '2022-07-06', 62213, 1, 2, 'C.NiÃ±o-554-Mick-343', 554, 277298, '250HO14407', 0, 6),
(552, 521856, '2022-07-16', 61600, 4, 2, 'C.NiÃ±o-555-Mick-441', 555, 431026, '250HO14407', 0, 6),
(553, 521857, '2022-08-09', 62232, 1, 2, 'C.NiÃ±o-557-Sunrise-385', 557, 318410, '7HO15225', 0, 6),
(554, 521877, '2022-08-19', 62228, 4, 2, 'C.NiÃ±o-558-Tomas-410', 558, 348002, 'TOMAS', 0, 6),
(555, 521888, '2022-08-26', 62239, 4, 2, 'C.NiÃ±o-559-Tomas-372', 559, 283072, 'TOMAS', 0, 6),
(556, 521889, '2022-08-28', 62242, 1, 2, 'C.NiÃ±o-560-Taos-458', 560, 431212, '7HO15112', 0, 6),
(557, 521890, '2022-08-30', 62235, 1, 2, 'C.NiÃ±o-561-RustyRed-275', 561, 204424, '7HO13826', 0, 6),
(558, 521902, '2022-09-29', 62252, 1, 2, 'C.NiÃ±o-562-Sunrise-420', 562, 348067, '7HO15225', 0, 6),
(559, 521923, '2022-10-01', 62251, 4, 2, 'C.NiÃ±o-563-Tomas-374', 563, 315914, 'TOMAS', 0, 6),
(560, 521933, '2022-10-17', 62263, 1, 2, 'C.NiÃ±o-564-Sunrise-462', 564, 414038, '7HO15225', 0, 6),
(561, 521935, '2022-10-24', 62261, 1, 3, 'C.NiÃ±o-565-Albion-416', 565, 348024, '7JE1620', 0, 6),
(562, 521936, '2022-11-06', 62283, 1, 2, 'C.NiÃ±o-566-RustyRed-460', 566, 414036, '7HO13826', 0, 6),
(563, 521937, '2022-11-12', 62275, 1, 2, 'C.NiÃ±o-567-RustyRed-468', 567, 414069, '7HO13826', 0, 6),
(564, 521969, '2022-11-21', 62286, 1, 2, 'C.NiÃ±o-568-RustyRed-471', 568, 414087, '7HO13826', 0, 6),
(565, 521970, '2022-11-24', 62281, 1, 2, 'C.NiÃ±o-569-RustyRed-465', 569, 414050, '7HO13826', 0, 6),
(566, 521999, '2022-12-12', 62297, 4, 2, 'C-NiÃ±o-570-Conan-119', 570, 222755, 'CONAN', 0, 6),
(567, 539013, '2023-03-18', 64365, 4, 2, 'C-NiÃ±o-582-Tomas-309', 582, 230485, 'TOMAS', 0, 6),
(568, 539014, '2023-03-20', 64366, 1, 2, 'C-NiÃ±o-583-Alpahbet-487', 583, 414225, '7HO14320', 0, 6),
(569, 539054, '2023-05-05', 61586, 1, 2, 'C-NiÃ±o-585-Alphabet-481', 585, 414147, '7HO14320', 0, 6),
(570, 539055, '2023-05-06', 615992, 1, 2, 'C-NiÃ±o-586-Ascender-303', 586, 230218, '7HO12616', 0, 6),
(571, 539056, '2023-05-06', 61580, 1, 2, 'C-NiÃ±o-587-Alphabet-286', 587, 230172, '7HO14320', 0, 6),
(572, 539057, '2023-05-07', 61597, 4, 2, 'C-NiÃ±o-588-Tomas-230', 588, 230014, 'TOMAS', 0, 6),
(573, 539066, '2023-06-01', 63827, 1, 2, 'C-NiÃ±o-590-Alphabet-480', 590, 414130, '7HO14320', 0, 6),
(574, 539067, '2023-06-05', 63826, 1, 2, 'C-NiÃ±o-591-House-430', 591, 368770, '7HO12978', 0, 6),
(575, 539088, '2023-06-06', 63821, 1, 2, 'C-NiÃ±o-592-House-396', 592, 318492, '7HO12978', 0, 6),
(576, 539089, '2023-06-06', 65501, 4, 2, 'C-NiÃ±o-593-Tomas-409', 593, 348001, 'TOMAS', 0, 6),
(577, 539095, '2023-06-20', 65541, 1, 2, 'C-NiÃ±o-594-Tomas-391', 594, 318457, 'TOMAS', 0, 6),
(578, 539096, '2023-06-24', 63824, 1, 2, 'C-NiÃ±o-595-Alphabet-406', 595, 347998, '7HO14320', 0, 6),
(579, 539097, '2023-07-08', 63836, 4, 2, 'C-NiÃ±o-596-Tomas-390', 596, 318456, 'TOMAS', 0, 6),
(580, 539119, '2023-07-12', 63834, 1, 2, 'C-NiÃ±o-598-House-485', 598, 414187, '7HO12978', 0, 6),
(581, 539120, '2023-07-14', 63837, 1, 2, 'C-NiÃ±o-599-House-385', 599, 318410, '7HO12978', 0, 6),
(582, 539121, '2023-07-15', 63845, 1, 2, 'C-NiÃ±o-600-Tomek-366', 600, 279490, '7HO12657', 0, 6),
(583, 539166, '2023-08-22', 63867, 1, 2, 'C-NiÃ±o-601-Tomek-501', 601, 414325, '7HO12657', 0, 6),
(584, 539167, '2023-09-04', 63874, 1, 2, 'C-NiÃ±o-602-Tomek-444', 602, 431029, '7HO12657', 0, 6),
(585, 539183, '2023-09-09', 63881, 1, 2, 'C-NiÃ±o-603-Sunrise-497', 603, 414274, '7HO15225', 0, 6),
(586, 539184, '2023-09-15', 63880, 1, 2, 'C-NiÃ±o-604-Sunrise-510', 604, 414453, '7HO15225', 0, 6),
(587, 539185, '2023-09-15', 63886, 1, 2, 'C-NiÃ±o-605-Sunrise-516', 605, 414464, '7HO15225', 0, 6),
(588, 539223, '2023-09-22', 63889, 1, 2, 'C-NiÃ±o-606-Sunrise-499', 606, 414323, '7HO15225', 0, 6),
(589, 539224, '2023-09-25', 63892, 4, 2, 'C-NiÃ±o-607-Tomas-456', 607, 431211, 'TOMAS', 0, 6),
(590, 539225, '2023-10-04', 64304, 1, 2, 'C-NiÃ±o-608-banjoP-502', 608, 414326, '7HO14694', 0, 6),
(591, 539226, '2023-10-05', 64309, 1, 2, 'C-NiÃ±o-609-BanjoP-500', 609, 414324, '7HO14694', 0, 6),
(592, 539227, '2023-10-07', 63899, 1, 2, 'C-NiÃ±o-610-Tomas-275', 610, 204424, 'TOMAS', 0, 6),
(593, 539233, '2023-10-09', 65596, 4, 2, 'C-NiÃ±o-611-Arturo-176', 611, 222831, 'ARTURO', 0, 6),
(594, 539253, '2023-11-20', 64322, 1, 2, 'C-NiÃ±o-612-bANJOp-507', 612, 414343, '7HO14694', 0, 6),
(595, 539254, '2023-12-01', 64331, 1, 2, 'C.NiÃ±o-613-House-524', 613, 474858, '7HO12978', 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruzamiento`
--

CREATE TABLE `cruzamiento` (
  `EventoID` int(11) NOT NULL,
  `ReproductorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL,
  `clave` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipoevento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`idEvento`, `clave`, `descripcion`, `tipoevento`) VALUES
(1, 'X', 'ExploraciÃ³n rectal', 1),
(2, 'P', 'Parto normal', 1),
(3, 'A', 'Aborto', 1),
(4, 'Dg', 'DiagnÃ³stico de Gestacion', 1),
(5, 'Md', 'Monta directa', 4),
(6, '+', 'Servicio', 4),
(7, 'U', 'Ãštero', 1),
(8, 'Un', 'Ãštero normal', 1),
(9, 'Ut', 'Ãštero turgente.', 1),
(10, 'U ed', 'Ãštero edematoso', 6),
(11, 'U pio', 'Piometra', 6),
(12, 'U endo', 'Ãštero Endometritis', 6),
(13, 'U met', 'Metritis', 6),
(14, 'D', 'Ovario derecho', 1),
(15, 'I', 'Ovario izquierdo', 1),
(16, 'Cl1', 'Cuerpo lÃºteo 1 (hasta 1 cm de longitud)', 1),
(17, 'Cl2', 'Cuerpo lÃºteo 2 (hasta 1 y 2 cm de longitud)', 1),
(18, 'Cl3', 'Cuerpo lÃºteo 3 (mayor de 2 cm de longitud).', 1),
(19, 'Fo', 'Fosa ovulatoria', 1),
(20, 'Fg', 'Foliculo de Gaff (N = tamaÃ±o en mm)', 1),
(21, 'Cl9', 'Cuerpo lÃºteo quÃ­stico', 6),
(22, 'G', 'Vaca gestante', 2),
(23, 'Pd', 'Parto distÃ³cico', 1),
(24, 'Rp', 'RetenciÃ³n de placenta', 6),
(25, 'Adh', 'Adherencias.', 6),
(26, 'Tum', 'Tumores', 7),
(27, 'Sal', 'Salpingitis', 6),
(28, 'Cerv', 'Cervicitis', 6);

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
-- Estructura de tabla para la tabla `reproductor`
--

CREATE TABLE `reproductor` (
  `idReproductor` int(11) NOT NULL,
  `hba` int(11) NOT NULL,
  `apodo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `rp` int(11) NOT NULL,
  `naab` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `raza` int(11) NOT NULL,
  `tiposervicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `reproductor`
--

INSERT INTO `reproductor` (`idReproductor`, `hba`, `apodo`, `nombre`, `rp`, `naab`, `raza`, `tiposervicio`) VALUES
(2, 11314, 'MOGUL', '7HO11314 MOGUL', 2147483647, '7HO11314 ', 2, 1),
(3, 10723, 'SPUR', '7HO10723 Spur', 66636663, '7HO10723 ', 2, 1),
(4, 4444, 'ARTURO', '4444 ARTURO', 0, '0', 4, 2);

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
(1, '10780686', 'Erwin', 'Apace Fabricano', 73751692, 'Av. Petrolera km 4', 'erwin', '202cb962ac59075b964b07152d234b70', 1, 1),
(2, '03', 'Einer', '', 71604433, 'Av. Blanco Galindo', 'einer', '202cb962ac59075b964b07152d234b70', 2, 1),
(3, '02', 'Wilder', 'Ledezma Villarroel', 71607106, 'Av. Villazon', 'wilder', '202cb962ac59075b964b07152d234b70', 2, 1),
(4, '01', 'Carlos', 'Agreda', 67686532, 'Vinto Pairumani', 'carlos', '202cb962ac59075b964b07152d234b70', 2, 1);

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
-- Indices de la tabla `cruzamiento`
--
ALTER TABLE `cruzamiento`
  ADD KEY `evento-cruzamiento` (`EventoID`),
  ADD KEY `Reproductor-cruzamiento` (`ReproductorID`);

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
  ADD KEY `usuario-finca` (`UsuarioID`);

--
-- Indices de la tabla `historia`
--
ALTER TABLE `historia`
  ADD PRIMARY KEY (`idHIstoria`),
  ADD KEY `animal-historia` (`animalID`),
  ADD KEY `tratamiento-historia` (`eventoID`);

--
-- Indices de la tabla `reproductor`
--
ALTER TABLE `reproductor`
  ADD PRIMARY KEY (`idReproductor`);

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
  MODIFY `idAnimal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=596;
--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
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
-- AUTO_INCREMENT de la tabla `reproductor`
--
ALTER TABLE `reproductor`
  MODIFY `idReproductor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `idTratamiento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `finca-animal` FOREIGN KEY (`fincaID`) REFERENCES `finca` (`idFinca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cruzamiento`
--
ALTER TABLE `cruzamiento`
  ADD CONSTRAINT `evento-cruzamiento` FOREIGN KEY (`EventoID`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reproductor-cruzamiento` FOREIGN KEY (`ReproductorID`) REFERENCES `reproductor` (`idReproductor`) ON DELETE CASCADE ON UPDATE CASCADE;

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
