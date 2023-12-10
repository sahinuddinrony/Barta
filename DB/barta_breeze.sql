-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2023 at 03:31 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barta_breeze`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `comment` text NOT NULL,
  `view_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `uuid`, `comment`, `view_count`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(2, '680471a1-5fdc-497d-af19-e5258cf99f08', 'my this is update', 0, 1, 2, '2023-12-06 08:52:18', '2023-12-06 08:52:18'),
(4, '9b2717b6-ce3d-4f08-beb6-48c4a62e1866', 'again comment post', 0, 1, 2, '2023-12-06 09:40:16', '2023-12-06 09:40:16'),
(5, '42a3ddc1-4721-4ac8-8e0d-f8fa86c7702e', 'hi this my post', 0, 1, 24, '2023-12-09 07:34:10', '2023-12-09 07:34:10'),
(6, 'b33f9c2c-eb8d-4dd2-9708-ce981c6609f7', 'يَا أَيُّهَا الَّذِينَ آمَنُوا ادْخُلُوا فِي السِّلْمِ كَافَّةً وَلَا تَتَّبِعُوا خُطُوَاتِ الشَّيْطَانِ إِنَّهُ لَكُمْ عَدُوٌّ مُبِينٌ', 0, 5, 25, '2023-12-09 21:27:25', '2023-12-09 21:27:25'),
(7, '1d3a7ce7-53dc-4c66-b502-093da3846e51', 'This is arabic post', 0, 5, 25, '2023-12-09 21:40:49', '2023-12-09 21:40:49'),
(8, '079177c7-e19b-4abb-a968-1479b74a2674', 'Jack Fruit is my national fruit', 0, 5, 21, '2023-12-09 21:45:53', '2023-12-09 21:45:53'),
(9, 'ec1da041-5f72-4b37-b149-64a670341ab2', 'Jack Fruit is my fevorate', 0, 3, 21, '2023-12-09 22:14:59', '2023-12-09 22:14:59'),
(10, '91cb9958-2045-4b89-bd88-788c54e6e602', 'Jack Fruit also my favorate', 0, 2, 21, '2023-12-09 22:17:55', '2023-12-09 22:17:55'),
(11, 'd0ee9600-2d4e-4d97-863e-7d26018e478a', 'Really awasome fruit', 0, 1, 21, '2023-12-09 22:19:26', '2023-12-09 22:19:26'),
(12, '1f9e9209-bc40-45cb-ab32-695c8c6831c9', 'জোরদার করার আহ্বান জানিয়েছে।', 0, 1, 11, '2023-12-09 22:26:23', '2023-12-09 22:26:23'),
(13, '3bc74967-77cc-4e17-ad29-fe898f7193b1', 'jhbkbnk', 0, 1, 21, '2023-12-10 02:57:41', '2023-12-10 02:57:41'),
(15, '53380602-16af-49bb-9986-590ee2675a65', 'No image profile post', 0, 4, 21, '2023-12-10 05:54:01', '2023-12-10 05:54:01');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(13, 'App\\Models\\Post', 21, 'f16a172a-c06c-48b0-83be-30f541d44a02', 'default', 'fruit-1', 'fruit-1.jpg', 'image/jpeg', 'public', 'public', 28571, '[]', '[]', '[]', '[]', 1, '2023-12-09 02:58:03', '2023-12-09 02:58:03'),
(15, 'App\\Models\\User', 1, '697a8cae-8b23-48f6-afae-fcb6ccff9729', 'default', 'Sahin Uddin Rony p', 'Sahin-Uddin-Rony-p.jpg', 'image/jpeg', 'public', 'public', 362232, '[]', '[]', '[]', '[]', 1, '2023-12-09 03:05:22', '2023-12-09 03:05:22'),
(18, 'App\\Models\\Post', 24, 'b1c677f0-b707-49af-9527-4fb0c559bfab', 'default', 'expensive car 4', 'expensive-car-4.jpg', 'image/jpeg', 'public', 'public', 156140, '[]', '[]', '[]', '[]', 1, '2023-12-09 04:56:43', '2023-12-09 04:56:43'),
(20, 'App\\Models\\Post', 15, '7f6aef01-1d1d-40a2-bf92-da0a52e9521c', 'default', 'dragon', 'dragon.jpg', 'image/jpeg', 'public', 'public', 34168, '[]', '[]', '[]', '[]', 1, '2023-12-09 07:33:07', '2023-12-09 07:33:07'),
(21, 'App\\Models\\Post', 25, '7fbf41bf-7f86-4dbb-9021-e29aa13acbbe', 'default', 'Mandarina', 'Mandarina.jpg', 'image/jpeg', 'public', 'public', 84885, '[]', '[]', '[]', '[]', 1, '2023-12-09 21:26:23', '2023-12-09 21:26:23'),
(22, 'App\\Models\\User', 5, 'c30a3bac-d747-4cd2-b4a2-f82030f2eaf5', 'default', 'keramot', 'keramot.jpg', 'image/jpeg', 'public', 'public', 86440, '[]', '[]', '[]', '[]', 1, '2023-12-09 22:10:17', '2023-12-09 22:10:17'),
(23, 'App\\Models\\User', 3, '9cea5b4e-536f-485c-8fc8-81ae03677b00', 'default', 'rihazul islam', 'rihazul-islam.jpg', 'image/jpeg', 'public', 'public', 168867, '[]', '[]', '[]', '[]', 1, '2023-12-09 22:12:55', '2023-12-09 22:12:55'),
(24, 'App\\Models\\User', 2, 'ed146624-1661-4f17-9dad-36ae9fc10226', 'default', 'azizul', 'azizul.jpg', 'image/jpeg', 'public', 'public', 662579, '[]', '[]', '[]', '[]', 1, '2023-12-09 22:17:04', '2023-12-09 22:17:04'),
(26, 'App\\Models\\Post', 3, 'e260278e-e15e-4adf-8e4a-723921db24d7', 'default', 'banana', 'banana.jpeg', 'image/jpeg', 'public', 'public', 4222, '[]', '[]', '[]', '[]', 1, '2023-12-10 06:32:17', '2023-12-10 06:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_04_013028_create_posts_table', 1),
(6, '2023_12_04_013418_create_comments_table', 1),
(7, '2023_12_08_011113_create_media_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `view_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `uuid`, `user_id`, `description`, `view_count`, `created_at`, `updated_at`) VALUES
(2, 'bff308ca-b7d4-4188-99ed-86b3a0f13807', 1, 'কথা বলতে বলতে প্রকাশ্যে কেঁদে দিলেন উত্তর কোরিয়ার প্রেসিডেন্ট কিম জং উন। তার সেই কান্নার ভিডিও এরইমধ্যে ইন্টারনেটে ব্যাপকভাবে ভাইরাল হয়েছে।', 14, '2023-12-06 08:49:24', '2023-12-06 09:40:16'),
(3, '7282d70b-7f9f-4a4c-9681-5b17b924cfd4', 1, 'Putin makes rare trip to Middle East to meet with UAE and Saudi leaders', 0, '2023-12-06 20:41:51', '2023-12-06 20:41:51'),
(10, 'a52ebe30-1c9d-43da-82ae-5c42856bc23f', 2, 'এই নতুন বৈশ্বিক শ্রম কৌশলটি সমস্ত মার্কিন সরকারি সংস্থাগুলোকে সরকার, শ্রম সংগঠন, ট্রেড ইউনিয়ন, সুশীল সমাজ এবং বেসরকারি খাতের সঙ্গে সংগঠন এবং সম্মিলিত দরকষাকষির স্বাধীনতার অধিকার প্রচার ও সুরক্ষার জন্য সম্পৃক্ততা জোরদার করার আহ্বান জানিয়েছে।', 1, '2023-12-07 06:02:38', '2023-12-07 06:10:18'),
(11, 'ddca1ed8-ef7d-4ca5-b485-ebaa4a497d5c', 3, 'সম্মিলিত দরকষাকষির স্বাধীনতার অধিকার প্রচার ও সুরক্ষার জন্য সম্পৃক্ততা জোরদার করার আহ্বান জানিয়েছে।', 3, '2023-12-07 06:10:31', '2023-12-10 05:20:53'),
(12, '51f66fc2-399d-4bd2-bfae-f1db6f087e8d', 4, 'আজ ফেলে আসা সেই মহান মনীষীগণের আক্বীদা জগতের একটি অংশ তাওহীদ ও আসমা ওয়াছ ছিফাতের ক্ষেত্রে কী খিদমত শুধু সেই বিষয়টি ফুটিয়ে তোলার চেষ্টা করব ইনশা-আল্লাহ। ওমা তাওফীক্বী ইল্লা বিল্লাহ।', 2, '2023-12-07 19:23:32', '2023-12-10 05:21:06'),
(15, '14a85694-e061-4233-9cfa-dec9e0301fff', 1, 'Green car name', 4, '2023-12-07 22:47:13', '2023-12-09 22:21:04'),
(21, '3ce60212-740e-4624-b7c4-c6b6987236f0', 1, 'This is Jack Fruit', 32, '2023-12-09 00:57:06', '2023-12-10 05:54:21'),
(24, '351a782b-f0a5-4f3f-a8fe-ec352320aba3', 5, 'ডজন ডজন বইয়ের থেকে প্রয়োজনীয় এক হালি বই শ্রেয়', 7, '2023-12-09 03:32:11', '2023-12-10 04:32:35'),
(25, 'e8d4cb0e-3a35-41eb-a77a-0804f332a19b', 5, 'হে ঈমানদারগণ! তোমরা পরিপূর্ণভাবে ইসলামে প্রবেশ করো। আর শয়তানের পদাঙ্কসমূহের অনুসরণ করো না। নিশ্চয়ই শয়তান তোমাদের প্রকাশ্য শত্রু’ (আল-বাক্বারা, ২/২০৮)।', 20, '2023-12-09 21:25:15', '2023-12-10 05:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `bio` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `username`, `email`, `password`, `bio`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sahin Uddin', 'Rony', 'sahincseiu', 'sahincseiu@gmail.com', '$2y$12$yXQKcGSesZlk43y6rsQPjOFhND6SNe3ivQjb3dIkdUR7ukRTManc2', 'Well come to my photo', NULL, NULL, '2023-12-06 07:54:10', '2023-12-09 03:05:22'),
(2, 'Azizul', 'Islam', 'abdullah19', 'azizul@gmail.com', '$2y$12$ElNcC57jAsDEjVcBbDncw.hL5aJrlassnQGrt0uH1rFs8bmsBRRF6', 'Azizul Profile', NULL, NULL, '2023-12-07 06:01:44', '2023-12-09 22:17:04'),
(3, 'Ripon', 'Islam', 'ripon2000', 'riponcv@gmail.com', '$2y$12$MSGyl2sWtrxN.r7k1HEEC.oMep9TJdj/V7AvyHd0WW0u3/rc0BUD.', 'This Rihazul Islam Ripon Bio', NULL, NULL, '2023-12-07 06:10:00', '2023-12-09 22:12:55'),
(4, 'Rony', 'Ahmed', 'ronycse', 'rony@gmail.com', '$2y$12$l2A9C8IrxFHTPATxxLEqgu8GOFa1qqyv/iB8.YV/8QRMdsugi0PNe', NULL, NULL, NULL, '2023-12-07 19:17:53', '2023-12-07 19:17:53'),
(5, 'Keramot Ali', 'Molla', 'keramot', 'keramot@gmail.com', '$2y$12$dty5/Z1eklFYyfSr8bixRO.qx2lZGrOZpX/EGlw6fcgBQXG0M7zcK', 'Tomoto Bio Update', NULL, NULL, '2023-12-09 03:29:42', '2023-12-09 05:01:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `comments_uuid_unique` (`uuid`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_uuid_unique` (`uuid`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
