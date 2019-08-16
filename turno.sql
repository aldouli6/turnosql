-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 16-08-2019 a las 02:51:11
-- Versión del servidor: 5.7.25
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `turno`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoriaId` int(11) NOT NULL,
  `categoriaPadre` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoriaId`, `categoriaPadre`, `nombre`) VALUES
(2, 0, 'Clases'),
(3, 2, 'Inglés'),
(6, 0, 'Modificación '),
(9, 0, 'Otro'),
(10, 0, 'Podólogo'),
(18, 0, 'Otros'),
(22, 2, 'Alemán'),
(23, 2, 'Italiano'),
(24, 25, 'Ortodoncia'),
(25, 0, 'Dentista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diasAsuetoOficiales`
--

CREATE TABLE `diasAsuetoOficiales` (
  `diasAsuetoOficialesId` int(11) NOT NULL,
  `dia` date NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `diasAsuetoOficiales`
--

INSERT INTO `diasAsuetoOficiales` (`diasAsuetoOficialesId`, `dia`, `descripcion`) VALUES
(1, '2019-05-10', 'día de las madres'),
(2, '2019-05-15', 'dia del maestro\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimientos`
--

CREATE TABLE `establecimientos` (
  `establecimientoId` int(11) NOT NULL,
  `categoriaId` int(10) NOT NULL,
  `subcategoriaId` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `stepping` int(11) NOT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `numeroExt` varchar(100) DEFAULT NULL,
  `numeroInt` varchar(100) DEFAULT NULL,
  `codigoPostal` varchar(100) DEFAULT NULL,
  `colonia` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `latitud` varchar(100) DEFAULT NULL,
  `longitud` varchar(100) DEFAULT NULL,
  `emailEstablecimiento` varchar(100) DEFAULT NULL,
  `telefonoEstablecimiento` varchar(100) DEFAULT NULL,
  `diasAsuetoExtra` json NOT NULL,
  `diasAsuetoOficiales` int(11) NOT NULL,
  `tooltipayuda` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `establecimientos`
--

INSERT INTO `establecimientos` (`establecimientoId`, `categoriaId`, `subcategoriaId`, `nombre`, `stepping`, `calle`, `numeroExt`, `numeroInt`, `codigoPostal`, `colonia`, `ciudad`, `estado`, `pais`, `latitud`, `longitud`, `emailEstablecimiento`, `telefonoEstablecimiento`, `diasAsuetoExtra`, `diasAsuetoOficiales`, `tooltipayuda`) VALUES
(1, 1, 0, 'uñas', 0, 'Calle Prueba', '2', '1', '76000', 'Obrera', 'Qro', 'Qro', 'Mexico', '-1.123424', '100.12324', 'uñas@gmail.com', '3456789120', 'null', 0, 0),
(2, 2, 0, 'escuela', 0, 'Calle Prueba', '3', '', '76000', 'Centro', 'Qro', 'Qro', 'Mexico', '-1.3456997', '100.54657687', 'escuela@gmail.com', '0987654321', 'null', 0, 0),
(20, 2, 4, 'definitivo', 0, 'Manuel de la Peña y Peña', '18', '', '76030', 'El Carrizal', 'Querétaro', 'Querétaro', 'México', '19.440537788528573', '-99.1263837814331', 'd@f.com', '87585697', 'null', 0, 0),
(22, 2, 3, 'Taller Arvizu', 0, 'Nicolás Bravo', '449', '', '60840', 'Coalcomán de Vázquez Pallares', 'Apatzingán', 'Michoacán', 'México', '18.78112616339036', '-103.16266325145392', 'taller@arvizu', '5645756867', 'null', 0, 0),
(23, 25, 24, 'La muela Feliz 2', 15, 'Avenida Cerro Sombrerete', '543', '3', '76121', 'Movimiento Obrero', 'Querétaro', 'Querétaro', 'México', '20.62613882201451', '-100.41264200210571', 'lamuela@feliz.com', '4531318574', '[\"2019-07-19\", \"2019-07-21\"]', 1, 1),
(25, 25, 24, 'La muela Feliz', 0, 'Avenida Cerro Sombrerete', 'LB', '', '76121', 'Movimiento Obrero', 'Querétaro', 'Querétaro', 'México', '20.625824073693902', '-100.41245222349391', 'lamuela@feliz', '123124124', 'null', 0, 0),
(30, 2, 22, 'Angelitos', 15, 'Calle Ignacio Allende Norte', '51', '', '76000', 'Centro', 'Querétaro', 'Querétaro', 'México', '20.595788685450476', '-100.39530420303345', 'ange@litos', '134134', 'null', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE `estatus` (
  `idestatus` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`idestatus`, `nombre`) VALUES
(1, 'agendado'),
(2, 'atendido'),
(3, 'atendiendo'),
(4, 'cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariosRecursos`
--

CREATE TABLE `horariosRecursos` (
  `horarioRecursoId` int(11) NOT NULL,
  `recursoId` int(11) NOT NULL,
  `tipoHorario` varchar(45) DEFAULT NULL COMMENT 'Puede ser gernerico o especifico',
  `horaInicio` time NOT NULL DEFAULT '00:00:00',
  `horaFin` time NOT NULL DEFAULT '00:00:00',
  `diasLaborables` json DEFAULT NULL COMMENT 'serán los días separados por comas, por ejemplo L,M,X,J,V',
  `fechas_especificas` varchar(100) DEFAULT NULL,
  `diasAsuetoOficiales` int(11) DEFAULT NULL,
  `diasAsuetoExtra` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `horariosRecursos`
--

INSERT INTO `horariosRecursos` (`horarioRecursoId`, `recursoId`, `tipoHorario`, `horaInicio`, `horaFin`, `diasLaborables`, `fechas_especificas`, `diasAsuetoOficiales`, `diasAsuetoExtra`) VALUES
(1, 2, '', '09:00:00', '15:00:00', NULL, '', NULL, NULL),
(2, 2, '', '08:00:00', '14:00:00', NULL, '', NULL, NULL),
(3, 2, '', '15:00:00', '20:00:00', NULL, '', NULL, NULL),
(5, 2, '', '08:00:00', '14:00:00', NULL, '', NULL, NULL),
(6, 2, '', '15:00:00', '20:00:00', NULL, '', NULL, NULL),
(7, 3, '', '08:00:00', '14:00:00', NULL, '', NULL, NULL),
(8, 3, '', '15:00:00', '20:00:00', NULL, '', NULL, NULL),
(9, 3, '', '08:00:00', '14:00:00', NULL, '', NULL, NULL),
(10, 3, '', '15:00:00', '20:00:00', NULL, '', NULL, NULL),
(18, 6, NULL, '09:00:00', '15:00:00', '[\"L\", \"M\", \"X\", \"J\", \"V\", \"S\"]', NULL, 1, 'null'),
(19, 6, NULL, '16:00:00', '21:00:00', '[\"L\", \"M\", \"X\", \"J\", \"V\"]', NULL, 1, 'null'),
(26, 9, NULL, '09:00:00', '15:00:00', '[\"X\"]', NULL, 1, 'null'),
(28, 9, NULL, '13:00:00', '21:00:00', '[\"X\", \"J\"]', NULL, 1, 'null'),
(30, 9, NULL, '00:00:00', '00:00:00', '[\"M\"]', NULL, 1, 'null'),
(37, 10, NULL, '00:00:00', '00:00:00', '[\"D\", \"M\", \"X\"]', NULL, 1, 'null'),
(38, 10, NULL, '00:00:00', '00:00:00', '[\"M\"]', NULL, 1, 'null'),
(39, 10, NULL, '15:00:00', '20:00:00', '[\"L\", \"M\"]', NULL, 1, 'null'),
(40, 9, NULL, '00:00:00', '00:00:00', '[\"X\"]', NULL, 1, 'null'),
(41, 11, NULL, '09:00:00', '15:00:00', '[\"L\", \"X\", \"J\", \"V\"]', NULL, NULL, NULL),
(42, 11, NULL, '17:00:00', '21:00:00', '[\"L\", \"M\", \"X\", \"J\", \"V\"]', NULL, NULL, NULL),
(44, 12, NULL, '09:00:00', '15:00:00', '[\"M\"]', NULL, NULL, NULL),
(45, 13, NULL, '08:00:00', '12:00:00', '[\"L\", \"M\", \"X\", \"J\", \"V\"]', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `notificacionId` int(11) NOT NULL,
  `establecimientoId` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `turnoId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`notificacionId`, `establecimientoId`, `estatus`, `fecha_hora`, `turnoId`) VALUES
(1, 23, 1, '2019-08-15 13:08:46', 48),
(2, 23, 1, '2019-08-15 08:08:46', 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

CREATE TABLE `recursos` (
  `recursoId` int(11) NOT NULL,
  `establecimientoId` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(100) NOT NULL,
  `seleccionable` int(11) NOT NULL DEFAULT '0',
  `orden_alfa` varchar(10) NOT NULL DEFAULT 'asc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recursos`
--

INSERT INTO `recursos` (`recursoId`, `establecimientoId`, `nombre`, `seleccionable`, `orden_alfa`) VALUES
(2, 1, 'Pone Uñas Postizas', 0, 'asc'),
(3, 1, 'Pinta Uñas ', 0, 'asc'),
(6, 25, 'Sillon de dentista 1', 0, 'asc'),
(7, 25, 'Sillon de dentista 2a', 0, 'asc'),
(8, 25, 'Sillon de dentista 3', 0, 'asc'),
(9, 30, 'Un recurso', 0, 'asc'),
(10, 30, 'Otro recurso', 0, 'asc'),
(11, 23, 'hermano 1', 1, 'desc'),
(12, 23, 'hermano 2', 0, 'asc'),
(13, 23, 'hermano 3', 0, 'asc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacionesRecursoTipoSesion`
--

CREATE TABLE `relacionesRecursoTipoSesion` (
  `idRelacionesRecursoTipoSesion` int(11) NOT NULL,
  `recursoId` int(11) NOT NULL,
  `tipoSesionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `relacionesRecursoTipoSesion`
--

INSERT INTO `relacionesRecursoTipoSesion` (`idRelacionesRecursoTipoSesion`, `recursoId`, `tipoSesionId`) VALUES
(6, 2, 3),
(7, 3, 4),
(8, 2, 4),
(26, 6, 16),
(27, 6, 17),
(28, 6, 18),
(29, 7, 16),
(30, 7, 17),
(31, 10, 19),
(32, 10, 23),
(39, 9, 19),
(41, 12, 27),
(42, 11, 28),
(43, 12, 28),
(46, 13, 28),
(47, 13, 27),
(48, 11, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacionesTurnosRecursos`
--

CREATE TABLE `relacionesTurnosRecursos` (
  `relacionesTurnosRecursosId` int(11) NOT NULL,
  `turnoId` int(11) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `recursoId` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estatusId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tempo`
--

CREATE TABLE `tempo` (
  `idusuario` int(11) NOT NULL,
  `fechanacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tempo`
--

INSERT INTO `tempo` (`idusuario`, `fechanacimiento`) VALUES
(4, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposSesiones`
--

CREATE TABLE `tiposSesiones` (
  `tipoSesionId` int(11) NOT NULL,
  `establecimientoId` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `duracion` time NOT NULL,
  `costo` float DEFAULT '0',
  `maximoAgendarDias` int(11) NOT NULL,
  `maximoAgendarHoras` int(11) NOT NULL,
  `maximoAgendarMins` int(11) NOT NULL,
  `limiteAntesAgendarDias` int(11) NOT NULL,
  `limiteAntesAgendarHoras` int(11) NOT NULL,
  `limiteAntesAgendarMins` int(11) NOT NULL,
  `tiempoEspera` time DEFAULT '00:00:00',
  `tiempoEntreSesion` time DEFAULT '00:00:00',
  `fechaFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tiposSesiones`
--

INSERT INTO `tiposSesiones` (`tipoSesionId`, `establecimientoId`, `nombre`, `duracion`, `costo`, `maximoAgendarDias`, `maximoAgendarHoras`, `maximoAgendarMins`, `limiteAntesAgendarDias`, `limiteAntesAgendarHoras`, `limiteAntesAgendarMins`, `tiempoEspera`, `tiempoEntreSesion`, `fechaFin`) VALUES
(3, 1, 'uñas pies', '00:00:00', 0, 0, 0, 0, 0, 0, 0, '00:10:00', '00:10:00', NULL),
(4, 1, 'uñas manos', '00:00:00', 0, 0, 0, 0, 0, 0, 0, '00:15:00', '00:15:00', NULL),
(5, 22, 'Soldar', '00:00:00', 34, 0, 0, 0, 0, 0, 0, '00:00:00', '00:00:00', NULL),
(16, 25, 'Extracción Molar (1pieza)', '00:30:00', 800, 10, 3, 0, 5, 5, 0, '00:10:00', '00:20:00', NULL),
(17, 25, 'Limpieza bucal', '00:30:00', 0, 0, 0, 0, 1, 0, 0, '00:05:00', '00:05:00', NULL),
(18, 25, 'Resina (1 pieza)', '00:30:00', 0, 0, 10, 0, 0, 0, 0, '00:10:00', '00:10:00', NULL),
(19, 30, 'Tipo 1', '01:15:00', 0, 2, 1, 2, 0, 0, 0, '00:15:00', '00:15:00', NULL),
(23, 30, 'epara editar', '00:00:00', 3, 0, 0, 0, 0, 0, 0, '00:00:00', '00:00:00', NULL),
(24, 30, 'otro', '00:00:00', 0, 0, 0, 0, 0, 0, 0, '00:00:00', '00:00:00', NULL),
(26, 30, 'wef', '00:00:00', 0, 0, 0, 0, 0, 0, 0, '00:00:00', '00:00:00', NULL),
(27, 23, 'Extracción', '00:30:00', 800, 10, 15, 10, 0, 0, 0, '00:15:00', '00:45:00', '2019-08-31'),
(28, 23, 'Resina', '00:30:00', 300, 0, 0, 0, 0, 0, 0, '00:15:00', '00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposUsuarios`
--

CREATE TABLE `tiposUsuarios` (
  `tipoUsuarioId` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `detalle` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tiposUsuarios`
--

INSERT INTO `tiposUsuarios` (`tipoUsuarioId`, `nombre`, `detalle`) VALUES
(1, 'SuperAdmin', 'Dueño del sistema y puede agregar admins\r\n'),
(2, 'Administrador', 'Responsable de establecimeinto y puede agregar usuarios y clientes'),
(3, 'Usuario', 'Solo puede aceptar citas y verlas'),
(4, 'Cliente', 'Solo puede crear citas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `turnoId` int(11) NOT NULL,
  `establecimientoId` int(11) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `recursoId` int(11) NOT NULL,
  `tipoSesionId` int(11) NOT NULL,
  `estatusId` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`turnoId`, `establecimientoId`, `usuarioId`, `recursoId`, `tipoSesionId`, `estatusId`, `fecha`, `horaInicio`, `horaFin`) VALUES
(1, 2, 7, 0, 3, 1, '2019-02-22', '12:00:00', '00:00:00'),
(2, 23, 19, 11, 27, 1, '2019-05-29', '09:30:00', '11:00:00'),
(3, 23, 30, 11, 27, 1, '2019-05-28', '12:00:00', '13:30:00'),
(4, 23, 30, 11, 27, 1, '2019-05-29', '11:00:00', '12:30:00'),
(5, 23, 19, 11, 28, 1, '2019-05-30', '12:45:00', '13:30:00'),
(6, 23, 19, 11, 28, 1, '2019-06-03', '09:15:00', '10:00:00'),
(7, 23, 19, 12, 27, 1, '2019-06-04', '09:15:00', '10:45:00'),
(8, 23, 30, 12, 28, 1, '2019-06-04', '11:15:00', '12:00:00'),
(9, 23, 19, 12, 27, 1, '2019-06-11', '09:30:00', '11:00:00'),
(10, 23, 19, 13, 28, 1, '2019-06-17', '13:00:00', '13:45:00'),
(11, 23, 19, 13, 28, 1, '2019-06-17', '13:00:00', '13:45:00'),
(12, 23, 30, 13, 28, 1, '2019-06-18', '08:30:00', '09:15:00'),
(13, 23, 30, 13, 28, 1, '2019-06-18', '08:30:00', '09:15:00'),
(14, 23, 19, 11, 28, 1, '2019-06-17', '17:45:00', '18:30:00'),
(15, 23, 19, 11, 28, 1, '2019-06-17', '17:45:00', '18:30:00'),
(16, 23, 19, 11, 27, 1, '2019-06-17', '18:45:00', '20:15:00'),
(17, 23, 19, 11, 27, 1, '2019-06-17', '18:45:00', '20:15:00'),
(18, 23, 19, 13, 28, 1, '2019-06-19', '08:15:00', '09:00:00'),
(19, 23, 19, 13, 28, 1, '2019-06-19', '08:15:00', '09:00:00'),
(20, 23, 19, 13, 28, 1, '2019-06-18', '08:30:00', '09:15:00'),
(21, 23, 19, 13, 28, 1, '2019-06-18', '08:30:00', '09:15:00'),
(22, 23, 19, 13, 28, 1, '2019-06-24', '08:30:00', '09:15:00'),
(23, 23, 19, 13, 28, 1, '2019-06-24', '08:30:00', '09:15:00'),
(24, 23, 19, 13, 28, 1, '2019-06-25', '08:15:00', '09:00:00'),
(25, 23, 19, 13, 28, 1, '2019-06-25', '08:15:00', '09:00:00'),
(26, 23, 19, 11, 28, 1, '2019-06-21', '17:30:00', '18:15:00'),
(27, 23, 19, 11, 28, 1, '2019-06-21', '17:30:00', '18:15:00'),
(28, 23, 19, 11, 28, 1, '2019-06-28', '09:15:00', '10:00:00'),
(29, 23, 19, 11, 28, 1, '2019-06-28', '09:15:00', '10:00:00'),
(30, 23, 19, 11, 28, 1, '2019-06-28', '12:30:00', '13:15:00'),
(31, 23, 19, 11, 28, 1, '2019-06-28', '12:30:00', '13:15:00'),
(32, 23, 30, 11, 28, 1, '2019-06-28', '17:30:00', '18:15:00'),
(33, 23, 30, 11, 28, 2, '2019-06-28', '17:30:00', '18:15:00'),
(34, 23, 30, 11, 28, 4, '2019-06-28', '18:30:00', '19:15:00'),
(35, 23, 30, 11, 28, 4, '2019-06-28', '18:30:00', '19:15:00'),
(36, 23, 30, 13, 27, 1, '2019-08-13', '08:30:00', '10:00:00'),
(38, 23, 32, 13, 28, 1, '2019-08-13', '09:00:00', '09:45:00'),
(40, 23, 30, 11, 27, 1, '2019-08-13', '09:00:00', '10:30:00'),
(42, 23, 19, 13, 28, 1, '2019-08-13', '10:00:00', '10:45:00'),
(43, 23, 19, 12, 27, 1, '2019-08-13', '10:45:00', '12:15:00'),
(44, 23, 19, 13, 28, 1, '2019-08-15', '08:15:00', '09:00:00'),
(45, 23, 19, 11, 28, 1, '2019-08-15', '09:30:00', '10:15:00'),
(46, 23, 19, 11, 28, 1, '2019-08-15', '09:00:00', '09:45:00'),
(47, 23, 19, 13, 28, 1, '2019-08-15', '09:15:00', '10:00:00'),
(48, 23, 19, 13, 28, 1, '2019-08-16', '08:15:00', '09:00:00'),
(49, 23, 19, 11, 28, 1, '2019-08-16', '09:15:00', '10:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuarioId` int(11) NOT NULL,
  `estatus` tinyint(11) NOT NULL DEFAULT '0',
  `establecimientoId` int(11) NOT NULL DEFAULT '0',
  `tipoUsuarioId` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `emailVerificado` tinyint(1) NOT NULL DEFAULT '0',
  `telefonoVerificado` tinyint(1) NOT NULL DEFAULT '0',
  `activacion` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuarioId`, `estatus`, `establecimientoId`, `tipoUsuarioId`, `username`, `nombre`, `apellidos`, `password`, `email`, `telefono`, `fecha_registro`, `emailVerificado`, `telefonoVerificado`, `activacion`) VALUES
(1, 1, 0, 2, 'nish', 'Nishelt', 'Perez', 'nish123', 'nish@gmail.com', '1234567890', NULL, 0, 0, ''),
(2, 1, 0, 1, 'aldo', 'Aldo Ul', 'Cornejo', 'E201994DCA9320FC94336603B1CFC970', 'aldouli6@outlook.com', '6789012345', NULL, 0, 0, ''),
(3, 1, 30, 2, 'nani', 'Erandi', 'Hernadez', 'F09276379BE92B588D79AAF8E6208861', 'nani@gmail.com', '0987654321', NULL, 0, 0, ''),
(4, 1, 0, 2, 'diana', 'Diana', 'Reyna', 'F09276379BE92B588D79AAF8E6208861', 'diana@gmail.com', '3269846329', NULL, 0, 0, ''),
(5, 1, 0, 2, 'janet', 'Janet', 'Cornejo', 'janet123', 'janet@gmail.com', '2938648751', NULL, 0, 0, ''),
(6, 1, 23, 2, 'ulises', 'Ulises', 'Velez', 'E201994DCA9320FC94336603B1CFC970', 'ulises@gmail.com', '8263986264', NULL, 0, 0, ''),
(7, 1, 0, 3, 'un', 'Aldo ', 'Velez', 'clientealdo', 'cliente@gmail.com', '2342355242', NULL, 0, 0, ''),
(19, 1, 0, 4, 'otrocliente', 'otro', 'cliente', '70FA55C113A9F41D34BBE85AF82D19DD', 'otro@cliente.com', '123214214', '2019-03-28 04:50:15', 0, 0, ''),
(23, 1, 22, 2, 'kari', 'Kari', 'Arvizu', '70FA55C113A9F41D34BBE85AF82D19DD', 'kar@arvizu', '1241245345643', '2019-04-03 23:47:37', 0, 0, ''),
(24, 1, 22, 3, 'elias', 'Elias', 'Arvizu', '70FA55C113A9F41D34BBE85AF82D19DD', 'elias@arvizu', '784586456789', '2019-04-03 23:53:10', 0, 0, ''),
(25, 1, 22, 3, 'elena', 'Elena', 'Arvizu', '70FA55C113A9F41D34BBE85AF82D19DD', 'elena@arvizu', '134523565', '2019-04-03 23:56:21', 0, 0, ''),
(28, 0, 0, 2, 'username', 'username', 'username', '14C4B06B824EC593239362517F538B29', 'aldouli6@gmail.com', '12345678', '2019-04-19 17:57:15', 0, 0, '1a32cf557be9d574ed19e52fc1f8d904'),
(29, 1, 25, 2, 'augusto1', 'Augusto', 'Primero', 'E201994DCA9320FC94336603B1CFC970', 'juandelabarrerajuan@gmail.com', '4531318574', '2019-04-19 18:09:25', 0, 0, 'd991d0cfed0ff087dc6e457f3bcf1a97'),
(30, 1, 25, 4, 'augusto2', 'Juan', 'escutia', 'E201994DCA9320FC94336603B1CFC970', 'juan@escturia', '234', '2019-04-19 18:32:38', 0, 0, '0'),
(31, 0, 0, 2, 'jhgh', 'unodos', 'tres', 'E201994DCA9320FC94336603B1CFC970', 'gjhg@jhkjghj', '564765876', '2019-04-20 12:04:45', 0, 0, '39678b82ced4ccb032b3087e4b6d2a6b'),
(32, 0, 0, 4, 'ojbl', 'ljbn', 'ljbkn', '8870B683A578B1336EE72194B79F4347', 'ojb', '8756i8', '2019-07-25 01:06:31', 0, 0, '0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoriaId`);

--
-- Indices de la tabla `diasAsuetoOficiales`
--
ALTER TABLE `diasAsuetoOficiales`
  ADD PRIMARY KEY (`diasAsuetoOficialesId`);

--
-- Indices de la tabla `establecimientos`
--
ALTER TABLE `establecimientos`
  ADD PRIMARY KEY (`establecimientoId`),
  ADD KEY `establecimientos_categorias_FK` (`categoriaId`);

--
-- Indices de la tabla `estatus`
--
ALTER TABLE `estatus`
  ADD PRIMARY KEY (`idestatus`),
  ADD UNIQUE KEY `idestatus_UNIQUE` (`idestatus`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `horariosRecursos`
--
ALTER TABLE `horariosRecursos`
  ADD PRIMARY KEY (`horarioRecursoId`),
  ADD KEY `horariosRecursos_recursos_FK` (`recursoId`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`notificacionId`),
  ADD KEY `notificacion_turno_FK` (`turnoId`);

--
-- Indices de la tabla `recursos`
--
ALTER TABLE `recursos`
  ADD PRIMARY KEY (`recursoId`),
  ADD KEY `recursos_negocios_FK` (`establecimientoId`);

--
-- Indices de la tabla `relacionesRecursoTipoSesion`
--
ALTER TABLE `relacionesRecursoTipoSesion`
  ADD PRIMARY KEY (`idRelacionesRecursoTipoSesion`),
  ADD KEY `relacionesRecursoTipoSesion_recursos_FK_idx` (`recursoId`),
  ADD KEY `relacionesRecursoTipoSesion_tiposSesiones_FK_idx` (`tipoSesionId`);

--
-- Indices de la tabla `relacionesTurnosRecursos`
--
ALTER TABLE `relacionesTurnosRecursos`
  ADD PRIMARY KEY (`relacionesTurnosRecursosId`),
  ADD UNIQUE KEY `relacionesTurnosRecursosId_UNIQUE` (`relacionesTurnosRecursosId`),
  ADD KEY `relacionesTurnosRecursos_turnos_FK_idx` (`turnoId`),
  ADD KEY `relacionesTurnosRecursos_recursos_FK_idx` (`recursoId`),
  ADD KEY `relacionesTurnosRecursos_usuarios_FK_idx` (`usuarioId`),
  ADD KEY `relacionesTurnosRecursos_estatus_idx` (`estatusId`);

--
-- Indices de la tabla `tempo`
--
ALTER TABLE `tempo`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `tiposSesiones`
--
ALTER TABLE `tiposSesiones`
  ADD PRIMARY KEY (`tipoSesionId`),
  ADD KEY `tiposSesiones_recursos_FK` (`establecimientoId`);

--
-- Indices de la tabla `tiposUsuarios`
--
ALTER TABLE `tiposUsuarios`
  ADD PRIMARY KEY (`tipoUsuarioId`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`turnoId`),
  ADD UNIQUE KEY `turnoId_UNIQUE` (`turnoId`),
  ADD KEY `turnos_establecimientos_FK_idx` (`establecimientoId`),
  ADD KEY `turnos_usuarios_FK_idx` (`usuarioId`),
  ADD KEY `turnos_tiposSesiones_FK_idx` (`tipoSesionId`),
  ADD KEY `turnos_estatus_FK_idx` (`estatusId`),
  ADD KEY `turnos_recursos_FK` (`recursoId`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuarioId`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  ADD KEY `usuarios_tiposUsuarios_FK` (`tipoUsuarioId`),
  ADD KEY `usuarios_establecimientos_FK` (`establecimientoId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoriaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `diasAsuetoOficiales`
--
ALTER TABLE `diasAsuetoOficiales`
  MODIFY `diasAsuetoOficialesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `establecimientos`
--
ALTER TABLE `establecimientos`
  MODIFY `establecimientoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `estatus`
--
ALTER TABLE `estatus`
  MODIFY `idestatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `horariosRecursos`
--
ALTER TABLE `horariosRecursos`
  MODIFY `horarioRecursoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `notificacionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recursos`
--
ALTER TABLE `recursos`
  MODIFY `recursoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `relacionesRecursoTipoSesion`
--
ALTER TABLE `relacionesRecursoTipoSesion`
  MODIFY `idRelacionesRecursoTipoSesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `relacionesTurnosRecursos`
--
ALTER TABLE `relacionesTurnosRecursos`
  MODIFY `relacionesTurnosRecursosId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tempo`
--
ALTER TABLE `tempo`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tiposSesiones`
--
ALTER TABLE `tiposSesiones`
  MODIFY `tipoSesionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `tiposUsuarios`
--
ALTER TABLE `tiposUsuarios`
  MODIFY `tipoUsuarioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `turnoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuarioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horariosRecursos`
--
ALTER TABLE `horariosRecursos`
  ADD CONSTRAINT `horariosRecursos_recursos_FK` FOREIGN KEY (`recursoId`) REFERENCES `recursos` (`recursoId`);

--
-- Filtros para la tabla `recursos`
--
ALTER TABLE `recursos`
  ADD CONSTRAINT `recursos_establecimientos_FK` FOREIGN KEY (`establecimientoId`) REFERENCES `establecimientos` (`establecimientoId`);

--
-- Filtros para la tabla `relacionesRecursoTipoSesion`
--
ALTER TABLE `relacionesRecursoTipoSesion`
  ADD CONSTRAINT `relacionesRecursoTipoSesion` FOREIGN KEY (`tipoSesionId`) REFERENCES `tiposSesiones` (`tipoSesionId`),
  ADD CONSTRAINT `relacionesRecursoTipoSesion_recursos_FK` FOREIGN KEY (`recursoId`) REFERENCES `recursos` (`recursoId`);

--
-- Filtros para la tabla `relacionesTurnosRecursos`
--
ALTER TABLE `relacionesTurnosRecursos`
  ADD CONSTRAINT `relacionesTurnosRecursos_estatus` FOREIGN KEY (`estatusId`) REFERENCES `estatus` (`idestatus`),
  ADD CONSTRAINT `relacionesTurnosRecursos_recursos_FK` FOREIGN KEY (`recursoId`) REFERENCES `recursos` (`recursoId`),
  ADD CONSTRAINT `relacionesTurnosRecursos_turnos_FK` FOREIGN KEY (`turnoId`) REFERENCES `turnos` (`turnoId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `relacionesTurnosRecursos_usuarios_FK` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`usuarioId`);

--
-- Filtros para la tabla `tiposSesiones`
--
ALTER TABLE `tiposSesiones`
  ADD CONSTRAINT `tiposSesiones_establecimientos_FK` FOREIGN KEY (`establecimientoId`) REFERENCES `establecimientos` (`establecimientoId`);

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `turnos_establecimientos_FK` FOREIGN KEY (`establecimientoId`) REFERENCES `establecimientos` (`establecimientoId`),
  ADD CONSTRAINT `turnos_estatus_FK` FOREIGN KEY (`estatusId`) REFERENCES `estatus` (`idestatus`),
  ADD CONSTRAINT `turnos_tiposSesiones_FK` FOREIGN KEY (`tipoSesionId`) REFERENCES `tiposSesiones` (`tipoSesionId`),
  ADD CONSTRAINT `turnos_usuarios_FK` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`usuarioId`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_tiposUsuarios_FK` FOREIGN KEY (`tipoUsuarioId`) REFERENCES `tiposUsuarios` (`tipoUsuarioId`);
