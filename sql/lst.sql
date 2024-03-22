/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `allergens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `allergens` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `totalquantity` int(11) DEFAULT NULL,
  `recipe` varchar(255) DEFAULT NULL,
  `productquantity` int(11) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `ingredient` varchar(255) DEFAULT NULL,
  `allergen` varchar(255) DEFAULT NULL,
  `deliverydate` date DEFAULT NULL,
  `orderdate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ingredients` varchar(255) DEFAULT NULL,
  `isfood` tinyint(4) DEFAULT NULL,
  `type_id` tinyint(4) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

CREATE TABLE `recipe_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `basevalue` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `stockitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `expirationdate` date DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

CREATE TABLE `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `allergens` (`id`, `name`) VALUES
(1, 'Gluten');
INSERT INTO `allergens` (`id`, `name`) VALUES
(2, 'Eieren');
INSERT INTO `allergens` (`id`, `name`) VALUES
(4, 'Soja');
INSERT INTO `allergens` (`id`, `name`) VALUES
(5, 'Melk'),
(6, 'Amandelen'),
(15, 'Sesamzaad'),
(16, 'Lupine'),
(18, 'Vis'),
(19, 'Selderij'),
(20, 'Mosterd'),
(24, 'Noten');

INSERT INTO `cities` (`id`, `name`) VALUES
(1, 'Genk');
INSERT INTO `cities` (`id`, `name`) VALUES
(2, 'Oudsbergen');


INSERT INTO `clients` (`id`, `firstname`, `lastname`, `dateofbirth`, `adress`, `zipcode`, `city_id`, `phone`) VALUES
(1, 'Jan', 'Jannsen', '1975-01-01', 'Zoenebloem 25', 3600, 1, 456789526);
INSERT INTO `clients` (`id`, `firstname`, `lastname`, `dateofbirth`, `adress`, `zipcode`, `city_id`, `phone`) VALUES
(2, 'Mia', 'Maesen', '1985-12-12', 'Bolderweg 174', 3660, 2, 498251634);




INSERT INTO `ingredients` (`id`, `name`, `allergens`) VALUES
(1, 'Suiker', NULL);
INSERT INTO `ingredients` (`id`, `name`, `allergens`) VALUES
(2, 'Gedroogde glucosestroop', NULL);
INSERT INTO `ingredients` (`id`, `name`, `allergens`) VALUES
(3, 'Invertsuikerstroop', NULL);
INSERT INTO `ingredients` (`id`, `name`, `allergens`) VALUES
(4, 'Karamel', NULL),
(5, 'Tarwebloem', '1'),
(6, 'Botervet', '5'),
(7, 'Aardappelzetmeel', NULL),
(8, 'Ei', '2'),
(9, 'Zout', NULL),
(10, 'Kokos', NULL),
(11, 'Amandelnoten', '24'),
(12, 'Vanilline', NULL),
(13, 'Rijsmiddelen', NULL),
(14, 'Maïszetmeel', NULL),
(15, 'Specerijen', NULL),
(16, 'Hazelnoten', '24'),
(17, 'Rozijnen', NULL),
(18, 'Plantaardige olie', NULL),
(19, 'Melkerijboter', '5'),
(20, 'E472c', NULL),
(21, 'Sojalecithine', NULL),
(22, 'Dextrose', NULL),
(23, 'Gepelde sojabonen', NULL),
(24, 'E202', NULL),
(25, 'Citroenzuur', NULL),
(26, 'Natuurlijk aroma', NULL),
(27, 'Vitamine A', NULL),
(28, 'Vitamine D2', NULL),
(29, 'Cacaopoeder', NULL),
(30, 'E501i', NULL),
(31, 'E330', NULL),
(32, 'Robusta', NULL),
(33, 'Frambozen', NULL),
(34, 'Pectine', NULL),
(35, 'Sorbinezuur', NULL),
(36, 'Gist', NULL),
(37, 'E491', NULL),
(39, 'Geleisuiker', NULL),
(40, 'Speltbloem', '1,4'),
(41, 'Suikerstroop', '6,16');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2019_12_14_000001_create_personal_access_tokens_table', 2);

INSERT INTO `orders` (`id`, `client_id`, `totalquantity`, `recipe`, `productquantity`, `product`, `type`, `ingredient`, `allergen`, `deliverydate`, `orderdate`) VALUES
(104, 1, 10000, 'Huiskoekjes', 2500, 'Boter', 'gram', 'Melkerijboter, Suiker, Tarwebloem, Ei', 'Melk, Gluten, Eieren', '2024-02-22', '15-02-2024');
INSERT INTO `orders` (`id`, `client_id`, `totalquantity`, `recipe`, `productquantity`, `product`, `type`, `ingredient`, `allergen`, `deliverydate`, `orderdate`) VALUES
(105, 1, 10000, 'Huiskoekjes', 1800, 'Fijne suiker', 'gram', 'Melkerijboter, Suiker, Tarwebloem, Ei', 'Melk, Gluten, Eieren', '2024-02-22', '15-02-2024');
INSERT INTO `orders` (`id`, `client_id`, `totalquantity`, `recipe`, `productquantity`, `product`, `type`, `ingredient`, `allergen`, `deliverydate`, `orderdate`) VALUES
(106, 1, 10000, 'Huiskoekjes', 5000, 'Tarwebloem', 'gram', 'Melkerijboter, Suiker, Tarwebloem, Ei', 'Melk, Gluten, Eieren', '2024-02-22', '15-02-2024');
INSERT INTO `orders` (`id`, `client_id`, `totalquantity`, `recipe`, `productquantity`, `product`, `type`, `ingredient`, `allergen`, `deliverydate`, `orderdate`) VALUES
(107, 1, 10000, 'Huiskoekjes', 30, 'Eieren', 'stuks', 'Melkerijboter, Suiker, Tarwebloem, Ei', 'Melk, Gluten, Eieren', '2024-02-22', '15-02-2024'),
(108, 1, 4000, 'Huiskoekjes', 1000, 'Boter', 'gram', 'Melkerijboter, Suiker, Tarwebloem, Ei', 'Melk, Gluten, Eieren', '2024-02-25', '15-02-2024'),
(109, 1, 4000, 'Huiskoekjes', 720, 'Fijne suiker', 'gram', 'Melkerijboter, Suiker, Tarwebloem, Ei', 'Melk, Gluten, Eieren', '2024-02-25', '15-02-2024'),
(110, 1, 4000, 'Huiskoekjes', 2000, 'Tarwebloem', 'gram', 'Melkerijboter, Suiker, Tarwebloem, Ei', 'Melk, Gluten, Eieren', '2024-02-25', '15-02-2024'),
(111, 1, 4000, 'Huiskoekjes', 12, 'Eieren', 'stuks', 'Melkerijboter, Suiker, Tarwebloem, Ei', 'Melk, Gluten, Eieren', '2024-02-25', '15-02-2024'),
(112, 1, 100000, 'Huiskoekjes', 300, 'Eieren', 'stuks', 'Melkerijboter, Suiker, Tarwebloem, Ei', 'Melk, Gluten, Eieren', '2024-02-29', '15-02-2024'),
(113, 1, 100000, 'Huiskoekjes', 300, 'Eieren', 'stuks', 'Melkerijboter, Suiker, Tarwebloem, Ei', 'Melk, Gluten, Eieren', '2024-02-29', '15-02-2024'),
(114, 1, 100000, 'Huiskoekjes', 300, 'Eieren', 'stuks', 'Melkerijboter, Suiker, Tarwebloem, Ei', 'Melk, Gluten, Eieren', '2024-02-29', '15-02-2024');



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
(36, 'App\\Models\\User', 42, 'auth_token', 'fe9c1971e7d50d7b55ccec66c4058dc2d4d246d41b65279525c71ec30b85b086', '[\"*\"]', '2024-03-02 15:21:05', NULL, '2024-02-15 08:20:45', '2024-03-02 15:21:05');

INSERT INTO `products` (`id`, `name`, `ingredients`, `isfood`, `type_id`) VALUES
(1, 'Suikerbakkerspoeder Van Gilse', '1,2', 1, 1);
INSERT INTO `products` (`id`, `name`, `ingredients`, `isfood`, `type_id`) VALUES
(2, 'Basterdsuiker donker', '1,3,4', 1, 1);
INSERT INTO `products` (`id`, `name`, `ingredients`, `isfood`, `type_id`) VALUES
(3, 'Basterdsuiker geel', '1,3,4', 1, 1);
INSERT INTO `products` (`id`, `name`, `ingredients`, `isfood`, `type_id`) VALUES
(4, 'Pidy zanddeeg tartelette rond Ø7x2cm', '5,6,1,7,8,9', 1, 3),
(5, 'Kokos geraspt', '10', 1, 1),
(6, 'Amandelen wit gehakt', '11', 1, 1),
(7, 'Dr.Oetker Prof. vanillesuiker', '1,12', 1, 1),
(8, 'Dr.Oetker Prof. bakpoeder', '13,14', 1, 1),
(9, 'Polak speculaaskruiden', '15', 1, 1),
(10, 'Polak kaneel gemalen', '15', 1, 1),
(11, 'Eieren', '8', 1, 3),
(12, 'Hazelnoten stukjes', '16', 1, 1),
(13, 'Amandelmeel extra fijn', '11', 1, 1),
(14, 'Amandelen wit', '11', 1, 1),
(15, 'Rozijnen klein', '17,18', 1, 1),
(16, 'Boter', '19', 1, 1),
(17, 'Tarwebloem', '5', 1, 1),
(18, 'Fijne suiker', '1', 1, 1),
(19, 'Alpro bakken en braden', '18,20,21,9,22,23,24,25,26,27,28', 1, 1),
(20, 'Cacaopoeder warm brown Van Houten', '29,30,31', 1, 1),
(21, 'Everyday oploskoffie gold', '32', 1, 1),
(22, 'Frambozen diepvries', '33', 1, 1),
(23, 'Tiense Suiker geleisuiker maxi fruit', '1,34,25,35', 1, 1),
(24, 'Instant droge gist', '36,37', 1, 1),
(25, 'Bakpapier 60x40cm SUPER dubbel gesiliconeerd', NULL, NULL, 3),
(26, 'PME lolly/ijsstokjes hout 11cm', NULL, 0, 3),
(27, 'Blokbodemzak 85 + 60 x 220mm', NULL, 0, 3),
(28, 'PME Easy Cut Dowels bulk pak á 100 stuks 30cm', NULL, 0, 3),
(29, 'Bakvorm plaatcake wit 37x28,5x4,5cm', NULL, 0, 3),
(30, 'Vershoudfolie 30cm x 300m', NULL, 0, 3),
(31, 'Brievenbusdoosjes transparant 10 x 10 x 3', NULL, 0, 3),
(32, 'Gouden sweetsbox met transparant deksel', NULL, 0, 3),
(33, 'Cakeboards 34x26 wit', NULL, 0, 3),
(34, 'Brievenbusdoosjes transparant 15x11x3', NULL, 0, 3),
(35, 'Doos voor 12 cupcakes luifel', NULL, 0, 3),
(36, 'Hoge taartdoos 25x25x25 luifel', NULL, 0, 3),
(37, 'Mdf cakeboards 25 cm', NULL, 0, 3),
(38, 'Brievenbusdoosjes transparant 25x10x3', NULL, 0, 3),
(39, 'Gouden letterdozen 17.5x12x2.5', NULL, 0, 3),
(41, 'Frambozenconfituur', '33,39', 1, 1),
(42, 'Speltmuffin', '1,2,3', NULL, 1),
(43, 'Speltzetmeel', '2,1,3', NULL, 1);

INSERT INTO `recipe_product` (`id`, `recipe_id`, `product_id`, `type_id`, `quantity`, `basevalue`) VALUES
(1, 1, 16, 1, 250, 1000);
INSERT INTO `recipe_product` (`id`, `recipe_id`, `product_id`, `type_id`, `quantity`, `basevalue`) VALUES
(2, 1, 18, 1, 180, 1000);
INSERT INTO `recipe_product` (`id`, `recipe_id`, `product_id`, `type_id`, `quantity`, `basevalue`) VALUES
(3, 1, 17, 1, 500, 1000);
INSERT INTO `recipe_product` (`id`, `recipe_id`, `product_id`, `type_id`, `quantity`, `basevalue`) VALUES
(4, 1, 11, 3, 3, 1000),
(5, 2, 16, 1, 400, 1000),
(6, 2, 18, 1, 250, 1000),
(7, 2, 11, 3, 1, 1000),
(8, 2, 17, 1, 500, 1000),
(9, 2, 41, 1, 100, 1000);

INSERT INTO `recipes` (`id`, `name`) VALUES
(1, 'Huiskoekjes');
INSERT INTO `recipes` (`id`, `name`) VALUES
(2, 'Spritsroosjes');
INSERT INTO `recipes` (`id`, `name`) VALUES
(3, 'Espressokoekjes');
INSERT INTO `recipes` (`id`, `name`) VALUES
(4, 'Marmerkoekjes');

INSERT INTO `stockitems` (`id`, `product_id`, `quantity`, `expirationdate`, `supplier_id`) VALUES
(12, 1, 9450, '2034-01-27', 1);
INSERT INTO `stockitems` (`id`, `product_id`, `quantity`, `expirationdate`, `supplier_id`) VALUES
(13, 1, 15000, '2040-06-12', 1);
INSERT INTO `stockitems` (`id`, `product_id`, `quantity`, `expirationdate`, `supplier_id`) VALUES
(14, 2, 4000, '2028-12-31', 1);
INSERT INTO `stockitems` (`id`, `product_id`, `quantity`, `expirationdate`, `supplier_id`) VALUES
(15, 2, 20000, '2040-12-31', 1),
(16, 3, 25000, '2034-12-31', 1),
(17, 4, 127, '2024-09-27', 1),
(18, 5, 2400, '2024-02-29', 1),
(19, 6, 670, '2024-10-31', 1),
(20, 7, 1400, '2024-12-31', 1),
(21, 7, 2000, '2026-08-11', 1),
(22, 8, 3200, '2025-06-30', 1),
(23, 9, 1300, '2026-03-31', 1),
(24, 10, 1250, '2026-03-31', 1),
(25, 11, 0, '2024-02-29', 2),
(26, 12, 320, '2024-06-30', 3),
(27, 13, 1150, '2024-09-30', 3),
(28, 42, 500, '2025-02-15', 7),
(29, 17, 1000, '2024-12-18', 4),
(30, 11, 5129, '2024-05-14', 2);

INSERT INTO `suppliers` (`id`, `name`) VALUES
(1, 'Baktotaal');
INSERT INTO `suppliers` (`id`, `name`) VALUES
(2, 'Maasland eieren');
INSERT INTO `suppliers` (`id`, `name`) VALUES
(3, 'Notenshop');
INSERT INTO `suppliers` (`id`, `name`) VALUES
(4, 'Colruyt'),
(5, 'Cupcakedozen'),
(7, 'Aldi'),
(8, 'Lidl'),
(9, 'Carrefour');

INSERT INTO `types` (`id`, `name`) VALUES
(1, 'gram');
INSERT INTO `types` (`id`, `name`) VALUES
(2, 'centiliter');
INSERT INTO `types` (`id`, `name`) VALUES
(3, 'stuks');

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(16, 'John', 'john.john@john.john', NULL, '$2y$12$lx5IYdg7uMMV85xkaYe2xeUVG.E.pcnhmXqafRGTNZ/i4LeAvl7XC', '2|aJhpYzuQP0edyPQergLMtAN4mG257OouPwOEiPX5dd42701a', '2024-01-16 10:52:08', '2024-01-16 10:52:08');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(17, 'Cisse', 'cisse.cisse@cisse.cisse', NULL, '$2y$12$coDdnyOEAptjeMXkgeSYZOrFCR0GEESZoCohdcZ.oHrtiYRUiPUci', '3|6g4twlq9AOjjVxkfmhCbsKJ6b4ZStjCp6QlJPO3a395e7a37', '2024-01-16 10:55:27', '2024-01-16 10:55:27');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(18, 'Lennert', 'lennert@mail.com', NULL, '$2y$12$6pCukNw8rx9vzKE7aK8vZe1wZr3bZUK6iFlDLkFsnPvYvQrYvE7wK', '4|L5HNXKCAmLqYmdnqS7VeKde47aOZ6JdUUELmK1WR5fc588be', '2024-01-16 11:07:53', '2024-01-16 11:07:53');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(19, 'Mas', 'test@test.comSQFSDFSDF', NULL, '$2y$12$6X/3L6CPYY.S1WNKstWxR.2qZhh1ft1D3tn5Ov6PU7sviq7rp8pJa', '5|oySOgVtyeQJNP2OKoRY3dGNJOO1IVebJyt58Qekw8e79a529', '2024-01-16 11:56:46', '2024-01-16 11:56:46'),
(20, 'Johntest', 'johntest@john.be', NULL, '$2y$12$0mGSywIyFOrwmIYtOPf.wO2cKq8k9vOBkHA0PvqpU4bz/7y9JLOiq', '6|ZWEs5yX6MpMKKXbO6UeMSGzCLAnjKAMLSsyH1TKh7017a819', '2024-01-17 08:49:15', '2024-01-17 08:49:15'),
(22, 'blob', 'vis@gmail.com', NULL, '$2y$12$YYkMOgHLjV1rU5N8D699hOg4ABVDoSqzCJKBwSJmxxCGlP9AcyZRy', '8|BYZrrikkDAz8eZ3ZVsxTBHTAXX87LrdRclHXFKL64a02cb5a', '2024-01-17 09:29:16', '2024-01-17 09:29:16'),
(37, 'Lester', 'lester@tester.com', NULL, '$2y$12$Z01bRlOlp7NAe1z7vUD0NeSeeA.DL6FDl1pdKPeP4Dee2ugJKQX..', '23|ybkvwJ9477coMgMCe2H7A3Imv1L85KChZ8ws0t4x37a896d9', '2024-01-17 13:56:17', '2024-01-17 13:56:17'),
(39, 'LennertTest', 'test@hello.com', NULL, '$2y$12$N2eYWnIN5qyH0c0VKVW7eeYgNu5gwJhHLURWBL7KJ0HaeN49ykDIK', '33|PhQ76XXkmlRwQerv67P5voVTZPKRVnwv0TU9FMov57a072d6', '2024-01-26 21:08:45', '2024-01-26 21:08:45'),
(40, 'Ciisse', 'belmanscisse@gmail.com', NULL, '$2y$12$EaT.4DwKaQYAxG2pbF76n.Vba9aEuo214tb7akD0q/ha7EMDiZw96', '34|sicuqIiNCBdddsmhIEv7eOxxj9Brnpsf2bzrMIrracbff9ac', '2024-01-29 08:48:08', '2024-01-29 08:48:08'),
(41, 'Massimo De Nittis', 'massimo@gmail.com', NULL, '$2y$12$aynknipQejgIMTfZw2Eu7uGJfQr6BksHxZaUKPxMr2PRY2fM3v6a.', '35|FpcBPjPfolo1zRmdoNB6vp1YUdjJYdhGLWFQzfcX680ca02c', '2024-01-29 11:17:36', '2024-01-29 11:17:36'),
(42, 'Laura', 'laura@gmail.com', NULL, '$2y$12$UymepHCwL8DnbggUYeD/uOuqs3CAP0dOhEySl0ZmAcLyh.FgAqrk.', '36|FhrwQe4GTXSMFzrpCPKTIzcshmPV76MlpeRgD3pHc10f2e06', '2024-02-15 08:20:45', '2024-02-15 08:20:45');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;