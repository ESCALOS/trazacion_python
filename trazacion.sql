-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2022 a las 19:55:18
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

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Encargado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 21),
(2, 1, 24),
(3, 1, 25),
(4, 1, 26),
(5, 1, 28),
(6, 1, 29),
(7, 1, 30),
(8, 1, 32),
(9, 1, 33),
(10, 1, 34),
(11, 1, 36),
(12, 1, 37),
(13, 1, 38),
(14, 1, 40),
(15, 1, 41),
(16, 1, 42),
(17, 1, 44),
(18, 1, 53),
(19, 1, 54),
(20, 1, 56),
(21, 1, 61),
(22, 1, 62),
(23, 1, 64);

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
(18, '2022-11-21 09:43:08.689661', '2', 'CAJA CARTON 8.2', 2, '[{\"changed\": {\"fields\": [\"Presentacion\"]}}]', 10, 2),
(19, '2022-11-29 12:31:12.085615', '3', 'CATEGORIA-3', 2, '[{\"changed\": {\"fields\": [\"Categoria\"]}}]', 8, 2),
(20, '2022-11-29 12:31:17.436594', '2', 'CATEGORIA-2', 2, '[{\"changed\": {\"fields\": [\"Categoria\"]}}]', 8, 2),
(21, '2022-11-29 12:31:22.451540', '1', 'CATEGORIA-1', 2, '[{\"changed\": {\"fields\": [\"Categoria\"]}}]', 8, 2),
(22, '2022-12-01 09:10:14.701488', '1', 'Encargado', 1, '[{\"added\": {}}]', 3, 2),
(23, '2022-12-01 09:26:03.514042', '3', '666666 -  ', 1, '[{\"added\": {}}]', 6, 2),
(24, '2022-12-01 09:26:32.286561', '3', '666666 - Mario Mendoza', 2, '[{\"changed\": {\"fields\": [\"Dni\", \"Nombre\", \"Apellido\"]}}]', 6, 2);

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
('0x73tnabwjs2i13ozvqqr50r4g76eti8', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1p0hv0:RAlIR2AcFfNNl2Qvvy4OEP7xS9Xa6-Cqy7rKczhmThM', '2022-12-15 06:39:54.945034'),
('13htovuctge4dl4hbocgywfpdcnsgpwz', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oyAEk:AQz8ncODuAYrp-ofIaGHZaQWlkUO38eAb3bz_pNJZKs', '2022-12-08 06:17:46.604318'),
('1p07lfpd2abuy8ybzdb8637ngi6nlr5j', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxsYt:ZyuaUjo4SzQXNmjpFFwiSAL0PXiy9YX_xHBIbxIQ9lI', '2022-12-07 11:25:23.977434'),
('1rrycxcskg357i2ghfks7ntheqinejcx', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxWXB:mIeG_5A-KuVE5a4h-UwEXrql6KurQFQJC2bJxKf5DQc', '2022-12-06 11:54:09.817843'),
('1v0gpoz3o5uzsc0epews7ra8c0jqr6wt', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1p0jG2:CgcYBfPKb632lJlPVn86IR3XNsVgeN4oMXRHYkCdNwM', '2022-12-15 08:05:42.548271'),
('2mr4q5um55s1i92shc1vojysoybqamzh', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxseg:_eGsPFYyEDrdIJE3r-LWqkWYLwBg7ISFYq-BAS1jotk', '2022-12-07 11:31:22.851910'),
('2wl60kfktt7b53nvyirexo5cglh71h6q', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxYLV:CpUuCwNdfpUYW_KoOAVKgMCiBXMl4sjf8fCUxtg4F_k', '2022-12-06 13:50:13.163801'),
('3qtbo06ga8ctedmizkp14xi4vfsiulz4', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oyAFq:IdAjHApFKh0zw8_dtvcEKDWBsIyU6uXuxekH6utaVdY', '2022-12-08 06:18:54.987393'),
('40tmwb9v40js2lrcjzt781gyyrvglrj9', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxXS8:L0iYiNfO7ITA_nnr8AZ5O-e7yD-I6ctqfdMWYvHaFBI', '2022-12-06 12:53:00.313932'),
('4vc3p71yvpswmku3cyfqbhjzok1hrxaz', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oycpP:-9_x1kdJL4t0s-qWIuTIP_X0nMlCxoXrU_VGzW3w8hk', '2022-12-09 12:49:31.356431'),
('64jxw7zogq6j91o4buhov3uc1bn8wsaz', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oyc8C:S_24SHGrEKGwxIGMv6KVcEqEnNkoyp1ja_oZGzql6Hc', '2022-12-09 12:04:52.170509'),
('6u4qftwz91tyv3f7jvpf3bpfgmidjeb9', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxscI:I4TwrBeJGmklborfw9meZFOk_zKrGW9qayorXTQpMIw', '2022-12-07 11:28:54.409452'),
('6yed66xrsluxx0box00siqfuavxv22tl', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oyA0R:-f4casvA6uaYjrjgWKszNDSD_cxMkvLhWkT5kscPbG0', '2022-12-08 06:02:59.352033'),
('78t75zsyh0bvhdgsgoimlx9qt1xtxomv', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxXio:v_GjN1vgutnWNB-XDczF4dhvGjOQoAiM-Ux6zup0sZU', '2022-12-06 13:10:14.981210'),
('8214lpbdzax6unud1b67e05l1tzv8c14', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxuXk:OlYQJ1k9arYnPzkkqg_010qiQVd0EG5diWkt3ch0M0o', '2022-12-07 13:32:20.620187'),
('8ap0hgbzfheulijffv8g5uugo2v8gpmx', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1ozdiC:QPDu2nJViZClt4e7yzsPvPg40gvXObr8MzsbAI7zppM', '2022-12-12 07:58:16.907466'),
('a6zvyj1dn7u90gew96rleazg4p5vfdwi', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oyA3J:0Bu9-3ZXK6OzouVYzNbNbOtdjK3K-BaFu2f5_CKOCD8', '2022-12-08 06:05:57.145781'),
('blc5ws2zv59d8sm5bss2h799z2u17rcq', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oycE3:I_I-T3xMao-1_eC86RnR33DLoY83kWlPGvCu4njNFAA', '2022-12-09 12:10:55.517866'),
('bm4howzmuovl5zrracgf5g6mpe4qu6np', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxsjI:-sJnl8L0qkXOXjHt4WsUK7K8NPrjIPcLQCm6E7anv64', '2022-12-07 11:36:08.777431'),
('bzkppgg0q0b348c2t8d1xyev1s2k79vl', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxXIv:f6GULM_WaHogcF5YaXEss2XS3advCgkv9x9yy_ibfRE', '2022-12-06 12:43:29.883932'),
('cb2n6s2ok4ds8ojrei7pjlfhmpa4x46u', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxoiZ:c8qd12UL6G8YX8IlqW9lgr5a1_4leaJNTl_nSbFFauo', '2022-12-07 07:19:07.699594'),
('hptgam1pl6roxztbshcqbohnasm61a1k', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxsfp:jQQFWXOjxhScwOUVFsUBRzSfkj2fxX7JfolD8qWTIlI', '2022-12-07 11:32:33.217701'),
('iqgrrkgmb5exke32rln6qiisjlmyoksf', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxYcf:3ugTrE9naKjtGTuDaB6dsGA3GutB5KGdRNmgxp7AU98', '2022-12-06 14:07:57.140408'),
('jjr6b16bzrcm6787291dyu56ni10956m', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oyASC:tim-YUW9b9tUnTaaugrJIqKi6qi_VNTpFav55_b0xgY', '2022-12-08 06:31:40.357203'),
('kdg750qjl03bfkic7gbza7r9wexs3trd', '.eJxVjDsOwjAQBe_iGlmOLXYNJT1nsPbj4ABypDipIu5OIqWA9s3MW02iZS5paXlKg5qrCeb0uzHJK9cd6JPqY7Qy1nka2O6KPWiz91Hz-3a4fweFWtnqXj2gBlaHyJ0HyAFCRJYNiETJ_oLA4NB54XMfBDokBz4KESqD-XwB7TA4MQ:1p0kXF:FhTGSCnChiEmQn8_kQZcaVOXctmQelhPoGFx3tdcjMo', '2022-12-15 09:27:33.452965'),
('m0ft3osw4nd7d0kd956ewqlmw2xro76d', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1ozdgT:TYogaZ6gaRa3nkjwdpSku5InE7cbZ4GAmwJVMoaXRJs', '2022-12-12 07:56:29.576442'),
('mmmxfgg9sakfdirsbmn6gp018igngtwf', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxuTa:H2e66QnjsAGvLGjrLLiwGLDVYFE0kmvH6aOOz8HumVc', '2022-12-07 13:28:02.395268'),
('n466p9esvlvkox64aks9eh3mirlvs2zi', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1p0RZs:1LA_lZRd2G_jvfccIgXxQ2s2lyJGUzeFre4S9gmN--A', '2022-12-14 13:13:00.718989'),
('pkytvlimb7tp8vsn00oq1b2lc9a1pyk4', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1p04RU:sMfOVFqW-b3dHlMM71pcHlX3wuDp9Lc5Ky2cHqRn0qY', '2022-12-13 12:30:48.231344'),
('qxy4wmxiy4grgdhp10tmbxxy8uqo7yf8', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxolh:2vE9vrzx1cS74Ycntqy08moL-8RFuqeoiELpvo3FO5A', '2022-12-07 07:22:21.701629'),
('rek3fc3u18kb5eegke6wp7mrtlzuvz1b', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1p0jTg:JuciDdvWgT0bTxAB3YRiKLxQ6aVdersZNB7xnr6V5-s', '2022-12-15 08:19:48.715640'),
('rg1emki851spi6rx5vu8o9u4ih8xl6mo', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxXUI:eg2YVPoo_4pfKPMwrRfU56aoI3rLZ1r3bV3WEHXb8zU', '2022-12-06 12:55:14.593919'),
('s86h3kscjfmutvxddip1eifl23nvsftw', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oycU6:5fz7kxOnme_5XSarzPh3NnIduafZCec5i9I561q0PWs', '2022-12-09 12:27:30.424212'),
('uttq37ko0oyajwbohjdjdjwxd177pyhl', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1p0hlI:gLapPVZwNGxeiGIoDT_FGQ1duRLssH-PYz_maLJ47HU', '2022-12-15 06:29:52.590353'),
('x4o20qxsd9ufefxathdxltoq716wo3hu', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oyd5E:Bi5b7aGwgjcMvmS7p6WrakUaRpBm19ukLuC5m5hC2jY', '2022-12-09 13:05:52.040539'),
('xqe9ck23rq3b0g3skz5knjhz2uhzttk7', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxtpr:iIlMHYWc6UVaF7-icU0LXdCp8_5gnPc4t9rA36vWrfQ', '2022-12-07 12:46:59.561224'),
('y26nkvvcdqb1cxz2zkqmoofxcvzdylya', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oyAGa:unBMwgcZIu-Au8-i4pc1VdvYL7l1gc9lkU3KBEaYoL0', '2022-12-08 06:19:40.574614'),
('y2m2e7i2c36kduqy59goejk26vt6qnst', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxYCN:fBW4iLOd4NLYwTK2utpb-XHa9f4v-G1E9biY9qLp5Is', '2022-12-06 13:40:47.122401'),
('yjelsb9u2fcq4jowo6admme21afmbial', '.eJxVjEEOwiAQAP_C2RCgKy0evfcNhF0WqRpISnsy_l1JetDrzGRewod9y35vvPoliosw4vTLMNCDSxfxHsqtSqplWxeUPZGHbXKukZ_Xo_0b5NBy3xpnCVCpEQyBxah40gNZq4konQPDkACcGg06Y_nLU8TJsHI91yjeH82zN2c:1oxuZA:y0YvP9wrIik3IScijOnyEVUv1wqV69BBxBHNNO8uWfA', '2022-12-07 13:33:48.015101');

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
(1, '2022-11-21 06:23:32.203814', '2022-11-29 12:31:22.450459', 'CATEGORIA-1'),
(2, '2022-11-21 06:23:34.397375', '2022-11-29 12:31:17.435753', 'CATEGORIA-2'),
(3, '2022-11-21 06:23:36.282981', '2022-11-29 12:31:12.084582', 'CATEGORIA-3');

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
(13, '2022-11-21 08:53:21.457298', '2022-11-21 08:53:21.457298', 'L-334', 'G-012', 40, 3, 2),
(14, '2022-11-21 08:53:21.461313', '2022-11-21 08:53:21.461313', 'L-334', 'G-013', 33, 3, 2),
(61, '2022-11-22 12:26:40.255674', '2022-11-22 12:26:40.255674', 'l-900', 'g-88', 12, 6, 2),
(62, '2022-11-22 12:26:40.257672', '2022-11-22 12:26:40.257672', 'l-22', 'g-33', 78, 6, 2),
(64, '2022-11-22 13:57:26.735043', '2022-11-22 13:57:26.735043', 'L-23', 'G-1222', 70, 5, 2),
(65, '2022-11-22 13:57:26.735043', '2022-11-22 13:57:26.735043', 'L-666', 'G-233', 10, 5, 2),
(73, '2022-11-22 13:58:08.407528', '2022-11-22 13:58:08.407528', 'L-33', 'G-21', 23, 4, 2),
(74, '2022-11-22 13:58:08.407528', '2022-11-22 13:58:08.407528', 'L-33', 'G-45', 57, 4, 2),
(75, '2022-11-22 13:58:08.407528', '2022-11-22 13:58:08.407528', 'L-777', 'G-46', 10, 4, 2),
(76, '2022-11-23 07:35:11.319359', '2022-11-23 07:35:11.319359', 'L-57', 'G-004', 37, 2, 2),
(77, '2022-11-23 07:35:11.319359', '2022-11-23 07:35:11.319359', 'L-44', 'G-005', 41, 2, 2),
(79, '2022-11-23 09:25:53.325339', '2022-11-23 09:25:53.325339', '445', 'G-12', 80, 7, 2),
(80, '2022-11-23 09:25:53.328194', '2022-11-23 09:25:53.328194', '122', 'G-122', 10, 7, 2),
(107, '2022-11-23 09:38:34.444454', '2022-11-23 09:38:34.444454', 'L-12', 'G-666', 60, 11, 2),
(108, '2022-11-23 09:38:34.460092', '2022-11-23 09:38:34.460092', 'L-44', 'G-233', 30, 11, 2),
(113, '2022-11-23 12:27:56.942717', '2022-11-23 12:27:56.942717', 'L-77', 'G-666', 58, 12, 2),
(114, '2022-11-23 12:27:56.943550', '2022-11-23 12:27:56.943550', '98', 'G-88', 42, 12, 2),
(133, '2022-11-23 14:15:44.174729', '2022-11-23 14:15:44.174729', 'L-98', 'G-77', 36, 10, 2),
(134, '2022-11-23 14:15:44.176436', '2022-11-23 14:15:44.176436', '98', 'G-88', 44, 10, 2),
(175, '2022-11-29 12:33:10.460980', '2022-11-29 12:33:10.460980', 'l-900', 'g-88', 21, 8, 2),
(176, '2022-11-29 12:33:10.463287', '2022-11-29 12:33:10.463287', 'as', 'ss', 36, 8, 2),
(177, '2022-11-29 12:33:10.464669', '2022-11-29 12:33:10.464669', 'sas', 'as', 23, 8, 2),
(178, '2022-11-29 12:33:10.465856', '2022-11-29 12:33:10.465856', 'as', 's', 19, 8, 2),
(179, '2022-11-29 12:34:09.243353', '2022-11-29 12:34:09.243353', 'L-23', 'G-001', 21, 1, 2),
(180, '2022-11-29 12:34:09.245854', '2022-11-29 12:34:09.245854', 'L-22', 'G-002', 29, 1, 2),
(181, '2022-11-29 12:34:09.246860', '2022-11-29 12:34:09.246860', 'L-12', 'G-003', 30, 1, 2),
(182, '2022-11-29 12:34:09.247856', '2022-11-29 12:34:09.247856', 'LOTE-3', 'G-003', 19, 1, 2),
(188, '2022-12-01 08:57:41.792148', '2022-12-01 08:57:41.792148', 'U20', 'G77', 25, 13, 2),
(189, '2022-12-01 08:57:41.794147', '2022-12-01 08:57:41.794147', '78', 'G66', 36, 13, 2),
(190, '2022-12-01 08:57:41.796147', '2022-12-01 08:57:41.796147', '76', 'G88', 39, 13, 2),
(194, '2022-12-01 10:57:47.027676', '2022-12-01 10:57:47.027676', '98', 'G-666', 40, 9, 3),
(195, '2022-12-01 10:57:47.031288', '2022-12-01 10:57:47.031288', '98', 'G-88', 14, 9, 3),
(196, '2022-12-01 10:57:47.032298', '2022-12-01 10:57:47.032298', '9', 'G-66', 25, 9, 3),
(202, '2022-12-01 13:52:22.459605', '2022-12-01 13:52:22.459605', 'U20', 'G77', 33, 14, 3),
(203, '2022-12-01 13:52:22.461844', '2022-12-01 13:52:22.461844', '78', 'G66', 21, 14, 3),
(204, '2022-12-01 13:52:22.466530', '2022-12-01 13:52:22.466530', 'Oi', 'Tg', 35, 14, 3);

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
(1, '2022-11-21 06:25:39.885277', '2022-11-29 12:34:09.230353', '70821326', 'DP-1', 0, 0, 100, 2, 2, 1, 2, 1),
(2, '2022-11-21 07:36:45.450610', '2022-11-23 07:35:11.300868', '1-300242.', 'DP-2', 1, 0, 100, 3, 2, 1, 2, 2),
(3, '2022-11-21 08:53:21.432381', '2022-11-21 08:53:21.432381', '18-213643.', 'DP-12', 0, 0, 80, 1, 2, 1, 3, 3),
(4, '2022-11-22 11:58:22.538152', '2022-11-22 13:58:08.389093', '18-213639.', 'DP-123', 0, 1, 90, 1, 1, 1, 1, 1),
(5, '2022-11-22 12:00:03.960725', '2022-11-22 13:57:26.723268', '18-213637.', 'DP-33', 1, 1, 80, 4, 2, 1, 3, 2),
(6, '2022-11-22 12:18:50.088574', '2022-11-22 12:26:40.241535', '18-213625.', 'DP-32', 1, 1, 90, 4, 3, 1, 1, 2),
(7, '2022-11-23 09:19:23.789643', '2022-11-23 09:25:53.311189', '18-213569.', '9191', 1, 1, 90, 2, 1, 1, 1, 2),
(8, '2022-11-23 09:28:32.508932', '2022-11-29 12:33:10.456523', '18-213554.', 'DP-32', 1, 0, 100, 3, 3, 1, 2, 2),
(9, '2022-11-23 09:34:37.011153', '2022-12-01 10:57:47.012617', '18-213602.', 'DP-1212', 0, 0, 80, 3, 3, 1, 3, 2),
(10, '2022-11-23 09:36:18.288993', '2022-11-23 14:15:44.159548', '18-213591.', 'DP-122', 1, 1, 80, 4, 3, 1, 3, 3),
(11, '2022-11-23 09:38:34.444454', '2022-11-23 09:38:34.444454', '18-213603.', 'DP-122', 1, 1, 90, 2, 1, 1, 1, 1),
(12, '2022-11-23 09:39:44.381439', '2022-11-23 12:27:56.939422', '18-213611.', 'DP-122', 0, 1, 100, 2, 3, 1, 2, 2),
(13, '2022-12-01 08:57:23.977389', '2022-12-01 08:57:41.777574', '18-213645.', '56', 1, 1, 100, 3, 3, 1, 2, 2),
(14, '2022-12-01 13:49:20.377682', '2022-12-01 13:52:22.442591', '18-213640.', '56', 0, 0, 90, 4, 3, 1, 1, 2);

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
(2, 'pbkdf2_sha256$390000$5iexyZyWgAn4gALwfzZleu$WliwT5NHGwcHPzRlSqDDRJmLHfsFIuXhQIp867Vu/iY=', '2022-12-01 13:52:51.753976', '419738', '70821326', 'Carlos Daniel', 'Escate Román', 1, 1, 1, 1),
(3, 'pbkdf2_sha256$390000$Bq1U5gjSonOe0DuNKooTqC$ktqU7/+cx8weDCzXszsUW/BS8Ebd9ucDtyB4wcD3dg0=', '2022-12-01 13:52:38.319391', '666666', '70821320', 'Mario', 'Mendoza', 1, 0, 0, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
