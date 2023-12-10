-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2023 at 02:35 PM
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
(1, 'fad63365-4fb2-4595-9eea-4a05ddd7bc3f', '২০২৩ সালের নির্বাচন নিয়ে সবাই উদ্বেগে', 0, 1, 2, '2023-12-04 09:11:57', '2023-12-04 09:11:57'),
(2, '3020ed32-6b6d-4120-a26e-ef95e03de894', '২০২৩ নির্বাচন আমারও উদ্বেগ আসে ।', 0, 3, 2, '2023-12-04 23:16:11', '2023-12-04 23:16:11'),
(3, 'a24fb7ee-eb24-4667-8610-82cf4093568a', 'আমি আব্দুল্লাহ বলছি ২০২৩ নির্বাচন আমারও উদ্বেগ আসে ।', 0, 2, 2, '2023-12-04 23:27:09', '2023-12-04 23:27:09'),
(4, '50e8c539-7431-41c3-82be-121751b5367d', 'আমি Abu Taher বলছি ২০২৩ নির্বাচন আমারও উদ্বেগ আসে ।', 0, 5, 2, '2023-12-05 00:36:20', '2023-12-05 00:36:20'),
(5, '69c53f08-72ae-40e5-8aa7-69bcd78099c3', 'আমি Reahajul Islam Ripon বলছি ২০২৩ নির্বাচন আমারও উদ্বেগ আসে ।', 0, 4, 2, '2023-12-05 00:39:35', '2023-12-05 00:39:35'),
(6, '1b1c2f30-97ad-41fc-94e8-ae8633562b4a', 'Really very nice day !', 0, 4, 1, '2023-12-05 00:49:08', '2023-12-05 00:49:08'),
(7, 'c4d0746d-937a-4986-bc2a-bb73a7604552', 'Abdullah\'s profile comment just edited', 0, 2, 8, '2023-12-05 04:55:38', '2023-12-05 04:55:38'),
(8, 'c69c3e35-b93c-4c37-9356-6cf31ca24532', 'জাতিসংঘের হস্তক্ষেপ অত্যন্ত গুরুত্বপূর্ণ।', 0, 1, 2, '2023-12-05 05:09:59', '2023-12-05 05:09:59'),
(9, 'c0331787-a821-4509-ac03-d1bbe825629c', 'খুবই সত্যি কথা। খুবই সত্যি কথা।', 0, 1, 7, '2023-12-05 05:14:45', '2023-12-05 05:14:45');

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
(6, '2023_12_04_013418_create_comments_table', 1);

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
(1, '848a0106-193c-414e-9132-af1fb18ec29d', 1, 'আজ রবিবার দিনটি খুবই সুন্দর', 3, '2023-12-04 09:07:47', '2023-12-04 09:07:47'),
(2, 'c6dd2c1b-6393-452f-9364-e994c15f6d39', 1, 'নির্বাচন নিয়ে উদ্বেগের পাশাপাশি, দেশের অভ্যন্তরে চলমান মানবাধিকার লঙ্ঘন মোকাবেলা করার জন্য একটি শক্তিশালী মেকানিজম প্রতিষ্ঠার জন্য চাপ দেয়া প্রয়োজন। মানবাধিকার সুরক্ষা, মত প্রকাশের স্বাধীনতা এবং প্রতিশোধের ভয় ছাড়াই গণতান্ত্রিক প্রক্রিয়ায় অংশগ্রহণের অধিকার নিশ্চিত করতে জাতিসংঘের হস্তক্ষেপ অত্যন্ত গুরুত্বপূর্ণ। যে কোনো জাতির সার্বিক উন্নয়নের জন্য একটি সুষ্ঠু ও গণতান্ত্রিক ব্যবস্থা অপরিহার্য। তাই আমি অবিলম্বে নিম্নোক্ত বিষয়ে পদক্ষেপ নেয়ার জন্য', 10, '2023-12-04 09:10:43', '2023-12-04 09:10:43'),
(3, '6d52d006-9646-4eb0-9362-ebfe8ce62b69', 3, 'হলফনামায় লেখা তথ্য বিশ্লেষণ করে দেখা যায়, অস্থাবর সম্পদ হিসেবে সাকিব ব্যাংকে জমা দেখিয়েছেন ১১ কোটি ৫৬ লাখ ৯৯ হাজার টাকা। এ ছাড়া ২৪ হাজার ২৬১ মার্কিন ডলার বৈদেশিক মুদ্রা থাকার তথ্যও সাকিব দিয়েছেন। বন্ড, ঋণপত্র ও শেয়ার বাজারে সাকিবের ৪৩ কোটি ৬৩ লাখ টাকা বিনিয়োগ আছে। সোনা আছে ২৫ ভরি। তিনি আসবাবপত্র ও ইলেকট্রনিকসামগ্রী দেখিয়েছেন ১৩ লাখ টাকার।', 1, '2023-12-04 10:13:29', '2023-12-04 10:13:29'),
(4, 'cc01ca18-fd56-47dc-a8e1-ffb1211a93db', 3, 'এই ধরনের কাজের মধ্যে নির্বাচনী প্রক্রিয়া নষ্ট করা বা নির্বাচনে কারচুপি, ভোটারদের ভোটাধিকার থেকে বঞ্চিত করা বা ভোটাধিকার প্রয়োগ করতে বাধা দেওয়া, রাজনৈতিক বিরোধী দলের সদস্যদের নির্বাচনী প্রক্রিয়া থেকে বাদ দেওয়া; গণতান্ত্রিক, শাসন, বা মানবাধিকার সংক্রান্ত কর্মকাণ্ড পরিচালনায় নিয়োজিত নাগরিক সমাজের সংগঠনগুলোর ক্ষমতা সীমিত করা; ভোটার, নির্বাচনী পর্যবেক্ষক বা নাগরিক সমাজের সংগঠনগুলোকে হুমকি কিংবা শারীরিক সহিংসতার মাধ্যমে ভয় দেখানোর মতো বিষয় অন্তর্ভুক্ত থাকতে পারে।', 3, '2023-12-04 23:19:20', '2023-12-04 23:19:20'),
(5, '3ae798da-930b-41c5-b721-b96065dee423', 2, 'আল্লাহ তাআলা অবশ্যই তাঁর দ্বীন এবং মুমিন বান্দাদের সাহায্য করবেন। আল্লাহ তাআলা বলেন, ‘আমি অবশ্যই আবশ্যক করেছি যে, আমি এবং আমার রাসূলগণ অবশ্যই বিজয়ী হবেন। নিশ্চয় তিনি শক্তিধর পরাক্রমশালী। তিনি আরও বলেন, আমি সাহায্য করব রাসূলগণকে, ইহকালে যারা ঈমান এনেছে তাদেরকে ও সাক্ষীদের দণ্ডায়মান হওয়ার দিন’ (গাফির, ৪০/৫১)। ‘হে রাসূল! আপনি কাফেরদের বলুন, তোমরা শীঘ্রই পরাজিত হবে এবং জাহান্নামে তোমাদেরকে একত্রিত করা হবে। সেটা কতই না নিকৃষ্ট আবাসস্থল!’ (আল ইমরান, ৩/১২)।', 2, '2023-12-04 23:22:25', '2023-12-04 23:22:25'),
(6, 'f61a6edc-051a-400a-b9fe-94dcefeabb72', 5, '‘হে ঈমানদারগণ! তোমাদের কি হলো, যখন আল্লাহর পথে বের হবার জন্য তোমাদের বলা হয়, তখন মাটি জড়িয়ে ধরো, তোমরা কি আখেরাতের পরিবর্তে দুনিয়ার জীবনে পরিতুষ্ট হয়ে গেলে? অথচ আখেরাতের তুলনায় দুনিয়ার জীবনের উপকরণ অতি অল্প’ (আত-তওবা, ৯/৩৮)।', 3, '2023-12-05 00:35:23', '2023-12-05 00:35:23'),
(7, '49c57d1a-7c41-4c15-9b3d-5e3a4a1bbb8f', 4, 'মুসলিমদের ভবিষৎ সাফল্য নিশ্চিত যদিও কাফেররা তা অপছন্দ করে। \r\nএটা খুবই সত্যি কথা।', 7, '2023-12-05 00:38:42', '2023-12-05 00:38:42'),
(8, '644cb8fe-93fe-4538-9777-6e5c01744530', 2, 'This post from Abdullah Profile', 9, '2023-12-05 03:48:11', '2023-12-05 03:48:11');

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
(1, 'Sahin Uddin', 'Rony', 'sahincseiu', 'sahincseiu@gmail.com', '$2y$12$im1PtK4SZw6I2DTmVigg6.2oCdONtzz97bVvN7i5U2qjL7TokP2Im', 'শাহিন উদ্দিন প্রোফাইল এটাঃঃ>', NULL, NULL, '2023-12-04 09:00:45', '2023-12-04 09:00:45'),
(2, 'Abdullah Bin', 'Sahin', 'abdullahsahin', 'abdullah@gmail.com', '$2y$12$RR.QnraHMeH7wjVwwpmfpu8aQCq5Vc1Ht1AaZeW.LLMEzMNnW9S3e', NULL, NULL, NULL, '2023-12-04 09:02:58', '2023-12-04 09:02:58'),
(3, 'Rony', 'Ahmed', 'ronycse', 'rony@gmail.com', '$2y$12$U2o489NG3UjYxS3JpHtTDe7qFnigZwM5cP7BEd36vXU4tIlkHV.hW', NULL, NULL, NULL, '2023-12-04 09:03:48', '2023-12-04 09:03:48'),
(4, 'Rehajul', 'Islam', 'ripon', 'riponcv@gmail.com', '$2y$12$POEvcE0ZjJn5lViYFCsljeP5l0miRH/cSR8J6oV.0LDMyyZ4kV4qW', NULL, NULL, NULL, '2023-12-04 09:04:43', '2023-12-04 09:04:43'),
(5, 'Abu Taher', 'Moniruzzaman', 'moniruzzaman', 'abutaher@gmail.com', '$2y$12$TwrxkCHhUUY6QLH2KXihmO.RE1ynZ0cNv5zDjgYOznPTOuWpxdnee', NULL, NULL, NULL, '2023-12-04 09:06:21', '2023-12-04 09:06:21');

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
  ADD UNIQUE KEY `posts_uuid_unique` (`uuid`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
