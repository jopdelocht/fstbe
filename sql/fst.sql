/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `fibocards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `value` int DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `regularcards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `value` int DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `fibocards` (`id`, `value`, `state`) VALUES
(1, 1, 0);
INSERT INTO `fibocards` (`id`, `value`, `state`) VALUES
(2, 2, 0);
INSERT INTO `fibocards` (`id`, `value`, `state`) VALUES
(3, 3, 0);
INSERT INTO `fibocards` (`id`, `value`, `state`) VALUES
(4, 5, 0),
(5, 8, 0),
(6, 13, 0),
(7, 21, 0),
(8, 34, 0),
(9, 55, 0),
(10, 89, 0),
(11, 144, 0),
(12, 233, 0);

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2019_12_14_000001_create_personal_access_tokens_table', 2);



INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 15, 'auth_token', 'ff6d639268ddb5d380a4fae9a32ede9e8519830c060545ba0105f755e8ffe106', '[\"*\"]', NULL, NULL, '2024-01-16 10:51:00', '2024-01-16 10:51:00');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 16, 'auth_token', '73792f267719c1ca1f943dfeeaaa8dbdade0574ef47ea49975231ca4437be290', '[\"*\"]', NULL, NULL, '2024-01-16 10:52:08', '2024-01-16 10:52:08');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 17, 'auth_token', '791dbddd0dcc33f15ae668c47666aa7ea822a1a084128b1ed0309966c2b650e7', '[\"*\"]', NULL, NULL, '2024-01-16 10:55:27', '2024-01-16 10:55:27');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(4, 'App\\Models\\User', 18, 'auth_token', '098708a9d68f9f02548b11926feaa22caa1f1f8172721456f666ffd6bb1b54cc', '[\"*\"]', '2024-01-27 15:55:20', NULL, '2024-01-16 11:07:53', '2024-01-27 15:55:20'),
(5, 'App\\Models\\User', 19, 'auth_token', 'e8935f51bab97f1d7757f3aeacc0ee4e7af0ab190fba11df6b733fbcf6829b44', '[\"*\"]', NULL, NULL, '2024-01-16 11:56:46', '2024-01-16 11:56:46'),
(6, 'App\\Models\\User', 20, 'auth_token', '859c7132ab38b4e3f549167c6a97123b91a091d997ce69ea1f5db6763f7e0760', '[\"*\"]', NULL, NULL, '2024-01-17 08:49:15', '2024-01-17 08:49:15'),
(7, 'App\\Models\\User', 21, 'auth_token', '0134b05aa8e85fe9fee464fa65e80cdc6e86c2c0db259ca93a0e7fda17adb0be', '[\"*\"]', NULL, NULL, '2024-01-17 09:20:56', '2024-01-17 09:20:56'),
(8, 'App\\Models\\User', 22, 'auth_token', '3c6a8c324399cc228597f284397bbf572a594bda546a3dbafc37e358269e48d0', '[\"*\"]', NULL, NULL, '2024-01-17 09:29:16', '2024-01-17 09:29:16'),
(9, 'App\\Models\\User', 23, 'auth_token', '0bc9dea99b6fb24c069aa50116c13e09389ab3c22eff3f702af57e7e11e5d89d', '[\"*\"]', NULL, NULL, '2024-01-17 10:26:47', '2024-01-17 10:26:47'),
(10, 'App\\Models\\User', 24, 'auth_token', '899e116cf93569193461232b48fee1d0dfb21d8c78181199e4e4cfe066f3a7a7', '[\"*\"]', NULL, NULL, '2024-01-17 11:05:06', '2024-01-17 11:05:06'),
(11, 'App\\Models\\User', 25, 'auth_token', '74eda0ddc5bda1870b15657f6f29860093ba47bddaf7d2e4ebe6d1e77bc99c37', '[\"*\"]', NULL, NULL, '2024-01-17 11:07:56', '2024-01-17 11:07:56'),
(12, 'App\\Models\\User', 26, 'auth_token', '82c984c5a119ae84b4af3e70ab906ddf14dcce0070eea659441d4906fd2e4465', '[\"*\"]', NULL, NULL, '2024-01-17 11:09:54', '2024-01-17 11:09:54'),
(13, 'App\\Models\\User', 27, 'auth_token', '6d397a611d0e86d20d52b48ec86fe3377d49f485df4ffc1f3adb833d8ccec0a1', '[\"*\"]', NULL, NULL, '2024-01-17 11:10:49', '2024-01-17 11:10:49'),
(14, 'App\\Models\\User', 28, 'auth_token', '7f3d76e37d781d45b403af6adaa1b1852ebe416ba65f4b889714692ba73eb5b1', '[\"*\"]', NULL, NULL, '2024-01-17 12:41:12', '2024-01-17 12:41:12'),
(15, 'App\\Models\\User', 29, 'auth_token', '73d400cb879894264c564da7e4bc8c7af6b3fa769418521053691a8d0bffb922', '[\"*\"]', NULL, NULL, '2024-01-17 13:35:19', '2024-01-17 13:35:19'),
(16, 'App\\Models\\User', 30, 'auth_token', '9bc324f4cbd2627b5d422e4a48f0d869adbb0fd1ceae3739dd67d52ccc78e391', '[\"*\"]', NULL, NULL, '2024-01-17 13:36:10', '2024-01-17 13:36:10'),
(17, 'App\\Models\\User', 31, 'auth_token', '4d5d607022a6e8015e08bccf9a39b1e0f491f60b83a107b346fd7610521b6028', '[\"*\"]', NULL, NULL, '2024-01-17 13:36:49', '2024-01-17 13:36:49'),
(18, 'App\\Models\\User', 32, 'auth_token', '9920fd48658b5546f08caecaeced6a541147930e3fdd0e020ed7b9964a08ee46', '[\"*\"]', NULL, NULL, '2024-01-17 13:45:27', '2024-01-17 13:45:27'),
(19, 'App\\Models\\User', 33, 'auth_token', '153c1fbefcd7952a8a6d19934a3bff7b2817c3334ee0bf19e2242696af3165bf', '[\"*\"]', NULL, NULL, '2024-01-17 13:47:42', '2024-01-17 13:47:42'),
(20, 'App\\Models\\User', 34, 'auth_token', 'fd5b1819ea10fa53ccfcd7eba5fb7fc1a62a3c4f75c7a48a2dd3f100d0de82ca', '[\"*\"]', NULL, NULL, '2024-01-17 13:49:13', '2024-01-17 13:49:13'),
(21, 'App\\Models\\User', 35, 'auth_token', 'cc7dfb2b50323a553c09c6007c53c8023d49d3d9ecf4270e02c41237f293e707', '[\"*\"]', NULL, NULL, '2024-01-17 13:53:38', '2024-01-17 13:53:38'),
(22, 'App\\Models\\User', 36, 'auth_token', '3c1b14df666a5469843aa158fce16c99c8760e134cdb467c730ea6fba0986d64', '[\"*\"]', NULL, NULL, '2024-01-17 13:55:19', '2024-01-17 13:55:19'),
(23, 'App\\Models\\User', 37, 'auth_token', 'faa65fbab490d128ad4923fded6ec1ed5a9d8be8c16a27a82e689aa4cb20de2c', '[\"*\"]', NULL, NULL, '2024-01-17 13:56:17', '2024-01-17 13:56:17'),
(24, 'App\\Models\\User', 38, 'auth_token', '7e4ff6b2c510b7fc96d090ab18ba17d95c77481a8a09cfaac4697c34cb03365f', '[\"*\"]', NULL, NULL, '2024-01-17 14:05:53', '2024-01-17 14:05:53'),
(25, 'App\\Models\\User', 39, 'auth_token', 'f5718b7653ce0eea0fc97f09dd09d90924e4f06a144d6e2c4cf3a89c36145014', '[\"*\"]', NULL, NULL, '2024-01-17 14:07:01', '2024-01-17 14:07:01'),
(26, 'App\\Models\\User', 40, 'auth_token', 'd039019a4bb3df2465c20456c6afb21adb80a43dfb18d122b56da9d0c8616e9e', '[\"*\"]', NULL, NULL, '2024-01-17 14:09:15', '2024-01-17 14:09:15'),
(27, 'App\\Models\\User', 41, 'auth_token', 'c1255780fe7b75cbc4d2b68c91921f62975900866a19026b3cc8790cc4f3c58b', '[\"*\"]', NULL, NULL, '2024-01-17 14:09:49', '2024-01-17 14:09:49'),
(28, 'App\\Models\\User', 42, 'auth_token', '12520ff9bc3e8bad37bafd11683e6ba5c6e372367c0b90b617ee02e622cb6ec9', '[\"*\"]', NULL, NULL, '2024-01-17 14:26:56', '2024-01-17 14:26:56'),
(29, 'App\\Models\\User', 43, 'auth_token', '357bb4b3235f6c0f60d3ce64006be6a89dcf06fc876bd4d0984a4b5eb50cb297', '[\"*\"]', NULL, NULL, '2024-01-17 15:32:10', '2024-01-17 15:32:10'),
(30, 'App\\Models\\User', 44, 'auth_token', 'a623de142cff612f22daecdd381ba8e1dbeef5f6c9f57c62cbdd6905e9d8ca0d', '[\"*\"]', NULL, NULL, '2024-01-17 15:33:11', '2024-01-17 15:33:11'),
(31, 'App\\Models\\User', 45, 'auth_token', 'a1265d67cc8eda30156c9d3cd0f8829be7350c5daedd6bfdbc8d62b96506ca39', '[\"*\"]', NULL, NULL, '2024-01-17 15:37:57', '2024-01-17 15:37:57'),
(32, 'App\\Models\\User', 38, 'auth_token', '44d3c7db0deb08524a26afaf4bee3b4b24ba1eeccdb88172043d77183c4ba702', '[\"*\"]', NULL, NULL, '2024-01-26 21:03:58', '2024-01-26 21:03:58'),
(33, 'App\\Models\\User', 39, 'auth_token', '7950a41a6d3b9666edf16ec841642c35b447131840e425f7693d5cf9734c2bbc', '[\"*\"]', '2024-01-27 15:21:37', NULL, '2024-01-26 21:08:45', '2024-01-27 15:21:37'),
(34, 'App\\Models\\User', 40, 'auth_token', 'c840393da6bcb048c3752d9a138ba74df78764a67898e39f52555e71fc63f05a', '[\"*\"]', NULL, NULL, '2024-01-29 08:48:09', '2024-01-29 08:48:09'),
(35, 'App\\Models\\User', 41, 'auth_token', '8f3b2b9ad38d91b586373681c3f107d84a48bcc464a1839c70b27ab0d9bb7fcc', '[\"*\"]', '2024-01-29 11:23:12', NULL, '2024-01-29 11:17:36', '2024-01-29 11:23:12'),
(36, 'App\\Models\\User', 42, 'auth_token', 'fe9c1971e7d50d7b55ccec66c4058dc2d4d246d41b65279525c71ec30b85b086', '[\"*\"]', '2024-03-02 15:21:05', NULL, '2024-02-15 08:20:45', '2024-03-02 15:21:05'),
(37, 'App\\Models\\User', 43, 'auth_token', '6d559a3f220127a9a27a73121cd9ba089d87ee97d2e455424b833b1e030c564a', '[\"*\"]', NULL, NULL, '2024-03-22 09:17:46', '2024-03-22 09:17:46'),
(38, 'App\\Models\\User', 44, 'auth_token', '4225fe16d8d6462e7f1fedaef66150e671d292a4f7cd86352ce66284603267f8', '[\"*\"]', NULL, NULL, '2024-03-22 10:18:19', '2024-03-22 10:18:19'),
(39, 'App\\Models\\User', 45, 'auth_token', '376ee18604c8fcf156aa6c42aa6c6d51af714d35a57c1d3352c3f2fe0f89db9a', '[\"*\"]', NULL, NULL, '2024-03-22 11:35:07', '2024-03-22 11:35:07'),
(40, 'App\\Models\\User', 46, 'auth_token', '1aa87b059bfaa9deed37a935dee4c656b0f206aeab8da2f781dfda9bad393f3d', '[\"*\"]', NULL, NULL, '2024-03-22 14:18:41', '2024-03-22 14:18:41'),
(41, 'App\\Models\\User', 47, 'auth_token', 'aa86d9b436cd11f2855fab15afd64c2e072b7c59b80144ea22aeb8a0f8b30f14', '[\"*\"]', NULL, NULL, '2024-03-22 16:55:56', '2024-03-22 16:55:56'),
(42, 'App\\Models\\User', 48, 'auth_token', 'c1951a07013fe1e1c91836fee45b56a38a5c21cfd3dcf39fb150be731a9db170', '[\"*\"]', NULL, NULL, '2024-03-25 09:00:39', '2024-03-25 09:00:39'),
(43, 'App\\Models\\User', 49, 'auth_token', '9d7dddd7c06718761233d4bbcb3be57a6d8730a78d0a7c759087cf606b9c933f', '[\"*\"]', NULL, NULL, '2024-03-25 12:45:51', '2024-03-25 12:45:51'),
(44, 'App\\Models\\User', 50, 'auth_token', 'a68dd5480939e63bed6dfb1295fa0355ead560831b1d865121c0909512f6dcae', '[\"*\"]', NULL, NULL, '2024-03-25 13:06:10', '2024-03-25 13:06:10'),
(45, 'App\\Models\\User', 51, 'auth_token', '3043910073bf596eb861587a99e0e07739ba6ed26f0987c10bb03c700bdbd709', '[\"*\"]', NULL, NULL, '2024-03-26 09:04:48', '2024-03-26 09:04:48'),
(46, 'App\\Models\\User', 52, 'auth_token', 'f27dcb60279a24ad00f33b5e23155d0b7b3c5bcb6235236fa5e37a58a328ff51', '[\"*\"]', NULL, NULL, '2024-03-26 10:26:46', '2024-03-26 10:26:46'),
(47, 'App\\Models\\User', 53, 'auth_token', 'ba1691cfb1c8873795a38b1e6c79525681751d781d8b32688c0406387501b39f', '[\"*\"]', NULL, NULL, '2024-03-26 14:47:11', '2024-03-26 14:47:11'),
(48, 'App\\Models\\User', 54, 'auth_token', 'ae7be1967090d284dc923e99163e39ff3b873f2a2f7aa6578bcf7038c3e99b89', '[\"*\"]', NULL, NULL, '2024-03-27 07:09:20', '2024-03-27 07:09:20'),
(49, 'App\\Models\\User', 55, 'auth_token', 'aea800e4e4959481feff09ac420a3c90ad5cb2f82f0518dd60fb7ee7da8ee077', '[\"*\"]', NULL, NULL, '2024-03-27 09:14:51', '2024-03-27 09:14:51'),
(50, 'App\\Models\\User', 56, 'auth_token', '8275a02a1199f06c75c9eedb9d032e2438e8b0c9f39960c96c3993e099c68e6b', '[\"*\"]', NULL, NULL, '2024-03-27 12:21:03', '2024-03-27 12:21:03'),
(51, 'App\\Models\\User', 57, 'auth_token', 'ef5ab7e90a74f1a17e77c8cdd1d66f4905d93247757df336bccb89dc9df6ba4b', '[\"*\"]', NULL, NULL, '2024-03-28 11:39:11', '2024-03-28 11:39:11'),
(52, 'App\\Models\\User', 58, 'auth_token', '82b80c6c5894512bef6711e51f21afdfa6782dfab8ad5f68ec9c6aac2489b593', '[\"*\"]', NULL, NULL, '2024-03-28 12:50:00', '2024-03-28 12:50:00'),
(53, 'App\\Models\\User', 59, 'auth_token', '4c4742dc42d6b8c864ae74bf9ecd579211475eb8aabc0171117311d04fac390c', '[\"*\"]', NULL, NULL, '2024-03-28 12:50:17', '2024-03-28 12:50:17');

INSERT INTO `regularcards` (`id`, `value`, `state`) VALUES
(1, 1, 0);
INSERT INTO `regularcards` (`id`, `value`, `state`) VALUES
(2, 2, 0);
INSERT INTO `regularcards` (`id`, `value`, `state`) VALUES
(3, 3, 0);
INSERT INTO `regularcards` (`id`, `value`, `state`) VALUES
(4, 4, 0),
(5, 5, 0),
(6, 6, 0),
(7, 7, 0),
(8, 8, 0),
(9, 9, 0),
(10, 10, 0),
(11, 11, 0),
(12, 12, 0);

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(54, 'John', 'john@msn.be', NULL, '$2y$12$61liaZYhRqwAGG.kDJjHturjSfxRHlwfx/z5CWVofrTDN.lEP0H2m', '48|xRB3iWIVzRAhpBlMNhGQyiKuatJ1dGeKbFUdlzBx9b1cd1ae', '2024-03-27 07:09:20', '2024-03-27 07:09:20');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(57, 'Jens', 'jens@gmail.com', NULL, '$2y$12$keSGlcuw6vV0/vjjwYgA.u7SsVeJODtCsZ3rCBz96Uvl9iFqOd6Uu', '51|6xDIFiklu660U8m2naCozBTd0wzdcXMoIgWowC9de530c60f', '2024-03-28 11:39:11', '2024-03-28 11:39:11');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(58, 'Jos', 'jos@gmail.com', NULL, '$2y$12$ywk2U3i66RcUxEUJoe8OJO1M7.6xjwRiQeerfCksQ55gjRj0AoTCW', '52|LrLD4Q2fVB6qRlYrHc0sV40Gu5KJjec1zJUiU1Bn9d084934', '2024-03-28 12:50:00', '2024-03-28 12:50:00');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(59, 'Arlette', 'arlette@gmail.com', NULL, '$2y$12$S8P4WE/O.xNP9or4UO/J6.Pc0NmijIrrivJsH/aM9P9c1cW3rhJPm', '53|jAy77TrAlkkTNDvIhEfY7lD6sVNrvBJaYFOlhv9p73550b8e', '2024-03-28 12:50:17', '2024-03-28 12:50:17');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;