-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-01-2023 a las 00:30:15
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
(29, 'Can add Campaña', 8, 'add_campaign'),
(30, 'Can change Campaña', 8, 'change_campaign'),
(31, 'Can delete Campaña', 8, 'delete_campaign'),
(32, 'Can view Campaña', 8, 'view_campaign'),
(33, 'Can add categoria', 9, 'add_categoria'),
(34, 'Can change categoria', 9, 'change_categoria'),
(35, 'Can delete categoria', 9, 'delete_categoria'),
(36, 'Can view categoria', 9, 'view_categoria'),
(37, 'Can add cliente', 10, 'add_cliente'),
(38, 'Can change cliente', 10, 'change_cliente'),
(39, 'Can delete cliente', 10, 'delete_cliente'),
(40, 'Can view cliente', 10, 'view_cliente'),
(41, 'Can add destino', 11, 'add_destino'),
(42, 'Can change destino', 11, 'change_destino'),
(43, 'Can delete destino', 11, 'delete_destino'),
(44, 'Can view destino', 11, 'view_destino'),
(45, 'Can add fundo', 12, 'add_fundo'),
(46, 'Can change fundo', 12, 'change_fundo'),
(47, 'Can delete fundo', 12, 'delete_fundo'),
(48, 'Can view fundo', 12, 'view_fundo'),
(49, 'Can add producto', 13, 'add_producto'),
(50, 'Can change producto', 13, 'change_producto'),
(51, 'Can delete producto', 13, 'delete_producto'),
(52, 'Can view producto', 13, 'view_producto'),
(53, 'Can add Tipo de Caja', 14, 'add_tipocaja'),
(54, 'Can change Tipo de Caja', 14, 'change_tipocaja'),
(55, 'Can delete Tipo de Caja', 14, 'delete_tipocaja'),
(56, 'Can view Tipo de Caja', 14, 'view_tipocaja'),
(57, 'Can add zona', 15, 'add_zona'),
(58, 'Can change zona', 15, 'change_zona'),
(59, 'Can delete zona', 15, 'delete_zona'),
(60, 'Can view zona', 15, 'view_zona'),
(61, 'Can add variedad', 16, 'add_variedad'),
(62, 'Can change variedad', 16, 'change_variedad'),
(63, 'Can delete variedad', 16, 'delete_variedad'),
(64, 'Can view variedad', 16, 'view_variedad'),
(65, 'Can add sede', 17, 'add_sede'),
(66, 'Can change sede', 17, 'change_sede'),
(67, 'Can delete sede', 17, 'delete_sede'),
(68, 'Can view sede', 17, 'view_sede'),
(69, 'Can add presentacion', 18, 'add_presentacion'),
(70, 'Can change presentacion', 18, 'change_presentacion'),
(71, 'Can delete presentacion', 18, 'delete_presentacion'),
(72, 'Can view presentacion', 18, 'view_presentacion'),
(73, 'Can add planta', 19, 'add_planta'),
(74, 'Can change planta', 19, 'change_planta'),
(75, 'Can delete planta', 19, 'delete_planta'),
(76, 'Can view planta', 19, 'view_planta'),
(77, 'Can add pallet', 20, 'add_pallet'),
(78, 'Can change pallet', 20, 'change_pallet'),
(79, 'Can delete pallet', 20, 'delete_pallet'),
(80, 'Can view pallet', 20, 'view_pallet'),
(81, 'Can add lote', 21, 'add_lote'),
(82, 'Can change lote', 21, 'change_lote'),
(83, 'Can delete lote', 21, 'delete_lote'),
(84, 'Can view lote', 21, 'view_lote'),
(85, 'Can add detalle pallet', 22, 'add_detallepallet'),
(86, 'Can change detalle pallet', 22, 'change_detallepallet'),
(87, 'Can delete detalle pallet', 22, 'delete_detallepallet'),
(88, 'Can view detalle pallet', 22, 'view_detallepallet'),
(89, 'Can add Campaña Actual', 23, 'add_currentcampaign'),
(90, 'Can change Campaña Actual', 23, 'change_currentcampaign'),
(91, 'Can delete Campaña Actual', 23, 'delete_currentcampaign'),
(92, 'Can view Campaña Actual', 23, 'view_currentcampaign');

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
(1, '2023-01-11 14:45:43.900577', '1', 'MD', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-01-11 14:45:45.944615', '2', 'XL', 1, '[{\"added\": {}}]', 7, 1),
(3, '2023-01-11 14:45:48.363709', '3', 'LG', 1, '[{\"added\": {}}]', 7, 1),
(4, '2023-01-11 14:45:52.299878', '4', 'J', 1, '[{\"added\": {}}]', 7, 1),
(5, '2023-01-11 14:45:57.906450', '5', 'JJ', 1, '[{\"added\": {}}]', 7, 1),
(6, '2023-01-11 14:46:08.071822', '1', 'SUR', 1, '[{\"added\": {}}]', 15, 1),
(7, '2023-01-11 14:46:17.598440', '1', 'UVA DE MESA', 1, '[{\"added\": {}}]', 13, 1),
(8, '2023-01-11 14:46:19.628102', '1', 'RED GLOBE', 1, '[{\"added\": {}}]', 16, 1),
(9, '2023-01-11 14:46:52.879668', '2', 'SWEET GLOBE', 1, '[{\"added\": {}}]', 16, 1),
(10, '2023-01-11 14:47:17.979786', '1', 'ICA |     SUR', 1, '[{\"added\": {}}]', 17, 1),
(11, '2023-01-11 14:47:19.770371', '1', 'ICA | ICA | SUR', 1, '[{\"added\": {}}]', 19, 1),
(12, '2023-01-11 14:47:25.592465', '2', '123456 -  ', 1, '[{\"added\": {}}]', 6, 1),
(13, '2023-01-11 15:00:03.187504', '2', '123456 - RAMÓN AGUADO APAZA', 2, '[{\"changed\": {\"fields\": [\"Dni\", \"Nombre\", \"Apellido\"]}}]', 6, 1),
(14, '2023-01-11 15:00:16.118710', '1', '419738 - CARLOS DANIEL ESCATE ROMÁN', 2, '[{\"changed\": {\"fields\": [\"Planta\", \"Dni\", \"Nombre\", \"Apellido\"]}}]', 6, 1),
(15, '2023-01-11 15:01:23.002139', '1', 'PLÁSTICO', 1, '[{\"added\": {}}]', 14, 1),
(16, '2023-01-11 15:01:28.963725', '2', 'MADERA', 1, '[{\"added\": {}}]', 14, 1),
(17, '2023-01-11 15:01:31.146441', '3', 'CARTÓN', 1, '[{\"added\": {}}]', 14, 1),
(18, '2023-01-11 15:01:51.437017', '1', 'SHANGHAI', 1, '[{\"added\": {}}]', 11, 1),
(19, '2023-01-11 15:01:53.384073', '2', 'AFRICA', 1, '[{\"added\": {}}]', 11, 1),
(20, '2023-01-11 15:01:55.204287', '3', 'EE.UU', 1, '[{\"added\": {}}]', 11, 1),
(21, '2023-01-11 15:02:01.414537', '4', 'AMSTERDAM', 1, '[{\"added\": {}}]', 11, 1),
(22, '2023-01-11 15:02:15.575753', '1', 'ESMERALD VALLEY', 1, '[{\"added\": {}}]', 10, 1),
(23, '2023-01-11 15:02:22.976706', '2', 'LION', 1, '[{\"added\": {}}]', 10, 1),
(24, '2023-01-11 15:02:29.810577', '1', 'CAT-1', 1, '[{\"added\": {}}]', 9, 1),
(25, '2023-01-11 15:02:33.371251', '2', 'CAT-2', 1, '[{\"added\": {}}]', 9, 1),
(26, '2023-01-11 15:04:00.961281', '1', 'CAJA GENERICA 8.2 KG', 1, '[{\"added\": {}}]', 18, 1),
(27, '2023-01-11 15:04:15.272791', '2', 'CAJA VERDE 7.3 KG', 1, '[{\"added\": {}}]', 18, 1),
(28, '2023-01-11 15:04:34.363537', '3', 'CAJA ROJA 4.5 KG', 1, '[{\"added\": {}}]', 18, 1),
(29, '2023-01-11 15:04:46.319916', '1', 'ICA | UVA DE MESA | 2022-12-27', 1, '[{\"added\": {}}]', 8, 1),
(30, '2023-01-11 15:05:02.833861', '1', 'SANTA MARGARITA | ICA | SUR', 1, '[{\"added\": {}}]', 12, 1),
(31, '2023-01-11 15:05:05.620665', '2', 'LA CASTELLANA | ICA | SUR', 1, '[{\"added\": {}}]', 12, 1),
(32, '2023-01-11 15:05:08.801878', '3', 'SANTA INÉS | ICA | SUR', 1, '[{\"added\": {}}]', 12, 1),
(33, '2023-01-11 15:05:12.152623', '4', 'SAN HILARION | ICA | SUR', 1, '[{\"added\": {}}]', 12, 1),
(34, '2023-01-11 15:05:16.815868', '5', 'LOS CASTILLOS | ICA | SUR', 1, '[{\"added\": {}}]', 12, 1),
(35, '2023-01-11 15:05:24.512709', '1', '5161 | 001-001 | SANTA MARGARITA', 1, '[{\"added\": {}}]', 21, 1),
(36, '2023-01-11 15:05:30.070842', '2', '5162 | 001-001 | LA CASTELLANA', 1, '[{\"added\": {}}]', 21, 1),
(37, '2023-01-11 15:05:39.724505', '3', '5163 | 001-002 | SANTA MARGARITA', 1, '[{\"added\": {}}]', 21, 1),
(38, '2023-01-11 15:05:50.265011', '4', '5164 | 001-003 | SANTA MARGARITA', 1, '[{\"added\": {}}]', 21, 1),
(39, '2023-01-11 15:05:56.708146', '5', '5261 | 001-001 | LA CASTELLANA', 1, '[{\"added\": {}}]', 21, 1),
(40, '2023-01-11 15:06:17.901037', '6', '5366 | 001-006 | SAN HILARION', 1, '[{\"added\": {}}]', 21, 1),
(41, '2023-01-11 15:06:25.352738', '7', '5367 | 001-008 | SAN HILARION', 1, '[{\"added\": {}}]', 21, 1),
(42, '2023-01-11 15:06:39.886842', '8', '5422 | 001-003 | SANTA INÉS', 1, '[{\"added\": {}}]', 21, 1),
(43, '2023-01-11 15:06:46.248789', '9', '5423 | 001-008 | SANTA INÉS', 1, '[{\"added\": {}}]', 21, 1),
(44, '2023-01-11 15:06:53.380475', '10', '5633 | 001-002 | LOS CASTILLOS', 1, '[{\"added\": {}}]', 21, 1),
(45, '2023-01-11 15:52:32.457477', '3', '419737 -  ', 1, '[{\"added\": {}}]', 6, 1),
(46, '2023-01-11 15:52:52.374849', '3', '419737 - DEF AFGNAF', 2, '[{\"changed\": {\"fields\": [\"Dni\", \"Nombre\", \"Apellido\"]}}]', 6, 1),
(47, '2023-01-12 14:39:22.075913', '2', '123456 - RAMÓN AGUADO APAZA', 2, '[{\"changed\": {\"fields\": [\"Staff\"]}}]', 6, 1),
(48, '2023-01-12 14:39:53.457478', '1', 'RG-6696 | ICA | UVA DE MESA', 2, '[{\"changed\": {\"fields\": [\"Completo\"]}}]', 20, 2),
(49, '2023-01-12 18:21:30.235285', '1', 'RG-6696 | ICA | UVA DE MESA', 2, '[{\"changed\": {\"fields\": [\"Completo\"]}}]', 20, 1);

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
(8, 'pallet_register', 'campaign'),
(9, 'pallet_register', 'categoria'),
(10, 'pallet_register', 'cliente'),
(23, 'pallet_register', 'currentcampaign'),
(11, 'pallet_register', 'destino'),
(22, 'pallet_register', 'detallepallet'),
(12, 'pallet_register', 'fundo'),
(21, 'pallet_register', 'lote'),
(20, 'pallet_register', 'pallet'),
(19, 'pallet_register', 'planta'),
(18, 'pallet_register', 'presentacion'),
(13, 'pallet_register', 'producto'),
(17, 'pallet_register', 'sede'),
(14, 'pallet_register', 'tipocaja'),
(6, 'pallet_register', 'usuario'),
(16, 'pallet_register', 'variedad'),
(15, 'pallet_register', 'zona'),
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
(1, 'pallet_register', '0001_initial', '2023-01-11 14:35:40.927468'),
(2, 'contenttypes', '0001_initial', '2023-01-11 14:35:40.974329'),
(3, 'admin', '0001_initial', '2023-01-11 14:35:41.083678'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-01-11 14:35:41.083678'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-01-11 14:35:41.099301'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-01-11 14:35:41.177407'),
(7, 'auth', '0001_initial', '2023-01-11 14:35:41.396106'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-01-11 14:35:41.458593'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-01-11 14:35:41.474212'),
(10, 'auth', '0004_alter_user_username_opts', '2023-01-11 14:35:41.474212'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-01-11 14:35:41.489833'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-01-11 14:35:41.489833'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-01-11 14:35:41.505455'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-01-11 14:35:41.521077'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-01-11 14:35:41.521077'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-01-11 14:35:41.599188'),
(17, 'auth', '0011_update_proxy_permissions', '2023-01-11 14:35:41.630426'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-01-11 14:35:41.630426'),
(19, 'sessions', '0001_initial', '2023-01-11 14:35:41.661668'),
(20, 'pallet_register', '0002_alter_usuario_rol', '2023-01-11 14:59:36.540858');

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
('0uapizevmmdzrxj8ouwak254ryijptur', '.eJxVjDkOwjAUBe_iGlmys31T0nMG62_GAWRLcVIh7g6RUkD7Zua9TMRtzXFrusRZzNl05vS7EfJDyw7kjuVWLdeyLjPZXbEHbfZaRZ-Xw_07yNjyt06BnJ_Q-cBuAI_QS09BwA-gzNIRTo5RaUREDU6FyAORhJRGUFHz_gABTDm1:1pG67T:inFwPPwfjmqU1sBvmHFO44bzj6SI7NeivlyZzM0ovj0', '2023-01-26 17:32:23.140345'),
('5krbjmeuuc74uc1wjnpjkam5bba2y3yu', '.eJxVjLsOAiEURP-F2hBgl5elvd9ALnCvrBpIlt3K-O9KsoU2U8w5My8WYN9K2DuuYcnszBQ7_XYR0gPrAPkO9dZ4anVbl8iHwg_a-bVlfF4O9--gQC_ftUjaCaOsAjI2EjkSkGkyYJNOPqOPyvns0mzkTAgSpdNyMhRHTCjZ-wP0CDg_:1pG3Mr:T6FKN4PqwRlO3FtTqGCl1Ki734cYjEl4aZUo3y85wBQ', '2023-01-26 14:36:05.893450'),
('6uheri26nhezy60bz2xpht1zazp8xayl', '.eJxVjDkOwjAUBe_iGlmys31T0nMG62_GAWRLcVIh7g6RUkD7Zua9TMRtzXFrusRZzNl05vS7EfJDyw7kjuVWLdeyLjPZXbEHbfZaRZ-Xw_07yNjyt06BnJ_Q-cBuAI_QS09BwA-gzNIRTo5RaUREDU6FyAORhJRGUFHz_gABTDm1:1pG4mp:ttq6jkxWTmjb1Kz4VMSXpaxtdLRZuw-8i5s1uB-c9gE', '2023-01-26 16:06:59.984259'),
('82p3cl5w5y6nz4u6qfe9gmucu5fj62gn', '.eJxVjDkOwjAUBe_iGlmys31T0nMG62_GAWRLcVIh7g6RUkD7Zua9TMRtzXFrusRZzNl05vS7EfJDyw7kjuVWLdeyLjPZXbEHbfZaRZ-Xw_07yNjyt06BnJ_Q-cBuAI_QS09BwA-gzNIRTo5RaUREDU6FyAORhJRGUFHz_gABTDm1:1pG4Xw:pF1VPW7RwiILrUh-OGUrSRxhGpBS3w8eJH_7czLEjBc', '2023-01-26 15:51:36.947400'),
('8t2iacb7svrdz350htnby4997i9w2zl6', '.eJxVjEsKwjAUAO-StYQ-XtKkLt17hvI-qa1KAk27Kt5dAl3odmaYw4y0b_O417SOi5qrAXP5ZUzySrkJfVJ-FCslb-vCtiX2tNXei6b37Wz_BjPVuW2RNZBXkRCpjxEGlA48O0rKE6IXL4NjcICuF6cwdQlpCBIgofRgPl_s-Dfy:1pG6se:V2dyfUEtNlJJ06tSOzJB5CLw1Yfw0G3h3ECWRk7lXWs', '2023-01-26 18:21:08.744034'),
('8y2lpvo4f6vouaflqu0x7iqtxb0cb1nd', '.eJxVjDkOwjAUBe_iGlmys31T0nMG62_GAWRLcVIh7g6RUkD7Zua9TMRtzXFrusRZzNl05vS7EfJDyw7kjuVWLdeyLjPZXbEHbfZaRZ-Xw_07yNjyt06BnJ_Q-cBuAI_QS09BwA-gzNIRTo5RaUREDU6FyAORhJRGUFHz_gABTDm1:1pG321:xwUKq--LYwzEWf8LQt080rKEhC5Z9FWEoAeyqe5c7TY', '2023-01-26 14:14:33.107041'),
('9dr9zovyhon4jckkkq39e1j4zo0m8kt5', '.eJxVjDkOwjAUBe_iGlmys31T0nMG62_GAWRLcVIh7g6RUkD7Zua9TMRtzXFrusRZzNl05vS7EfJDyw7kjuVWLdeyLjPZXbEHbfZaRZ-Xw_07yNjyt06BnJ_Q-cBuAI_QS09BwA-gzNIRTo5RaUREDU6FyAORhJRGUFHz_gABTDm1:1pG4iU:wYmefudyYNLL8G_cmg-9fvo80lAWXY_veiCK7ZLwDTY', '2023-01-26 16:02:30.251652'),
('ags6oj9n4l0y71xr4qs6smbq819ofjvz', '.eJxVjLsOAiEURP-F2hBgl5elvd9ALnCvrBpIlt3K-O9KsoU2U8w5My8WYN9K2DuuYcnszBQ7_XYR0gPrAPkO9dZ4anVbl8iHwg_a-bVlfF4O9--gQC_ftUjaCaOsAjI2EjkSkGkyYJNOPqOPyvns0mzkTAgSpdNyMhRHTCjZ-wP0CDg_:1pG3RC:tY4jdYS95GOcFLUAgmoMy5RPGAXAuDPCFEUI9Ck3Y0A', '2023-01-26 14:40:34.156599'),
('cec02n4ehjz4cza1rt6pnogrncvhze4y', '.eJxVjDkOwjAUBe_iGlmys31T0nMG62_GAWRLcVIh7g6RUkD7Zua9TMRtzXFrusRZzNl05vS7EfJDyw7kjuVWLdeyLjPZXbEHbfZaRZ-Xw_07yNjyt06BnJ_Q-cBuAI_QS09BwA-gzNIRTo5RaUREDU6FyAORhJRGUFHz_gABTDm1:1pFi8R:64W6Jv1z-ldJPQN9FYsbBzHLIqG5KnECDqRw6uTn_lY', '2023-01-25 15:55:47.907184'),
('hc1lya7w8ftmoyhcfrm9z1s0bv4k6ruc', '.eJxVjDkOwjAUBe_iGlmys31T0nMG62_GAWRLcVIh7g6RUkD7Zua9TMRtzXFrusRZzNl05vS7EfJDyw7kjuVWLdeyLjPZXbEHbfZaRZ-Xw_07yNjyt06BnJ_Q-cBuAI_QS09BwA-gzNIRTo5RaUREDU6FyAORhJRGUFHz_gABTDm1:1pG68g:iPovWs94Llh5pNbjdfnBU2GuPunY6U_yHDytRqDpaq0', '2023-01-26 17:33:38.571068'),
('kru0vwp8gdwdcqpjil2z3ithrtcbnzh4', '.eJxVjDkOwjAUBe_iGlmys31T0nMG62_GAWRLcVIh7g6RUkD7Zua9TMRtzXFrusRZzNl05vS7EfJDyw7kjuVWLdeyLjPZXbEHbfZaRZ-Xw_07yNjyt06BnJ_Q-cBuAI_QS09BwA-gzNIRTo5RaUREDU6FyAORhJRGUFHz_gABTDm1:1pG51Q:-vfRrOlfsYx0bp6GowYEt3SAIb1Z6yBMe_ZRL6ZwcTg', '2023-01-26 16:22:04.940205'),
('nxl8xd32g9q03jj19u10nid65vx6cels', '.eJxVjDkOwjAUBe_iGlmys31T0nMG62_GAWRLcVIh7g6RUkD7Zua9TMRtzXFrusRZzNl05vS7EfJDyw7kjuVWLdeyLjPZXbEHbfZaRZ-Xw_07yNjyt06BnJ_Q-cBuAI_QS09BwA-gzNIRTo5RaUREDU6FyAORhJRGUFHz_gABTDm1:1pG50L:GeGZGXjb8jd5qQVrYm4EZXbzQRnBTwDFcrsFn46xZOI', '2023-01-26 16:20:57.355489'),
('ygoaht8flv9rngm4xkqp48wqyv88wak9', '.eJxVjDkOwjAUBe_iGlmys31T0nMG62_GAWRLcVIh7g6RUkD7Zua9TMRtzXFrusRZzNl05vS7EfJDyw7kjuVWLdeyLjPZXbEHbfZaRZ-Xw_07yNjyt06BnJ_Q-cBuAI_QS09BwA-gzNIRTo5RaUREDU6FyAORhJRGUFHz_gABTDm1:1pG5B1:7qoD5kXhfKWGbnBTl0FB7zA7jpfSn2b3GwOHw1aFOgc', '2023-01-26 16:31:59.404381');

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
(1, '2023-01-11 14:45:43.896589', '2023-01-11 14:45:43.896589', 'MD'),
(2, '2023-01-11 14:45:45.943616', '2023-01-11 14:45:45.943616', 'XL'),
(3, '2023-01-11 14:45:48.362743', '2023-01-11 14:45:48.362743', 'LG'),
(4, '2023-01-11 14:45:52.299878', '2023-01-11 14:45:52.299878', 'J'),
(5, '2023-01-11 14:45:57.905456', '2023-01-11 14:45:57.905456', 'JJ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_campaign`
--

CREATE TABLE `pallet_register_campaign` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `inicio` date NOT NULL,
  `state` tinyint(1) NOT NULL,
  `planta_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_campaign`
--

INSERT INTO `pallet_register_campaign` (`id`, `created_at`, `updated_at`, `inicio`, `state`, `planta_id`, `producto_id`) VALUES
(1, '2023-01-11 15:04:46.289443', '2023-01-11 15:04:46.289443', '2022-12-27', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_campaign_clientes`
--

CREATE TABLE `pallet_register_campaign_clientes` (
  `id` bigint(20) NOT NULL,
  `campaign_id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_campaign_clientes`
--

INSERT INTO `pallet_register_campaign_clientes` (`id`, `campaign_id`, `cliente_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_campaign_presentaciones`
--

CREATE TABLE `pallet_register_campaign_presentaciones` (
  `id` bigint(20) NOT NULL,
  `campaign_id` bigint(20) NOT NULL,
  `presentacion_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_campaign_presentaciones`
--

INSERT INTO `pallet_register_campaign_presentaciones` (`id`, `campaign_id`, `presentacion_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_campaign_usuarios`
--

CREATE TABLE `pallet_register_campaign_usuarios` (
  `id` bigint(20) NOT NULL,
  `campaign_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_campaign_usuarios`
--

INSERT INTO `pallet_register_campaign_usuarios` (`id`, `campaign_id`, `usuario_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_campaign_variedades`
--

CREATE TABLE `pallet_register_campaign_variedades` (
  `id` bigint(20) NOT NULL,
  `campaign_id` bigint(20) NOT NULL,
  `variedad_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_campaign_variedades`
--

INSERT INTO `pallet_register_campaign_variedades` (`id`, `campaign_id`, `variedad_id`) VALUES
(1, 1, 1),
(2, 1, 2);

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
(1, '2023-01-11 15:02:29.805592', '2023-01-11 15:02:29.805592', 'CAT-1'),
(2, '2023-01-11 15:02:33.370290', '2023-01-11 15:02:33.370290', 'CAT-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_cliente`
--

CREATE TABLE `pallet_register_cliente` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cliente` varchar(150) NOT NULL,
  `abreviatura` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_cliente`
--

INSERT INTO `pallet_register_cliente` (`id`, `created_at`, `updated_at`, `cliente`, `abreviatura`) VALUES
(1, '2023-01-11 15:02:15.566777', '2023-01-11 15:02:15.566777', 'ESMERALD VALLEY', 'E / V'),
(2, '2023-01-11 15:02:22.972411', '2023-01-11 15:02:22.972411', 'LION', 'LION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_cliente_destino`
--

CREATE TABLE `pallet_register_cliente_destino` (
  `id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `destino_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_cliente_destino`
--

INSERT INTO `pallet_register_cliente_destino` (`id`, `cliente_id`, `destino_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 2, 3),
(5, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_currentcampaign`
--

CREATE TABLE `pallet_register_currentcampaign` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `inicio` datetime(6) NOT NULL,
  `fin` datetime(6) NOT NULL,
  `campaign_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_destino`
--

CREATE TABLE `pallet_register_destino` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `destino` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_destino`
--

INSERT INTO `pallet_register_destino` (`id`, `created_at`, `updated_at`, `destino`) VALUES
(1, '2023-01-11 15:01:51.436055', '2023-01-11 15:01:51.436055', 'SHANGHAI'),
(2, '2023-01-11 15:01:53.383076', '2023-01-11 15:01:53.383076', 'AFRICA'),
(3, '2023-01-11 15:01:55.203291', '2023-01-11 15:01:55.203291', 'EE.UU'),
(4, '2023-01-11 15:02:01.413539', '2023-01-11 15:02:01.413539', 'AMSTERDAM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_detallepallet`
--

CREATE TABLE `pallet_register_detallepallet` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
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
(1, '2023-01-11 15:08:31.038866', '2023-01-11 15:08:31.038866', 'G-001', 55, 4, 1, 1);

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

--
-- Volcado de datos para la tabla `pallet_register_fundo`
--

INSERT INTO `pallet_register_fundo` (`id`, `created_at`, `updated_at`, `fundo`, `sede_id`) VALUES
(1, '2023-01-11 15:05:02.831862', '2023-01-11 15:05:02.831862', 'SANTA MARGARITA', 1),
(2, '2023-01-11 15:05:05.616708', '2023-01-11 15:05:05.616708', 'LA CASTELLANA', 1),
(3, '2023-01-11 15:05:08.800881', '2023-01-11 15:05:08.800881', 'SANTA INÉS', 1),
(4, '2023-01-11 15:05:12.150657', '2023-01-11 15:05:12.150657', 'SAN HILARION', 1),
(5, '2023-01-11 15:05:16.813872', '2023-01-11 15:05:16.813872', 'LOS CASTILLOS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_lote`
--

CREATE TABLE `pallet_register_lote` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `lote` varchar(50) NOT NULL,
  `codigo_lugar_produccion` varchar(150) NOT NULL,
  `fundo_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_lote`
--

INSERT INTO `pallet_register_lote` (`id`, `created_at`, `updated_at`, `lote`, `codigo_lugar_produccion`, `fundo_id`) VALUES
(1, '2023-01-11 15:05:24.511741', '2023-01-11 15:05:24.511741', '5161', '001-001', 1),
(2, '2023-01-11 15:05:30.069843', '2023-01-11 15:05:30.069843', '5162', '001-001', 2),
(3, '2023-01-11 15:05:39.724505', '2023-01-11 15:05:39.724505', '5163', '001-002', 1),
(4, '2023-01-11 15:05:50.263015', '2023-01-11 15:05:50.263015', '5164', '001-003', 1),
(5, '2023-01-11 15:05:56.707124', '2023-01-11 15:05:56.707124', '5261', '001-001', 2),
(6, '2023-01-11 15:06:17.900039', '2023-01-11 15:06:17.900039', '5366', '001-006', 4),
(7, '2023-01-11 15:06:25.350752', '2023-01-11 15:06:25.350752', '5367', '001-008', 4),
(8, '2023-01-11 15:06:39.884874', '2023-01-11 15:06:39.884874', '5422', '001-003', 3),
(9, '2023-01-11 15:06:46.247794', '2023-01-11 15:06:46.247794', '5423', '001-008', 3),
(10, '2023-01-11 15:06:53.379505', '2023-01-11 15:06:53.379505', '5633', '001-002', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_pallet`
--

CREATE TABLE `pallet_register_pallet` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `codigo_comercial` varchar(50) NOT NULL,
  `dp` varchar(150) DEFAULT NULL,
  `plu` tinyint(1) NOT NULL,
  `completo` tinyint(1) NOT NULL,
  `embarcado` tinyint(1) NOT NULL,
  `cantidad_de_cajas` int(11) NOT NULL,
  `calibre_id` bigint(20) NOT NULL,
  `campaign_id` bigint(20) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `presentacion_id` bigint(20) NOT NULL,
  `variedad_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_pallet`
--

INSERT INTO `pallet_register_pallet` (`id`, `created_at`, `updated_at`, `codigo`, `codigo_comercial`, `dp`, `plu`, `completo`, `embarcado`, `cantidad_de_cajas`, `calibre_id`, `campaign_id`, `categoria_id`, `cliente_id`, `presentacion_id`, `variedad_id`) VALUES
(1, '2023-01-11 15:08:13.885747', '2023-01-12 18:21:30.235285', 'RG-6696', 'BU-003', '55', 1, 0, 0, 100, 1, 1, 1, 1, 1, 1);

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
(1, '2023-01-11 14:47:19.766385', '2023-01-11 14:47:19.766385', 'ICA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_presentacion`
--

CREATE TABLE `pallet_register_presentacion` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `peso` decimal(3,1) NOT NULL,
  `cantidad_de_cajas` int(11) NOT NULL,
  `tipo_caja_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_presentacion`
--

INSERT INTO `pallet_register_presentacion` (`id`, `created_at`, `updated_at`, `descripcion`, `peso`, `cantidad_de_cajas`, `tipo_caja_id`) VALUES
(1, '2023-01-11 15:04:00.957288', '2023-01-11 15:04:00.957288', 'CAJA GENERICA', '8.2', 100, 1),
(2, '2023-01-11 15:04:15.268801', '2023-01-11 15:04:15.268801', 'CAJA VERDE', '7.3', 110, 2),
(3, '2023-01-11 15:04:34.360545', '2023-01-11 15:04:34.360545', 'CAJA ROJA', '4.5', 140, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_presentacion_productos`
--

CREATE TABLE `pallet_register_presentacion_productos` (
  `id` bigint(20) NOT NULL,
  `presentacion_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_presentacion_productos`
--

INSERT INTO `pallet_register_presentacion_productos` (`id`, `presentacion_id`, `producto_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_producto`
--

CREATE TABLE `pallet_register_producto` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `producto` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_producto`
--

INSERT INTO `pallet_register_producto` (`id`, `created_at`, `updated_at`, `producto`) VALUES
(1, '2023-01-11 14:46:17.598440', '2023-01-11 14:46:17.598440', 'UVA DE MESA');

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
(1, '2023-01-11 14:47:17.978790', '2023-01-11 14:47:17.978790', 'ICA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_tipocaja`
--

CREATE TABLE `pallet_register_tipocaja` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `tipo_caja` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_tipocaja`
--

INSERT INTO `pallet_register_tipocaja` (`id`, `created_at`, `updated_at`, `tipo_caja`) VALUES
(1, '2023-01-11 15:01:22.999148', '2023-01-11 15:01:22.999148', 'PLÁSTICO'),
(2, '2023-01-11 15:01:28.962254', '2023-01-11 15:01:28.962254', 'MADERA'),
(3, '2023-01-11 15:01:31.144476', '2023-01-11 15:01:31.144476', 'CARTÓN');

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
  `rol` varchar(3) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `staff` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `planta_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_usuario`
--

INSERT INTO `pallet_register_usuario` (`id`, `password`, `last_login`, `codigo`, `dni`, `nombre`, `apellido`, `rol`, `active`, `staff`, `admin`, `planta_id`) VALUES
(1, 'pbkdf2_sha256$390000$9VwpmbbRJNMXwEDwp2m9K3$P4KIarWjRBIHbuLEDOKWZdoYuBSdNfjRaUYpO4uCunA=', '2023-01-12 18:21:08.744034', '419738', '12345678', 'CARLOS DANIEL', 'ESCATE ROMÁN', 'REG', 1, 1, 1, 1),
(2, 'pbkdf2_sha256$390000$EdWNb3RLeRMu0iQMkl96JI$hsn/FARCzLUQ6KzJJ5SxlODijsQZ4+i2dTkZlkP4yrw=', '2023-01-12 14:40:34.156599', '123456', '12345678', 'RAMÓN', 'AGUADO APAZA', 'EMB', 1, 1, 0, 1),
(3, 'pbkdf2_sha256$390000$az8lGxZb0ER7AfyRYestfb$6lo4ZSFIqBSYvW4+UV10XEWZnTNvBx3daDjEB1PjG54=', '2023-01-12 17:33:38.568685', '419737', '77777777', 'DEF', 'AFGNAF', 'LEC', 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallet_register_variedad`
--

CREATE TABLE `pallet_register_variedad` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `codigo` varchar(3) NOT NULL,
  `variedad` varchar(100) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pallet_register_variedad`
--

INSERT INTO `pallet_register_variedad` (`id`, `created_at`, `updated_at`, `codigo`, `variedad`, `producto_id`) VALUES
(1, '2023-01-11 14:46:19.625108', '2023-01-11 14:46:19.625108', 'RG', 'RED GLOBE', 1),
(2, '2023-01-11 14:46:52.878671', '2023-01-11 14:46:52.878671', 'SW', 'SWEET GLOBE', 1);

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
(1, '2023-01-11 14:46:08.069191', '2023-01-11 14:46:08.069191', 'SUR');

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
-- Indices de la tabla `pallet_register_campaign`
--
ALTER TABLE `pallet_register_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pallet_register_camp_planta_id_d2d60227_fk_pallet_re` (`planta_id`),
  ADD KEY `pallet_register_camp_producto_id_75ac91de_fk_pallet_re` (`producto_id`);

--
-- Indices de la tabla `pallet_register_campaign_clientes`
--
ALTER TABLE `pallet_register_campaign_clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pallet_register_campaign_campaign_id_cliente_id_435c0a7a_uniq` (`campaign_id`,`cliente_id`),
  ADD KEY `pallet_register_camp_cliente_id_7878b310_fk_pallet_re` (`cliente_id`);

--
-- Indices de la tabla `pallet_register_campaign_presentaciones`
--
ALTER TABLE `pallet_register_campaign_presentaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pallet_register_campaign_campaign_id_presentacion_80f830ca_uniq` (`campaign_id`,`presentacion_id`),
  ADD KEY `pallet_register_camp_presentacion_id_07ce19dc_fk_pallet_re` (`presentacion_id`);

--
-- Indices de la tabla `pallet_register_campaign_usuarios`
--
ALTER TABLE `pallet_register_campaign_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pallet_register_campaign_campaign_id_usuario_id_c4dcfc1e_uniq` (`campaign_id`,`usuario_id`),
  ADD KEY `pallet_register_camp_usuario_id_2089f713_fk_pallet_re` (`usuario_id`);

--
-- Indices de la tabla `pallet_register_campaign_variedades`
--
ALTER TABLE `pallet_register_campaign_variedades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pallet_register_campaign_campaign_id_variedad_id_94619e37_uniq` (`campaign_id`,`variedad_id`),
  ADD KEY `pallet_register_camp_variedad_id_75320cc9_fk_pallet_re` (`variedad_id`);

--
-- Indices de la tabla `pallet_register_categoria`
--
ALTER TABLE `pallet_register_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pallet_register_cliente`
--
ALTER TABLE `pallet_register_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pallet_register_cliente_destino`
--
ALTER TABLE `pallet_register_cliente_destino`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pallet_register_cliente__cliente_id_destino_id_257c85ba_uniq` (`cliente_id`,`destino_id`),
  ADD KEY `pallet_register_clie_destino_id_ec95aa82_fk_pallet_re` (`destino_id`);

--
-- Indices de la tabla `pallet_register_currentcampaign`
--
ALTER TABLE `pallet_register_currentcampaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pallet_register_curr_campaign_id_6e70ef80_fk_pallet_re` (`campaign_id`);

--
-- Indices de la tabla `pallet_register_destino`
--
ALTER TABLE `pallet_register_destino`
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
  ADD KEY `pallet_register_pall_campaign_id_b9a66ece_fk_pallet_re` (`campaign_id`),
  ADD KEY `pallet_register_pall_categoria_id_1c9da0e2_fk_pallet_re` (`categoria_id`),
  ADD KEY `pallet_register_pall_cliente_id_fec2c545_fk_pallet_re` (`cliente_id`),
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `pallet_register_pres_tipo_caja_id_36fe84bb_fk_pallet_re` (`tipo_caja_id`);

--
-- Indices de la tabla `pallet_register_presentacion_productos`
--
ALTER TABLE `pallet_register_presentacion_productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pallet_register_presenta_presentacion_id_producto_935bc56a_uniq` (`presentacion_id`,`producto_id`),
  ADD KEY `pallet_register_pres_producto_id_fe6346b0_fk_pallet_re` (`producto_id`);

--
-- Indices de la tabla `pallet_register_producto`
--
ALTER TABLE `pallet_register_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pallet_register_sede`
--
ALTER TABLE `pallet_register_sede`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pallet_register_sede_zona_id_aae389b6_fk_pallet_register_zona_id` (`zona_id`);

--
-- Indices de la tabla `pallet_register_tipocaja`
--
ALTER TABLE `pallet_register_tipocaja`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `pallet_register_vari_producto_id_07cb71ee_fk_pallet_re` (`producto_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `pallet_register_calibre`
--
ALTER TABLE `pallet_register_calibre`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pallet_register_campaign`
--
ALTER TABLE `pallet_register_campaign`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pallet_register_campaign_clientes`
--
ALTER TABLE `pallet_register_campaign_clientes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pallet_register_campaign_presentaciones`
--
ALTER TABLE `pallet_register_campaign_presentaciones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pallet_register_campaign_usuarios`
--
ALTER TABLE `pallet_register_campaign_usuarios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pallet_register_campaign_variedades`
--
ALTER TABLE `pallet_register_campaign_variedades`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pallet_register_categoria`
--
ALTER TABLE `pallet_register_categoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pallet_register_cliente`
--
ALTER TABLE `pallet_register_cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pallet_register_cliente_destino`
--
ALTER TABLE `pallet_register_cliente_destino`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pallet_register_currentcampaign`
--
ALTER TABLE `pallet_register_currentcampaign`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pallet_register_destino`
--
ALTER TABLE `pallet_register_destino`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pallet_register_detallepallet`
--
ALTER TABLE `pallet_register_detallepallet`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pallet_register_fundo`
--
ALTER TABLE `pallet_register_fundo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pallet_register_lote`
--
ALTER TABLE `pallet_register_lote`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pallet_register_pallet`
--
ALTER TABLE `pallet_register_pallet`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT de la tabla `pallet_register_presentacion_productos`
--
ALTER TABLE `pallet_register_presentacion_productos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pallet_register_producto`
--
ALTER TABLE `pallet_register_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pallet_register_sede`
--
ALTER TABLE `pallet_register_sede`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pallet_register_tipocaja`
--
ALTER TABLE `pallet_register_tipocaja`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pallet_register_usuario`
--
ALTER TABLE `pallet_register_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pallet_register_variedad`
--
ALTER TABLE `pallet_register_variedad`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Filtros para la tabla `pallet_register_campaign`
--
ALTER TABLE `pallet_register_campaign`
  ADD CONSTRAINT `pallet_register_camp_planta_id_d2d60227_fk_pallet_re` FOREIGN KEY (`planta_id`) REFERENCES `pallet_register_planta` (`id`),
  ADD CONSTRAINT `pallet_register_camp_producto_id_75ac91de_fk_pallet_re` FOREIGN KEY (`producto_id`) REFERENCES `pallet_register_producto` (`id`);

--
-- Filtros para la tabla `pallet_register_campaign_clientes`
--
ALTER TABLE `pallet_register_campaign_clientes`
  ADD CONSTRAINT `pallet_register_camp_campaign_id_8005f293_fk_pallet_re` FOREIGN KEY (`campaign_id`) REFERENCES `pallet_register_campaign` (`id`),
  ADD CONSTRAINT `pallet_register_camp_cliente_id_7878b310_fk_pallet_re` FOREIGN KEY (`cliente_id`) REFERENCES `pallet_register_cliente` (`id`);

--
-- Filtros para la tabla `pallet_register_campaign_presentaciones`
--
ALTER TABLE `pallet_register_campaign_presentaciones`
  ADD CONSTRAINT `pallet_register_camp_campaign_id_cbbaab80_fk_pallet_re` FOREIGN KEY (`campaign_id`) REFERENCES `pallet_register_campaign` (`id`),
  ADD CONSTRAINT `pallet_register_camp_presentacion_id_07ce19dc_fk_pallet_re` FOREIGN KEY (`presentacion_id`) REFERENCES `pallet_register_presentacion` (`id`);

--
-- Filtros para la tabla `pallet_register_campaign_usuarios`
--
ALTER TABLE `pallet_register_campaign_usuarios`
  ADD CONSTRAINT `pallet_register_camp_campaign_id_024747ca_fk_pallet_re` FOREIGN KEY (`campaign_id`) REFERENCES `pallet_register_campaign` (`id`),
  ADD CONSTRAINT `pallet_register_camp_usuario_id_2089f713_fk_pallet_re` FOREIGN KEY (`usuario_id`) REFERENCES `pallet_register_usuario` (`id`);

--
-- Filtros para la tabla `pallet_register_campaign_variedades`
--
ALTER TABLE `pallet_register_campaign_variedades`
  ADD CONSTRAINT `pallet_register_camp_campaign_id_46f3f71d_fk_pallet_re` FOREIGN KEY (`campaign_id`) REFERENCES `pallet_register_campaign` (`id`),
  ADD CONSTRAINT `pallet_register_camp_variedad_id_75320cc9_fk_pallet_re` FOREIGN KEY (`variedad_id`) REFERENCES `pallet_register_variedad` (`id`);

--
-- Filtros para la tabla `pallet_register_cliente_destino`
--
ALTER TABLE `pallet_register_cliente_destino`
  ADD CONSTRAINT `pallet_register_clie_cliente_id_235f54aa_fk_pallet_re` FOREIGN KEY (`cliente_id`) REFERENCES `pallet_register_cliente` (`id`),
  ADD CONSTRAINT `pallet_register_clie_destino_id_ec95aa82_fk_pallet_re` FOREIGN KEY (`destino_id`) REFERENCES `pallet_register_destino` (`id`);

--
-- Filtros para la tabla `pallet_register_currentcampaign`
--
ALTER TABLE `pallet_register_currentcampaign`
  ADD CONSTRAINT `pallet_register_curr_campaign_id_6e70ef80_fk_pallet_re` FOREIGN KEY (`campaign_id`) REFERENCES `pallet_register_campaign` (`id`);

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
  ADD CONSTRAINT `pallet_register_pall_campaign_id_b9a66ece_fk_pallet_re` FOREIGN KEY (`campaign_id`) REFERENCES `pallet_register_campaign` (`id`),
  ADD CONSTRAINT `pallet_register_pall_categoria_id_1c9da0e2_fk_pallet_re` FOREIGN KEY (`categoria_id`) REFERENCES `pallet_register_categoria` (`id`),
  ADD CONSTRAINT `pallet_register_pall_cliente_id_fec2c545_fk_pallet_re` FOREIGN KEY (`cliente_id`) REFERENCES `pallet_register_cliente` (`id`),
  ADD CONSTRAINT `pallet_register_pall_presentacion_id_0cdf61cb_fk_pallet_re` FOREIGN KEY (`presentacion_id`) REFERENCES `pallet_register_presentacion` (`id`),
  ADD CONSTRAINT `pallet_register_pall_variedad_id_2d369e31_fk_pallet_re` FOREIGN KEY (`variedad_id`) REFERENCES `pallet_register_variedad` (`id`);

--
-- Filtros para la tabla `pallet_register_planta`
--
ALTER TABLE `pallet_register_planta`
  ADD CONSTRAINT `pallet_register_plan_sede_id_fe81c58a_fk_pallet_re` FOREIGN KEY (`sede_id`) REFERENCES `pallet_register_sede` (`id`);

--
-- Filtros para la tabla `pallet_register_presentacion`
--
ALTER TABLE `pallet_register_presentacion`
  ADD CONSTRAINT `pallet_register_pres_tipo_caja_id_36fe84bb_fk_pallet_re` FOREIGN KEY (`tipo_caja_id`) REFERENCES `pallet_register_tipocaja` (`id`);

--
-- Filtros para la tabla `pallet_register_presentacion_productos`
--
ALTER TABLE `pallet_register_presentacion_productos`
  ADD CONSTRAINT `pallet_register_pres_presentacion_id_9706a346_fk_pallet_re` FOREIGN KEY (`presentacion_id`) REFERENCES `pallet_register_presentacion` (`id`),
  ADD CONSTRAINT `pallet_register_pres_producto_id_fe6346b0_fk_pallet_re` FOREIGN KEY (`producto_id`) REFERENCES `pallet_register_producto` (`id`);

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

--
-- Filtros para la tabla `pallet_register_variedad`
--
ALTER TABLE `pallet_register_variedad`
  ADD CONSTRAINT `pallet_register_vari_producto_id_07cb71ee_fk_pallet_re` FOREIGN KEY (`producto_id`) REFERENCES `pallet_register_producto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
