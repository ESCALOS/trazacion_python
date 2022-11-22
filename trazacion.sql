-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2022 a las 18:27:15
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trazacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add usuarios', 6, 'add_usuario'),
(22, 'Can change usuarios', 6, 'change_usuario'),
(23, 'Can delete usuarios', 6, 'delete_usuario'),
(24, 'Can view usuarios', 6, 'view_usuario'),
(25, 'Can add calibre', 7, 'add_calibre'),
(26, 'Can change calibre', 7, 'change_calibre'),
(27, 'Can delete calibre', 7, 'delete_calibre'),
(28, 'Can view calibre', 7, 'view_calibre'),
(29, 'Can add categoria', 8, 'add_categoria'),
(30, 'Can change categoria', 8, 'change_categoria'),
(31, 'Can delete categoria', 8, 'delete_categoria'),
(32, 'Can view categoria', 8, 'view_categoria'),
(33, 'Can add fundo', 9, 'add_fundo'),
(34, 'Can change fundo', 9, 'change_fundo'),
(35, 'Can delete fundo', 9, 'delete_fundo'),
(36, 'Can view fundo', 9, 'view_fundo'),
(37, 'Can add presentacion', 10, 'add_presentacion'),
(38, 'Can change presentacion', 10, 'change_presentacion'),
(39, 'Can delete presentacion', 10, 'delete_presentacion'),
(40, 'Can view presentacion', 10, 'view_presentacion'),
(41, 'Can add variedad', 11, 'add_variedad'),
(42, 'Can change variedad', 11, 'change_variedad'),
(43, 'Can delete variedad', 11, 'delete_variedad'),
(44, 'Can view variedad', 11, 'view_variedad'),
(45, 'Can add zona', 12, 'add_zona'),
(46, 'Can change zona', 12, 'change_zona'),
(47, 'Can delete zona', 12, 'delete_zona'),
(48, 'Can view zona', 12, 'view_zona'),
(49, 'Can add sede', 13, 'add_sede'),
(50, 'Can change sede', 13, 'change_sede'),
(51, 'Can delete sede', 13, 'delete_sede'),
(52, 'Can view sede', 13, 'view_sede'),
(53, 'Can add planta', 14, 'add_planta'),
(54, 'Can change planta', 14, 'change_planta'),
(55, 'Can delete planta', 14, 'delete_planta'),
(56, 'Can view planta', 14, 'view_planta'),
(57, 'Can add pallet', 15, 'add_pallet'),
(58, 'Can change pallet', 15, 'change_pallet'),
(59, 'Can delete pallet', 15, 'delete_pallet'),
(60, 'Can view pallet', 15, 'view_pallet'),
(61, 'Can add lote', 16, 'add_lote'),
(62, 'Can change lote', 16, 'change_lote'),
(63, 'Can delete lote', 16, 'delete_lote'),
(64, 'Can view lote', 16, 'view_lote'),
(65, 'Can add detalle pallet', 17, 'add_detallepallet'),
(66, 'Can change detalle pallet', 17, 'change_detallepallet'),
(67, 'Can delete detalle pallet', 17, 'delete_detallepallet'),
(68, 'Can view detalle pallet', 17, 'view_detallepallet');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-11-21 06:17:12.872425', '2', '419738 - Carlos Daniel Escate Román', 2, '[{\"changed\": {\"fields\": [\"Planta\", \"Dni\", \"Nombre\", \"Apellido\"]}}]', 6, 2),
(2, '2022-11-21 06:23:03.158743', '1', 'CAJA CARTON 4.5', 1, '[{\"added\": {}}]', 10, 2),
(3, '2022-11-21 06:23:05.394047', '1', 'CAJA CARTON 4.5', 2, '[]', 10, 2),
(4, '2022-11-21 06:23:13.229967', '2', 'CAJA PLASTICO 8.2', 1, '[{\"added\": {}}]', 10, 2),
(5, '2022-11-21 06:23:20.956974', '3', 'CAJA PLASTICO 8.2', 1, '[{\"added\": {}}]', 10, 2),
(6, '2022-11-21 06:23:32.205769', '1', 'CATEGORIA 1', 1, '[{\"added\": {}}]', 8, 2),
(7, '2022-11-21 06:23:34.399290', '2', 'CATEGORIA 2', 1, '[{\"added\": {}}]', 8, 2),
(8, '2022-11-21 06:23:36.283947', '3', 'CATEGORIA 3', 1, '[{\"added\": {}}]', 8, 2),
(9, '2022-11-21 06:23:42.301859', '1', 'MD', 1, '[{\"added\": {}}]', 7, 2),
(10, '2022-11-21 06:23:44.141777', '2', 'JB', 1, '[{\"added\": {}}]', 7, 2),
(11, '2022-11-21 06:23:45.759638', '3', 'XL', 1, '[{\"added\": {}}]', 7, 2),
(12, '2022-11-21 06:23:47.452786', '4', 'XXL', 1, '[{\"added\": {}}]', 7, 2),
(13, '2022-11-21 06:23:53.099619', '1', 'CRIMSOM', 1, '[{\"added\": {}}]', 11, 2),
(14, '2022-11-21 06:23:56.108596', '2', 'RED GLOBE', 1, '[{\"added\": {}}]', 11, 2),
(15, '2022-11-21 06:24:01.289810', '3', 'ALISOM', 1, '[{\"added\": {}}]', 11, 2),
(16, '2022-11-21 07:36:31.675695', '2', 'CAJA PLASTICO 8.2', 2, '[{\"changed\": {\"fields\": [\"Cantidad de cajas\"]}}]', 10, 2),
(17, '2022-11-21 07:36:39.226644', '3', 'CAJA PLASTICO 8.2', 2, '[{\"changed\": {\"fields\": [\"Cantidad de cajas\"]}}]', 10, 2),
(18, '2022-11-21 09:43:08.689661', '2', 'CAJA CARTON 8.2', 2, '[{\"changed\": {\"fields\": [\"Presentacion\"]}}]', 10, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(7, 'pallet_register', 'calibre'),
(8, 'pallet_register', 'categoria'),
(17, 'pallet_register', 'detallepallet'),
(9, 'pallet_register', 'fundo'),
(16, 'pallet_register', 'lote'),
(15, 'pallet_register', 'pallet'),
(14, 'pallet_register', 'planta'),
(10, 'pallet_register', 'presentacion'),
(13, 'pallet_register', 'sede'),
(6, 'pallet_register', 'usuario'),
(11, 'pallet_register', 'variedad'),
(12, 'pallet_register', 'zona'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'pallet_register', '0001_initial', '2022-11-21 06:12:56.310889'),
(2, 'contenttypes', '0001_initial', '2022-11-21 06:12:56.421337'),
(3, 'admin', '0001_initial', '2022-11-21 06:12:56.609114'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-11-21 06:12:56.625724'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-11-21 06:12:56.641590'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-11-21 06:12:56.767483'),
(7, 'auth', '0001_initial', '2022-11-21 06:12:57.164956'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-11-21 06:12:57.285387'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-11-21 06:12:57.306188'),
(10, 'auth', '0004_alter_user_username_opts', '2022-11-21 06:12:57.326443'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-11-21 06:12:57.350884'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-11-21 06:12:57.370650'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-11-21 06:12:57.387307'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-11-21 06:12:57.405569'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-11-21 06:12:57.417322'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-11-21 06:12:57.454576'),
(17, 'auth', '0011_update_proxy_permissions', '2022-11-21 06:12:57.479275'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-11-21 06:12:57.492658'),
(19, 'sessions', '0001_initial', '2022-11-21 06:12:57.556912');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0hn81yhmiptvgclcuoyiegamatsh5t78', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1ox4nF:qn5SWq6WI-olLdUOnQyc9Ex3dfXq0YoLnssF0RmSi8Y', '2022-12-05 06:16:53.892517'),
('1rrycxcskg357i2ghfks7ntheqinejcx', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxWXB:mIeG_5A-KuVE5a4h-UwEXrql6KurQFQJC2bJxKf5DQc', '2022-12-06 11:54:09.817843');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_calibre`
--

CREATE TABLE `pallet_register_calibre` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `calibre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_calibre`
--

INSERT INTO `pallet_register_calibre` (`id`, `created_at`, `updated_at`, `calibre`) VALUES
(1, '2022-11-21 06:23:42.301413', '2022-11-21 06:23:42.301413', 'MD'),
(2, '2022-11-21 06:23:44.139779', '2022-11-21 06:23:44.139779', 'JB'),
(3, '2022-11-21 06:23:45.758673', '2022-11-21 06:23:45.758673', 'XL'),
(4, '2022-11-21 06:23:47.452290', '2022-11-21 06:23:47.452290', 'XXL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_categoria`
--

CREATE TABLE `pallet_register_categoria` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_categoria`
--

INSERT INTO `pallet_register_categoria` (`id`, `created_at`, `updated_at`, `categoria`) VALUES
(1, '2022-11-21 06:23:32.203814', '2022-11-21 06:23:32.203814', 'CATEGORIA 1'),
(2, '2022-11-21 06:23:34.397375', '2022-11-21 06:23:34.397375', 'CATEGORIA 2'),
(3, '2022-11-21 06:23:36.282981', '2022-11-21 06:23:36.282981', 'CATEGORIA 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_detallepallet`
--

CREATE TABLE `pallet_register_detallepallet` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `lote` varchar(255) NOT NULL,
  `numero_de_guia` varchar(255) NOT NULL,
  `numero_de_cajas` bigint(20) NOT NULL,
  `pallet_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_detallepallet`
--

INSERT INTO `pallet_register_detallepallet` (`id`, `created_at`, `updated_at`, `lote`, `numero_de_guia`, `numero_de_cajas`, `pallet_id`, `usuario_id`) VALUES
(7, '2022-11-21 07:52:40.201597', '2022-11-21 07:52:40.201597', 'L-57', 'G-004', 37, 2, 2),
(8, '2022-11-21 07:52:40.206170', '2022-11-21 07:52:40.206170', 'L-44', 'G-005', 40, 2, 2),
(13, '2022-11-21 08:53:21.457298', '2022-11-21 08:53:21.457298', 'L-334', 'G-012', 40, 3, 2),
(14, '2022-11-21 08:53:21.461313', '2022-11-21 08:53:21.461313', 'L-334', 'G-013', 33, 3, 2),
(38, '2022-11-22 12:01:47.705977', '2022-11-22 12:01:47.705977', 'L-33', 'G-21', 23, 4, 2),
(39, '2022-11-22 12:01:47.707519', '2022-11-22 12:01:47.707519', 'L-33', 'G-45', 57, 4, 2),
(52, '2022-11-22 12:02:43.944131', '2022-11-22 12:02:43.944131', 'L-23', 'G-001', 20, 1, 2),
(53, '2022-11-22 12:02:43.946401', '2022-11-22 12:02:43.946401', 'L-22', 'G-002', 30, 1, 2),
(54, '2022-11-22 12:02:43.947977', '2022-11-22 12:02:43.947977', 'L-12', 'G-003', 30, 1, 2),
(55, '2022-11-22 12:02:43.948988', '2022-11-22 12:02:43.948988', 'LOTE-3', 'G-003', 20, 1, 2),
(61, '2022-11-22 12:26:40.255674', '2022-11-22 12:26:40.255674', 'l-900', 'g-88', 12, 6, 2),
(62, '2022-11-22 12:26:40.257672', '2022-11-22 12:26:40.257672', 'l-22', 'g-33', 78, 6, 2),
(63, '2022-11-22 12:26:47.849622', '2022-11-22 12:26:47.849622', 'L-23', 'G-1222', 70, 5, 2);

--
-- Disparadores `pallet_register_detallepallet`
--
DELIMITER $$
CREATE TRIGGER `verficar_pallet_lleno` AFTER INSERT ON `pallet_register_detallepallet` FOR EACH ROW BEGIN
DECLARE cajas_maxima INT;
DECLARE cajas_totales INT;
DECLARE presentacion INT;
SELECT presentacion_id INTO presentacion FROM pallet_register_pallet WHERE id = new.pallet_id;
SELECT cantidad_de_cajas INTO cajas_maxima FROM pallet_register_presentacion WHERE id = presentacion;
SELECT SUM(numero_de_cajas) INTO cajas_totales FROM pallet_register_detallepallet p WHERE p.pallet_id = new.pallet_id;
IF(cajas_totales = cajas_maxima) THEN
	UPDATE pallet_register_pallet p SET p.completo = 1 WHERE id = new.pallet_id;
ELSE
	UPDATE pallet_register_pallet SET completo = 0 WHERE id = new.pallet_id;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_fundo`
--

CREATE TABLE `pallet_register_fundo` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `fundo` varchar(100) NOT NULL,
  `sede_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_lote`
--

CREATE TABLE `pallet_register_lote` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `lote` varchar(50) NOT NULL,
  `fundo_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_pallet`
--

CREATE TABLE `pallet_register_pallet` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `dp` varchar(150) DEFAULT NULL,
  `plu` tinyint(1) NOT NULL,
  `completo` tinyint(1) NOT NULL,
  `cantidad_de_cajas` int(11) NOT NULL,
  `calibre_id` bigint(20) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  `planta_id` bigint(20) NOT NULL,
  `presentacion_id` bigint(20) NOT NULL,
  `variedad_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_pallet`
--

INSERT INTO `pallet_register_pallet` (`id`, `created_at`, `updated_at`, `codigo`, `dp`, `plu`, `completo`, `cantidad_de_cajas`, `calibre_id`, `categoria_id`, `planta_id`, `presentacion_id`, `variedad_id`) VALUES
(1, '2022-11-21 06:25:39.885277', '2022-11-22 12:02:43.938091', '70821326', 'DP-1', 0, 0, 100, 2, 2, 1, 2, 1),
(2, '2022-11-21 07:36:45.450610', '2022-11-21 07:52:40.193842', '1-300242.', 'DP-2', 1, 0, 100, 3, 2, 1, 2, 2),
(3, '2022-11-21 08:53:21.432381', '2022-11-21 08:53:21.432381', '18-213643.', 'DP-12', 0, 0, 80, 1, 2, 1, 3, 3),
(4, '2022-11-22 11:58:22.538152', '2022-11-22 12:01:47.702977', '18-213639.', 'DP-123', 0, 0, 90, 1, 1, 1, 1, 1),
(5, '2022-11-22 12:00:03.960725', '2022-11-22 12:26:47.832429', '18-213637.', 'DP-33', 1, 0, 80, 4, 2, 1, 3, 2),
(6, '2022-11-22 12:18:50.088574', '2022-11-22 12:26:40.241535', '18-213625.', 'DP-32', 1, 1, 90, 4, 3, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_planta`
--

CREATE TABLE `pallet_register_planta` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `planta` varchar(100) NOT NULL,
  `sede_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_planta`
--

INSERT INTO `pallet_register_planta` (`id`, `created_at`, `updated_at`, `planta`, `sede_id`) VALUES
(1, '2022-11-21 06:14:25.000000', '2022-11-21 06:14:25.000000', 'ICA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_presentacion`
--

CREATE TABLE `pallet_register_presentacion` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `presentacion` varchar(100) NOT NULL,
  `cantidad_de_cajas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_presentacion`
--

INSERT INTO `pallet_register_presentacion` (`id`, `created_at`, `updated_at`, `presentacion`, `cantidad_de_cajas`) VALUES
(1, '2022-11-21 06:23:03.156410', '2022-11-21 06:23:05.391178', 'CAJA CARTON 4.5', 90),
(2, '2022-11-21 06:23:13.228356', '2022-11-21 09:43:08.684672', 'CAJA CARTON 8.2', 100),
(3, '2022-11-21 06:23:20.955976', '2022-11-21 07:36:39.225400', 'CAJA PLASTICO 8.2', 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_sede`
--

CREATE TABLE `pallet_register_sede` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `sede` varchar(50) NOT NULL,
  `zona_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_sede`
--

INSERT INTO `pallet_register_sede` (`id`, `created_at`, `updated_at`, `sede`, `zona_id`) VALUES
(1, '2022-11-21 06:14:02.000000', '2022-11-21 06:14:02.000000', 'ICA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_usuario`
--

CREATE TABLE `pallet_register_usuario` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `codigo` varchar(6) NOT NULL,
  `dni` varchar(12) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `staff` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `planta_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_usuario`
--

INSERT INTO `pallet_register_usuario` (`id`, `password`, `last_login`, `codigo`, `dni`, `nombre`, `apellido`, `active`, `staff`, `admin`, `planta_id`) VALUES
(2, 'pbkdf2_sha256$390000$5iexyZyWgAn4gALwfzZleu$WliwT5NHGwcHPzRlSqDDRJmLHfsFIuXhQIp867Vu/iY=', '2022-11-22 11:54:09.815675', '419738', '70821326', 'Carlos Daniel', 'Escate Román', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_variedad`
--

CREATE TABLE `pallet_register_variedad` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `variedad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_variedad`
--

INSERT INTO `pallet_register_variedad` (`id`, `created_at`, `updated_at`, `variedad`) VALUES
(1, '2022-11-21 06:23:53.098459', '2022-11-21 06:23:53.098459', 'CRIMSOM'),
(2, '2022-11-21 06:23:56.107116', '2022-11-21 06:23:56.107116', 'RED GLOBE'),
(3, '2022-11-21 06:24:01.287986', '2022-11-21 06:24:01.287986', 'ALISOM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_zona`
--

CREATE TABLE `pallet_register_zona` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `zona` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_zona`
--

INSERT INTO `pallet_register_zona` (`id`, `created_at`, `updated_at`, `zona`) VALUES
(1, '2022-11-21 06:13:44.000000', '2022-11-21 06:13:44.000000', 'SUR');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_pallet_register_usuario_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `pallet_register_calibre`
--
ALTER TABLE `pallet_register_calibre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pallet_register_categoria`
--
ALTER TABLE `pallet_register_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pallet_register_detallepallet`
--
ALTER TABLE `pallet_register_detallepallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pallet_register_deta_pallet_id_0277a10d_fk_pallet_re` (`pallet_id`),
  ADD KEY `pallet_register_deta_usuario_id_fef27ca9_fk_pallet_re` (`usuario_id`);

--
-- Indices de la tabla `pallet_register_fundo`
--
ALTER TABLE `pallet_register_fundo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pallet_register_fund_sede_id_26135944_fk_pallet_re` (`sede_id`);

--
-- Indices de la tabla `pallet_register_lote`
--
ALTER TABLE `pallet_register_lote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pallet_register_lote_fundo_id_3458cc7b_fk_pallet_re` (`fundo_id`);

--
-- Indices de la tabla `pallet_register_pallet`
--
ALTER TABLE `pallet_register_pallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pallet_register_pall_calibre_id_1ab74b54_fk_pallet_re` (`calibre_id`),
  ADD KEY `pallet_register_pall_categoria_id_1c9da0e2_fk_pallet_re` (`categoria_id`),
  ADD KEY `pallet_register_pall_planta_id_2dc25271_fk_pallet_re` (`planta_id`),
  ADD KEY `pallet_register_pall_presentacion_id_0cdf61cb_fk_pallet_re` (`presentacion_id`),
  ADD KEY `pallet_register_pall_variedad_id_2d369e31_fk_pallet_re` (`variedad_id`);

--
-- Indices de la tabla `pallet_register_planta`
--
ALTER TABLE `pallet_register_planta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pallet_register_plan_sede_id_fe81c58a_fk_pallet_re` (`sede_id`);

--
-- Indices de la tabla `pallet_register_presentacion`
--
ALTER TABLE `pallet_register_presentacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pallet_register_sede`
--
ALTER TABLE `pallet_register_sede`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pallet_register_sede_zona_id_aae389b6_fk_pallet_register_zona_id` (`zona_id`);

--
-- Indices de la tabla `pallet_register_usuario`
--
ALTER TABLE `pallet_register_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `pallet_register_usua_planta_id_3b3f1b36_fk_pallet_re` (`planta_id`);

--
-- Indices de la tabla `pallet_register_variedad`
--
ALTER TABLE `pallet_register_variedad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pallet_register_zona`
--
ALTER TABLE `pallet_register_zona`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `pallet_register_calibre`
--
ALTER TABLE `pallet_register_calibre`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pallet_register_categoria`
--
ALTER TABLE `pallet_register_categoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pallet_register_detallepallet`
--
ALTER TABLE `pallet_register_detallepallet`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `pallet_register_fundo`
--
ALTER TABLE `pallet_register_fundo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pallet_register_lote`
--
ALTER TABLE `pallet_register_lote`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pallet_register_pallet`
--
ALTER TABLE `pallet_register_pallet`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pallet_register_planta`
--
ALTER TABLE `pallet_register_planta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pallet_register_presentacion`
--
ALTER TABLE `pallet_register_presentacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pallet_register_sede`
--
ALTER TABLE `pallet_register_sede`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pallet_register_usuario`
--
ALTER TABLE `pallet_register_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pallet_register_variedad`
--
ALTER TABLE `pallet_register_variedad`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pallet_register_zona`
--
ALTER TABLE `pallet_register_zona`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_pallet_register_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `pallet_register_usuario` (`id`);

--
-- Filtros para la tabla `pallet_register_detallepallet`
--
ALTER TABLE `pallet_register_detallepallet`
  ADD CONSTRAINT `pallet_register_deta_pallet_id_0277a10d_fk_pallet_re` FOREIGN KEY (`pallet_id`) REFERENCES `pallet_register_pallet` (`id`),
  ADD CONSTRAINT `pallet_register_deta_usuario_id_fef27ca9_fk_pallet_re` FOREIGN KEY (`usuario_id`) REFERENCES `pallet_register_usuario` (`id`);

--
-- Filtros para la tabla `pallet_register_fundo`
--
ALTER TABLE `pallet_register_fundo`
  ADD CONSTRAINT `pallet_register_fund_sede_id_26135944_fk_pallet_re` FOREIGN KEY (`sede_id`) REFERENCES `pallet_register_sede` (`id`);

--
-- Filtros para la tabla `pallet_register_lote`
--
ALTER TABLE `pallet_register_lote`
  ADD CONSTRAINT `pallet_register_lote_fundo_id_3458cc7b_fk_pallet_re` FOREIGN KEY (`fundo_id`) REFERENCES `pallet_register_fundo` (`id`);

--
-- Filtros para la tabla `pallet_register_pallet`
--
ALTER TABLE `pallet_register_pallet`
  ADD CONSTRAINT `pallet_register_pall_calibre_id_1ab74b54_fk_pallet_re` FOREIGN KEY (`calibre_id`) REFERENCES `pallet_register_calibre` (`id`),
  ADD CONSTRAINT `pallet_register_pall_categoria_id_1c9da0e2_fk_pallet_re` FOREIGN KEY (`categoria_id`) REFERENCES `pallet_register_categoria` (`id`),
  ADD CONSTRAINT `pallet_register_pall_planta_id_2dc25271_fk_pallet_re` FOREIGN KEY (`planta_id`) REFERENCES `pallet_register_planta` (`id`),
  ADD CONSTRAINT `pallet_register_pall_presentacion_id_0cdf61cb_fk_pallet_re` FOREIGN KEY (`presentacion_id`) REFERENCES `pallet_register_presentacion` (`id`),
  ADD CONSTRAINT `pallet_register_pall_variedad_id_2d369e31_fk_pallet_re` FOREIGN KEY (`variedad_id`) REFERENCES `pallet_register_variedad` (`id`);

--
-- Filtros para la tabla `pallet_register_planta`
--
ALTER TABLE `pallet_register_planta`
  ADD CONSTRAINT `pallet_register_plan_sede_id_fe81c58a_fk_pallet_re` FOREIGN KEY (`sede_id`) REFERENCES `pallet_register_sede` (`id`);

--
-- Filtros para la tabla `pallet_register_sede`
--
ALTER TABLE `pallet_register_sede`
  ADD CONSTRAINT `pallet_register_sede_zona_id_aae389b6_fk_pallet_register_zona_id` FOREIGN KEY (`zona_id`) REFERENCES `pallet_register_zona` (`id`);

--
-- Filtros para la tabla `pallet_register_usuario`
--
ALTER TABLE `pallet_register_usuario`
  ADD CONSTRAINT `pallet_register_usua_planta_id_3b3f1b36_fk_pallet_re` FOREIGN KEY (`planta_id`) REFERENCES `pallet_register_planta` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
