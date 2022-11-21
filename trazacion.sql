-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2022 a las 05:53:55
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

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
(1, '2022-11-12 13:02:28.683287', '1', 'SUR', 1, '[{\"added\": {}}]', 12, 1),
(2, '2022-11-12 13:02:31.686412', '1', 'ICA | SUR', 1, '[{\"added\": {}}]', 13, 1),
(3, '2022-11-12 13:02:33.913252', '1', 'ICA | ICA | SUR', 1, '[{\"added\": {}}]', 14, 1),
(4, '2022-11-12 13:02:43.606920', '1', '419738 - Carlos Daniel Escate Román', 2, '[{\"changed\": {\"fields\": [\"Planta\", \"Dni\", \"Nombre\", \"Apellido\"]}}]', 6, 1),
(5, '2022-11-12 13:03:06.933968', '2', '419739 -  ', 1, '[{\"added\": {}}]', 6, 1),
(6, '2022-11-12 13:04:57.011132', '1', 'MD', 1, '[{\"added\": {}}]', 7, 1),
(7, '2022-11-12 13:05:01.494038', '2', 'JB', 1, '[{\"added\": {}}]', 7, 1),
(8, '2022-11-12 13:05:05.899669', '3', 'XL', 1, '[{\"added\": {}}]', 7, 1),
(9, '2022-11-12 13:05:10.764656', '4', 'XXL', 1, '[{\"added\": {}}]', 7, 1),
(10, '2022-11-12 13:05:20.948511', '1', 'RED GLOBE', 1, '[{\"added\": {}}]', 11, 1),
(11, '2022-11-12 13:05:26.204444', '2', 'CRIMSOM', 1, '[{\"added\": {}}]', 11, 1),
(12, '2022-11-12 13:05:31.796452', '3', 'ALISOM', 1, '[{\"added\": {}}]', 11, 1),
(13, '2022-11-12 13:05:47.677181', '1', 'CAJA CARTON 8.2', 1, '[{\"added\": {}}]', 10, 1),
(14, '2022-11-12 13:05:56.748808', '1', 'CAJA CARTON 8.2', 2, '[{\"changed\": {\"fields\": [\"Cantidad de cajas\"]}}]', 10, 1),
(15, '2022-11-12 13:06:09.628487', '2', 'CAJA CARTON 4.5', 1, '[{\"added\": {}}]', 10, 1),
(16, '2022-11-12 13:06:25.373281', '3', 'CAJAS PLASTICA 8.2', 1, '[{\"added\": {}}]', 10, 1),
(17, '2022-11-12 13:06:33.931667', '1', 'CATEGORIA 1', 1, '[{\"added\": {}}]', 8, 1),
(18, '2022-11-12 13:06:40.395785', '2', 'CATEGORIA 2', 1, '[{\"added\": {}}]', 8, 1),
(19, '2022-11-12 13:06:47.125117', '3', 'CATEGORIA 3', 1, '[{\"added\": {}}]', 8, 1),
(20, '2022-11-12 13:06:51.633608', '1', '70821326 | ICA', 1, '[{\"added\": {}}]', 15, 1),
(21, '2022-11-12 13:07:44.777388', '1', '70821326 | ICA', 2, '[{\"changed\": {\"fields\": [\"Presentacion\"]}}]', 15, 1),
(22, '2022-11-17 19:15:16.876787', '1', 'SANTA MARGARITA | ICA | SUR', 1, '[{\"added\": {}}]', 9, 1),
(23, '2022-11-17 19:15:19.743765', '1', '123456 | SANTA MARGARITA', 1, '[{\"added\": {}}]', 16, 1),
(24, '2022-11-17 19:15:32.500117', '1', 'Pallet: 70821326 | Lote: 123456 | Guia: 12312312', 1, '[{\"added\": {}}]', 17, 1),
(25, '2022-11-17 19:15:43.759195', '2', 'Pallet: 70821326 | Lote: 123456 | Guia: 2221', 1, '[{\"added\": {}}]', 17, 1),
(26, '2022-11-17 19:15:53.869267', '1', 'Pallet: 70821326 | Lote: 123456 | Guia: 12312312', 2, '[{\"changed\": {\"fields\": [\"Numero de cajas\"]}}]', 17, 1);

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
(1, 'pallet_register', '0001_initial', '2022-11-12 12:56:56.995584'),
(2, 'contenttypes', '0001_initial', '2022-11-12 12:56:57.090487'),
(3, 'admin', '0001_initial', '2022-11-12 12:56:57.256725'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-11-12 12:56:57.275650'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-11-12 12:56:57.286621'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-11-12 12:56:57.357952'),
(7, 'auth', '0001_initial', '2022-11-12 12:56:57.712312'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-11-12 12:56:57.788315'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-11-12 12:56:57.797513'),
(10, 'auth', '0004_alter_user_username_opts', '2022-11-12 12:56:57.808482'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-11-12 12:56:57.818094'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-11-12 12:56:57.823672'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-11-12 12:56:57.833128'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-11-12 12:56:57.842572'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-11-12 12:56:57.851837'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-11-12 12:56:57.891763'),
(17, 'auth', '0011_update_proxy_permissions', '2022-11-12 12:56:57.911277'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-11-12 12:56:57.922286'),
(19, 'sessions', '0001_initial', '2022-11-12 12:56:57.971863');

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
('2tw19gikwkoonoct52xbh7s26e2tpihf', '.eJxVjDsOwjAQBe_iGlm28W8p6TlDtF6vcQDZUj4V4u4kUgpo38y8txhwXeqwzjwNYxYXocXpd0tIT247yA9s9y6pt2Uak9wVedBZ3nrm1_Vw_w4qznWrIygApazKlo3VEDwl8o6xAHiflU2UdDF2c86YiV0JgJFddGSC8Vp8vsZ6N1A:1ovp22:IVxdveuiIWbSb3rSIHH4H06ThTYD3egxWqG6GpuQOa0', '2022-12-01 19:14:58.286689'),
('8h666gzr3qp9g5jybydcmur3nut92cab', '.eJxVjDsOwjAQBe_iGlm28W8p6TlDtF6vcQDZUj4V4u4kUgpo38y8txhwXeqwzjwNYxYXocXpd0tIT247yA9s9y6pt2Uak9wVedBZ3nrm1_Vw_w4qznWrIygApazKlo3VEDwl8o6xAHiflU2UdDF2c86YiV0JgJFddGSC8Vp8vsZ6N1A:1ow6nP:Hc695GRyMbPMkGZfApWESEpyIqGEAP0pA2-WNvZUkNA', '2022-12-02 14:13:03.901086'),
('8lg2t1qk2jazzp108upmnsfft9xidrhm', '.eJxVjDsOwjAQBe_iGlm28W8p6TlDtF6vcQDZUj4V4u4kUgpo38y8txhwXeqwzjwNYxYXocXpd0tIT247yA9s9y6pt2Uak9wVedBZ3nrm1_Vw_w4qznWrIygApazKlo3VEDwl8o6xAHiflU2UdDF2c86YiV0JgJFddGSC8Vp8vsZ6N1A:1ow6v7:ACZaTG_wdTv-bMllK-QUpaXy03UfqCsEOx75sQr25aY', '2022-12-02 14:21:01.071105'),
('cybuz561ez5s1gct4j8kq392y6k1xii4', '.eJxVjDsOwjAQBe_iGlm28W8p6TlDtF6vcQDZUj4V4u4kUgpo38y8txhwXeqwzjwNYxYXocXpd0tIT247yA9s9y6pt2Uak9wVedBZ3nrm1_Vw_w4qznWrIygApazKlo3VEDwl8o6xAHiflU2UdDF2c86YiV0JgJFddGSC8Vp8vsZ6N1A:1ow6xL:oJQ-sHwnauVuoYKgpqMkQU4vdzs--xXZGXDO_EpMeKY', '2022-12-02 14:23:19.493841'),
('e9igrq38k14o50slx2zsbmb4pfvbsl8j', '.eJxVjDkOwjAUBe_iGll2sPNjSvqcIfpbcADZUpYKcXeIlALaNzPvZQbc1jxsi87DJOZivDn9boT80LIDuWO5Vcu1rPNEdlfsQRfbV9Hn9XD_DjIu-VvHxM4Rdp7YcQwasQ2oAOgZk29CO0aMSVsgOaugUwcNJQaBMUFHYt4f8rA4kQ:1otulb:jFhAnmOFBE0fGKKpXRCYkj4n2Be_CDAUHJ36oq9TXTk', '2022-11-26 12:58:07.775306');

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
(1, '2022-11-12 13:04:57.010168', '2022-11-12 13:04:57.010168', 'MD'),
(2, '2022-11-12 13:05:01.493074', '2022-11-12 13:05:01.493074', 'JB'),
(3, '2022-11-12 13:05:05.898689', '2022-11-12 13:05:05.898689', 'XL'),
(4, '2022-11-12 13:05:10.763691', '2022-11-12 13:05:10.763691', 'XXL');

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
(1, '2022-11-12 13:06:33.930740', '2022-11-12 13:06:33.930740', 'CATEGORIA 1'),
(2, '2022-11-12 13:06:40.394788', '2022-11-12 13:06:40.394788', 'CATEGORIA 2'),
(3, '2022-11-12 13:06:47.123116', '2022-11-12 13:06:47.124150', 'CATEGORIA 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_detallepallet`
--

CREATE TABLE `pallet_register_detallepallet` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `numero_de_guia` varchar(255) NOT NULL,
  `numero_de_cajas` bigint(20) NOT NULL,
  `lote_id` bigint(20) NOT NULL,
  `pallet_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_detallepallet`
--

INSERT INTO `pallet_register_detallepallet` (`id`, `created_at`, `updated_at`, `numero_de_guia`, `numero_de_cajas`, `lote_id`, `pallet_id`, `usuario_id`) VALUES
(382, '2022-11-20 23:52:58', '2022-11-20 23:52:58', 'G-1', 60, 1, 15, 1);

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

--
-- Volcado de datos para la tabla `pallet_register_fundo`
--

INSERT INTO `pallet_register_fundo` (`id`, `created_at`, `updated_at`, `fundo`, `sede_id`) VALUES
(1, '2022-11-17 19:15:16.839391', '2022-11-17 19:15:16.839391', 'SANTA MARGARITA', 1);

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

--
-- Volcado de datos para la tabla `pallet_register_lote`
--

INSERT INTO `pallet_register_lote` (`id`, `created_at`, `updated_at`, `lote`, `fundo_id`) VALUES
(1, '2022-11-17 19:15:19.705338', '2022-11-17 19:15:19.705338', '123456', 1);

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
  `completo` tinyint(1) NOT NULL DEFAULT 0,
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
(15, '2022-11-20 23:52:23.881702', '2022-11-20 23:52:58.914629', '70821326', 'DP-1', 0, 0, 200, 2, 3, 1, 2, 2);

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
(1, '2022-11-12 13:02:33.911229', '2022-11-12 13:02:33.911229', 'ICA', 1);

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
(1, '2022-11-12 13:05:47.675878', '2022-11-12 13:05:56.747749', 'CAJA CARTON 8.2', 90),
(2, '2022-11-12 13:06:09.627099', '2022-11-12 13:06:09.627099', 'CAJA CARTON 4.5', 200),
(3, '2022-11-12 13:06:25.372268', '2022-11-12 13:06:25.372268', 'CAJAS PLASTICA 8.2', 100);

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
(1, '2022-11-12 13:02:31.685424', '2022-11-12 13:02:31.685424', 'ICA', 1);

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
(1, 'pbkdf2_sha256$320000$S5X3THdnkl0EyTLhL5wov4$8ObcCXZuFce95elfPZdmmOwo0UjaDDuXhW4inVQctsI=', '2022-11-18 14:23:19.457837', '419738', '70821326', 'Carlos Daniel', 'Escate Román', 1, 1, 1, 1),
(2, 'pbkdf2_sha256$390000$2DG5StWBMnKwxVkFy7PFcc$VzxC/AbunFv+VeP06iS8zKLx49XYUVoYzWyurK0IbMk=', NULL, '419739', '', '', '', 1, 0, 0, 1);

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
(1, '2022-11-12 13:05:20.948117', '2022-11-12 13:05:20.948117', 'RED GLOBE'),
(2, '2022-11-12 13:05:26.202751', '2022-11-12 13:05:26.203782', 'CRIMSOM'),
(3, '2022-11-12 13:05:31.795080', '2022-11-12 13:05:31.795080', 'ALISOM');

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
(1, '2022-11-12 13:02:28.682855', '2022-11-12 13:02:28.682855', 'SUR');

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
  ADD KEY `pallet_register_deta_lote_id_dafe4f68_fk_pallet_re` (`lote_id`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=383;

--
-- AUTO_INCREMENT de la tabla `pallet_register_fundo`
--
ALTER TABLE `pallet_register_fundo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pallet_register_lote`
--
ALTER TABLE `pallet_register_lote`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pallet_register_pallet`
--
ALTER TABLE `pallet_register_pallet`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  ADD CONSTRAINT `pallet_register_deta_lote_id_dafe4f68_fk_pallet_re` FOREIGN KEY (`lote_id`) REFERENCES `pallet_register_lote` (`id`),
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
