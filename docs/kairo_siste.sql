-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-12-2025 a las 01:26:25
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kairo_siste`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_cursos`
--

CREATE TABLE `categorias_cursos` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `codigo_categoria` varchar(20) DEFAULT NULL,
  `categoria_padre` int(11) DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `orden` int(11) DEFAULT 0,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creado_por` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `categorias_cursos`
--

INSERT INTO `categorias_cursos` (`id_categoria`, `nombre_categoria`, `descripcion`, `codigo_categoria`, `categoria_padre`, `estado`, `orden`, `fecha_creacion`, `fecha_actualizacion`, `creado_por`) VALUES
(7, 'ALIMENTACIÓN GASTRONOMÍA Y TURISMO', 'Área formativa orientada a la preparación de alimentos, gastronomía, servicios turísticos y buenas prácticas relacionadas con la alimentación.', 'AGT', NULL, 'activo', 0, '2025-12-30 00:02:15', '2025-12-30 00:02:15', NULL),
(8, 'EDUCACIÓN Y CAPACITACIÓN', 'Área enfocada en procesos de enseñanza, formación continua, capacitación profesional y desarrollo de competencias educativas.', 'EC', NULL, 'activo', 0, '2025-12-30 00:02:15', '2025-12-30 00:02:15', NULL),
(9, 'PROCESOS INDUSTRIALES', 'Área formativa relacionada con procesos productivos, industriales, técnicos y operativos, orientados a la eficiencia y seguridad.', 'PI', NULL, 'activo', 0, '2025-12-30 00:02:15', '2025-12-30 00:02:15', NULL),
(16, 'ELABORACIÓN TECNOLOGÍA Y PRODUCCIÓN DE ALIMENTOS', 'Capacitación orientada a los procesos de elaboración, transformación, conservación y producción de alimentos, aplicando normas técnicas, sanitarias y de calidad.', 'ETPA', 7, 'activo', 0, '2025-12-30 00:04:21', '2025-12-30 00:04:21', NULL),
(17, 'MEDIOS Y MATERIALES DIDÁCTICOS', 'Formación enfocada en el diseño, elaboración y uso de recursos, medios y materiales didácticos para fortalecer los procesos de enseñanza y aprendizaje.', 'MMD', 8, 'activo', 0, '2025-12-30 00:04:21', '2025-12-30 00:04:21', NULL),
(18, 'SEGURIDAD PREVENCIÓN DE RIESGOS E HIGIENE INDUSTRIAL', 'Programas de formación relacionados con la prevención de riesgos laborales, seguridad industrial e higiene ocupacional en entornos productivos.', 'SPRHI', 9, 'activo', 0, '2025-12-30 00:04:21', '2025-12-30 00:04:21', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificados`
--

CREATE TABLE `certificados` (
  `id_certificado` int(11) NOT NULL,
  `id_inscripcion` int(11) NOT NULL,
  `codigo_certificado` varchar(50) NOT NULL,
  `fecha_emision` date NOT NULL,
  `url_certificado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `objetivo` text DEFAULT NULL,
  `codigo_curso` varchar(30) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `modalidad` enum('presencial','virtual','hibrido') NOT NULL,
  `duracion_horas` int(11) NOT NULL,
  `nivel` enum('basico','intermedio','avanzado') DEFAULT 'basico',
  `tipo_certificado` enum('participacion','aprobacion') NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` enum('borrador','publicado','inactivo') DEFAULT 'borrador',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_instructores`
--

CREATE TABLE `curso_instructores` (
  `id_curso` int(11) NOT NULL,
  `id_instructor` int(11) NOT NULL,
  `fecha_asignacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id_inscripcion` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `fecha_inscripcion` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('inscrito','aprobado','reprobado','retirado') DEFAULT 'inscrito'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`, `estado`, `fecha_creacion`) VALUES
(1, 'admin', 'Administrador del sistema', 'activo', '2025-12-29 23:15:55'),
(2, 'instructor', 'Instructor de cursos', 'activo', '2025-12-29 23:15:55'),
(3, 'estudiante', 'Participante del sistema de certificación', 'activo', '2025-12-29 23:15:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `tipo_identificacion` enum('cedula','pasaporte') NOT NULL,
  `identificacion` varchar(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `id_rol` int(11) NOT NULL,
  `estado` enum('activo','inactivo','bloqueado') DEFAULT 'activo',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `creado_por` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `tipo_identificacion`, `identificacion`, `nombres`, `apellidos`, `correo`, `telefono`, `fecha_nacimiento`, `usuario`, `password`, `ultimo_login`, `id_rol`, `estado`, `fecha_creacion`, `fecha_actualizacion`, `creado_por`) VALUES
(1, 'cedula', '1314927607', 'Carlos Antonio', 'Gallegos García', 'gallegosc772@gmail.com', '0964054280', '1996-05-22', 'carlosg', 'Solracsfo18', NULL, 1, 'activo', '2025-12-29 23:22:21', '2025-12-29 23:22:21', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias_cursos`
--
ALTER TABLE `categorias_cursos`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre_categoria` (`nombre_categoria`),
  ADD KEY `fk_categoria_padre` (`categoria_padre`),
  ADD KEY `fk_categoria_usuario` (`creado_por`);

--
-- Indices de la tabla `certificados`
--
ALTER TABLE `certificados`
  ADD PRIMARY KEY (`id_certificado`),
  ADD UNIQUE KEY `codigo_certificado` (`codigo_certificado`),
  ADD KEY `fk_certificado_inscripcion` (`id_inscripcion`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`),
  ADD UNIQUE KEY `codigo_curso` (`codigo_curso`),
  ADD KEY `fk_curso_categoria` (`id_categoria`),
  ADD KEY `fk_curso_creador` (`creado_por`);

--
-- Indices de la tabla `curso_instructores`
--
ALTER TABLE `curso_instructores`
  ADD PRIMARY KEY (`id_curso`,`id_instructor`),
  ADD KEY `fk_ci_instructor` (`id_instructor`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD UNIQUE KEY `id_curso` (`id_curso`,`id_estudiante`),
  ADD KEY `fk_inscripcion_estudiante` (`id_estudiante`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `identificacion` (`identificacion`),
  ADD KEY `fk_usuario_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias_cursos`
--
ALTER TABLE `categorias_cursos`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `certificados`
--
ALTER TABLE `certificados`
  MODIFY `id_certificado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id_inscripcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias_cursos`
--
ALTER TABLE `categorias_cursos`
  ADD CONSTRAINT `fk_categoria_padre` FOREIGN KEY (`categoria_padre`) REFERENCES `categorias_cursos` (`id_categoria`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_categoria_usuario` FOREIGN KEY (`creado_por`) REFERENCES `usuarios` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `certificados`
--
ALTER TABLE `certificados`
  ADD CONSTRAINT `fk_certificado_inscripcion` FOREIGN KEY (`id_inscripcion`) REFERENCES `inscripciones` (`id_inscripcion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_curso_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_cursos` (`id_categoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_curso_creador` FOREIGN KEY (`creado_por`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `curso_instructores`
--
ALTER TABLE `curso_instructores`
  ADD CONSTRAINT `fk_ci_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ci_instructor` FOREIGN KEY (`id_instructor`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `fk_inscripcion_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inscripcion_estudiante` FOREIGN KEY (`id_estudiante`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
