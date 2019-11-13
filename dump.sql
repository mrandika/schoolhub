-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 13, 2019 at 04:36 AM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `schoolhub`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_data`
--

CREATE TABLE `attendance_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_students` bigint(20) UNSIGNED NOT NULL,
  `id_attendance` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Hadir','Tidak Hadir','Dispensasi','Izin','Sakit','Absen') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `id_user`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Informasi', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(2, 1, 'Pemberitahuan', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(3, 1, 'Pengumuman', '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_categories` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `has_meta` tinyint(1) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `headline` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_comments`
--

CREATE TABLE `blog_post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_post` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_likes`
--

CREATE TABLE `blog_post_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_post` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_metas`
--

CREATE TABLE `blog_post_metas` (
  `id_post` bigint(20) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_tags`
--

CREATE TABLE `blog_post_tags` (
  `id_post` bigint(20) UNSIGNED NOT NULL,
  `id_tag` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_teacher` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `id_teacher`, `name`, `created_at`, `updated_at`) VALUES
(1, 6, 'KELAS COBA', '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(2, 14, '11 RPL 1', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(3, 16, '11 RPL 2', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(4, 26, '12 RPL 3', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(5, 12, '12 RPL 4', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(6, 14, '11 RPL 5', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(7, 14, '12 RPL 6', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(8, 16, '11 RPL 7', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(9, 20, '12 RPL 8', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(10, 25, '12 RPL 9', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(11, 22, '10 RPL 10', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(12, 25, '10 RPL 11', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(13, 21, '11 RPL 12', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(14, 21, '11 RPL 13', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(15, 21, '10 RPL 14', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(16, 10, '12 RPL 15', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(17, 23, '11 RPL 16', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(18, 27, '11 RPL 17', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(19, 15, '11 RPL 18', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(20, 15, '11 RPL 19', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(21, 11, '10 RPL 20', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(22, 14, '12 RPL 21', '2019-11-13 04:35:56', '2019-11-13 04:35:56');

-- --------------------------------------------------------

--
-- Table structure for table `kantin_inventories`
--

CREATE TABLE `kantin_inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_shop` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kantin_inventories`
--

INSERT INTO `kantin_inventories` (`id`, `id_shop`, `name`, `image`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(1, 1, 'Makanan', 'makanan.png', 1000, 10, '2019-11-13 04:35:52', '2019-11-13 04:35:52'),
(2, 1, 'Minuman', 'minuman.png', 1000, 10, '2019-11-13 04:35:52', '2019-11-13 04:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `kantin_payments`
--

CREATE TABLE `kantin_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_seller` bigint(20) UNSIGNED NOT NULL,
  `id_buyer` bigint(20) UNSIGNED NOT NULL,
  `id_inventory` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kantin_shops`
--

CREATE TABLE `kantin_shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_owner` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kantin_shops`
--

INSERT INTO `kantin_shops` (`id`, `id_owner`, `name`, `image`, `description`, `created_at`, `updated_at`) VALUES
(1, 8, 'Warung Penjual', 'warungpenjual.png', 'Warung Penjual lorem dorem.', '2019-11-13 04:35:52', '2019-11-13 04:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `kesiswaan_events`
--

CREATE TABLE `kesiswaan_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kesiswaan_reports`
--

CREATE TABLE `kesiswaan_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_teacher` bigint(20) UNSIGNED NOT NULL,
  `id_student` bigint(20) UNSIGNED NOT NULL,
  `id_violation` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Tervalidasi','Belum Tervalidasi') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kesiswaan_reports`
--

INSERT INTO `kesiswaan_reports` (`id`, `id_teacher`, `id_student`, `id_violation`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 7, 1, 'Tervalidasi', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(2, 6, 7, 2, 'Tervalidasi', '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `kesiswaan_violation`
--

CREATE TABLE `kesiswaan_violation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kesiswaan_violation`
--

INSERT INTO `kesiswaan_violation` (`id`, `name`, `score`, `created_at`, `updated_at`) VALUES
(1, 'Pelanggaran Ke-1', 84, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(2, 'Pelanggaran Ke-2', 30, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(3, 'Pelanggaran Ke-3', 64, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(4, 'Pelanggaran Ke-4', 30, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(5, 'Pelanggaran Ke-5', 25, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(6, 'Pelanggaran Ke-6', 48, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(7, 'Pelanggaran Ke-7', 14, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(8, 'Pelanggaran Ke-8', 24, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(9, 'Pelanggaran Ke-9', 56, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(10, 'Pelanggaran Ke-10', 17, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(11, 'Pelanggaran Ke-11', 53, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(12, 'Pelanggaran Ke-12', 27, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(13, 'Pelanggaran Ke-13', 46, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(14, 'Pelanggaran Ke-14', 31, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(15, 'Pelanggaran Ke-15', 48, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(16, 'Pelanggaran Ke-16', 79, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(17, 'Pelanggaran Ke-17', 81, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(18, 'Pelanggaran Ke-18', 77, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(19, 'Pelanggaran Ke-19', 84, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(20, 'Pelanggaran Ke-20', 72, '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_07_25_01_create_roles_table', 1),
(3, '2019_07_25_02_create_users_table', 1),
(4, '2019_07_25_03_create_users_data_table', 1),
(5, '2019_07_25_04_create_users_session_table', 1),
(6, '2019_07_25_05_create_rooms_table', 1),
(7, '2019_07_25_06_create_subjects_table', 1),
(8, '2019_07_25_07_create_teachers_table', 1),
(9, '2019_07_25_08_create_class_table', 1),
(10, '2019_07_25_09_create_notes_table', 1),
(11, '2019_07_25_10_create_students_table', 1),
(12, '2019_07_25_11_create_attendance_table', 1),
(13, '2019_07_25_12_create_attendance_data_table', 1),
(14, '2019_07_25_13_create_teaching_data_table', 1),
(15, '2019_07_25_14_create_teaching_attendance_table', 1),
(16, '2019_07_25_15_create_student_grade_table', 1),
(17, '2019_07_25_16_create_blog_categories_table', 1),
(18, '2019_07_25_17_create_blog_tags_table', 1),
(19, '2019_07_25_18_create_blog_posts_table', 1),
(20, '2019_07_25_19_create_blog_post_metas_table', 1),
(21, '2019_07_25_20_create_blog_post_tags_table', 1),
(22, '2019_07_25_21_create_blog_post_likes_table', 1),
(23, '2019_07_25_22_create_blog_post_comments_table', 1),
(24, '2019_07_25_23_create_sarpras_inventories_table', 1),
(25, '2019_07_25_24_create_sarpras_borrower_table', 1),
(26, '2019_07_25_25_create_kesiswaan_events_table', 1),
(27, '2019_07_25_26_create_kesiswaan_violation_table', 1),
(28, '2019_07_25_27_create_kesiswaan_reports_table', 1),
(29, '2019_07_25_28_create_kantin_shops_table', 1),
(30, '2019_07_25_29_create_kantin_inventories_table', 1),
(31, '2019_07_25_30_create_kantin_payments_table', 1),
(32, '2019_11_09_162544_create_test_questions_table', 1),
(33, '2019_11_09_162846_create_test_tokens_table', 1),
(34, '2019_11_09_165438_create_test_question_items_table', 1),
(35, '2019_11_09_194627_create_test_sessions_table', 1),
(36, '2019_11_13_093317_create_user_today_pages_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_teacher` bigint(20) UNSIGNED NOT NULL,
  `id_class` bigint(20) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '2019-11-13 04:35:50', '2019-11-13 04:35:50'),
(2, 'Admin Kesiswaan', '2019-11-13 04:35:50', '2019-11-13 04:35:50'),
(3, 'Admin Kurikulum', '2019-11-13 04:35:50', '2019-11-13 04:35:50'),
(4, 'Admin Sarpras', '2019-11-13 04:35:50', '2019-11-13 04:35:50'),
(5, 'Admin Kantin', '2019-11-13 04:35:50', '2019-11-13 04:35:50'),
(6, 'Guru', '2019-11-13 04:35:50', '2019-11-13 04:35:50'),
(7, 'Siswa', '2019-11-13 04:35:50', '2019-11-13 04:35:50'),
(8, 'Penjual', '2019-11-13 04:35:50', '2019-11-13 04:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(11) NOT NULL,
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `code`, `alias`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ruang Teori 1', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(2, 2, 'Ruang Teori 2', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(3, 3, 'Ruang Teori 3', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(4, 4, 'Ruang Teori 4', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(5, 5, 'Ruang Teori 5', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(6, 6, 'Ruang Teori 6', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(7, 7, 'Ruang Teori 7', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(8, 8, 'Ruang Teori 8', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(9, 9, 'Ruang Teori 9', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(10, 10, 'Ruang Teori 10', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(11, 1, 'Ruang Lab 1', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(12, 2, 'Ruang Lab 2', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(13, 3, 'Ruang Lab 3', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(14, 4, 'Ruang Lab 4', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(15, 5, 'Ruang Lab 5', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(16, 6, 'Ruang Lab 6', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(17, 7, 'Ruang Lab 7', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(18, 8, 'Ruang Lab 8', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(19, 9, 'Ruang Lab 9', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(20, 10, 'Ruang Lab 10', '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `sarpras_borrower`
--

CREATE TABLE `sarpras_borrower` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_inventory` bigint(20) UNSIGNED NOT NULL,
  `id_room` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Belum Dikembalikan','Dikembalikan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sarpras_borrower`
--

INSERT INTO `sarpras_borrower` (`id`, `id_user`, `id_inventory`, `id_room`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 1, 'Belum Dikembalikan', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(2, 7, 2, 1, 'Belum Dikembalikan', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(3, 7, 3, 1, 'Belum Dikembalikan', '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `sarpras_inventories`
--

CREATE TABLE `sarpras_inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Dipinjam','Tersedia') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sarpras_inventories`
--

INSERT INTO `sarpras_inventories` (`id`, `code`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PRYK-1', 'Proyektor 1', 'proyektor.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(2, 'PRYK-2', 'Proyektor 2', 'proyektor.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(3, 'PRYK-3', 'Proyektor 3', 'proyektor.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(4, 'PRYK-4', 'Proyektor 4', 'proyektor.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(5, 'PRYK-5', 'Proyektor 5', 'proyektor.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(6, 'PRYK-6', 'Proyektor 6', 'proyektor.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(7, 'PRYK-7', 'Proyektor 7', 'proyektor.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(8, 'PRYK-8', 'Proyektor 8', 'proyektor.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(9, 'PRYK-9', 'Proyektor 9', 'proyektor.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(10, 'PRYK-10', 'Proyektor 10', 'proyektor.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(11, 'STPK-1', 'Stopkontak 1', 'stopkontak.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(12, 'STPK-2', 'Stopkontak 2', 'stopkontak.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(13, 'STPK-3', 'Stopkontak 3', 'stopkontak.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(14, 'STPK-4', 'Stopkontak 4', 'stopkontak.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(15, 'STPK-5', 'Stopkontak 5', 'stopkontak.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(16, 'STPK-6', 'Stopkontak 6', 'stopkontak.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(17, 'STPK-7', 'Stopkontak 7', 'stopkontak.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(18, 'STPK-8', 'Stopkontak 8', 'stopkontak.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(19, 'STPK-9', 'Stopkontak 9', 'stopkontak.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(20, 'STPK-10', 'Stopkontak 10', 'stopkontak.jpg', 'Tersedia', '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nipd` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nisn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_class` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id_user`, `nipd`, `nisn`, `id_class`, `created_at`, `updated_at`) VALUES
(7, '123456789', '123456789', 1, '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(29, '899293416', '206893892', 13, '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(30, '105825673', '221617623', 19, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(31, '945888678', '540097232', 6, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(32, '679422511', '443379998', 8, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(33, '999288153', '806207978', 17, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(34, '846847991', '201008771', 1, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(35, '618207637', '305969087', 4, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(36, '640566838', '324351005', 16, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(37, '954794794', '215822685', 1, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(38, '500997964', '391274883', 15, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(39, '558488968', '954309488', 1, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(40, '57018979', '377691869', 1, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(41, '481743198', '408987764', 2, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(42, '467937868', '949179897', 10, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(43, '34840117', '203691125', 4, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(44, '248268822', '30901731', 7, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(45, '894799571', '537975256', 22, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(46, '901932459', '335686603', 5, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(47, '788352166', '333555130', 16, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(48, '822931415', '224060788', 11, '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `student_grade`
--

CREATE TABLE `student_grade` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_teaching` bigint(20) UNSIGNED NOT NULL,
  `id_students` bigint(20) UNSIGNED NOT NULL,
  `section` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_grade`
--

INSERT INTO `student_grade` (`id`, `id_teaching`, `id_students`, `section`, `section_name`, `score`, `created_at`, `updated_at`) VALUES
(1, 1, 7, '3.1', 'Pengenalan Database', 80, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(2, 1, 7, '3.2', 'Database Tingkat Lanjut', 78, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(3, 1, 7, '3.3', 'Penerapan Database', 80, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(4, 1, 7, '3.4', 'Database dan PHP', 70, '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('C1','C2','C3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `code`, `name`, `type`, `minimum`, `created_at`, `updated_at`) VALUES
(1, 'MP-1', 'Mata Pelajaran 1', 'C1', 80, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(2, 'MP-2', 'Mata Pelajaran 2', 'C2', 75, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(3, 'MP-3', 'Mata Pelajaran 3', 'C2', 79, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(4, 'MP-4', 'Mata Pelajaran 4', 'C2', 75, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(5, 'MP-5', 'Mata Pelajaran 5', 'C1', 75, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(6, 'MP-6', 'Mata Pelajaran 6', 'C3', 77, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(7, 'MP-7', 'Mata Pelajaran 7', 'C3', 80, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(8, 'MP-8', 'Mata Pelajaran 8', 'C1', 76, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(9, 'MP-9', 'Mata Pelajaran 9', 'C2', 78, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(10, 'MP-10', 'Mata Pelajaran 10', 'C3', 80, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(11, 'MP-11', 'Mata Pelajaran 11', 'C3', 77, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(12, 'MP-12', 'Mata Pelajaran 12', 'C2', 80, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(13, 'MP-13', 'Mata Pelajaran 13', 'C2', 75, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(14, 'MP-14', 'Mata Pelajaran 14', 'C2', 80, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(15, 'MP-15', 'Mata Pelajaran 15', 'C1', 79, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(16, 'MP-16', 'Mata Pelajaran 16', 'C1', 78, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(17, 'MP-17', 'Mata Pelajaran 17', 'C3', 78, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(18, 'MP-18', 'Mata Pelajaran 18', 'C2', 80, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(19, 'MP-19', 'Mata Pelajaran 19', 'C3', 80, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(20, 'MP-20', 'Mata Pelajaran 20', 'C2', 76, '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id_user`, `nip`, `created_at`, `updated_at`) VALUES
(6, '123456789', '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(9, '932972503', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(10, '416765309', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(11, '653271467', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(12, '183763950', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(13, '162283797', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(14, '388391305', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(15, '361239252', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(16, '517318978', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(17, '725012007', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(18, '167034592', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(19, '868250471', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(20, '320439520', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(21, '699406735', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(22, '190695569', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(23, '645754226', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(24, '693676095', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(25, '989748375', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(26, '154102657', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(27, '213556659', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(28, '715246882', '2019-11-13 04:35:56', '2019-11-13 04:35:56');

-- --------------------------------------------------------

--
-- Table structure for table `teaching_attendance`
--

CREATE TABLE `teaching_attendance` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_teaching` bigint(20) UNSIGNED NOT NULL,
  `section` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Hadir','Tidak Hadir','Dispensasi','Izin','Sakit','Absen') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teaching_data`
--

CREATE TABLE `teaching_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_teacher` bigint(20) UNSIGNED NOT NULL,
  `day` int(11) NOT NULL,
  `id_class` bigint(20) UNSIGNED NOT NULL,
  `id_subject` bigint(20) UNSIGNED NOT NULL,
  `id_room` bigint(20) UNSIGNED NOT NULL,
  `time_in` time DEFAULT NULL,
  `time_out` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teaching_data`
--

INSERT INTO `teaching_data` (`id`, `id_teacher`, `day`, `id_class`, `id_subject`, `id_room`, `time_in`, `time_out`, `created_at`, `updated_at`) VALUES
(1, 23, 4, 11, 1, 19, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(2, 11, 1, 11, 7, 8, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(3, 17, 1, 1, 1, 16, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(4, 17, 2, 17, 15, 18, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(5, 18, 2, 14, 11, 4, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(6, 12, 4, 1, 9, 16, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(7, 15, 1, 18, 12, 4, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(8, 24, 6, 1, 9, 17, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(9, 26, 6, 3, 4, 13, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(10, 26, 3, 18, 20, 13, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(11, 26, 6, 1, 6, 13, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(12, 9, 5, 4, 13, 16, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(13, 13, 3, 3, 2, 16, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(14, 15, 2, 6, 3, 20, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(15, 12, 3, 16, 17, 8, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(16, 17, 2, 18, 20, 12, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(17, 20, 4, 20, 9, 8, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(18, 11, 4, 7, 12, 3, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(19, 12, 2, 4, 10, 6, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(20, 18, 1, 17, 18, 12, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(21, 16, 4, 1, 1, 7, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(22, 15, 6, 1, 11, 18, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(23, 22, 6, 1, 4, 4, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(24, 21, 6, 1, 19, 1, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(25, 24, 4, 1, 13, 2, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(26, 6, 3, 1, 7, 3, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(27, 6, 3, 1, 11, 9, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(28, 6, 6, 1, 10, 12, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(29, 6, 3, 1, 11, 15, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(30, 6, 1, 1, 1, 8, '07:00:00', '12:00:00', '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `test_questions`
--

CREATE TABLE `test_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_teaching` bigint(20) UNSIGNED NOT NULL,
  `section` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_questions`
--

INSERT INTO `test_questions` (`id`, `id_teaching`, `section`, `section_name`, `created_at`, `updated_at`) VALUES
(1, 1, '3.1', '[UH] Pengenalan Database', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(2, 1, '3.2', '[UH] Database Tingkat Lanjut', '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `test_question_items`
--

CREATE TABLE `test_question_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_question` bigint(20) UNSIGNED NOT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_question_items`
--

INSERT INTO `test_question_items` (`id`, `id_question`, `question`, `answer`, `is_correct`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(2, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(3, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(4, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(5, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(6, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(7, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(8, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(9, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(10, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(11, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(12, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(13, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(14, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(15, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(16, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(17, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(18, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(19, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:59', '2019-11-13 04:35:59'),
(20, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-11-13 04:35:59', '2019-11-13 04:35:59');

-- --------------------------------------------------------

--
-- Table structure for table `test_sessions`
--

CREATE TABLE `test_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_student` bigint(20) UNSIGNED NOT NULL,
  `id_token` bigint(20) UNSIGNED NOT NULL,
  `progress` longtext COLLATE utf8mb4_unicode_ci,
  `score` int(11) NOT NULL,
  `is_ongoing` tinyint(1) NOT NULL,
  `is_finished` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_tokens`
--

CREATE TABLE `test_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_question` bigint(20) UNSIGNED NOT NULL,
  `id_student` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_tokens`
--

INSERT INTO `test_tokens` (`id`, `id_question`, `id_student`, `token`, `created_at`, `updated_at`) VALUES
(1, 1, 7, '123456789-PGNLNDB', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(2, 2, 7, '123456789-DBTGTLNJT', '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` int(11) NOT NULL,
  `role` bigint(20) UNSIGNED NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `image`, `email`, `username`, `password`, `balance`, `role`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'administrator.png', 'admin@starbhak.com', 'administrator', '$2y$10$B3cCMTE8X.ydpPfmYDBrSuEkj8/Ouv3evbImbWJKGWk8IFHUW79QG', 0, 1, NULL, NULL, '2019-11-13 04:35:50', '2019-11-13 04:35:50'),
(2, 'admin-kesiswaan.png', 'admin-kesiswaan@starbhak.com', 'adminkesiswaan', '$2y$10$Vpi9iS24QkLLRWMkoPWy8u9UFCZHbhJPzDvpzStxJ2MVDX7pDc.HK', 0, 2, NULL, NULL, '2019-11-13 04:35:50', '2019-11-13 04:35:50'),
(3, 'admin-kurikulum.png', 'admin-kurikulum@starbhak.com', 'adminkurikulum', '$2y$10$D.j2snbFoLw6nDeXjKE7qenwk9wA49Pwd04IRVSusHZlnWh5.d7u.', 0, 3, NULL, NULL, '2019-11-13 04:35:50', '2019-11-13 04:35:50'),
(4, 'admin-sarpras.png', 'admin-sarpras@starbhak.com', 'adminsarpras', '$2y$10$lGLPEiZSoYPLQCcC977tDOgmYQyCGFuCbEWzlGeA3.LiXiSLnGZfe', 0, 4, NULL, NULL, '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(5, 'admin-kantin.png', 'admin-kantin@starbhak.com', 'adminkantin', '$2y$10$Cvfcv5DssZYeus1qGJ1aru3Hc2a.TT07FoGtncxY1Ew6e1rw42pyO', 100000, 5, NULL, NULL, '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(6, 'guru.png', 'guru@starbhak.com', 'guru', '$2y$10$sLJOlJQIuyc/.06V82x6zO6VzgkumuQWgYY7gjdKHqK2ZS4JNwguS', 0, 6, NULL, NULL, '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(7, 'siswa.png', 'siswa@starbhak.com', 'siswa', '$2y$10$VdIlv9pC0ZDT7W7STvhhIuA3BUZxxFVbr4r0GSj9L6ZYiAWyvaWNK', 10000, 7, NULL, NULL, '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(8, 'penjual.png', 'penjual@starbhak.com', 'penjual', '$2y$10$1GrBB3MVMBG3wNxRSlSdqe2nD4GCsz2vbWvmNFqDoQKz5AlzAXAaK', 10000, 8, NULL, NULL, '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(9, '8_ANDIKA.png', 'ofujiati@yahoo.co.id', 'mayasari.anastasia', '$2y$10$zTV1g56TQrHBAhDddAnRCufz63LajNqDZEdlyrhir.emgea.9noWO', 0, 6, NULL, NULL, '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(10, '8_ANDIKA.png', 'wmarpaung@suryatmi.biz', 'padmasari.devi', '$2y$10$Cal8dTiT1zccIKPTCxatheF1drtSOVYIi2NC7eHgRvx6V1MAN09Gu', 0, 6, NULL, NULL, '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(11, '8_ANDIKA.png', 'rini18@tarihoran.biz.id', 'jwasita', '$2y$10$68JRQnTn04bsOCjPmCmEouQrvhsOE/6wd6yRSqVJO6XHAUn7SMMKC', 0, 6, NULL, NULL, '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(12, '8_ANDIKA.png', 'cengkal.utama@gmail.co.id', 'usada.najwa', '$2y$10$aItNUtyRLKg/vjkuBHDukOrj3bScKWxAPxexp.z/bvSDCHbmOSwO.', 0, 6, NULL, NULL, '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(13, '8_ANDIKA.png', 'kasusra10@yahoo.com', 'widodo.agnes', '$2y$10$kNOf9.sk.5cFu9EWCcHgFeagdNi2Gj6FOnnI3MlA5RFz7oxOoG8Ne', 0, 6, NULL, NULL, '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(14, '8_ANDIKA.png', 'alika82@yahoo.com', 'hana.laksmiwati', '$2y$10$V6gFefdEaq9XhyvMDwGHEek/q.XAPl.dKpmG3JkGa87nICYLFtSiS', 0, 6, NULL, NULL, '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(15, '8_ANDIKA.png', 'maheswara.wawan@gmail.co.id', 'tirtayasa.pratama', '$2y$10$p6aIBOBmeaqLsBgl/bixlO0p205Gg2aV3gl2LU05vFgF9/A8aVCNG', 0, 6, NULL, NULL, '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(16, '8_ANDIKA.png', 'almira.siregar@gmail.co.id', 'hani92', '$2y$10$Qq.2Rsdr4nkKFgyNNZoS4.Jd60.Rh78iDN3.yVhOSJuFBO3qiwyZm', 0, 6, NULL, NULL, '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(17, '8_ANDIKA.png', 'sitorus.bella@salahudin.go.id', 'kamaria21', '$2y$10$ep2JG.UsfeOU.otWr36kX.PeZcOCQfjLa0le63SBmBI8GjaqbFe/e', 0, 6, NULL, NULL, '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(18, '8_ANDIKA.png', 'murti08@rahimah.ac.id', 'darmanto.yulianti', '$2y$10$cY2SqQiW92E.3OY2dAptGOpyxmTR00nPo4LB56mj.uZlolpVFDvhO', 0, 6, NULL, NULL, '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(19, '8_ANDIKA.png', 'kurniawan.jaeman@gmail.co.id', 'dharyanti', '$2y$10$YZm89iN6.4gD4IKdkDz3meBN6Cp7yMThTsxWKp5lcUF67FXvqPesy', 0, 6, NULL, NULL, '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(20, '8_ANDIKA.png', 'puput89@suwarno.com', 'pastuti', '$2y$10$ahHNZ8R9ISgqa5Sgj/96OuHTp9bcBoLTUTHRw2CkU.if6W7t7oXf.', 0, 6, NULL, NULL, '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(21, '8_ANDIKA.png', 'fnasyiah@nasyiah.sch.id', 'hadi45', '$2y$10$oyPPLtgVHmCB9m6Rks4MxeDIpvtEpO2MjGEaEtqeajsrbyoe4Csp6', 0, 6, NULL, NULL, '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(22, '8_ANDIKA.png', 'jamal.dongoran@dongoran.my.id', 'utama.eluh', '$2y$10$EQqMgRgSRpAWFR2rwo6kIeO2tp1REnb0MwLSD3YrVy.VNau.5APBG', 0, 6, NULL, NULL, '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(23, '8_ANDIKA.png', 'aditya03@wibisono.asia', 'ian50', '$2y$10$ZAe1NEFAvlPaKXntGbuYW.XOh5AtTaxra946Jod/0gxi6BpnYPYyW', 0, 6, NULL, NULL, '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(24, '8_ANDIKA.png', 'rini.rahimah@laksmiwati.web.id', 'wahyu.saefullah', '$2y$10$6DfyNl1cxSlGHuso0Cs9meTn3MOpeLMMT3VbYXl2PalPbbhea5K3m', 0, 6, NULL, NULL, '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(25, '8_ANDIKA.png', 'warsa.utami@gmail.com', 'wadi.yuniar', '$2y$10$U7hJnYJqbJOOanr233QlWeuHHa4IjxThazPLrtsfSVFlZaVjFql2G', 0, 6, NULL, NULL, '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(26, '8_ANDIKA.png', 'astuti.tantri@gmail.com', 'jamal47', '$2y$10$VLrjx1qrJenX/kCP7MNRJuAbHM51BajfL5uAE8K4sn2Fmrnu8/uWu', 0, 6, NULL, NULL, '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(27, '8_ANDIKA.png', 'tari62@yahoo.com', 'asalahudin', '$2y$10$aIlLzZbKqpRXUHcqOBmQB.EqREsRXzrMcatfm6mG9MSNhvBt6SIoy', 0, 6, NULL, NULL, '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(28, '8_ANDIKA.png', 'adinata.saptono@gmail.com', 'puspa14', '$2y$10$aLKXm08gmwFpKvBHkjEyceewK6nVAMcG.5WPJdlKTf1MhCyLkGmVa', 0, 6, NULL, NULL, '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(29, '8_ANDIKA.png', 'vicky85@maryadi.name', 'betania.rahimah', '$2y$10$r4LdnEyofT2OQCjuW/vJkOtdZq/N9TJ2ceHccS.E0cWCu1JzM2bTe', 0, 7, NULL, NULL, '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(30, '8_ANDIKA.png', 'umi48@yahoo.com', 'irawan.vanesa', '$2y$10$/yuteH2NQ/F0/ZdcXG0Cj.ILT7cQPr/jMPsb1wkkiib4MFAVNl7qO', 0, 7, NULL, NULL, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(31, '8_ANDIKA.png', 'uli.prayoga@gunawan.org', 'lailasari.intan', '$2y$10$eg3SlRq.4YoXN.uXhZ/38.bqk0ErJAhsC1C1lN2HbsLzLnDgf22Te', 0, 7, NULL, NULL, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(32, '8_ANDIKA.png', 'simanjuntak.bella@yahoo.co.id', 'unjani.rahimah', '$2y$10$3MS4d8izdPN4dmrLORUep.fXbBQhStAYl52IJJmVh.DWZ1DHFGHRy', 0, 7, NULL, NULL, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(33, '8_ANDIKA.png', 'dina.jailani@yahoo.com', 'puspa85', '$2y$10$27XfXDhiu85mMLKcjdK1keCeyt7.09lEZww05za/V3ZmxfIoP.TNC', 0, 7, NULL, NULL, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(34, '8_ANDIKA.png', 'kfujiati@damanik.web.id', 'hassanah.maria', '$2y$10$1sVpvJOdpuRKh6ikl2dq8eIqH6J2O9.iqzHpAyFn3jEV4pqdRD6QS', 0, 7, NULL, NULL, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(35, '8_ANDIKA.png', 'fathonah.waskita@yahoo.com', 'rwibowo', '$2y$10$FGzQslxS5GAr9RlxrTylGOJ8iZ6wLjJhEgfiXUFD8xFL0LH3ten5G', 0, 7, NULL, NULL, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(36, '8_ANDIKA.png', 'emulyani@wastuti.tv', 'cinthia98', '$2y$10$islmNLpeh3iureuu47TwVuHypfQWuvzqaU3LxK.jWI8CHpJ4I1Wk2', 0, 7, NULL, NULL, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(37, '8_ANDIKA.png', 'qwahyudin@yahoo.co.id', 'knasyidah', '$2y$10$mm0sftbrQhLRjk8D83JMoeoqT3N5x/HY7/6ZH5PRkWly/DGf8UMsq', 0, 7, NULL, NULL, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(38, '8_ANDIKA.png', 'haryanti.syahrini@suryatmi.tv', 'wmahendra', '$2y$10$IVq5Xrw2p0E2lNbzPnSR7unWmfCQjSJKfS3NiYfYPliHePAyxRRRC', 0, 7, NULL, NULL, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(39, '8_ANDIKA.png', 'tomi.marpaung@yahoo.co.id', 'ade02', '$2y$10$9xf2Fd2BpmhQYt.c3depWexSGnmg7SqLd/hsJxCNh/4NOLfkdiOhy', 0, 7, NULL, NULL, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(40, '8_ANDIKA.png', 'simon.safitri@gmail.co.id', 'slailasari', '$2y$10$TE2Lz/C6FK6bpxR4QsVv7OVgs0wPNxXMyh84BDNpr/tTyeTYVS/8a', 0, 7, NULL, NULL, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(41, '8_ANDIKA.png', 'byolanda@gmail.com', 'rahimah.elvina', '$2y$10$c1YXczgG.jZ1yJqnkLBTm.6teGDvhg4JDUhpwC44clFaQ.OKO8XKi', 0, 7, NULL, NULL, '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(42, '8_ANDIKA.png', 'pratama.mahfud@suwarno.go.id', 'ulaksmiwati', '$2y$10$ecVnsQNytQb741LMsdGgNumZ.Eice3RFVy3T.wvVnPUvE0aI4eSPa', 0, 7, NULL, NULL, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(43, '8_ANDIKA.png', 'mujur.sitompul@permata.desa.id', 'prima86', '$2y$10$mpMvZKG020vyPpM4DSIBSeQaQA9ZjDtzyrC4HS.ErseR0P1YNe9A.', 0, 7, NULL, NULL, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(44, '8_ANDIKA.png', 'michelle.nashiruddin@gmail.co.id', 'cayadi32', '$2y$10$2yzxcv0.kXJemXjzMZg89u2JxJoaynYSR.qBtwOQqi6azxs4.smM.', 0, 7, NULL, NULL, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(45, '8_ANDIKA.png', 'handayani.faizah@yahoo.com', 'belinda.salahudin', '$2y$10$poNke.xoY/xgdWV35mWfQOZCSfcLvxz3k5QAhF4OJiY8kXsSiCNda', 0, 7, NULL, NULL, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(46, '8_ANDIKA.png', 'hamima79@aryani.or.id', 'kamal92', '$2y$10$sUZIchy2NMj5IB2/xEgMxuMX4h8Yy7GUYMQYFVrMRvXwEaq2A/46.', 0, 7, NULL, NULL, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(47, '8_ANDIKA.png', 'zwulandari@gmail.co.id', 'raden22', '$2y$10$h3S876Bac.rmbTSWNstSSuFKZt/uk6vLhJYiz4hDbxOmYAU.aUMw.', 0, 7, NULL, NULL, '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(48, '8_ANDIKA.png', 'pudjiastuti.sarah@halimah.name', 'harjasa38', '$2y$10$u99KM38e4YnZqg1MB5CKZe1nl6SFq2AMCNdMekvcQus8nPEtkofne', 0, 7, NULL, NULL, '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `users_data`
--

CREATE TABLE `users_data` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('Laki-laki','Perempuan','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `religion` enum('Islam','Kristen Protestan','Katolik','Buddha','Hindu','Kong Hu Chu','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthplace` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_data`
--

INSERT INTO `users_data` (`id_user`, `name`, `gender`, `religion`, `birthplace`, `dob`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(2, 'Admin Kesiswaan', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(3, 'Admin Kurikulum', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(4, 'Admin Sarpras', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(5, 'Admin Kantin', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(6, 'Guru Pengajar', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(7, 'Siswa', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(8, 'Penjual', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:51', '2019-11-13 04:35:51'),
(9, 'Kani Puti Wijayanti', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(10, 'Maida Tari Puspita S.Farm', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(11, 'Irma Novitasari', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(12, 'Latika Yuliarti', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(13, 'Rosman Suwarno', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(14, 'Salimah Malika Purwanti', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(15, 'Karen Lili Purwanti', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(16, 'Harsaya Enteng Pranowo M.Pd', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(17, 'Asirwanda Nugroho', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(18, 'Abyasa Kurniawan S.T.', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(19, 'Uli Sarah Oktaviani S.Pt', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:55', '2019-11-13 04:35:55'),
(20, 'Hadi Widodo', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(21, 'Ian Megantara', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(22, 'Balamantri Lazuardi', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(23, 'Hani Lili Puspasari', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(24, 'Jaga Hutasoit', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(25, 'Maryanto Waluyo', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(26, 'Siska Sakura Yuliarti', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(27, 'Zulfa Hasanah', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(28, 'Rama Firgantoro', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(29, 'Indah Yulianti', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:56', '2019-11-13 04:35:56'),
(30, 'Mutia Oktaviani S.E.', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(31, 'Hafshah Eli Purnawati S.Pt', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(32, 'Umar Maryadi', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(33, 'Yance Fitria Nurdiyanti', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(34, 'Karna Putu Ramadan', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(35, 'Oni Riyanti S.Ked', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(36, 'Okto Manullang', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(37, 'Halima Eka Astuti', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(38, 'Limar Gunarto', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(39, 'Ibrahim Tarihoran', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(40, 'Kajen Kusumo', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(41, 'Gandi Sihombing M.M.', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:57', '2019-11-13 04:35:57'),
(42, 'Raisa Violet Wulandari', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(43, 'Endah Susanti', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(44, 'Agnes Wulandari', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(45, 'Karja Ismail Waluyo S.Sos', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(46, 'Rachel Jasmin Winarsih', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(47, 'Intan Yessi Rahayu', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:58', '2019-11-13 04:35:58'),
(48, 'Puput Farah Mardhiyah', '0', '0', '0', '1970-01-01', '0', '0', '2019-11-13 04:35:58', '2019-11-13 04:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `users_session`
--

CREATE TABLE `users_session` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `is_mobile` tinyint(1) NOT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imei` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_today_pages`
--

CREATE TABLE `user_today_pages` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subheading` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_blog_posts`
-- (See below for the actual view)
--
CREATE TABLE `v_blog_posts` (
`id` bigint(20) unsigned
,`categories` mediumtext
,`user` varchar(100)
,`has_meta` tinyint(1)
,`title` text
,`headline` text
,`content` text
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_blog_post_comment`
-- (See below for the actual view)
--
CREATE TABLE `v_blog_post_comment` (
`id` bigint(20) unsigned
,`users` varchar(100)
,`posts` mediumtext
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_blog_post_tags`
-- (See below for the actual view)
--
CREATE TABLE `v_blog_post_tags` (
`id_post` bigint(20) unsigned
,`tag` mediumtext
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_class`
-- (See below for the actual view)
--
CREATE TABLE `v_class` (
`id` bigint(20) unsigned
,`teacher` varchar(100)
,`name` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kantin_payments`
-- (See below for the actual view)
--
CREATE TABLE `v_kantin_payments` (
`id` bigint(20) unsigned
,`id_seller` bigint(20) unsigned
,`shop` varchar(100)
,`customer` varchar(100)
,`item` varchar(100)
,`qty` int(11)
,`total` int(11)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kantin_shops`
-- (See below for the actual view)
--
CREATE TABLE `v_kantin_shops` (
`id` bigint(20) unsigned
,`owner` varchar(100)
,`name` varchar(100)
,`image` text
,`description` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kesiswaan_reports`
-- (See below for the actual view)
--
CREATE TABLE `v_kesiswaan_reports` (
`id` bigint(20) unsigned
,`id_teacher` bigint(20) unsigned
,`teacher` varchar(100)
,`id_student` bigint(20) unsigned
,`student` varchar(100)
,`violation` mediumtext
,`violation_score` bigint(11)
,`status` varchar(17)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_notes`
-- (See below for the actual view)
--
CREATE TABLE `v_notes` (
`teacher` varchar(100)
,`class` varchar(50)
,`text` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_sarpras_borrower`
-- (See below for the actual view)
--
CREATE TABLE `v_sarpras_borrower` (
`id` bigint(20) unsigned
,`id_user` bigint(20) unsigned
,`user` varchar(100)
,`item` mediumtext
,`room` varchar(100)
,`status` enum('Belum Dikembalikan','Dikembalikan')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_students`
-- (See below for the actual view)
--
CREATE TABLE `v_students` (
`id_user` bigint(20) unsigned
,`name` varchar(100)
,`nipd` varchar(20)
,`nisn` varchar(20)
,`id_class` bigint(20) unsigned
,`class` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_student_grade`
-- (See below for the actual view)
--
CREATE TABLE `v_student_grade` (
`id` bigint(20) unsigned
,`id_teaching` bigint(20) unsigned
,`id_teacher` bigint(20) unsigned
,`id_students` bigint(20) unsigned
,`student` varchar(100)
,`class_name` varchar(50)
,`subject` varchar(100)
,`section` text
,`section_name` text
,`minimum` double
,`score` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_teachers`
-- (See below for the actual view)
--
CREATE TABLE `v_teachers` (
`id_user` bigint(20) unsigned
,`name` varchar(100)
,`nip` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_teaching_data`
-- (See below for the actual view)
--
CREATE TABLE `v_teaching_data` (
`id` bigint(20) unsigned
,`id_teacher` bigint(20) unsigned
,`teacher` varchar(100)
,`day` int(11)
,`id_class` bigint(20) unsigned
,`class` varchar(50)
,`subject` varchar(100)
,`room` varchar(100)
,`time_in` time
,`time_out` time
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_test_question`
-- (See below for the actual view)
--
CREATE TABLE `v_test_question` (
`id` bigint(20) unsigned
,`id_teaching` bigint(20) unsigned
,`class_name` varchar(50)
,`subject_name` varchar(100)
,`id_teacher` bigint(20) unsigned
,`section` varchar(255)
,`section_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_users_session`
-- (See below for the actual view)
--
CREATE TABLE `v_users_session` (
`id` bigint(20) unsigned
,`name` varchar(100)
,`is_mobile` tinyint(1)
,`phone` text
,`imei` text
);

-- --------------------------------------------------------

--
-- Structure for view `v_blog_posts`
--
DROP TABLE IF EXISTS `v_blog_posts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_blog_posts`  AS  (select `blog_posts`.`id` AS `id`,(select `blog_categories`.`name` from `blog_categories` where (`blog_categories`.`id` = `blog_posts`.`id_categories`)) AS `categories`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `blog_posts`.`id_user`)) AS `user`,`blog_posts`.`has_meta` AS `has_meta`,`blog_posts`.`title` AS `title`,`blog_posts`.`headline` AS `headline`,`blog_posts`.`content` AS `content`,`blog_posts`.`created_at` AS `created_at`,`blog_posts`.`updated_at` AS `updated_at` from `blog_posts`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_blog_post_comment`
--
DROP TABLE IF EXISTS `v_blog_post_comment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_blog_post_comment`  AS  (select `blog_post_comments`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `blog_post_comments`.`id_user`)) AS `users`,(select `blog_posts`.`title` from `blog_posts` where (`blog_posts`.`id` = `blog_post_comments`.`id_post`)) AS `posts`,`blog_post_comments`.`created_at` AS `created_at`,`blog_post_comments`.`updated_at` AS `updated_at` from `blog_post_comments`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_blog_post_tags`
--
DROP TABLE IF EXISTS `v_blog_post_tags`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_blog_post_tags`  AS  (select `blog_post_tags`.`id_post` AS `id_post`,(select `blog_tags`.`name` from `blog_tags` where (`blog_tags`.`id` = `blog_post_tags`.`id_tag`)) AS `tag` from `blog_post_tags`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_class`
--
DROP TABLE IF EXISTS `v_class`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_class`  AS  (select `class`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `class`.`id_teacher`)) AS `teacher`,`class`.`name` AS `name` from `class`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_kantin_payments`
--
DROP TABLE IF EXISTS `v_kantin_payments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kantin_payments`  AS  (select `kantin_payments`.`id` AS `id`,`kantin_payments`.`id_seller` AS `id_seller`,(select `kantin_shops`.`name` from `kantin_shops` where (`kantin_shops`.`id_owner` = `kantin_payments`.`id_seller`)) AS `shop`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `kantin_payments`.`id_buyer`)) AS `customer`,(select `kantin_inventories`.`name` from `kantin_inventories` where (`kantin_inventories`.`id` = `kantin_payments`.`id_inventory`)) AS `item`,`kantin_payments`.`qty` AS `qty`,`kantin_payments`.`total` AS `total`,`kantin_payments`.`created_at` AS `created_at`,`kantin_payments`.`updated_at` AS `updated_at` from `kantin_payments`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_kantin_shops`
--
DROP TABLE IF EXISTS `v_kantin_shops`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kantin_shops`  AS  (select `kantin_shops`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `kantin_shops`.`id_owner`)) AS `owner`,`kantin_shops`.`name` AS `name`,`kantin_shops`.`image` AS `image`,`kantin_shops`.`description` AS `description` from `kantin_shops`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_kesiswaan_reports`
--
DROP TABLE IF EXISTS `v_kesiswaan_reports`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kesiswaan_reports`  AS  (select `kesiswaan_reports`.`id` AS `id`,(select `teachers`.`id_user` from `teachers` where (`teachers`.`id_user` = `kesiswaan_reports`.`id_teacher`)) AS `id_teacher`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `kesiswaan_reports`.`id_teacher`)) AS `teacher`,(select `students`.`id_user` from `students` where (`students`.`id_user` = `kesiswaan_reports`.`id_student`)) AS `id_student`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `kesiswaan_reports`.`id_student`)) AS `student`,(select `kesiswaan_violation`.`name` from `kesiswaan_violation` where (`kesiswaan_violation`.`id` = `kesiswaan_reports`.`id_violation`)) AS `violation`,(select `kesiswaan_violation`.`score` from `kesiswaan_violation` where (`kesiswaan_violation`.`id` = `kesiswaan_reports`.`id_violation`)) AS `violation_score`,(select `kesiswaan_reports`.`status` from `kesiswaan_reports` where (`kesiswaan_violation`.`id` = `kesiswaan_reports`.`id_violation`)) AS `status`,`kesiswaan_reports`.`created_at` AS `created_at` from (`kesiswaan_violation` join `kesiswaan_reports`) where (`kesiswaan_violation`.`id` = `kesiswaan_reports`.`id_violation`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_notes`
--
DROP TABLE IF EXISTS `v_notes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_notes`  AS  (select (select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `notes`.`id_teacher`)) AS `teacher`,(select `class`.`name` from `class` where (`class`.`id` = `notes`.`id_class`)) AS `class`,`notes`.`text` AS `text` from `notes`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_sarpras_borrower`
--
DROP TABLE IF EXISTS `v_sarpras_borrower`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sarpras_borrower`  AS  (select `sarpras_borrower`.`id` AS `id`,`sarpras_borrower`.`id_user` AS `id_user`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `sarpras_borrower`.`id_user`)) AS `user`,(select `sarpras_inventories`.`name` from `sarpras_inventories` where (`sarpras_inventories`.`id` = `sarpras_borrower`.`id_inventory`)) AS `item`,(select `rooms`.`alias` from `rooms` where (`rooms`.`id` = `sarpras_borrower`.`id_room`)) AS `room`,`sarpras_borrower`.`status` AS `status` from `sarpras_borrower`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_students`
--
DROP TABLE IF EXISTS `v_students`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_students`  AS  (select `students`.`id_user` AS `id_user`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `students`.`id_user`)) AS `name`,`students`.`nipd` AS `nipd`,`students`.`nisn` AS `nisn`,(select `class`.`id` from `class` where (`class`.`id` = `students`.`id_class`)) AS `id_class`,(select `class`.`name` from `class` where (`class`.`id` = `students`.`id_class`)) AS `class` from `students`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_student_grade`
--
DROP TABLE IF EXISTS `v_student_grade`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_student_grade`  AS  (select `student_grade`.`id` AS `id`,`student_grade`.`id_teaching` AS `id_teaching`,(select `teachers`.`id_user` from `teachers` where (`teachers`.`id_user` = `teaching_data`.`id_teacher`)) AS `id_teacher`,`student_grade`.`id_students` AS `id_students`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `student_grade`.`id_students`)) AS `student`,(select `class`.`name` from `class` where (`class`.`id` = `teaching_data`.`id_class`)) AS `class_name`,(select `subjects`.`name` from `subjects` where ((`subjects`.`id` = `teaching_data`.`id_subject`) and (`student_grade`.`id_teaching` = `teaching_data`.`id`))) AS `subject`,`student_grade`.`section` AS `section`,`student_grade`.`section_name` AS `section_name`,(select `subjects`.`minimum` from `subjects` where ((`subjects`.`id` = `teaching_data`.`id_subject`) and (`teaching_data`.`id` = `student_grade`.`id_teaching`))) AS `minimum`,`student_grade`.`score` AS `score` from (`student_grade` join `teaching_data`) where (`student_grade`.`id_teaching` = `teaching_data`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_teachers`
--
DROP TABLE IF EXISTS `v_teachers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_teachers`  AS  (select `teachers`.`id_user` AS `id_user`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `teachers`.`id_user`)) AS `name`,`teachers`.`nip` AS `nip` from `teachers`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_teaching_data`
--
DROP TABLE IF EXISTS `v_teaching_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_teaching_data`  AS  (select `teaching_data`.`id` AS `id`,`teaching_data`.`id_teacher` AS `id_teacher`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `teaching_data`.`id_teacher`)) AS `teacher`,`teaching_data`.`day` AS `day`,(select `class`.`id` from `class` where (`class`.`id` = `teaching_data`.`id_class`)) AS `id_class`,(select `class`.`name` from `class` where (`class`.`id` = `teaching_data`.`id_class`)) AS `class`,(select `subjects`.`name` from `subjects` where (`subjects`.`id` = `teaching_data`.`id_subject`)) AS `subject`,(select `rooms`.`alias` from `rooms` where (`rooms`.`id` = `teaching_data`.`id_room`)) AS `room`,`teaching_data`.`time_in` AS `time_in`,`teaching_data`.`time_out` AS `time_out` from `teaching_data`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_test_question`
--
DROP TABLE IF EXISTS `v_test_question`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_test_question`  AS  (select `test_questions`.`id` AS `id`,`test_questions`.`id_teaching` AS `id_teaching`,(select `class`.`name` from `class` where (`class`.`id` = `teaching_data`.`id_class`)) AS `class_name`,(select `subjects`.`name` from `subjects` where (`subjects`.`id` = `teaching_data`.`id_subject`)) AS `subject_name`,(select `teaching_data`.`id_teacher` from `teaching_data` where (`teaching_data`.`id` = `test_questions`.`id_teaching`)) AS `id_teacher`,`test_questions`.`section` AS `section`,`test_questions`.`section_name` AS `section_name` from (`test_questions` join `teaching_data`) where (`test_questions`.`id_teaching` = `teaching_data`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_users_session`
--
DROP TABLE IF EXISTS `v_users_session`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_users_session`  AS  (select `users_session`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `users_session`.`id_user`)) AS `name`,`users_session`.`is_mobile` AS `is_mobile`,`users_session`.`phone` AS `phone`,`users_session`.`imei` AS `imei` from `users_session`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_data`
--
ALTER TABLE `attendance_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_data_id_students_foreign` (`id_students`),
  ADD KEY `attendance_data_id_attendance_foreign` (`id_attendance`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_categories_id_user_foreign` (`id_user`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_posts_id_categories_foreign` (`id_categories`),
  ADD KEY `blog_posts_id_user_foreign` (`id_user`);

--
-- Indexes for table `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_post_comments_id_user_foreign` (`id_user`),
  ADD KEY `blog_post_comments_id_post_foreign` (`id_post`);

--
-- Indexes for table `blog_post_likes`
--
ALTER TABLE `blog_post_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_post_likes_id_user_foreign` (`id_user`),
  ADD KEY `blog_post_likes_id_post_foreign` (`id_post`);

--
-- Indexes for table `blog_post_metas`
--
ALTER TABLE `blog_post_metas`
  ADD KEY `blog_post_metas_id_post_foreign` (`id_post`);

--
-- Indexes for table `blog_post_tags`
--
ALTER TABLE `blog_post_tags`
  ADD KEY `blog_post_tags_id_post_foreign` (`id_post`),
  ADD KEY `blog_post_tags_id_tag_foreign` (`id_tag`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_tags_id_user_foreign` (`id_user`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id_teacher_foreign` (`id_teacher`);

--
-- Indexes for table `kantin_inventories`
--
ALTER TABLE `kantin_inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kantin_inventories_id_shop_foreign` (`id_shop`);

--
-- Indexes for table `kantin_payments`
--
ALTER TABLE `kantin_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kantin_payments_id_seller_foreign` (`id_seller`),
  ADD KEY `kantin_payments_id_buyer_foreign` (`id_buyer`),
  ADD KEY `kantin_payments_id_inventory_foreign` (`id_inventory`);

--
-- Indexes for table `kantin_shops`
--
ALTER TABLE `kantin_shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kantin_shops_id_owner_foreign` (`id_owner`);

--
-- Indexes for table `kesiswaan_events`
--
ALTER TABLE `kesiswaan_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kesiswaan_reports`
--
ALTER TABLE `kesiswaan_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kesiswaan_reports_id_teacher_foreign` (`id_teacher`),
  ADD KEY `kesiswaan_reports_id_student_foreign` (`id_student`),
  ADD KEY `kesiswaan_reports_id_violation_foreign` (`id_violation`);

--
-- Indexes for table `kesiswaan_violation`
--
ALTER TABLE `kesiswaan_violation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_id_teacher_foreign` (`id_teacher`),
  ADD KEY `notes_id_class_foreign` (`id_class`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sarpras_borrower`
--
ALTER TABLE `sarpras_borrower`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sarpras_borrower_id_user_foreign` (`id_user`),
  ADD KEY `sarpras_borrower_id_inventory_foreign` (`id_inventory`),
  ADD KEY `sarpras_borrower_id_room_foreign` (`id_room`);

--
-- Indexes for table `sarpras_inventories`
--
ALTER TABLE `sarpras_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD UNIQUE KEY `students_id_user_unique` (`id_user`),
  ADD KEY `students_id_class_foreign` (`id_class`);

--
-- Indexes for table `student_grade`
--
ALTER TABLE `student_grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_grade_id_teaching_foreign` (`id_teaching`),
  ADD KEY `student_grade_id_students_foreign` (`id_students`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD UNIQUE KEY `teachers_id_user_unique` (`id_user`);

--
-- Indexes for table `teaching_attendance`
--
ALTER TABLE `teaching_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teaching_attendance_id_teaching_foreign` (`id_teaching`);

--
-- Indexes for table `teaching_data`
--
ALTER TABLE `teaching_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teaching_data_id_teacher_foreign` (`id_teacher`),
  ADD KEY `teaching_data_id_class_foreign` (`id_class`),
  ADD KEY `teaching_data_id_subject_foreign` (`id_subject`),
  ADD KEY `teaching_data_id_room_foreign` (`id_room`);

--
-- Indexes for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_questions_id_teaching_foreign` (`id_teaching`);

--
-- Indexes for table `test_question_items`
--
ALTER TABLE `test_question_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_question_items_id_question_foreign` (`id_question`);

--
-- Indexes for table `test_sessions`
--
ALTER TABLE `test_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_sessions_id_student_foreign` (`id_student`),
  ADD KEY `test_sessions_id_token_foreign` (`id_token`);

--
-- Indexes for table `test_tokens`
--
ALTER TABLE `test_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `test_tokens_token_unique` (`token`),
  ADD KEY `test_tokens_id_question_foreign` (`id_question`),
  ADD KEY `test_tokens_id_student_foreign` (`id_student`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_foreign` (`role`);

--
-- Indexes for table `users_data`
--
ALTER TABLE `users_data`
  ADD UNIQUE KEY `users_data_id_user_unique` (`id_user`);

--
-- Indexes for table `users_session`
--
ALTER TABLE `users_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_session_id_user_foreign` (`id_user`);

--
-- Indexes for table `user_today_pages`
--
ALTER TABLE `user_today_pages`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_data`
--
ALTER TABLE `attendance_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post_likes`
--
ALTER TABLE `blog_post_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `kantin_inventories`
--
ALTER TABLE `kantin_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kantin_payments`
--
ALTER TABLE `kantin_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kantin_shops`
--
ALTER TABLE `kantin_shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kesiswaan_events`
--
ALTER TABLE `kesiswaan_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kesiswaan_reports`
--
ALTER TABLE `kesiswaan_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kesiswaan_violation`
--
ALTER TABLE `kesiswaan_violation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sarpras_borrower`
--
ALTER TABLE `sarpras_borrower`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sarpras_inventories`
--
ALTER TABLE `sarpras_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `student_grade`
--
ALTER TABLE `student_grade`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `teaching_attendance`
--
ALTER TABLE `teaching_attendance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teaching_data`
--
ALTER TABLE `teaching_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `test_questions`
--
ALTER TABLE `test_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test_question_items`
--
ALTER TABLE `test_question_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `test_sessions`
--
ALTER TABLE `test_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_tokens`
--
ALTER TABLE `test_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users_session`
--
ALTER TABLE `users_session`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_data`
--
ALTER TABLE `attendance_data`
  ADD CONSTRAINT `attendance_data_id_attendance_foreign` FOREIGN KEY (`id_attendance`) REFERENCES `attendance` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attendance_data_id_students_foreign` FOREIGN KEY (`id_students`) REFERENCES `students` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD CONSTRAINT `blog_categories_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_id_categories_foreign` FOREIGN KEY (`id_categories`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_posts_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_post_comments`
--
ALTER TABLE `blog_post_comments`
  ADD CONSTRAINT `blog_post_comments_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_post_comments_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_post_likes`
--
ALTER TABLE `blog_post_likes`
  ADD CONSTRAINT `blog_post_likes_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_post_likes_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_post_metas`
--
ALTER TABLE `blog_post_metas`
  ADD CONSTRAINT `blog_post_metas_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_post_tags`
--
ALTER TABLE `blog_post_tags`
  ADD CONSTRAINT `blog_post_tags_id_post_foreign` FOREIGN KEY (`id_post`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_post_tags_id_tag_foreign` FOREIGN KEY (`id_tag`) REFERENCES `blog_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD CONSTRAINT `blog_tags_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_id_teacher_foreign` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `kantin_inventories`
--
ALTER TABLE `kantin_inventories`
  ADD CONSTRAINT `kantin_inventories_id_shop_foreign` FOREIGN KEY (`id_shop`) REFERENCES `kantin_shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kantin_payments`
--
ALTER TABLE `kantin_payments`
  ADD CONSTRAINT `kantin_payments_id_buyer_foreign` FOREIGN KEY (`id_buyer`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kantin_payments_id_inventory_foreign` FOREIGN KEY (`id_inventory`) REFERENCES `kantin_inventories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kantin_payments_id_seller_foreign` FOREIGN KEY (`id_seller`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kantin_shops`
--
ALTER TABLE `kantin_shops`
  ADD CONSTRAINT `kantin_shops_id_owner_foreign` FOREIGN KEY (`id_owner`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kesiswaan_reports`
--
ALTER TABLE `kesiswaan_reports`
  ADD CONSTRAINT `kesiswaan_reports_id_student_foreign` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `kesiswaan_reports_id_teacher_foreign` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `kesiswaan_reports_id_violation_foreign` FOREIGN KEY (`id_violation`) REFERENCES `kesiswaan_violation` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_id_class_foreign` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notes_id_teacher_foreign` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `sarpras_borrower`
--
ALTER TABLE `sarpras_borrower`
  ADD CONSTRAINT `sarpras_borrower_id_inventory_foreign` FOREIGN KEY (`id_inventory`) REFERENCES `sarpras_inventories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sarpras_borrower_id_room_foreign` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sarpras_borrower_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_id_class_foreign` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_grade`
--
ALTER TABLE `student_grade`
  ADD CONSTRAINT `student_grade_id_students_foreign` FOREIGN KEY (`id_students`) REFERENCES `students` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_grade_id_teaching_foreign` FOREIGN KEY (`id_teaching`) REFERENCES `teaching_data` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teaching_attendance`
--
ALTER TABLE `teaching_attendance`
  ADD CONSTRAINT `teaching_attendance_id_teaching_foreign` FOREIGN KEY (`id_teaching`) REFERENCES `teaching_data` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teaching_data`
--
ALTER TABLE `teaching_data`
  ADD CONSTRAINT `teaching_data_id_class_foreign` FOREIGN KEY (`id_class`) REFERENCES `class` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teaching_data_id_room_foreign` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teaching_data_id_subject_foreign` FOREIGN KEY (`id_subject`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `teaching_data_id_teacher_foreign` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD CONSTRAINT `test_questions_id_teaching_foreign` FOREIGN KEY (`id_teaching`) REFERENCES `teaching_data` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_question_items`
--
ALTER TABLE `test_question_items`
  ADD CONSTRAINT `test_question_items_id_question_foreign` FOREIGN KEY (`id_question`) REFERENCES `test_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_sessions`
--
ALTER TABLE `test_sessions`
  ADD CONSTRAINT `test_sessions_id_student_foreign` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_user`),
  ADD CONSTRAINT `test_sessions_id_token_foreign` FOREIGN KEY (`id_token`) REFERENCES `test_tokens` (`id`);

--
-- Constraints for table `test_tokens`
--
ALTER TABLE `test_tokens`
  ADD CONSTRAINT `test_tokens_id_question_foreign` FOREIGN KEY (`id_question`) REFERENCES `test_questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `test_tokens_id_student_foreign` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_foreign` FOREIGN KEY (`role`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_data`
--
ALTER TABLE `users_data`
  ADD CONSTRAINT `users_data_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_session`
--
ALTER TABLE `users_session`
  ADD CONSTRAINT `users_session_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_today_pages`
--
ALTER TABLE `user_today_pages`
  ADD CONSTRAINT `user_today_pages_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
