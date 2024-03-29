--
-- Base de datos: `proyecto`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_activar_usuario` (`_idusuario` INT)  UPDATE usuario SET status=1 WHERE idUsuario=_idusuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_participante` (`_nroparticipante` INT, `_descripcion` VARCHAR(50))  INSERT INTO participante(nroparticipante,descripcion)VALUES(_nroparticipante,_descripcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregar_tratamiento` (IN `_nrotratamiento` INT, IN `_descripcion` VARCHAR(50))  INSERT INTO tratamiento(nrotratamiento,descripcion)VALUES(_nrotratamiento,_descripcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_bloquear_usuario` (IN `_idusuario` INT)  UPDATE usuario SET status=2 WHERE idUsuario=_idusuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_animales` (IN `_idFinca` INT, IN `_valor` VARCHAR(50))  SELECT * FROM animal WHERE chb LIKE CONCAT('%', _valor, '%') AND fincaID = _idFinca$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_finca` (`_idFinca` INT)  SELECT * FROM finca WHERE idFinca=_idFinca$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_mostrar_animal` (IN `_idAnimal` INT)  SELECT * FROM animal WHERE idAnimal=_idAnimal OR chb=_idAnimal$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_mostrar_animal_idAnimal` (`_idAnimal` INT)  SELECT * FROM animal WHERE idAnimal=_idAnimal$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_mostrar_evento` (`_valor` VARCHAR(20))  SELECT * FROM evento WHERE clave LIKE CONCAT('%', _valor, '%') OR descripcion LIKE CONCAT('%', _valor, '%') ORDER BY 4 ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_mostrar_tratamiento` (`_valor` VARCHAR(10))  SELECT * FROM tratamiento WHERE nrotratamiento LIKE CONCAT('%', _valor, '%') OR descripcion LIKE CONCAT('%', _valor, '%') ORDER BY 1 DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_mostrar_usuario` (IN `_valor` VARCHAR(20))  SELECT idUsuario,ci,nombre,apellidos,telefono,direccion,usuario,rol,status FROM usuario
WHERE ci LIKE CONCAT('%', _valor, '%') OR nombre LIKE CONCAT('%', _valor, '%') OR usuario LIKE CONCAT('%', _valor, '%') AND status=1 AND status=2 ORDER BY 1 DESC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_nrotratamiento` (`_nrotratamiento` INT)  SELECT * FROM tratamiento WHERE nrotratamiento=_nrotratamiento$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_participante` (IN `_valor` VARCHAR(50))  SELECT * FROM participante WHERE nroparticipante=_valor OR descripcion LIKE CONCAT('%', _valor, '%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_toro` (IN `_valor` VARCHAR(15))  SELECT * FROM reproductor WHERE apodo=_valor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buscar_usuario` (IN `_idUsuario` INT)  SELECT * FROM usuario WHERE idUsuario=_idusuario$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_animal` (`_chb` INT, `_fnacimiento` DATE, `_nroregistro` INT, `_categoria` INT, `_raza` INT, `_nombre` VARCHAR(50), `_rp` INT, `_chbmadre` INT, `_naabpadre` VARCHAR(12), `_FincaID` INT)  INSERT INTO animal(chb,fecha_nacimiento,nro_registro,categoria,raza,nombre,rp,chbmadre,naabpadre,fincaID)VALUES(_chb,_fnacimiento,_nroregistro,_categoria,_raza,_nombre,_rp,_chbmadre,_naabpadre,_FincaID)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_cruzamiento` (`_EventoID` INT, `_ReproductorID` INT)  INSERT INTO cruzamiento(EventoID,ReproductorID)VALUES(_EventoID,_ReproductorID)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_evento` (IN `_clave` VARCHAR(10), IN `_descripcion` VARCHAR(50), IN `_tipoevento` INT)  INSERT INTO evento(clave,descripcion,tipoevento)VALUES(_clave,_descripcion,_tipoevento)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_finca` (IN `_numero_propietario` INT, IN `_propietario` VARCHAR(80), IN `_nro_tacho` INT, IN `_nombre_finca` VARCHAR(50), IN `_telefono` INT, IN `_direccion` VARCHAR(100), IN `_UsuarioID` INT)  INSERT INTO finca(nroPropietario,propietario,nroTacho,nombre_finca,telefono,direccion,UsuarioID)VALUES
(_numero_propietario,
 _propietario,
 _nro_tacho,
 _nombre_finca,_telefono,_direccion,_UsuarioID)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_historia` (IN `_fecha` DATE, IN `_AnimalID` INT, IN `_EventoID` INT, IN `_TratamientoID` INT, IN `_ParticipanteID` INT)  INSERT INTO historia(fecha,animalID,eventoID,tratamientoID,participanteID)VALUES(_fecha,_AnimalID,_EventoID,_TratamientoID,_ParticipanteID)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_parto` (IN `_nroparto` INT, IN `_tipo` INT, IN `_sexo` INT, IN `_chbcria` INT, IN `_peso` FLOAT, IN `_EventoID` INT)  INSERT INTO parto(nroparto,tipo,sexo,chbcria,peso,EventoID)
VALUES(_nroparto,_tipo,_sexo,_chbcria,_peso,_EventoID)$$

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_evento` (IN `_valor` VARCHAR(2))  SELECT * FROM evento WHERE idEvento LIKE CONCAT('%', _valor, '%') OR clave LIKE CONCAT('%', _valor, '%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_partos` (`_chb` INT)  SELECT h.idHIstoria,DATE_FORMAT(h.fecha,'%d/%m/%Y')'fecha',e.descripcion 'evento',pa.tipo,pa.nroparto,pa.sexo,pa.chbcria,t.descripcion 'tratamiento',p.descripcion 'participante' FROM historia h JOIN animal a ON h.animalID=a.idAnimal
JOIN evento e ON h.eventoID=e.idEvento JOIN tratamiento t ON h.tratamientoID=t.idTratamiento
JOIN participante p ON h.participanteID=p.idParticipante JOIN parto pa ON pa.EventoID=e.idEvento
WHERE a.chb=_chb GROUP BY h.idHIstoria ORDER BY h.fecha ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_reproductor` (`_idReproductor` INT)  SELECT * FROM reproductor WHERE idReproductor=_idReproductor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_servicios` (`_chb` INT)  SELECT h.idHIstoria,DATE_FORMAT(h.fecha,'%d/%m/%Y')'fecha',e.descripcion 'evento',t.descripcion 'tratamiento',p.descripcion 'participante',r.apodo 'reproductor' FROM historia h JOIN animal a ON h.animalID=a.idAnimal
JOIN evento e ON h.eventoID=e.idEvento JOIN tratamiento t ON h.tratamientoID=t.idTratamiento
JOIN participante p ON h.participanteID=p.idParticipante JOIN cruzamiento c ON c.EventoID=e.idEvento JOIN reproductor r ON c.ReproductorID=r.idReproductor
WHERE a.chb=_chb GROUP BY h.idHIstoria ORDER BY h.fecha ASC$$

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
(595, 539254, '2023-12-01', 64331, 1, 2, 'C.NiÃ±o-613-House-524', 613, 474858, '7HO12978', 0, 6),
(596, 414397, '2018-10-02', 0, 4, 2, 'SanJulian-Liz', 0, 0, '0', 0, 16),
(597, 414404, '2018-07-13', 0, 4, 2, 'SanJulian-Pura', 0, 0, '0', 0, 16),
(598, 414406, '2017-05-20', 0, 4, 2, 'SanJulian-Mariana', 0, 0, '0', 0, 16),
(599, 414409, '2019-01-15', 0, 4, 2, 'SanJulian-Griselda', 0, 0, '0', 0, 16),
(600, 414416, '2018-07-16', 0, 4, 2, 'SanJulian-Fernanda', 0, 0, '0', 0, 16),
(601, 414417, '2018-06-27', 0, 4, 2, 'SanJulian-Juanita', 0, 0, '0', 0, 16),
(602, 414424, '2021-03-15', 0, 4, 2, 'SanJulian-Roxana', 0, 0, '0', 0, 16),
(603, 414426, '2019-02-15', 0, 4, 2, 'SanJulian-Carina', 0, 0, '0', 0, 16),
(604, 414433, '2020-02-10', 0, 4, 2, 'SanJulian-Brenda', 0, 0, '0', 0, 16),
(605, 414435, '2018-07-18', 0, 4, 2, 'SanJulian-Gaby', 0, 0, '0', 0, 16),
(606, 414438, '2020-02-10', 0, 4, 2, 'SanJulian-Erika', 0, 0, '0', 0, 16),
(607, 414441, '2019-03-15', 0, 4, 2, 'SanJulian-Danitza', 0, 0, '0', 0, 16),
(608, 414443, '2019-12-01', 0, 4, 2, 'SanJulian-Briza', 0, 0, '0', 0, 16),
(609, 414444, '2020-02-20', 0, 4, 2, 'SanJulian-Teresa', 0, 0, '0', 0, 16),
(610, 414445, '2019-11-30', 0, 4, 2, 'SanJulian-Bertha', 0, 0, '0', 0, 16),
(611, 414448, '2018-08-30', 0, 4, 2, 'SanJulian-Marisol', 0, 0, '0', 0, 16),
(612, 474806, '2020-05-18', 0, 4, 2, 'SanJulian-Candy', 0, 0, '0', 0, 16),
(613, 474808, '2020-09-16', 0, 4, 2, 'SanJulian-Litzy', 0, 0, '0', 0, 16),
(614, 474810, '2020-06-01', 0, 4, 2, 'SanJulian-Noemi', 0, 0, '0', 0, 16),
(615, 474811, '2020-04-15', 62927, 1, 2, 'SanJulian-Camila-Mabon-Carina', 0, 414426, '7HO12829', 0, 16),
(616, 474812, '2020-07-14', 62903, 4, 2, 'SanJulian-Marina', 0, 0, '0', 0, 16),
(617, 474813, '2020-11-10', 0, 4, 2, 'SanJulian-Jeny', 0, 0, '0', 0, 16),
(618, 474815, '2020-10-21', 0, 4, 2, 'SanJulian-Gaviota', 0, 0, '0', 0, 16),
(619, 474816, '2020-04-01', 0, 4, 2, 'SanJulian-Mariela', 0, 0, '0', 0, 16),
(620, 474817, '2020-08-28', 0, 4, 2, 'SanJulian-Lucero', 0, 0, '0', 0, 16),
(621, 474818, '2020-12-27', 0, 4, 2, 'SanJulian-Belen', 0, 414407, '0', 0, 16),
(622, 474819, '2020-06-24', 0, 4, 2, 'SanJulian-Angela', 0, 0, '0', 0, 16),
(623, 474821, '2021-06-01', 0, 4, 2, 'SanJulian-Cristina', 0, 0, '0', 0, 16),
(624, 474822, '2021-05-03', 62915, 1, 2, 'SanJulian-Amalia-Ascender-Andreita', 0, 414425, '7HO12616', 0, 16),
(625, 474823, '2021-05-16', 62916, 1, 2, 'SanJulian-Celina-Rozwell-Celeste', 0, 414411, '7HO12777', 0, 16),
(626, 474825, '2021-05-17', 62917, 1, 2, 'SanJulian-Gringa-Mabon-Grisela', 0, 414409, '7HO12829', 0, 16),
(627, 474826, '2020-12-25', 62909, 1, 2, 'SanJulian-Alexa-Ascender-Alely', 0, 414415, '7HO12616', 0, 16),
(628, 474827, '2021-01-18', 0, 4, 2, 'SanJulian-Feli', 0, 0, '0', 0, 16),
(629, 474829, '2021-04-19', 62913, 1, 2, 'SanJulian-Perla-Ascender-Pilar', 0, 414413, '7HO12616', 0, 16),
(630, 474830, '2020-01-19', 0, 4, 2, 'SanJulian-Chatita', 0, 0, '0', 0, 16),
(631, 474831, '2021-03-03', 62912, 1, 2, 'SanJulian-Mayte-Ascender-Mayra', 474831, 414420, '7HO12616', 0, 16),
(632, 474832, '2021-06-12', 62921, 1, 2, 'SanJulian-Prima-Ascender-Pura', 474832, 414404, '7HO12616', 0, 16),
(633, 474833, '2021-06-17', 62925, 1, 2, 'SanJulian-Sole-Ascender-Sofia', 474833, 414427, '7HO12616', 0, 16),
(634, 474834, '2020-03-15', 0, 4, 2, 'SanJulian-Nicol', 0, 0, '0', 0, 16),
(635, 474835, '2020-06-15', 0, 4, 2, 'SanJulian-Blanki', 0, 0, '0', 0, 16),
(636, 474836, '2020-07-15', 0, 4, 2, 'SanJulian-Lucy', 0, 0, '0', 0, 16),
(637, 474861, '2021-10-09', 62942, 1, 3, 'SanJulian-Olivia-Megapower-Olenka', 0, 414440, '7JE5011', 0, 16),
(638, 474862, '2021-11-05', 62846, 4, 2, 'SanJulian-Valentina', 0, 0, '0', 0, 16),
(639, 474863, '2021-10-28', 0, 4, 2, 'SanJulian-Luna', 0, 474838, '0', 0, 16),
(640, 474865, '2021-09-01', 62935, 1, 2, 'SanJulian-Lilian-CrownRed-Lili', 0, 222936, '7HO14460', 0, 16),
(641, 474866, '2021-12-06', 63014, 1, 3, 'SanJulian-Daniela-Megapower-Danitza', 0, 414441, '7JE2011', 0, 16),
(642, 474867, '2021-12-11', 63013, 1, 3, 'SanJulian-Nilda-Megapower-Noelia', 0, 414421, '7JE5011', 0, 16),
(643, 474868, '2020-10-25', 62932, 1, 2, 'SanJulian-Marlen-Ascender-Martha', 0, 414428, '7HO12616', 0, 16),
(644, 474959, '2022-02-08', 0, 4, 2, 'SanJulian-Lety', 0, 474836, '0', 0, 16),
(645, 474969, '2022-05-02', 62985, 1, 2, 'SanJulian-Belen-Ascender-Betty', 0, 414423, '7HO12616', 0, 16),
(646, 474970, '2022-05-05', 62981, 1, 2, 'SanJulian-Techi-Ascender-Teresa', 0, 414444, '7HO12616', 0, 16),
(647, 475000, '2022-04-18', 62984, 1, 2, 'SanJulian-Lina-Advance-Liz', 0, 414397, '7HO12868', 0, 16),
(648, 503861, '2022-12-20', 63038, 1, 2, 'SanJulian-Soraya-Jules-Sonia', 0, 474820, '7HO15002', 0, 16),
(649, 503908, '2023-01-22', 63046, 1, 2, 'SanJulian-Galina-Jules-Gaby', 0, 414435, '7HO15002', 0, 16),
(650, 503918, '2023-03-08', 63051, 1, 2, 'SanJulian-Lupita-Ascender-Luciana', 0, 414396, '7HO12616', 0, 16),
(651, 521817, '2022-05-24', 62990, 1, 2, 'SanJulian-Celia-Ascender-Celeste', 0, 414411, '7HO12616', 0, 16),
(652, 521863, '2022-08-10', 63005, 1, 2, 'SanJulian-Tati-Ascender-Tati', 0, 414398, '7HO12616', 0, 16),
(653, 521864, '2022-08-14', 63006, 1, 2, 'SanJulian-Galya-Ascender-Gabriela', 0, 774920, '7HO12616', 0, 16),
(654, 521885, '2022-08-20', 63010, 1, 3, 'SanJulian-Oriana-Fournette-Olga', 0, 204485, '7JE1600', 0, 16),
(655, 521922, '2022-09-23', 0, 4, 2, 'SanJulian-Bonita', 0, 474835, '0', 0, 16),
(656, 521931, '2022-10-19', 63018, 1, 2, 'SanJulian-Carol-Tomek-Camila', 0, 474811, '7HO12657', 0, 16),
(657, 521975, '2022-11-01', 63024, 1, 2, 'SanJulian-Barbi-Taos-Blanca', 0, 414436, '7HO15112', 0, 16),
(658, 521976, '2022-11-04', 63026, 1, 2, 'SanJulian-Gris-Tomek-Griselda', 0, 414409, '7HO12657', 0, 16),
(659, 521977, '2022-12-06', 63037, 1, 2, 'SanJulian-Pili-Tomek-Pilar', 0, 414413, '7HO12657', 0, 16),
(660, 539049, '2022-02-14', 0, 4, 2, 'SanJulian-Gilda', 0, 0, '0', 0, 16),
(661, 539050, '2023-05-08', 63061, 1, 2, 'SanJulian-Gloria-Tomek-Gaviota', 0, 474815, '7HO12657', 0, 16),
(662, 539051, '2023-05-08', 63059, 1, 3, 'SanJulian-Jerusa-Megapower-Jeny', 0, 474813, '7JE5011', 0, 16),
(663, 539134, '2021-06-10', 0, 4, 2, 'SanJulian-Asly', 0, 0, '0', 0, 16),
(664, 539150, '2023-08-01', 63078, 1, 3, 'SanJulian-Ofelia-Megapower-Olga', 0, 204485, '7JE5011', 0, 16),
(665, 539243, '2023-10-26', 63096, 1, 2, 'SanJulian-Paki-LightMyFire-Perla', 0, 474829, '250HO12879', 0, 16),
(666, 539252, '2023-12-14', 65714, 1, 3, 'SanJulian-Dalila-Megapower-Danitza', 0, 414441, '7JE5011', 0, 16),
(667, 204404, '2016-08-06', 0, 4, 2, 'Tapia-Jade', 0, 0, '0', 0, 14),
(668, 230362, '2016-11-22', 0, 4, 2, 'Tapia-Chaska', 0, 0, '0', 0, 14),
(669, 230364, '2016-07-19', 0, 4, 2, 'Tapia-Macla', 0, 0, '0', 0, 14),
(670, 230367, '2017-04-20', 0, 4, 2, 'Tapia-Ana', 0, 0, '0', 0, 14),
(671, 272735, '2017-08-12', 54339, 4, 2, 'Tapia-Mery', 0, 230347, '0', 0, 14),
(672, 272762, '2015-05-15', 0, 4, 2, 'Tapia-Cody-Freddy-Cony', 0, 0, '0', 0, 14),
(673, 272885, '2018-02-03', 54306, 1, 2, 'Tapia-Mozita-RudolphRed-Monserrat', 0, 230326, '7HO11497', 0, 14),
(674, 277182, '2018-04-02', 54396, 4, 2, 'Tapia-Lenci', 0, 230343, '0', 0, 14),
(675, 279366, '2018-07-09', 54346, 1, 2, 'Tapia-Martha-RudolphRed-MuÃ±eca', 0, 230339, '7HO11497', 0, 14),
(676, 279406, '2018-07-10', 54337, 1, 2, 'Tapia-Celia-Wonka-Perla', 0, 230350, '7HO12175', 0, 14),
(677, 283055, '2015-01-08', 0, 4, 2, 'Tapia-Janeth', 0, 0, '0', 0, 14),
(678, 315903, '2018-12-15', 54383, 1, 2, 'Tapia-Jesica-Reynold-Fede', 0, 283053, '7HO12150', 0, 14),
(679, 315906, '2019-01-06', 0, 4, 2, 'Tapia-Aracely', 0, 283087, '0', 0, 14),
(680, 318406, '2019-03-02', 55903, 1, 2, 'Tapia-Leticia-Doctor-Uruguaya', 0, 230320, '250HO11953', 0, 14),
(681, 318450, '2019-04-02', 55916, 1, 2, 'Tapia-Erika-Doctor-Emilia', 0, 230358, '250HO11953', 0, 14),
(682, 474912, '2019-04-29', 55924, 1, 2, 'Tapia-Patricia-Beecher-Pocha', 0, 230366, '7HO12043', 0, 14),
(683, 347983, '2016-10-11', 0, 4, 2, 'Tapia-Pancha', 0, 0, '0', 0, 14),
(684, 347984, '2016-10-11', 0, 4, 2, 'Tapia-Julieta', 0, 0, '0', 0, 14),
(685, 348042, '2019-08-29', 55942, 1, 2, 'Tapia-Justina-KingPin-Ana', 0, 230367, '7HO12726', 0, 14),
(686, 348053, '2019-07-09', 55994, 4, 2, 'Tapia-Albina', 0, 774789, '0', 0, 14),
(687, 348054, '2019-08-06', 55995, 4, 2, 'Tapia-Josefa', 0, 204404, '0', 0, 14),
(688, 368773, '2019-11-02', 55958, 1, 2, 'Tapia-Fabiola-Mitch-Fede', 0, 283053, '7HO11767', 0, 14),
(689, 368774, '2019-11-09', 55959, 1, 2, 'Tapia-Hilaria-Braxton-Hilda', 0, 272916, '7HO9165', 0, 14),
(690, 368775, '2019-11-16', 0, 4, 2, 'Tapia-Stefani', 0, 774912, '0', 0, 14),
(691, 368776, '2019-11-23', 0, 4, 2, 'Tapia-Mrina', 0, 272733, '0', 0, 14),
(692, 368852, '2020-01-20', 59141, 4, 2, 'Tapia-Marisol', 0, 368872, '0', 0, 14),
(693, 368871, '2020-02-06', 55970, 1, 2, 'Tapia-Nelci-Sterling-Nancy', 0, 230355, '7HO11585', 0, 14),
(694, 368900, '2017-02-26', 0, 4, 2, 'Tapia-Peni', 0, 0, '0', 0, 14),
(695, 368902, '2020-03-08', 55973, 1, 2, 'Tapia-Dora-Sterling-Maria', 0, 230347, '7HO11585', 0, 14),
(696, 414010, '2020-09-22', 59125, 1, 2, 'Tapia-Brenda-Scenario-Fede', 0, 283053, '7HO12615', 0, 14),
(697, 414011, '2020-10-08', 59139, 1, 2, 'Tapia-Mirian-CrownRed-Steph', 0, 230369, '7HO14460', 0, 14),
(698, 414012, '2020-10-12', 59130, 1, 2, 'Tapia-Leydi-CrownRed-Luz', 0, 279441, '7HO14460', 0, 14),
(699, 414094, '2020-12-20', 59145, 1, 2, 'Tapia-Carolian-CrownRed-Chaska', 0, 230362, '7HO14460', 0, 14),
(700, 414095, '2020-12-28', 59148, 1, 2, 'Tapia-Vicenta-CrownRed-Micaela', 0, 431173, '7HO14460', 0, 14),
(701, 414157, '2021-01-21', 59197, 1, 2, 'Tapia-Dominga-Butler-Nicole', 0, 431172, '7HO12195', 0, 14),
(702, 414183, '2021-02-20', 59199, 1, 2, 'Tapia-Valentina-Reflector-Maria', 0, 230347, '7HO12105', 0, 14),
(703, 414259, '2021-05-14', 59170, 1, 2, 'Tapia-Vanesa-CrownRed-Dolores', 0, 279440, '7HO14460', 0, 14),
(704, 414361, '2021-07-18', 59180, 1, 2, 'Tapia-MuÃ±eca-Headliner-Mozita', 0, 272885, '7HO11419', 0, 14),
(705, 414362, '2021-07-08', 59188, 1, 2, 'Tapia-Celina-CrownRed-Celia', 0, 279406, '7HO14460', 0, 14),
(706, 414369, '2021-08-17', 59200, 4, 2, 'Tapia-Marlene', 0, 368773, '0', 0, 14),
(707, 431021, '2020-04-12', 55996, 1, 2, 'Tapia-Isabel-Sterling-Naida', 0, 368901, '7HO11585', 0, 14),
(708, 431128, '2020-05-11', 59101, 1, 2, 'Tapia-Luciana-Sterling-Linda', 0, 272829, '7HO11585', 0, 14),
(709, 431169, '2020-07-30', 59113, 1, 2, 'Tapia-Yovana-Butler-Jade', 0, 204404, '7HO12195', 0, 14),
(710, 431170, '2020-08-18', 59117, 1, 2, 'Tapia-Elena-KingPin-Jake', 0, 230353, '7HO12228', 0, 14),
(711, 431173, '2017-09-10', 54342, 4, 2, 'Tapia-Micaela', 0, 230315, '0', 0, 14),
(712, 431174, '2018-06-02', 54331, 1, 2, 'Tapia-Dina-RudolphRed-Lupe', 0, 230346, '7HO11497', 0, 14),
(713, 431175, '2020-07-10', 55296, 1, 2, 'Tapia-Florencia-Sterling-Ignacia', 0, 272763, '7HO11585', 0, 14),
(714, 474844, '2021-10-13', 60008, 1, 2, 'Tapia-Fernanda-LusterP-Cody', 0, 272762, '7HO14160', 0, 14),
(715, 474855, '2021-11-27', 60027, 1, 2, 'Tapia-Carmen-CrownRed-Nancy', 0, 230355, '7HO14460', 0, 14),
(716, 474870, '2021-11-30', 60029, 1, 2, 'Tapia-Tomek-Sdenka', 0, 774912, '7HO12657', 0, 14),
(717, 474891, '2021-12-13', 60033, 1, 2, 'Tapia-Madelin-Ascender-Pocha', 0, 230366, '7HO12616', 0, 14),
(718, 474967, '2022-03-13', 60061, 1, 2, 'Tapia-MariaFernanda-Bradnick-Josefina', 0, 431176, '7HO10999', 0, 14),
(719, 490245, '2015-09-15', 0, 4, 2, 'Tapia-Nancy', 0, 0, '0', 0, 14),
(720, 490249, '2017-03-21', 0, 4, 2, 'Tapia-Pocha', 0, 0, '0', 0, 14),
(721, 503862, '2022-12-15', 63531, 1, 2, 'Tapia-Moly-RompenRed-Mozita', 0, 272885, '7HO15427', 0, 14),
(722, 503863, '2023-01-07', 63538, 1, 2, 'Tapia-Adriana-RompenRed-Valentina', 0, 414183, '7HO15427', 0, 14),
(723, 521797, '2022-07-08', 63564, 1, 2, 'Tapia-Juana-Pharo-Julieta', 0, 347984, '250HO12975', 0, 14),
(724, 521816, '2022-06-14', 60080, 1, 2, 'Tapia-Teresa-LusterP-Abril', 0, 283087, '7HO14160', 0, 14),
(725, 521883, '2022-09-04', 60096, 1, 2, 'Tapia-Paty-RompenRed-Hilaria', 0, 368774, '7HO15427', 0, 14),
(726, 521884, '2022-09-16', 60099, 1, 2, 'Tapia-Diana-Talon-Janeth', 0, 283055, '7HO15457', 0, 14),
(727, 521958, '2022-11-20', 63505, 1, 2, 'Tapia-Lisbet-RompenRed-Leydi', 0, 414012, '7HO15427', 0, 14),
(728, 521959, '2022-11-25', 63520, 1, 2, 'Tapia-Luna-RompenRed-Lupe', 0, 230346, '7HO15427', 0, 14),
(729, 521961, '2022-12-09', 63529, 1, 2, 'Tapia-Merlina-RompenRed-Mery', 0, 272735, '7HO15427', 0, 14),
(730, 539020, '2023-04-14', 63562, 1, 2, 'Tapia-Santusa-Tomek-MuÃ±eca', 0, 414361, '7HO12657', 0, 14),
(731, 539080, '2023-06-03', 63567, 1, 2, 'Tapia-Sol-RainyRed-Dina', 0, 431174, '250HO15316', 0, 14),
(732, 539113, '2023-06-19', 63571, 1, 2, 'Tapia-Coral-RickPRed-Cody', 0, 272762, '7HO15017', 0, 14),
(733, 539114, '2023-06-20', 63573, 1, 2, 'Tapia-Jesabel-RainyRed-Yovana', 0, 431169, '250HO15316', 0, 14),
(734, 539115, '2023-07-10', 63570, 1, 2, 'Tapia-Magui-Talon-Martha', 0, 279366, '7HO15457', 0, 14),
(735, 539116, '2023-07-12', 63579, 1, 2, 'Tapia-Josefina-RainyRed-Peni', 0, 368900, '250HO15316', 0, 14),
(736, 539130, '2023-08-05', 62662, 4, 2, 'Tapia-Maribel', 0, 414369, '0', 0, 14),
(737, 539152, '2024-01-09', 65626, 1, 2, 'Tapia-Dolores-Alphabet-Dominga', 0, 414157, '7HO14320', 0, 14),
(738, 539242, '2023-12-04', 65624, 1, 2, 'Tapia-Blanca-Alpahbet-Justina', 0, 348042, '7HO14320', 0, 14),
(739, 539273, '2023-12-24', 0, 4, 2, 'Tapia-Sylphy', 0, 474967, '0', 0, 14),
(740, 539274, '2023-12-26', 65619, 1, 2, 'Tapia-Ariel-RainyRed-Marisol', 0, 368852, '250HO15316', 0, 14),
(741, 539275, '2024-01-02', 65622, 1, 2, 'Tapia-Cielo-LightMyDire-Janeth', 0, 283055, '250HO12879', 0, 14),
(742, 539276, '2024-01-04', 65625, 1, 2, 'Tapia-Yermana-Alphabet-Pancha', 0, 347983, '7HO14320', 0, 14),
(743, 539277, '2024-01-09', 65628, 1, 2, 'Tapia-Gabi-Alphabet-Marina', 0, 368776, '7HO14320', 0, 14),
(744, 278557, '2017-11-17', 0, 4, 2, 'Merida-Malena', 0, 0, '0', 0, 13),
(745, 278578, '2013-03-16', 0, 4, 2, 'Merida-Petisa', 0, 0, '0', 0, 13),
(746, 278579, '2014-04-07', 0, 4, 2, 'Merida-Carla', 0, 0, '0', 0, 13),
(747, 279348, '2015-08-01', 0, 4, 2, 'Merida-Virginia', 0, 0, '0', 0, 13),
(748, 279362, '2018-03-21', 0, 1, 2, 'Merida-Nelly-Kenyon-Petisa', 0, 278578, '7HO12769', 0, 13),
(749, 315959, '2019-01-16', 56304, 1, 2, 'Merida-Puka-RagerRed-Cristy', 0, 279341, '7HO12344', 0, 13),
(750, 318502, '2019-09-15', 56334, 1, 2, 'Merida-Laura-KingTut-Isidra', 0, 279351, '7HO12726', 0, 13),
(751, 347938, '2019-05-20', 56315, 1, 2, 'Merida-Zulma-Kenyon-Virginia', 0, 279348, '7HO12769', 0, 13),
(752, 347989, '2019-06-14', 56320, 1, 2, 'Merida-Frecia-Kenyon-Petisa', 0, 278578, '7HO12769', 0, 13),
(753, 347990, '2019-06-14', 56321, 1, 2, 'Merida-Claudia-KingTutu-Mariela', 0, 279343, '7HO12726', 0, 13),
(754, 347991, '2019-06-15', 56318, 1, 2, 'Merida-Camila-Kenyon-Carla', 0, 278579, '7HO12769', 0, 13),
(755, 414107, '2021-01-03', 56372, 1, 2, 'Merida-Mary-Butler-Marisol', 0, 279421, '7HO12195', 0, 13),
(756, 414248, '2021-04-20', 56381, 1, 2, 'Merida-Maya-LusterP-Martha', 0, 279358, '7HO14160', 0, 13),
(757, 414334, '2021-07-12', 56393, 1, 2, 'Merida-Alita-Headliner-Luna', 0, 431105, '7HO11419', 0, 13),
(758, 414335, '2021-08-02', 56395, 1, 2, 'Merida-Lupe-BanjoP-Camila', 0, 347991, '7HO14694', 0, 13),
(759, 414489, '2021-10-16', 61405, 1, 2, 'Merida-Milka-Loyalty-Cristina', 0, 16102021, '509HO12690', 0, 13),
(760, 431105, '2019-01-22', 0, 4, 2, 'Merida-Luna', 0, 0, '0', 0, 13),
(761, 431113, '2020-06-05', 56350, 4, 2, 'Merida-Blanca-Doc-Petisa', 0, 278578, '250HO12961', 0, 13),
(762, 431252, '2020-09-15', 56362, 1, 2, 'Merida-Kochala-Butler-Mallku', 0, 278581, '7HO12195', 0, 13),
(763, 474972, '2022-02-10', 61423, 1, 2, 'Merida-Rutila-Cascade-Malena', 0, 278557, '7HO14401', 0, 13),
(764, 521753, '2022-04-20', 61428, 1, 2, 'Merida-Awita-Cascade-Petra', 0, 348064, '7HO14401', 0, 13),
(765, 521800, '2022-06-11', 61434, 1, 2, 'Merida-Dulce-Spartacus-Luna', 0, 431105, '7HO14674', 0, 13),
(766, 521801, '2022-06-21', 61435, 1, 2, 'Merida-Lupita-RompenRed-Puka', 0, 315959, '7HO15427', 0, 13),
(767, 521802, '2022-07-01', 61436, 1, 2, 'Merida-Nena-RustyRed-Nelly', 0, 279362, '7HO13826', 0, 13),
(768, 521855, '2022-08-01', 61442, 1, 2, 'Merida-Bella-RompenRed-Camila', 0, 347991, '7HO15427', 0, 13),
(769, 521966, '2022-11-22', 61449, 4, 4, 'Merida-Pili-August-Olivia', 0, 368861, '507BS5826', 0, 13),
(770, 521967, '2022-11-22', 614449, 4, 4, 'Merida-Mili-August-Olivia', 0, 368861, '507BS5826', 0, 13),
(771, 539028, '2023-04-23', 61469, 1, 2, 'Merida-Lina-RickPRed-Lala', 0, 431145, '7HO15017', 0, 13),
(772, 539029, '2023-05-03', 61473, 4, 2, 'Merida-Belinda-Magellan-Blanca', 0, 431113, '7AY121', 0, 13),
(773, 539063, '2023-05-22', 61476, 4, 4, 'Merida-Luzma-Discovery-Laura', 0, 3184502, '9BS925', 0, 13),
(774, 539090, '2023-03-17', 61478, 4, 4, 'Merida-Discovery-Malena', 0, 278557, '9BS925', 0, 13),
(775, 539203, '2023-09-08', 61483, 1, 4, 'Merida-Cielo-Discovery-Camila', 0, 347991, '9BS925', 0, 13),
(776, 539204, '2023-09-17', 61489, 1, 2, 'Merida-Linda-RainyRed-Lupe', 0, 414335, '250HO15316', 0, 13),
(777, 230232, '2013-11-30', 0, 4, 2, 'Cardozo-Juana', 0, 0, '0', 0, 8),
(778, 230244, '2016-10-31', 0, 1, 2, 'Cardozo-Celia-Braxton-Rosario', 0, 230227, '7HO9165', 0, 8),
(779, 230245, '2016-08-27', 0, 1, 2, 'Cardozo-Cirila-Brisco-Julia', 0, 230226, '7HO10908', 0, 8),
(780, 230246, '2016-03-12', 0, 1, 2, 'Cardozo-Rosa-Defender-Patricia', 0, 230233, '7HO11926', 0, 8),
(781, 230248, '2016-09-12', 0, 1, 2, 'Cardozo-Flor-Matt-Chela', 0, 230229, '7JE1344', 0, 8),
(782, 230252, '2017-04-27', 0, 1, 3, 'Cardozo-Reina-Antidote-Cocacola', 0, 230228, '7JE1131', 0, 8),
(783, 230253, '2017-05-28', 0, 1, 2, 'Cardozo-Lucy-Taillight-Constantina', 0, 230224, '7HO11591', 0, 8),
(784, 277241, '2018-04-17', 54017, 1, 2, 'Cardozo-Monica-Wonka-Patricia', 0, 230233, '7HO12175', 0, 8),
(785, 277242, '2018-04-26', 54022, 1, 3, 'Cardozo-Meche-Calypso-Domi', 0, 230237, '7JE1350', 0, 8),
(786, 277265, '2018-05-14', 54023, 1, 2, 'Cardozo-Mariel-RagerRed-Choca', 0, 230236, '7HO12344', 0, 8),
(787, 279378, '2018-06-20', 54025, 1, 2, 'Cardozo-Erlinda-Gamma-Victoria', 0, 230240, '7HO12723', 0, 8),
(788, 279379, '2018-06-22', 54026, 1, 2, 'Cardozo-Wilma-Heisemberg-Miki', 0, 230225, '7HO12569', 0, 8),
(789, 283052, '2018-10-21', 54031, 1, 2, 'Cardozo-Jorgina-Chrome-Rosa', 0, 230246, '7HO12464', 0, 8),
(790, 283057, '2018-11-24', 54036, 1, 2, 'Cardozo-Grace-Kenyon-Flor', 0, 230248, '7HO12769', 0, 8),
(791, 318404, '2019-01-20', 54037, 1, 2, 'Cardozo-Erika-Heisemberg-Juana', 0, 230232, '7HO12569', 0, 8),
(792, 347931, '2019-06-04', 54050, 1, 2, 'Cardozo-Lucia-Kingtut-Romalda', 0, 230234, '7HO12726', 0, 8),
(793, 348086, '2019-09-23', 54063, 1, 2, 'Cardozo-Luciana-Chrome-Miky', 0, 230225, '7HO12464', 0, 8),
(794, 368767, '2019-11-19', 54066, 1, 2, 'Cardozo-Adriana-Kenyon-Celia', 0, 230244, '7HO12769', 0, 8),
(795, 414119, '2021-01-26', 54089, 1, 2, 'Cardozo-Salome-Butler-Susi', 0, 230243, '7HO12195', 0, 8),
(796, 414360, '2021-08-04', 61009, 1, 2, 'Cardozo-Emilia-BanjoP-Erika', 0, 318404, '7HO14694', 0, 8),
(797, 414367, '2021-08-04', 61014, 1, 3, 'Cardozo-Reyli-Albion-Meche', 0, 277242, '7JE1620', 0, 8),
(798, 414368, '2021-08-13', 61011, 1, 2, 'Cardozo-Bonifacia-Bradnick-Camila', 0, 13082021, '7HO10999', 0, 8),
(799, 431092, '2020-02-10', 54075, 1, 2, 'Cardozo-Mary-Bradnick-Julia', 0, 230226, '7HO10999', 0, 8),
(800, 431093, '2020-02-29', 54076, 1, 2, 'Cardozo-Fernanda-Bradnick-Juana', 0, 230232, '7HO10999', 0, 8),
(801, 431162, '2020-06-15', 54084, 1, 2, 'Cardozo-Iris-Doc-Romalda', 0, 230234, '250HO12961', 0, 8),
(802, 431232, '2020-06-07', 54082, 1, 3, 'Cardozo-Janeth-Barnabas-Domi', 0, 230237, '7JE1294', 0, 8),
(803, 474852, '2021-11-12', 611017, 1, 2, 'Cardozo-Marlen-LusterP-Mariel', 0, 277265, '7HO14160', 0, 8),
(804, 490240, '2023-05-31', 61070, 1, 3, 'Cardozo-Jimena-SalsaP-Janeth', 0, 431232, '7JE1474', 0, 8),
(805, 521710, '2022-04-24', 61044, 1, 2, 'Cardozo-Natalia-Megapower-Janeth', 0, 431232, '7HO8778', 0, 8),
(806, 521742, '2022-05-19', 61032, 1, 2, 'Cardozo-Giovana-Hancock-Grace', 0, 283057, '250HO14579', 0, 8),
(807, 521751, '2022-05-21', 61031, 1, 2, 'Cardozo-Flora-Captivating-Fernanda', 0, 431093, '250HO15156', 0, 8),
(808, 521767, '2022-05-30', 61035, 1, 2, 'Cardozo-Magui-Advance-Monica', 0, 277241, '7HO12868', 0, 8),
(809, 521793, '2022-06-27', 61006, 1, 2, 'Cardozo-Evarista-Mabon-Flor', 0, 230248, '7HO12829', 0, 8),
(810, 521886, '2023-03-02', 61057, 1, 2, 'Cardozo-Marcela-RainyRed-Mariel', 0, 277265, '250HO15316', 0, 8),
(811, 521887, '2022-10-03', 61048, 1, 2, 'Cardozo-Retama-Captivating-Cirila', 0, 230245, '250HO15156', 0, 8),
(812, 521913, '2022-10-03', 61046, 1, 2, 'Cardozo-Casandra-RompenRed-Rosa', 0, 230246, '7HO15427', 0, 8),
(813, 539033, '2023-04-23', 61064, 1, 2, 'Cardozo-Leny-Zamboni-Lucy', 0, 230353, '7HO12837', 0, 8),
(814, 539236, '2023-10-28', 61081, 1, 2, 'Cardozo-Cinda-BanjoP-Cirila', 0, 230245, '7HO14694', 0, 8),
(815, 539237, '2023-10-29', 61078, 1, 2, 'Cardozo-Maya-Sunrise-Monica', 0, 277241, '7HO15225', 0, 8),
(816, 272767, '2015-04-08', 0, 4, 2, 'Marisol-Mandy-Freddy-Morita', 0, 0, '0', 0, 15),
(817, 272768, '2010-03-22', 0, 4, 2, 'Marisol-Colorina-PradokerRed-Chocolina', 0, 0, '0', 0, 15),
(818, 272770, '2014-02-25', 0, 4, 2, 'Marisol-Belinda-Lazarith-Blanca', 0, 0, '0', 0, 15),
(819, 272773, '2015-03-07', 0, 4, 2, 'Marisol-Clois-Freddy-Claris', 0, 0, '0', 0, 15),
(820, 272803, '2017-08-27', 0, 4, 2, 'Marisol-Micaela-Bolt-Mimi', 0, 0, '0', 0, 15),
(821, 272804, '2017-07-23', 0, 4, 2, 'Marisol-Pria-Piranha-Paris', 0, 272765, '0', 0, 15),
(822, 272917, '2017-12-12', 55222, 4, 2, 'Marisol-Bahia-Piranha-Baby', 0, 272781, '0', 0, 15),
(823, 279409, '2018-07-27', 55209, 1, 2, 'Marisol-Prisma-Payoffred-Popis', 0, 272769, '1HO11616', 0, 15),
(824, 283058, '2018-10-22', 552191, 1, 2, 'Marisol-Lety-Beecher-Leonar', 0, 272778, '7HO12043', 0, 15),
(825, 347940, '2019-06-05', 55235, 1, 2, 'Marisol-Kenosha-Cristal', 0, 272795, '7HO12773', 0, 15),
(826, 347994, '2019-06-25', 55242, 1, 2, 'Marisol-Mady-Kingtutu-Mady', 0, 272767, '7HO12726', 0, 15),
(827, 348063, '2019-08-08', 55248, 1, 2, 'Marisol-Clony-Kenosha-Clois', 0, 272773, '7HO12773', 0, 15),
(828, 368750, '2019-11-18', 55256, 1, 2, 'Marisol-Lina-Braxton-Laydi', 0, 272772, '7HO9165', 0, 15),
(829, 368751, '2019-11-29', 55259, 1, 2, 'Marisol-Bryna-Braxton-Bryana', 0, 272792, '7HO9165', 0, 15),
(830, 368891, '2020-01-27', 55264, 1, 2, 'Marisol-Levy-Bradnick-Leny', 0, 272805, '7HO10999', 0, 15),
(831, 368892, '2020-01-31', 55265, 1, 2, 'Marisol-Leo-Doc-Leonor', 0, 272778, '250HO12961', 0, 15),
(832, 368894, '2020-01-22', 58211, 4, 2, 'Marisol-Lincy-Bradnick-Lindaura', 0, 0, '7HO10999', 0, 15),
(833, 414031, '2020-07-01', 0, 4, 2, 'Marisol-Sandy-Reflector-Silvia', 0, 0, '7HO12105', 0, 15),
(834, 414032, '2020-07-21', 0, 4, 2, 'Marisol-Paolina-Havoc-Pilar', 0, 0, '7HO12645', 0, 15),
(835, 414033, '2020-07-17', 0, 1, 2, 'Marisol-Cristy-Doc-Cristal', 0, 272795, '250HO12961', 0, 15),
(836, 414034, '2020-09-10', 58203, 1, 2, 'Marisol-Melina-CrownRed-Mandy', 0, 272767, '7HO14460', 0, 15),
(837, 414224, '2021-03-28', 58231, 1, 2, 'Marisol-Calipso-CrownRed-Camila', 0, 318409, '7HO14460', 0, 15),
(838, 414249, '2021-04-10', 58232, 1, 2, 'Marisol-Catalina-Schmidt-Coraline', 0, 272776, '7HO12863', 0, 15),
(839, 414308, '2021-06-27', 58252, 1, 2, 'Marisol-Magdalena-Mabon-Micaela', 0, 272803, '7HO12829', 0, 15),
(840, 414374, '2021-08-14', 58258, 1, 2, 'Marisol-Cloisa-Headliner-Clois', 0, 272773, '7HO11419', 0, 15),
(841, 414487, '2021-10-08', 58264, 1, 2, 'Marisol-Madelin-LusterP-Mady', 0, 347994, '7HO14160', 0, 15),
(842, 414488, '2021-10-11', 58263, 1, 2, 'Marisol-Clarisa-LusterP-Clony', 0, 348063, '7HO14160', 0, 15),
(843, 431124, '2020-03-28', 0, 1, 2, 'Marisol-Puka-Chrome-Paris', 0, 272765, '7HO12464', 0, 15),
(844, 431254, '2020-06-23', 0, 1, 2, 'Marisol-Carelin-Havoc-Candy', 0, 272766, '7HO12645', 0, 15),
(845, 474803, '2021-11-01', 58267, 1, 2, 'Marisol-Maldina-Ascender-Mandy', 0, 272767, '7HO12616', 0, 15),
(846, 474923, '2021-12-13', 63218, 4, 2, 'Marisol-Luana-LusterP-Lia', 0, 0, '7HO14160', 0, 15),
(847, 474924, '2021-12-27', 63219, 4, 2, 'Marisol-Lilo-Bradnick-Lesly', 0, 0, '7HO10999', 0, 15),
(848, 474986, '2022-03-04', 63233, 1, 2, 'Marisol-Caridad-LusterP-Cecy', 0, 272786, '7HO14160', 0, 15),
(849, 474987, '2022-02-21', 58277, 1, 2, 'Marisol-Lais-Hancock-Leidy', 0, 272772, '250HO14579', 0, 15),
(850, 503873, '2022-12-18', 63226, 1, 2, 'Marisol-Betsabe-Jules-Belinda', 0, 272770, '7HO15002', 0, 15),
(851, 503878, '2023-02-20', 63237, 1, 2, 'Marisol-Caterina-RainyRed-Clony', 0, 348063, '250HO15316', 0, 15),
(852, 521773, '2022-05-15', 58280, 1, 2, 'Marisol-Candida-LusterP-Crisa', 0, 347940, '507HO14160', 0, 15),
(853, 521774, '2022-05-21', 58289, 1, 2, 'Marisol-Coral-Bradnick-Coraline', 0, 272776, '7HO10999', 0, 15),
(854, 521835, '2022-06-12', 58293, 1, 2, 'Marisol-Bata-LusterP-Bamby', 0, 318408, '7HO14160', 0, 15),
(855, 521836, '2022-07-03', 58295, 1, 2, 'Marisol-Caeli-RompenRed-Colorina', 0, 272768, '7HO15427', 0, 15),
(856, 521837, '2022-06-19', 0, 4, 2, 'Marisol-Prisca-LusterP-Palomita', 0, 0, '7HO14160', 0, 15),
(857, 521862, '2022-08-02', 63254, 4, 2, 'Marisol-Samira-ZekePRed-Sami', 0, 0, '7HO13921', 0, 15),
(858, 521873, '2022-08-16', 63202, 1, 2, 'Marisol-Beatriz-Captivating-Bahia', 0, 272917, '250HO15156', 0, 15),
(859, 521968, '2022-11-07', 63216, 1, 2, 'Marisol-Magnolia-RustyRed-Meche', 0, 277274, '7HO13826', 0, 15),
(860, 539031, '2023-04-18', 63244, 1, 2, 'Marisol-Crisandra-RainyRed-Crisa', 0, 347940, '250HO15316', 0, 15),
(861, 539232, '2023-04-19', 63246, 1, 2, 'Marisol-Mela-Tomek-Melina', 0, 414034, '7HO12657', 0, 15),
(862, 539053, '2023-04-18', 65911, 1, 2, 'Marisol-Saly-RainyRed-Sandra', 0, 0, '250HO15316', 0, 15),
(863, 539065, '2023-05-24', 63250, 1, 2, 'Marisol-Laila-RainyRed-Laidy', 0, 272772, '250HO15316', 0, 15),
(864, 539132, '2023-07-01', 63255, 1, 2, 'Marisol-Cora-RainyRed-Colorina', 0, 272768, '250HO15316', 0, 15),
(865, 539178, '2023-07-08', 63258, 1, 2, 'Marisol-Laila-BanjoP-Lina', 0, 368750, '7HO14694', 0, 15),
(866, 539179, '2023-07-19', 63263, 1, 2, 'Marisol-Lafita-RickpRed-Lety', 0, 283058, '7HO15017', 0, 15),
(867, 539205, '2023-08-25', 63274, 1, 2, 'Marisol-Cloe-RickPRed-Chandra', 0, 431125, '7HO15017', 0, 15),
(868, 539206, '2023-09-12', 63277, 1, 2, 'Marisol-Cala-Sunrise-Carelin', 0, 431254, '7HO15225', 0, 15),
(869, 539207, '2023-07-27', 0, 4, 2, 'Marisol-Serena-RickPRed-Sami', 0, 0, '0', 0, 15),
(870, 539231, '2023-12-03', 0, 4, 2, 'Marisol-Cecia', 0, 0, '0', 0, 15),
(871, 539238, '2023-10-10', 63282, 1, 2, 'Marisol-Blasa-Talon-Bahia', 0, 272917, '7HO15457', 0, 15),
(872, 14968, '2016-10-20', 50330, 3, 2, 'Mafloren-Lucifer-Montross-Jovita', 0, 12794, '7HO12165', 0, 4),
(873, 14979, '2016-02-25', 50369, 3, 2, 'Mafloren-Candelaria-Halogen-Camila', 0, 14909, '7HO12008', 0, 4),
(874, 14981, '2017-01-23', 50380, 1, 2, 'Mafloren-Estelita-Brisco-Fabi', 0, 13571, '7HO10908', 0, 4),
(875, 14982, '2014-11-02', 0, 3, 2, 'Mafloren-Mariquilla-Primetime-Pituca', 0, 12894, '7HO10501', 0, 4),
(876, 277216, '2017-05-06', 51240, 3, 2, 'Mafloren-Maruja-Chrome-Domitila', 0, 13367, '7HO12464', 0, 4),
(877, 279458, '2018-03-11', 52360, 1, 2, 'Mafloren-Chevela-Kenyon-Ely', 0, 13518, '7HO12769', 0, 4),
(878, 279462, '2017-09-28', 52304, 7, 2, 'Mafloren-Irma-Kenyon-Isaura', 0, 14929, '7HO12769', 0, 4),
(879, 283009, '2018-10-08', 54248, 1, 2, 'Mafloren-Evaliz-Petrone-Sandra', 0, 14990, '7HO11169', 0, 4),
(880, 315912, '2019-03-18', 56214, 2, 2, 'Mafloren-Matilda-Kingboy-Margarita', 0, 14977, '7HO12198', 0, 4),
(881, 348005, '2019-07-22', 56258, 1, 2, 'Mafloren-Teodosia-Petrone-Wendy', 0, 347986, '7HO11169', 0, 4),
(882, 348007, '2019-07-29', 56274, 2, 2, 'Mafloren-Celestina-Reynold-Amalia', 0, 14928, '7HO12150', 0, 4),
(883, 348101, '2019-09-20', 56299, 7, 2, 'Mafloren-Jovita-Bradnick-Juanita', 0, 14994, '7HO10999', 0, 4),
(884, 353894, '2020-12-08', 59469, 2, 2, 'Mafloren-Rosa-LusterP-Samanta', 0, 14905, '7HO14160', 0, 4),
(885, 368733, '2019-09-15', 56292, 2, 2, 'Mafloren-Reyna-Kenyon-Carolina', 0, 14899, '7HO12769', 0, 4),
(886, 368734, '2019-10-10', 59442, 3, 2, 'Mafloren-Yoya-Petrone-Maruja', 0, 277216, '7HO11169', 0, 4),
(887, 368808, '2019-11-29', 57924, 1, 2, 'Mafloren-Regina-Kenyon-Roxana', 0, 14970, '7HO12769', 0, 4),
(888, 414116, '2019-10-11', 57903, 1, 2, 'Mafloren-Norma-Kingtut-Isidra', 0, 11102019, '7HO12726', 0, 4),
(889, 414117, '2021-01-08', 59471, 2, 2, 'Mafloren-Mati-LusterP-Margarita', 0, 14977, '7HO14160', 0, 4),
(890, 414118, '2021-01-09', 59485, 1, 2, 'Mafloren-Sara-LusterP-Romina', 0, 431276, '7HO14160', 0, 4),
(891, 414185, '2021-03-27', 59492, 7, 2, 'Mafloren-Maria-Schmidt-Verito', 0, 14934, '7HO12863', 0, 4),
(892, 414233, '2021-04-11', 59496, 2, 2, 'Mafloren-Luisa-Loyalty-Celia', 0, 348041, '7HO12690', 0, 4),
(893, 414305, '2021-05-11', 60604, 1, 4, 'Mafloren-Eliza-Bankit-Estefania', 0, 230132, '7BS909', 0, 4),
(894, 414311, '2021-05-22', 60613, 3, 2, 'Mafloren-Lusmery-BanjoP-Lucifer', 0, 14968, '7HO14694', 0, 4),
(895, 414320, '2021-07-08', 60633, 2, 2, 'Mafloren-Riso-Cascade-Turca', 0, 277293, '7HO14401', 0, 4),
(896, 414390, '2021-09-15', 60652, 1, 4, 'Mafloren-Zamba-Bosephus-Zabina', 0, 230481, '7BS852', 0, 4),
(897, 414395, '2021-09-28', 60666, 2, 2, 'Mafloren-Ruth-LusterP-Azucena', 0, 14976, '7HO14160', 0, 4),
(898, 431085, '2020-04-09', 57980, 2, 2, 'Mafloren-Bella-Doc-Casta', 0, 14966, '250HO12961', 0, 4),
(899, 431087, '2020-05-08', 57956, 1, 2, 'Mafloren-Blanca-House-Sexi', 0, 279460, '7HO12978', 0, 4),
(900, 431216, '2020-08-02', 59432, 3, 2, 'Mafloren-Agripina-Havoc-Carmela', 0, 14973, '7HO12645', 0, 4),
(901, 431217, '2020-08-15', 59435, 2, 2, 'Mafloren-Lucy-Reflector-Carolina', 0, 14899, '7HO12105', 0, 4),
(902, 431220, '2020-08-23', 59438, 3, 2, 'Mafloren-Rosalia-Reflector-Mariquilla', 0, 14982, '7HO12105', 0, 4),
(903, 431247, '2020-08-28', 59441, 2, 1, 'Mafloren-Clarabella-Bradnick-Turca', 0, 277293, '7HO10999', 0, 4),
(904, 474960, '2022-03-25', 61927, 3, 2, 'Mafloren-Gregoria-Renegade-Yoya', 0, 368734, '550HO14134', 0, 4),
(905, 474996, '2022-02-04', 61911, 2, 2, 'Mafloren-Liliana-Renegade-Marilu', 0, 431278, '250HO14134', 0, 4),
(906, 474997, '2022-01-08', 61912, 2, 2, 'Mafloren-Giovana-Spartacus-Greta', 0, 348039, '7HO14674', 0, 4),
(907, 490246, '2022-12-18', 63151, 2, 2, 'Mafloren-Carlota-Captivating-Celestina', 0, 348007, '250HO15156', 0, 4),
(908, 490248, '2022-12-26', 63153, 2, 2, 'Mafloren-Raquel-Captivating-Lucy', 0, 431217, '250HO15156', 0, 4),
(909, 503938, '2023-03-15', 63182, 3, 2, 'Mafloren-Aylin-Alphabet-Angela', 0, 521722, '7HO14320', 0, 4),
(910, 503942, '2020-05-27', 57995, 3, 2, 'Mafloren-Linda-Doc-Sisy', 0, 15000, '250HO12961', 0, 4),
(911, 503943, '2023-02-20', 63171, 1, 2, 'Mafloren-Doris-Captivating-Sara', 0, 414118, '250HO15156', 0, 4),
(912, 503945, '2023-01-10', 63161, 7, 2, 'Mafloren-Alicia-Captivating-Jovita', 0, 348101, '250HO15156', 0, 4),
(913, 521711, '2019-07-16', 56266, 2, 2, 'Mafloren-Celina-Kenyon-Carina', 0, 14935, '7HO12769', 0, 4),
(914, 521722, '2019-06-10', 56247, 3, 2, 'Mafloren-Angela-Kenyon-Mariquilla', 0, 14982, '7HO12769', 0, 4),
(915, 521723, '2018-09-03', 54227, 2, 2, 'Mafloren-Greta-Kenyon-Gringa', 0, 14910, '7HO12769', 0, 4),
(916, 521736, '2022-04-06', 63187, 2, 2, 'Mafloren-Nina-Reyna-Captivating', 0, 368733, '250HO15156', 0, 4),
(917, 521785, '2022-06-16', 61999, 2, 2, 'Mafloren-Belinda-Captivating-Bella', 0, 431085, '250HO15156', 0, 4),
(918, 521821, '2019-07-01', 56260, 7, 2, 'Mafloren-Isidra-Kenyon-Isaura', 0, 14929, '7HO12769', 0, 4),
(919, 521845, '2022-07-15', 63110, 1, 2, 'Mafloren-Yayita-Captivating-Chevela', 0, 2794458, '250HO15156', 0, 4),
(920, 521897, '2022-09-20', 63132, 2, 2, 'Mafloren-Alaska-Captivating-Amalia', 0, 14928, '250HO15156', 0, 4),
(921, 521944, '2022-10-25', 63137, 1, 4, 'Mafloren-Karmina-Skyhigh-Julissa', 0, 521944, '7BS914', 0, 4),
(922, 521985, '2022-11-15', 63144, 7, 2, 'Mafloren-Katy-Captivating-Flora', 0, 521996, '250HO15156', 0, 4),
(923, 521996, '2020-08-24', 59453, 7, 2, 'Mafloren-Flora-Reflector-Carlota', 0, 272914, '7HO12105', 0, 4),
(924, 539023, '2023-04-24', 63199, 3, 2, 'Mafloren-Domitila-Luszmery', 0, 414311, '7HO15457', 0, 4),
(925, 539086, '2023-05-28', 65033, 2, 2, 'Mafloren-Arminda-Alphabet-Rosa', 0, 353894, '7HO14320', 0, 4),
(926, 539145, '2023-07-14', 65061, 2, 2, 'Mafloren-Mary-Alphabet-Celina', 0, 521711, '7HO14320', 0, 4),
(927, 539146, '2023-07-20', 65063, 1, 2, 'Mafloren-Aurora-Alphabet-Blanca', 0, 431087, '7HO14320', 0, 4),
(928, 539221, '2023-10-20', 65097, 7, 2, 'Mafloren-Deysi-Roadster-Verito', 0, 14934, '250HO15026', 0, 4),
(929, 539232, '2023-04-27', 65016, 7, 2, 'Mafloren-Sofia-Talon-Isidra', 0, 521821, '7HO15457', 0, 4),
(930, 539244, '2023-11-11', 65804, 1, 2, 'Mafloren-Ariane-Roadster-Evaliz', 0, 283009, '250HO15026', 0, 4),
(931, 548, '2014-12-20', 0, 4, 3, 'Mafloren-Soraya', 0, 0, '0', 0, 4),
(932, 14908, '2014-02-01', 0, 4, 3, 'Mafloren-Luciana', 0, 0, '0', 0, 4),
(933, 14948, '2015-12-18', 48205, 2, 3, 'Mafloren-Dudu-Miles-Dulcinea', 0, 402, '7JE886', 0, 4),
(934, 14958, '2016-04-14', 48268, 3, 3, 'Mafloren-Rosita-Calypso-Alegra', 0, 556, '7JE1350', 0, 4),
(935, 14978, '2016-12-17', 50365, 1, 3, 'Mafloren-Maruja-Calypso-Felicidad', 0, 14922, '7JE1350', 0, 4),
(936, 14985, '2017-05-15', 51247, 1, 2, 'Mafloren-Gladiola-Barnabas-Dori', 0, 14946, '7JE1294', 0, 4),
(937, 244347, '2015-12-20', 47706, 1, 3, 'Mafloren-Cacao-Irwin-Canela', 0, 511, '7JE1163', 0, 4),
(938, 315992, '2019-03-20', 56201, 1, 2, 'Mafloren-Dayra-Barnabas-Delia', 0, 774732, '7JE1294', 0, 4),
(939, 347977, '2019-06-26', 56253, 1, 3, 'Mafloren-Diana-Barnabas-Dori', 0, 14946, '7JE1294', 0, 4),
(940, 348078, '2019-08-02', 56276, 1, 3, 'Mafloren-Agripina-Barnabas-Luciana', 0, 14908, '7JE1294', 0, 4),
(941, 414184, '2021-03-15', 59491, 1, 3, 'Mafloren-Pinki-Chrome-Dayra', 0, 315992, '7JE5004', 0, 4),
(942, 414312, '2021-05-29', 60621, 1, 3, 'Mafloren-Concepcion-Respect-Tiburcia', 0, 279446, '7JE1638', 0, 4),
(943, 414340, '2021-07-29', 60636, 1, 3, 'Mafloren-Chuky-Respect-Cacao', 0, 244347, '7JE1638', 0, 4),
(944, 431088, '2020-05-16', 57989, 1, 3, 'Mafloren-Buba-Chrome-Maruja', 0, 14972, '7JE5004', 0, 4),
(945, 431090, '2020-05-23', 57994, 2, 3, 'Mafloren-Burbuja-Chrome-Dudu', 0, 14948, '7JE5004', 0, 4),
(946, 431188, '2020-07-18', 59415, 1, 3, 'Mafloren-Yenny-Chrome-Gladiola', 0, 14985, '7JE5004', 0, 4),
(947, 431189, '2020-07-25', 59421, 1, 3, 'Mafloren-Liza-Chrome-Amanda', 0, 277294, '7JE5004', 0, 4),
(948, 431269, '2018-05-20', 52384, 1, 3, 'Mafloren-Mini-Barnabas-Rosita', 0, 14958, '7JE1294', 0, 4),
(949, 474848, '2021-11-10', 60667, 1, 3, 'Mafloren-Flora-Chrome-Agripina', 0, 348078, '7JE5004', 0, 4),
(950, 474849, '2021-11-17', 60682, 1, 1, 'Mafloren-Silvia-Megapower-Julissa', 0, 315996, '7JE5011', 0, 4),
(951, 474909, '2022-01-05', 61904, 1, 3, 'Mafloren-Charito-Megapower-Pikachu', 0, 272825, '7JE5011', 0, 4),
(952, 521735, '2019-08-20', 56286, 1, 3, 'Mafloren-Sarita-Barnabas-Chaparrita', 0, 14939, '7JE1294', 0, 4),
(953, 521738, '2022-04-08', 61944, 1, 3, 'Mafloren-Bee-Kiawa-Sarita', 0, 521735, '7JE1617', 0, 4),
(954, 521741, '2018-06-03', 52389, 1, 3, 'Mafloren-Amanda-Barnabas-Vicky', 0, 414, '7JE1294', 0, 4),
(955, 521783, '2022-06-02', 61979, 1, 3, 'Mafloren-Alaya-Respect-Gladiola', 0, 14985, '507JE1638', 0, 4),
(956, 521809, '2022-05-02', 61960, 2, 3, 'Mafloren-Norma-Kiawa-Burbuja', 0, 431090, '7JE1617', 0, 4),
(957, 521846, '2022-07-20', 63111, 1, 3, 'Mafloren-Vicky-Kiawa-Yenny', 0, 431188, '7JE1617', 0, 4),
(958, 521869, '2022-08-20', 63120, 1, 3, 'Mafloren-Maricucha-Benelli-Chaparrita', 0, 14939, '7JE1724', 0, 4),
(959, 539098, '2023-06-11', 65037, 1, 3, 'Mafloren-Faby-Kiawa-Pinki', 0, 414184, '7JE1617', 0, 4),
(960, 539175, '2023-09-07', 65080, 1, 3, 'Mafloren-Macarena-Graduate-Yenny', 0, 431188, '7JE1939', 0, 4),
(961, 539176, '2023-09-23', 65084, 1, 4, 'Mafloren-Teofila-Rampage-Silvia', 0, 474849, '507BS905', 0, 4),
(962, 539222, '2022-12-25', 65092, 1, 3, 'Mafloren-Rosmery-Kiawa-Dayra', 0, 315992, '7JE1617', 0, 4),
(963, 539245, '2023-11-25', 65808, 3, 3, 'Mafloren-Marisol-Albion-Rosita', 0, 14958, '7JE1620', 0, 4),
(964, 414474, '2021-09-28', 61379, 7, 2, 'P.Ancha-Ester-Eminent-Kusiy', 6021, 272931, '7HO14329', 0, 12),
(965, 414485, '2021-10-04', 61383, 7, 2, 'P.Ancha-Eta-Eminent-Roki', 61383, 283045, '7HO14329', 0, 12),
(966, 474877, '2021-11-07', 61608, 3, 2, 'P.Ancha-Lawa-LusterP-Body', 0, 368741, '7HO14160', 0, 12),
(967, 474901, '2021-12-26', 61658, 3, 2, 'P.Ancha-Sola-Samuri-Mecha', 0, 272929, '7HO12897', 0, 12),
(968, 503852, '2022-12-02', 63741, 3, 2, 'P.Ancha-Ropa-Renegade-Luna', 0, 414082, '550HO14134', 0, 12),
(969, 503853, '2022-12-06', 63488, 7, 2, 'P.Ancha-Rilma-Renegade-Lili', 0, 414024, '550HO14134', 0, 12),
(970, 503854, '2022-12-06', 63485, 7, 2, 'P.Ancha-Rut-Renegade-Lupe', 0, 414114, '550HO14134', 0, 12),
(971, 503855, '2022-12-12', 63484, 7, 2, 'P.Ancha-Rina-Renegade-Kety', 0, 368763, '550HO14134', 0, 12),
(972, 503856, '2022-12-15', 63489, 3, 2, 'P.Ancha-Layla-LusterP-Patri', 0, 277297, '7HO14160', 0, 12),
(973, 503857, '2022-12-21', 63486, 7, 2, 'P.Ancha-Loyda-LusterP-Poli', 0, 279402, '7HO14160', 0, 12),
(974, 503858, '2022-12-22', 63498, 7, 2, 'P.Ancha-Linda-LusterP-Bisa', 0, 368738, '7HO14160', 0, 12),
(975, 503859, '2022-12-25', 63709, 2, 2, 'P.Ancha-Casta-Captivating-Moly', 0, 431230, '250HO15156', 0, 12),
(976, 503897, '2023-01-07', 63713, 7, 2, 'P.Ancha-Mika-Mick-Roky', 0, 283045, '250HO14407', 0, 12),
(977, 503898, '2023-01-07', 63708, 7, 2, 'P.Ancha-CaÃ±a-Captivating-Rita', 0, 348084, '250HO15156', 0, 12),
(978, 503899, '0003-01-14', 63711, 3, 2, 'P.Ancha-Rika-Renegade-Luci', 0, 414151, '550HO14134', 0, 12),
(979, 503900, '2023-01-11', 63715, 3, 2, 'P.Ancha-Royal-Renegade-Lina', 0, 414111, '550HO14134', 0, 12),
(980, 503901, '2023-01-15', 63716, 7, 2, 'P.Ancha-Remi-Renegade-Lana', 0, 414180, '550HO14134', 0, 12),
(981, 503915, '2023-02-02', 63741, 3, 2, 'P.Ancha-Lucia-Logistics-Gota', 0, 315929, '250HO15208', 0, 12),
(982, 503916, '2023-02-08', 63739, 7, 2, 'P.Ancha-Love-Logistics-Hoja', 0, 368765, '250HO15208', 0, 12),
(983, 503939, '2023-03-02', 63758, 3, 2, 'P.Ancha-Roka-Magnitude-Lira', 0, 414160, '7HO14792', 0, 12),
(984, 503940, '2023-03-03', 63759, 7, 2, 'P.Ancha-Lilia-Logistics-Eva', 0, 414209, '250HO15208', 0, 12),
(985, 503941, '2023-03-03', 63752, 3, 2, 'P.Ancha-Lasy-Logistics-Rudy', 0, 348049, '250HO15208', 0, 12),
(986, 503946, '0003-02-08', 63744, 7, 2, 'P.Ancha-Suci-Samuri-Bea', 0, 368736, '7HO12897', 0, 12),
(987, 503947, '2023-02-12', 63746, 3, 2, 'P.Ancha-Sara-Samuri-Zalay', 0, 414019, '7HO12897', 0, 12),
(988, 503948, '2023-02-14', 63748, 3, 2, 'P.Ancha-Clave-Coffe-Ema', 0, 414208, '250HO14310', 0, 12),
(989, 503949, '2023-02-17', 63747, 7, 2, 'P.Ancha-Clara-Coffee-Zabel', 0, 414206, '250HO14310', 0, 12),
(990, 503950, '2023-02-25', 63750, 7, 2, 'P.Ancha-Mery-Magnitude-Pulpo', 0, 315908, '7HO14792', 0, 12),
(991, 503951, '2023-02-28', 63760, 7, 2, 'P.Ancha-Mony-Magnitude-Zeyna', 0, 503869, '7HO14792', 0, 12),
(992, 521703, '2022-02-27', 62314, 2, 2, 'P.Ancha-Ruby-Eminent-Pinky', 0, 347979, '507HO14329', 0, 12),
(993, 521704, '2022-03-03', 62312, 7, 2, 'P.Ancha-Luz-LusterP-Ray', 0, 283048, '7HO14160', 0, 12),
(994, 521706, '2022-03-07', 62322, 3, 2, 'P.Ancha-Lama-LusterP-Holme', 0, 368766, '507HO14160', 0, 12),
(995, 521745, '2022-04-29', 62369, 7, 2, 'P.Ancha-Masa-Mick-Zulma', 0, 431070, '250HO14407', 0, 12),
(996, 521746, '2022-04-29', 62371, 3, 2, 'P.Ancha-Muyu-Mick-Playa', 0, 318442, '250HO14407', 0, 12),
(997, 521747, '2022-04-29', 62361, 3, 2, 'P.Ancha-Lenci-LusterP-RomaRed', 0, 272856, '7HO14160', 0, 12),
(998, 521750, '2022-05-08', 623787, 3, 2, 'P.Ancha-Sofi-Samuri-Bania', 0, 431068, '7HO12897', 0, 12),
(999, 521826, '2022-06-21', 62408, 3, 2, 'P.Ancha-Loma-LusterP-Raly', 0, 347978, '507HO14160', 0, 12),
(1000, 521828, '2022-06-25', 62400, 7, 2, 'P.Ancha-Laci-LusterP-Boa', 0, 431155, '507HO14160', 0, 12),
(1001, 521832, '2022-06-11', 62388, 7, 2, 'P.Ancha-Sumo-Samuri-Haya', 0, 431223, '507HO12897', 0, 12),
(1002, 521850, '2022-07-22', 62436, 1, 2, 'P.Ancha-Sulfa-Samuri-Para', 0, 318444, '7HO12897', 0, 12),
(1003, 521851, '2022-07-29', 62449, 3, 2, 'P.Ancha-Lago-LusterP-Barni', 0, 431157, '7HO14160', 0, 12),
(1004, 521878, '2022-08-01', 62447, 7, 2, 'P.Ancha-Sima-Samuri-Zami', 0, 431156, '7HO12897', 0, 12),
(1005, 521879, '2022-08-03', 62451, 7, 2, 'P.Ancha-Safi-Samuri-Magui', 0, 431222, '7HO12897', 0, 12),
(1006, 521880, '2022-08-11', 62455, 7, 2, 'P.Ancha-Sonda-Samuri-Blak', 0, 431066, '7HO12897', 0, 12),
(1007, 521881, '2022-08-23', 62464, 7, 2, 'P.Ancha-Soli-Samuri-Maiz', 4522, 431160, '7HO12897', 0, 12),
(1008, 521882, '2022-08-29', 62473, 1, 2, 'P.Ancha-Sapi-Samuri-Paris', 4622, 277240, '7HO12897', 0, 12),
(1009, 521903, '2022-09-06', 62477, 7, 2, 'P.Ancha-Suma-Samuri-Randy', 62477, 283049, '7HO12897', 0, 12),
(1010, 521904, '2022-09-14', 62483, 7, 2, 'P.Ancha-Later-LusterP-Holi', 2248, 431262, '7HO14160', 0, 12),
(1011, 521905, '2022-09-18', 62491, 7, 2, 'P.Ancha-Santa-Samuri-Bata', 0, 431225, '7HO12897', 0, 12),
(1012, 521906, '2022-09-19', 62486, 1, 2, 'P.Ancha-Lia-LusterP-Zony', 2250, 431159, '7HO14160', 0, 12),
(1013, 521907, '2022-09-20', 62495, 2, 2, 'P.Ancha-Secy-Samuri-Zary', 2251, 431266, '7HO12897', 0, 12),
(1014, 521908, '2022-09-27', 64062, 7, 2, 'P.Ancha-Caly-Captivating-Zuri', 2252, 431267, '250HO15156', 0, 12),
(1015, 521909, '2022-09-25', 62492, 7, 2, 'P.Ancha-Latex-LusterP-Hana', 2253, 431265, '7HO14160', 0, 12),
(1016, 521910, '2022-09-27', 62499, 7, 2, 'P.Ancha-Saky-Samuri-Hand', 2254, 230440, '7HO12897', 0, 12),
(1017, 521911, '2022-09-30', 62494, 7, 2, 'P.Ancha-Lea-LusterP-RamaRed', 2255, 431250, '7HO14160', 0, 12),
(1018, 521912, '2022-09-30', 63411, 7, 2, 'P.Ancha-Rizo-Renegade-Hania', 63411, 431263, '550HO14130', 0, 12),
(1019, 521953, '2022-10-11', 63417, 7, 2, 'P.Ancha-Leya-LusterP-Maya', 5722, 431224, '7HO14160', 0, 12),
(1020, 521954, '2022-10-13', 63416, 7, 2, 'P.Ancha-RiÃ±a-Renegade-Tady', 5822, 414022, '550HO14134', 0, 12),
(1021, 521956, '2022-10-18', 63423, 3, 2, 'P.Ancha-Celma-Captivating-Zumi', 6022, 414020, '250HO15156', 0, 12);
INSERT INTO `animal` (`idAnimal`, `chb`, `fecha_nacimiento`, `nro_registro`, `categoria`, `raza`, `nombre`, `rp`, `chbmadre`, `naabpadre`, `estado`, `fincaID`) VALUES
(1022, 521957, '2022-10-26', 63426, 7, 2, 'P.Ancha-Malta-Mick-Kina', 6122, 368704, '250HO14407', 0, 12),
(1023, 521988, '2022-10-30', 63440, 3, 2, 'P.Ancha-Cielo-Captivating-May', 521988, 347981, '250HO15156', 0, 12),
(1024, 521989, '2022-11-08', 63448, 7, 2, 'P.Ancha-Celia-Captivating-Tina', 6322, 414155, '250HO15156', 0, 12),
(1025, 521990, '2022-11-10', 63429, 7, 2, 'P.Ancha-Cari-Cativating-Kutiy', 2264, 283043, '250HO15156', 0, 12),
(1026, 521991, '2022-11-18', 63456, 3, 2, 'P.Ancha-Rebe-Renegade-Lila', 6522, 414074, '550HO14134', 0, 12),
(1027, 521992, '2022-11-20', 63468, 7, 2, 'P.Ancha-Mata-Mick-Lima', 6622, 414081, '250HO14407', 0, 12),
(1028, 521993, '2022-11-22', 63461, 7, 2, 'P.Ancha-Carla-Captivating-Zani', 6722, 414021, '250HO15156', 0, 12),
(1029, 521994, '2022-11-26', 63465, 7, 2, 'P.Ancha-Rumi-Renegade-Tere', 6822, 414025, '550HO14134', 0, 12),
(1030, 521995, '2022-11-28', 63453, 7, 2, 'P.Ancha-Reyli-Renegade-Lola', 6922, 414023, '550HO14134', 0, 12),
(1031, 539003, '2023-03-06', 637596, 3, 2, 'P.Ancha-Maite-Mick-Pame', 1723, 315909, '250HO14407', 0, 12),
(1032, 539004, '2023-03-07', 63772, 7, 2, 'P.Ancha-Moira-Magnitude-Lody', 1823, 414154, '7HO14792', 0, 12),
(1033, 539005, '2023-03-11', 63775, 2, 2, 'P.Ancha-Mar-Magnitude-Lulu', 1923, 414073, '7HO14792', 0, 12),
(1034, 539006, '2023-03-13', 63766, 7, 2, 'P.Ancha-Leydi-Logistics-Holl', 2023, 431058, '250HO15208', 0, 12),
(1035, 539008, '2023-03-17', 63764, 3, 2, 'P.Ancha-Llave-Logistics-Kony', 2223, 431056, '250HO15208', 0, 12),
(1036, 539009, '2023-03-20', 63777, 7, 2, 'P.Ancha-Letra-Logistics-Elin', 2323, 414253, '250HO15208', 0, 12),
(1037, 539010, '2023-03-23', 63779, 1, 2, 'P.Ancha-Mirta-Magnitude-Elma', 2423, 414210, '7HO14792', 0, 12),
(1038, 539011, '2023-03-29', 63794, 7, 2, 'P.Ancha-Maki-Magnitude-Zandi', 2523, 368761, '7HO14792', 0, 12),
(1039, 539012, '2023-03-31', 63780, 3, 2, 'P.Ancha-Cely-Coffe-RemiRed', 2623, 414226, '250HO14310', 0, 12),
(1040, 539026, '2023-05-01', 64008, 3, 2, 'P.Ancha-Saka-Samuri-RomaRed', 503892, 503892, '7HO12897', 0, 12),
(1041, 539027, '2023-05-04', 64015, 7, 2, 'P.Ancha-Lexus-Logistics-Esli', 3423, 414151, '250HO15208', 0, 12),
(1042, 539043, '2023-04-04', 63792, 7, 2, 'P.Ancha-Mita-Magnitude-Zulma', 2723, 431070, '7HO14792', 0, 12),
(1043, 539044, '2023-04-17', 64001, 7, 2, 'P.Ancha-Coma-Coffe-Ena', 2823, 414283, '250HO14310', 0, 12),
(1044, 539045, '2023-04-20', 64004, 3, 2, 'P.Ancha-Miel-Magnitude-Elif', 2923, 414252, '7HO14792', 0, 12),
(1045, 539046, '2023-04-21', 64005, 7, 2, 'P.Ancha-Sumba-Samuri-Taki', 3023, 414026, '507HO12897', 0, 12),
(1046, 539047, '2023-04-24', 64007, 7, 2, 'P.Ancha-Motul-Magnitude-Suna', 3123, 414254, '7HO14792', 0, 12),
(1047, 539048, '2023-04-25', 64014, 1, 2, 'P.Ancha-Maday-Magnitude-Enar', 3223, 414288, '7HO14792', 0, 12),
(1048, 539052, '2023-05-09', 64017, 7, 2, 'P.Ancha-Ceci-Coffee-Emi', 3523, 414281, '250HO14310', 0, 12),
(1049, 539071, '2023-05-09', 64022, 7, 2, 'P.Ancha-Marle-Magnitude-Lety', 3623, 414255, '7HO14792', 0, 12),
(1050, 539072, '2023-05-10', 64020, 3, 2, 'P.Ancha-Salta-Samuri-Bama', 2723, 368869, '7HO12897', 0, 12),
(1051, 539073, '2023-05-11', 64021, 7, 2, 'P.Ancha-Milan-Magnitude-Bian', 3823, 368814, '7HO14792', 0, 12),
(1052, 539074, '2023-05-20', 64029, 7, 2, 'P.Ancha-Coca-Coffee-Sami', 3923, 414289, '250HO14310', 0, 12),
(1053, 539075, '2023-05-24', 64030, 1, 2, 'P.Ancha-Claro-Coffee-Lara', 4023, 414285, '250HO14310', 0, 12),
(1054, 539076, '2023-05-28', 64032, 3, 2, 'P.Ancha-Chava-Coffee-Ela', 4123, 414286, '250HO14310', 0, 12),
(1055, 539077, '2023-05-29', 64028, 7, 2, 'P.Ancha-Cata-Coffee-Zoe', 4223, 414205, '250HO14310', 0, 12),
(1056, 539078, '2023-05-31', 64043, 3, 2, 'P.Ancha-Cliza-Coffee-Sol', 4323, 414284, '250HO14310', 0, 12),
(1057, 539100, '2023-06-03', 64041, 7, 2, 'P.Ancha-Seja-Samuri-Zanit', 4423, 503868, '7HO12897', 0, 12),
(1058, 539101, '2023-06-04', 64039, 3, 2, 'P.Ancha-Cola-Coffee-Zaida', 4523, 431152, '250HO14310', 0, 12),
(1059, 539102, '2023-06-09', 64037, 7, 2, 'P.Ancha-Menta-Mick-Zair', 4623, 414207, '250HO14407', 0, 12),
(1060, 539103, '2023-06-14', 64045, 3, 2, 'P.Ancha-Lupe-Logistics-Pony', 4723, 318485, '250HO15208', 0, 12),
(1061, 539104, '2023-06-15', 15062023, 7, 2, 'P.Ancha-Crema-Coffee-Boa', 4823, 431155, '250HO14310', 0, 12),
(1062, 539105, '2023-06-21', 64050, 3, 2, 'P.Ancha-Cilva-Coffee-Hola', 64050, 431059, '250HO14310', 0, 12),
(1063, 539106, '2023-06-25', 64057, 7, 2, 'P.Ancha-Cloy-Coffee-Luka', 5023, 414355, '250HO14310', 0, 12),
(1064, 539117, '2023-08-31', 64815, 7, 2, 'P.Ancha-Lety-LusterP-Selfi', 6323, 414468, '7HO14160', 0, 12),
(1065, 539137, '2023-10-16', 64864, 2, 2, 'P.Ancha-Lua-Logistics-Lisi', 7423, 414500, '250HO15208', 0, 12),
(1066, 5391448, '2023-07-11', 64067, 2, 2, 'P.Ancha-Chiva-Coffee-Ziza', 5123, 414354, '250HO14310', 0, 12),
(1067, 539149, '2023-07-20', 64075, 3, 2, 'P.Ancha-Lazo-Logistics-Loba', 5223, 414358, '250HO15208', 0, 12),
(1068, 539153, '2023-07-29', 64083, 3, 2, 'P.Ancha-Lola-Logistics-Extra', 5323, 414386, '250HO15208', 0, 12),
(1069, 539154, '2023-07-31', 64089, 7, 2, 'P.Ancha-Lili-LusterP-Sera', 5423, 414385, '7HO14160', 0, 12),
(1070, 539155, '2023-08-01', 64081, 7, 2, 'P.Ancha-Libra-Logistics-Zeth', 5523, 539155, '250HO15208', 0, 12),
(1071, 539156, '2023-08-02', 64096, 3, 2, 'P.Ancha-Lanza-LusterP-Sama', 5623, 414357, '7HO14160', 0, 12),
(1072, 539157, '2023-08-05', 64086, 3, 2, 'P.Ancha-Lulu-Logistics-Zully', 5723, 414352, '250HO15208', 0, 12),
(1073, 539158, '2023-08-10', 64098, 3, 2, 'P.Ancha-Limba-Logistics-Lala', 5823, 414316, '250HO15208', 0, 12),
(1074, 539159, '2023-08-13', 64805, 7, 2, 'P.Ancha-Lara-LusterP-Sika', 6023, 414384, '7HO14160', 0, 12),
(1075, 539160, '2023-08-11', 64803, 3, 2, 'P.Ancha-Samba-Samuri-Edna', 5923, 414287, '7HO12897', 0, 12),
(1076, 539161, '2023-08-17', 64802, 7, 2, 'P.Ancha-Llama-Logistics-Sole', 6123, 414356, '250HO15208', 0, 12),
(1077, 539162, '2023-08-28', 64812, 3, 2, 'P.Ancha-Ley-Logistics-Liru', 6223, 414466, '250HO15208', 0, 12),
(1078, 539177, '2023-09-06', 64831, 7, 2, 'P.Ancha-Liz-Logistics-Sosa', 6423, 414359, '250HO15208', 0, 12),
(1079, 539197, '2023-09-12', 64832, 7, 2, 'P.Ancha-Lidu-Logistics-Leyla', 6523, 414497, '250HO15208', 0, 12),
(1080, 539198, '2023-09-19', 64839, 3, 2, 'P.Ancha-Caro-Coffee-Layne', 6923, 414389, '250HO14310', 0, 12),
(1081, 539199, '2023-09-21', 64833, 7, 2, 'P.Ancha-Lija-Logistics-Lupa', 7023, 414498, '250HO15208', 0, 12),
(1082, 539200, '2023-09-24', 64857, 7, 2, 'P.Ancha-Ludo-Logistics-Luki', 7223, 414315, '250HO15208', 0, 12),
(1083, 539201, '2023-09-23', 64843, 7, 2, 'P.Ancha-Call-Coffee-Eti', 67123, 414499, '250HO14310', 0, 12),
(1084, 539202, '2023-09-29', 64860, 7, 2, 'P.Ancha-Carli-Coffee-Lena', 7323, 414470, '250HO14310', 0, 12),
(1085, 539215, '2023-09-15', 64830, 7, 2, 'P.Ancha-Linfa-Logistics-Zira', 6623, 414351, '250HO15208', 0, 12),
(1086, 539216, '2023-09-17', 672369, 7, 2, 'P.Ancha-Cafe-Coffee-Sinta', 6723, 414382, '250HO14310', 0, 12),
(1087, 539217, '2023-09-18', 64841, 7, 2, 'P.Ancha-Cante-Coffee-Siri', 6823, 0, '250HO14310', 0, 12),
(1088, 539264, '2023-11-09', 64887, 7, 2, 'P.Ancha-Cien-Coffee-Seni', 7523, 414021, '250HO14310', 0, 12),
(1089, 539265, '2023-11-12', 64890, 7, 2, 'P.Ancha-Cami-Coffee-Lora', 7623, 414496, '250HO14310', 0, 12),
(1090, 539266, '2023-11-12', 64888, 3, 2, 'P.Ancha-Lujan-Logistics-Loca', 7723, 474882, '250HO15208', 0, 12),
(1091, 539267, '2023-11-12', 64871, 7, 2, 'P.Ancha-Candi-Coffee-Erli', 7823, 474876, '250HO14310', 0, 12),
(1092, 539268, '2023-11-16', 64898, 7, 2, 'P.Ancha-Lau-Logistics-Mora', 7923, 474883, '250HO15208', 0, 12),
(1093, 539269, '2023-11-25', 64900, 3, 2, 'P.Ancha-Luli-Logistics-Elsa', 8023, 414475, '250HO15208', 0, 12),
(1094, 315937, '2019-01-14', 50792, 1, 2, 'H.Sofia-Marisol-Haisemberg-Mercedes', 0, 277184, '7HO12569', 0, 11),
(1095, 368790, '2019-11-27', 56137, 1, 2, 'H.Sofia-Rosita-Loyalty-Rosmery', 0, 244370, '509HO12690', 0, 11),
(1096, 414040, '2020-10-21', 56172, 2, 2, 'H.Sofia-Sara-Scenario-Cesi', 0, 14888, '7HO12615', 0, 11),
(1097, 414061, '2020-10-27', 56178, 1, 2, 'H.Sofia-Mery-Aicon-Melina', 0, 277282, '507HO12422', 0, 11),
(1098, 414131, '2021-01-01', 561836, 1, 2, 'H.Sofia-Rossy-CrownRed-Rosmery', 0, 244370, '7HO14460', 0, 11),
(1099, 414213, '2021-02-27', 56193, 1, 2, 'H.Sofia-Lucia-Aicon-Lucy', 0, 222975, '507HO12422', 0, 11),
(1100, 414228, '2021-03-21', 56195, 1, 2, 'H.Sofia-Marisa-Aicon-Marisol', 0, 315937, '507HO12422', 0, 11),
(1101, 414235, '2021-05-26', 56199, 1, 2, 'H.Sofia-Lia-Butler-Linda', 0, 272864, '7HO12195', 0, 11),
(1102, 414304, '2021-07-12', 60905, 1, 2, 'H.Sofia-Magdalena-Headliner-Matilde', 0, 774080, '7HO11419', 0, 11),
(1103, 431014, '2020-03-11', 56152, 1, 2, 'H.Sofia-Luna-Zamboni-Lucy', 0, 222975, '7HO12837', 0, 11),
(1104, 431015, '2020-04-20', 65156, 1, 2, 'H.Sofia-Lucero-Kenyon-Linda', 0, 272864, '7HO12769', 0, 11),
(1105, 431040, '2020-05-07', 56161, 1, 2, 'H.Sofia-Liset-Zamboni-Laura', 0, 222864, '7HO12837', 0, 11),
(1106, 431073, '2020-05-11', 56163, 1, 2, 'H.Sofia-Guara-Kingpin-Guadalupe', 0, 277201, '7HO12228', 0, 11),
(1107, 431199, '2018-04-07', 50762, 1, 2, 'H.Sofia-Guadalupe-Kenyon-Gaby', 0, 277185, '7HO12769', 0, 11),
(1108, 431200, '2014-03-11', 0, 1, 2, 'H.Sofia-Laura-ValorRed-Sofia', 0, 13700, '7HO11214', 0, 11),
(1109, 431201, '2018-04-08', 51727, 2, 2, 'H.Sofia-Geiset-Gamma-Gardenia', 0, 14492, '7HO12723', 0, 11),
(1110, 431236, '2020-09-01', 56165, 2, 2, 'H.Sofia-Mary-Headliner-Matilde', 0, 774080, '7HO11419', 0, 11),
(1111, 431237, '2020-09-17', 56170, 1, 2, 'H.Sofia-Maya-Scenario-Magali', 0, 272837, '7HO12615', 0, 11),
(1112, 474885, '2021-12-26', 60914, 2, 2, 'H.Sofia-Carmin-Grand-Celia', 0, 368791, '7HO13930', 0, 11),
(1113, 503872, '2022-12-30', 60964, 2, 2, 'H.Sofia-Jimena-RompenRed-Gaiset', 0, 431201, '7HO15427', 0, 11),
(1114, 503933, '2023-03-08', 60976, 1, 2, 'H.Sofia-Genova-Guara-RainyRed', 0, 431073, '250HO15316', 0, 11),
(1115, 503934, '2023-03-18', 60978, 2, 2, 'H.Sofia-Sabina-RainyRed-Sara', 0, 414040, '250HO15316', 0, 11),
(1116, 521728, '2022-04-04', 60925, 1, 2, 'H.Sofia-Shirley-Captivating-Silvia', 0, 774786, '250HO15156', 0, 11),
(1117, 521729, '2022-04-19', 60927, 1, 2, 'H.Sofia-Rosalia-Bradnick-Rosita', 0, 368790, '507HO10999', 0, 11),
(1118, 521771, '2022-05-12', 60930, 1, 2, 'H.Sofia-Lisbet-Pharo-Linda', 0, 272864, '250HO12975', 0, 11),
(1119, 521781, '2022-06-06', 60935, 1, 2, 'H.Sofia-Sulma-LusterP-Susi', 0, 368792, '7HO14160', 0, 11),
(1120, 521782, '2022-06-08', 60936, 1, 2, 'H.Sofia-Lurdes-LusterP-Luna', 0, 431014, '7HO14160', 0, 11),
(1121, 521858, '2022-08-02', 60942, 1, 2, 'H.Sofia-Lorena-Bradnick-Lucero', 0, 431015, '507HO10999', 0, 11),
(1122, 521892, '2022-09-23', 60679, 1, 2, 'H.Sofia-Simona-RompenRed-Senovia', 0, 431198, '7HO14527', 0, 11),
(1123, 539091, '2023-06-01', 60998, 1, 2, 'H.Sofia-Melec-RickpRed-Mery', 0, 414061, '7HO15017', 0, 11),
(1124, 539127, '2023-07-19', 65325, 4, 2, 'H.Sofia-Maribel-Mary', 0, 431236, '0', 0, 11),
(1125, 539192, '2023-09-11', 60999, 1, 2, 'H.Sofia-Rocio-RickpRed-Rosita', 0, 368790, '7HO15017', 0, 11),
(1126, 230184, '2017-06-04', 50726, 1, 3, 'H.Sofia-Juliana-Antidote-Judit', 0, 244491, '7JE1131', 0, 11),
(1127, 272863, '2017-11-24', 50750, 1, 3, 'H.Sofia-Tatiana-Calypso-Tita', 0, 244492, '7JE1350', 0, 11),
(1128, 368897, '2020-02-15', 56146, 1, 2, 'H.Sofia-Tere-Topeka-Teresa', 0, 387, '7JE1169', 0, 11),
(1129, 414214, '2021-03-21', 56194, 1, 2, 'H.Sofia-Tania-Ronaldinho', 0, 2728693, '7JE1503', 0, 11),
(1130, 414363, '2021-08-01', 60907, 1, 2, 'H.Sofia-Julia-Posterboy-Judit', 0, 244491, '7JE5043', 0, 11),
(1131, 431013, '2020-03-07', 56151, 1, 3, 'H.Sofia-Talia-Barnabas-Tatiana', 0, 272863, '7JE1294', 0, 11),
(1132, 539191, '2023-09-02', 60997, 1, 3, 'H.Sofia-Tita-Corsair-Talia', 0, 431013, '550JE1947', 0, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cruzamiento`
--

CREATE TABLE `cruzamiento` (
  `idCruzamiento` int(11) NOT NULL,
  `EventoID` int(11) NOT NULL,
  `ReproductorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cruzamiento`
--

INSERT INTO `cruzamiento` (`idCruzamiento`, `EventoID`, `ReproductorID`) VALUES
(1, 6, 46),
(2, 6, 46);

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
(2, 'P', 'Parto', 1),
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
(28, 'Cerv', 'Cervicitis', 6),
(29, 'Seca', 'Seca', 3),
(30, 'Va', 'Vacunacion Reproductiva', 12),
(31, 'Br', 'Vacuna Brucelosis', 12);

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
  `fecha` date NOT NULL,
  `animalID` int(11) NOT NULL,
  `eventoID` int(11) NOT NULL,
  `tratamientoID` int(11) NOT NULL,
  `participanteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `historia`
--

INSERT INTO `historia` (`idHIstoria`, `fecha`, `animalID`, `eventoID`, `tratamientoID`, `participanteID`) VALUES
(1, '2021-07-25', 60, 6, 2, 6),
(2, '2022-02-06', 60, 6, 2, 6),
(3, '2022-11-15', 60, 2, 4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participante`
--

CREATE TABLE `participante` (
  `idParticipante` int(11) NOT NULL,
  `nroparticipante` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `participante`
--

INSERT INTO `participante` (`idParticipante`, `nroparticipante`, `descripcion`) VALUES
(1, 1, 'Wilder Villarroel'),
(2, 2, 'Raul Carvajal'),
(3, 3, 'Einer Gonzales'),
(4, 4, 'ROBERT JALDIN'),
(5, 5, 'LENNY SUAREZ'),
(6, 6, 'CARLOS AGREDA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parto`
--

CREATE TABLE `parto` (
  `idParto` int(11) NOT NULL,
  `nroparto` int(11) NOT NULL,
  `tipo` int(1) NOT NULL,
  `sexo` int(11) NOT NULL,
  `chbcria` int(11) NOT NULL,
  `peso` float NOT NULL,
  `EventoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `parto`
--

INSERT INTO `parto` (`idParto`, `nroparto`, `tipo`, `sexo`, `chbcria`, `peso`, `EventoID`) VALUES
(1, 1, 1, 1, 521979, 12, 2);

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
(1, 0, 'apodo', 'nombre', 0, 'naab', 0, 0),
(2, 5004, 'CHROME', 'CHROME-507JE5004', 1, '507JE5004', 3, 1),
(3, 14160, 'LUSTER-P', 'LUSTER-P-507HO14160', 2, '507HO14160', 2, 1),
(4, 1638, 'RESPECT', 'RESPECT-507JE1638', 3, '507JE1638', 3, 1),
(5, 16179, 'BACKFIRE', 'BACKFIRE-507HO16179', 4, '507HO16179', 2, 1),
(6, 1947, 'CORSAIR {5}', 'CORSAIR {5}-550J E 01947', 5, '550J E 01947', 3, 1),
(7, 1939, 'GRADUATE', 'GRADUATE-507JE01939', 6, '507JE01939', 3, 1),
(8, 905, 'RAMPAGE', 'RAMPAGE-507BS00905', 7, '507BS00905', 4, 1),
(9, 1617, 'JX KIAWA {6}-P', 'JX KIAWA {6}-P-507JE01617', 8, '507JE01617', 3, 1),
(10, 14579, 'HANCOCK', 'HANCOCK-550HO14579', 9, '550HO14579', 2, 1),
(11, 924, 'TANK', 'TANK-579BS00924', 10, '579BS00924', 4, 1),
(12, 15325, 'HANANS', 'HANANS-507HO15325', 11, '507HO15325', 2, 1),
(13, 14132, 'LIBERTY-P', 'LIBERTY-P-507HO14132', 12, '507HO14132', 2, 1),
(14, 15440, 'HANDY-RED', 'HANDY-RED-507HO15440', 13, '507HO15440', 2, 1),
(15, 15085, 'PARFECT', 'PARFECT-7HO15085', 14, '7HO15085', 2, 1),
(16, 16179, 'BACKFIRE', 'BACKFIRE-7HO16179', 15, '7HO16179', 2, 1),
(17, 16304, 'CHOICES', 'CHOICES-250HO16304', 16, '250HO16304', 2, 1),
(18, 16163, 'BURGOON', 'BURGOON-7HO16163', 17, '7HO16163', 2, 1),
(19, 1617, 'JX KIAWA', 'JX KIAWA-7JE1617', 18, '7JE1617', 3, 1),
(20, 1638, 'RESPECT', 'RESPECT-7JE1638', 19, '7JE1638', 3, 1),
(21, 16174, 'RAITON', 'RAITON-7HO16174', 20, '7HO16174', 2, 1),
(22, 12961, 'DOC', 'DOC-250HO12961', 21, '250HO12961', 2, 1),
(23, 15325, 'HANANS', 'HANANS-7HO15325', 22, '7HO15325', 2, 1),
(24, 15563, 'IMPACT', 'IMPACT-7HO15563', 23, '7HO15563', 2, 1),
(25, 15825, 'REBEL-RED', 'REBEL-RED-7HO15825', 24, '7HO15825', 2, 1),
(26, 133, 'REYNOLDS', 'REYNOLDS-9AY00133', 25, '9AY00133', 4, 1),
(27, 449, 'ICE CAP', 'ICE CAP-7AN00449', 26, '7AN00449', 2, 1),
(28, 14132, 'LIBERTY-P', 'LIBERTY-P-7HO14132', 27, '7HO14132', 2, 1),
(29, 1620, 'ALBION', 'ALBION-7JE1620', 28, '7JE1620', 3, 1),
(30, 1786, 'JX CARDIFF {4}', 'JX CARDIFF {4}-7JE1786', 29, '7JE1786', 3, 1),
(31, 606, 'OVATION', 'OVATION-7AN00606', 30, '7AN00606', 2, 1),
(32, 15094, 'REVELATION', 'REVELATION-7HO15094', 31, '7HO15094', 2, 1),
(33, 1219, 'OLIVER-P', 'OLIVER-P-7JE01219', 32, '7JE01219', 3, 1),
(34, 15217, 'CAPONE', 'CAPONE-250HO15217', 33, '250HO15217', 2, 1),
(35, 924, 'TANK', 'TANK-9BS00924', 34, '9BS00924', 4, 1),
(36, 14579, 'HANCOCK', 'HANCOCK-250HO14579', 35, '250HO14579', 2, 1),
(37, 1822, 'FRINGE', 'FRINGE-7JE01822', 36, '7JE01822', 2, 1),
(38, 929, 'PUMA', 'PUMA-9BS00929', 37, '9BS00929', 4, 1),
(39, 12879, 'LIGHT MY FIRE', 'LIGHT MY FIRE-250HO12879', 38, '250HO12879', 2, 1),
(40, 15225, 'SUNRISE', 'SUNRISE-7HO15225', 39, '7HO15225', 2, 1),
(41, 16426, 'LASHIO-RED', 'LASHIO-RED-7HO16426', 40, '7HO16426', 2, 1),
(42, 932, 'DESPERADO', 'DESPERADO-9BS00932', 41, '9BS00932', 4, 1),
(43, 12978, 'HOUSE', 'HOUSE-7HO12978', 42, '7HO12978', 2, 1),
(44, 14717, 'PENSIVE-P', 'PENSIVE-P-250HO14717', 43, '250HO14717', 2, 1),
(45, 1887, 'MADDUX', 'MADDUX-7JE01887', 44, '7JE01887', 3, 1),
(46, 11383, 'MORGAN', 'MORGAN 7HO11383 ', 2147483647, '7HO11383 ', 2, 1),
(47, 15208, 'LOGISTICS', 'LOGISTICS-250HO15208', 2147483647, '250HO15208', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `idTratamiento` int(11) NOT NULL,
  `nrotratamiento` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`idTratamiento`, `nrotratamiento`, `descripcion`) VALUES
(1, 0, 'Ninguno'),
(2, 1, 'PROSTAGLANDINA 15ML'),
(3, 2, 'Pomos de Secado'),
(4, 3, 'P+ADE');

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
  ADD PRIMARY KEY (`idCruzamiento`),
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
  ADD KEY `tratamiento-historia` (`eventoID`),
  ADD KEY `participante-historia` (`participanteID`),
  ADD KEY `historia-tratamiento` (`tratamientoID`);

--
-- Indices de la tabla `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`idParticipante`);

--
-- Indices de la tabla `parto`
--
ALTER TABLE `parto`
  ADD PRIMARY KEY (`idParto`),
  ADD KEY `Parto-Evento` (`EventoID`);

--
-- Indices de la tabla `reproductor`
--
ALTER TABLE `reproductor`
  ADD PRIMARY KEY (`idReproductor`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`idTratamiento`);

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
  MODIFY `idAnimal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1133;
--
-- AUTO_INCREMENT de la tabla `cruzamiento`
--
ALTER TABLE `cruzamiento`
  MODIFY `idCruzamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `finca`
--
ALTER TABLE `finca`
  MODIFY `idFinca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `historia`
--
ALTER TABLE `historia`
  MODIFY `idHIstoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `participante`
--
ALTER TABLE `participante`
  MODIFY `idParticipante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `parto`
--
ALTER TABLE `parto`
  MODIFY `idParto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `reproductor`
--
ALTER TABLE `reproductor`
  MODIFY `idReproductor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `idTratamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
  ADD CONSTRAINT `cruzamiento-evento` FOREIGN KEY (`EventoID`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cruzamiento-reproductor` FOREIGN KEY (`ReproductorID`) REFERENCES `reproductor` (`idReproductor`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `evento-historia` FOREIGN KEY (`eventoID`) REFERENCES `evento` (`idEvento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participante-historia` FOREIGN KEY (`participanteID`) REFERENCES `participante` (`idParticipante`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tratamiento-historia` FOREIGN KEY (`tratamientoID`) REFERENCES `tratamiento` (`idTratamiento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `parto`
--
ALTER TABLE `parto`
  ADD CONSTRAINT `Parto-Evento` FOREIGN KEY (`EventoID`) REFERENCES `evento` (`idEvento`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
