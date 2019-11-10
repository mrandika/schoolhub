-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 26, 2019 at 05:24 PM
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

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `uid`, `password`, `date`, `created_at`, `updated_at`) VALUES
(1, 'KAMISLOMBA', 'SEMANGAT', '2019-09-26', '2019-09-26 08:15:11', '2019-09-26 08:15:11');

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

--
-- Dumping data for table `attendance_data`
--

INSERT INTO `attendance_data` (`id`, `id_students`, `id_attendance`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 'Hadir', '2019-09-26 10:11:05', '2019-09-26 10:11:05');

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
(1, 1, 'Pemberitahuan', NULL, NULL),
(2, 1, 'Penyesuaian', NULL, NULL),
(3, 1, 'Pelaksanaan', NULL, NULL);

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

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `id_categories`, `id_user`, `has_meta`, `title`, `headline`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 'Pemberitahuan Libur Akhir Tahun', 'lorem dorem ipsum dolor.', '<p>lorem dorem ipsum dolor.&nbsp;lorem dorem ipsum dolor. lorem dorem ipsum dolor.&nbsp;lorem dorem ipsum dolor.&nbsp;<br></p>', '2019-09-26 06:33:45', '2019-09-26 06:33:45'),
(2, 1, 1, 0, 'Pemberiahuan Ujian Tengah Semester (UTS)', 'lorem dorem ipsum dolor.', '<p>lorem dorem ipsum dolor.&nbsp;lorem dorem ipsum dolor. lorem dorem ipsum dolor.&nbsp;lorem dorem ipsum dolor.&nbsp;<br></p>', '2019-09-26 06:34:27', '2019-09-26 06:34:27'),
(3, 1, 1, 0, 'Pemberitahuan Peserta Lolos Lomba', 'lorem dorem ipsum dolor. lorem dorem ipsum dolor.', '<p>lorem dorem ipsum dolor.&nbsp;lorem dorem ipsum dolor.&nbsp;<br></p>', '2019-09-26 06:35:29', '2019-09-26 06:35:29');

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
(1, 6, 'KELAS COBA', '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(2, 12, '11 RPL 1', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(3, 23, '12 RPL 2', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(4, 10, '11 RPL 3', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(5, 24, '12 RPL 4', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(6, 21, '11 RPL 5', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(7, 28, '10 RPL 6', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(8, 26, '10 RPL 7', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(9, 9, '12 RPL 8', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(10, 23, '12 RPL 9', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(11, 28, '12 RPL 10', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(12, 14, '11 RPL 11', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(13, 13, '11 RPL 12', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(14, 21, '11 RPL 13', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(15, 11, '10 RPL 14', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(16, 17, '12 RPL 15', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(17, 23, '12 RPL 16', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(18, 23, '10 RPL 17', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(19, 25, '10 RPL 18', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(20, 11, '12 RPL 19', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(21, 16, '11 RPL 20', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(22, 26, '10 RPL 21', '2019-09-26 06:01:55', '2019-09-26 06:01:55');

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
(1, 1, 'Makanan', 'makanan.png', 1000, 10, '2019-09-26 06:01:51', '2019-09-26 06:01:51'),
(2, 1, 'Minuman', 'minuman.png', 1000, 10, '2019-09-26 06:01:51', '2019-09-26 06:01:51');

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

--
-- Dumping data for table `kantin_payments`
--

INSERT INTO `kantin_payments` (`id`, `id_seller`, `id_buyer`, `id_inventory`, `qty`, `total`, `created_at`, `updated_at`) VALUES
(1, 8, 7, 1, 1, 1000, '2019-09-26 06:29:24', '2019-09-26 06:29:24'),
(2, 8, 7, 2, 1, 1000, '2019-09-26 06:29:32', '2019-09-26 06:29:32'),
(3, 8, 7, 1, 1, 1000, '2019-09-26 09:00:43', '2019-09-26 09:00:43'),
(4, 8, 7, 2, 1, 1000, '2019-09-26 10:12:46', '2019-09-26 10:12:46');

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
(1, 8, 'Warung Penjual', 'warungpenjual.png', 'Warung Penjual lorem dorem.', '2019-09-26 06:01:51', '2019-09-26 06:01:51');

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
(31, '2019_07_25_30_create_kantin_payments_table', 1);

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
(1, 'Administrator', '2019-09-26 06:01:49', '2019-09-26 06:01:49'),
(2, 'Admin Kesiswaan', '2019-09-26 06:01:49', '2019-09-26 06:01:49'),
(3, 'Admin Kurikulum', '2019-09-26 06:01:49', '2019-09-26 06:01:49'),
(4, 'Admin Sarpras', '2019-09-26 06:01:49', '2019-09-26 06:01:49'),
(5, 'Admin Kantin', '2019-09-26 06:01:49', '2019-09-26 06:01:49'),
(6, 'Guru', '2019-09-26 06:01:49', '2019-09-26 06:01:49'),
(7, 'Siswa', '2019-09-26 06:01:49', '2019-09-26 06:01:49'),
(8, 'Penjual', '2019-09-26 06:01:49', '2019-09-26 06:01:49');

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
(1, 1, 'Ruang Teori 1', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(2, 2, 'Ruang Teori 2', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(3, 3, 'Ruang Teori 3', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(4, 4, 'Ruang Teori 4', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(5, 5, 'Ruang Teori 5', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(6, 6, 'Ruang Teori 6', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(7, 7, 'Ruang Teori 7', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(8, 8, 'Ruang Teori 8', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(9, 9, 'Ruang Teori 9', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(10, 10, 'Ruang Teori 10', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(11, 1, 'Ruang Lab 1', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(12, 2, 'Ruang Lab 2', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(13, 3, 'Ruang Lab 3', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(14, 4, 'Ruang Lab 4', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(15, 5, 'Ruang Lab 5', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(16, 6, 'Ruang Lab 6', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(17, 7, 'Ruang Lab 7', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(18, 8, 'Ruang Lab 8', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(19, 9, 'Ruang Lab 9', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(20, 10, 'Ruang Lab 10', '2019-09-26 06:01:56', '2019-09-26 06:01:56');

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
(1, 7, 10, 1, 'Belum Dikembalikan', '2019-09-26 10:12:08', '2019-09-26 10:12:08');

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
(1, 'PRYK-1', 'Proyektor 1', 'proyektor.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(2, 'PRYK-2', 'Proyektor 2', 'proyektor.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(3, 'PRYK-3', 'Proyektor 3', 'proyektor.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(4, 'PRYK-4', 'Proyektor 4', 'proyektor.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(5, 'PRYK-5', 'Proyektor 5', 'proyektor.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(6, 'PRYK-6', 'Proyektor 6', 'proyektor.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(7, 'PRYK-7', 'Proyektor 7', 'proyektor.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(8, 'PRYK-8', 'Proyektor 8', 'proyektor.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(9, 'PRYK-9', 'Proyektor 9', 'proyektor.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(10, 'PRYK-10', 'Proyektor 10', 'proyektor.jpg', 'Dipinjam', '2019-09-26 06:01:56', '2019-09-26 10:12:08'),
(11, 'STPK-1', 'Stopkontak 1', 'stopkontak.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(12, 'STPK-2', 'Stopkontak 2', 'stopkontak.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(13, 'STPK-3', 'Stopkontak 3', 'stopkontak.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(14, 'STPK-4', 'Stopkontak 4', 'stopkontak.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(15, 'STPK-5', 'Stopkontak 5', 'stopkontak.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(16, 'STPK-6', 'Stopkontak 6', 'stopkontak.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(17, 'STPK-7', 'Stopkontak 7', 'stopkontak.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(18, 'STPK-8', 'Stopkontak 8', 'stopkontak.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(19, 'STPK-9', 'Stopkontak 9', 'stopkontak.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(20, 'STPK-10', 'Stopkontak 10', 'stopkontak.jpg', 'Tersedia', '2019-09-26 06:01:56', '2019-09-26 06:01:56');

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
(7, '123456789', '123456789', 1, '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(29, '611780204', '869903712', 19, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(30, '536849699', '264538706', 18, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(31, '251425962', '385358513', 13, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(32, '173888595', '940323404', 13, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(33, '150636615', '336750877', 21, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(34, '578558809', '241941905', 5, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(35, '156491929', '253336048', 14, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(36, '589503041', '413416635', 4, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(37, '814908541', '243058509', 6, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(38, '677640878', '786655976', 18, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(39, '958101588', '820848797', 8, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(40, '294968270', '185291688', 1, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(41, '723050165', '481014111', 2, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(42, '754597819', '282555838', 10, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(43, '671972331', '358811562', 15, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(44, '30534037', '749703492', 8, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(45, '882011709', '255124268', 20, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(46, '680856801', '574204104', 17, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(47, '597169337', '345085546', 15, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(48, '45450475', '855588859', 3, '2019-09-26 06:01:56', '2019-09-26 06:01:56');

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
(1, 21, 7, 'UH Mapel 6', 'Menjaga dan memelihara', 80, NULL, NULL),
(2, 22, 7, 'Keterampilan', 'Coding 12 jari', 100, NULL, NULL),
(3, 23, 7, 'Pengetahuan', 'List<> dan Array', 99, NULL, NULL);

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
(1, 'MP-1', 'Mata Pelajaran 1', 'C2', 76, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(2, 'MP-2', 'Mata Pelajaran 2', 'C3', 80, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(3, 'MP-3', 'Mata Pelajaran 3', 'C1', 78, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(4, 'MP-4', 'Mata Pelajaran 4', 'C2', 76, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(5, 'MP-5', 'Mata Pelajaran 5', 'C1', 76, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(6, 'MP-6', 'Mata Pelajaran 6', 'C1', 80, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(7, 'MP-7', 'Mata Pelajaran 7', 'C1', 75, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(8, 'MP-8', 'Mata Pelajaran 8', 'C1', 76, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(9, 'MP-9', 'Mata Pelajaran 9', 'C1', 77, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(10, 'MP-10', 'Mata Pelajaran 10', 'C3', 79, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(11, 'MP-11', 'Mata Pelajaran 11', 'C3', 77, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(12, 'MP-12', 'Mata Pelajaran 12', 'C3', 80, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(13, 'MP-13', 'Mata Pelajaran 13', 'C3', 76, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(14, 'MP-14', 'Mata Pelajaran 14', 'C1', 75, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(15, 'MP-15', 'Mata Pelajaran 15', 'C2', 75, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(16, 'MP-16', 'Mata Pelajaran 16', 'C1', 80, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(17, 'MP-17', 'Mata Pelajaran 17', 'C2', 78, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(18, 'MP-18', 'Mata Pelajaran 18', 'C1', 75, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(19, 'MP-19', 'Mata Pelajaran 19', 'C1', 77, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(20, 'MP-20', 'Mata Pelajaran 20', 'C1', 79, '2019-09-26 06:01:56', '2019-09-26 06:01:56');

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
(6, '123456789', '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(9, '508340927', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(10, '412824421', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(11, '532638974', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(12, '421884794', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(13, '104373573', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(14, '606993946', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(15, '572946959', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(16, '684344782', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(17, '368035594', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(18, '866819072', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(19, '544704519', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(20, '135336712', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(21, '627593003', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(22, '745610100', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(23, '691770732', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(24, '596406712', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(25, '310339184', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(26, '561540513', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(27, '89858195', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(28, '8551229', '2019-09-26 06:01:54', '2019-09-26 06:01:54');

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
(1, 22, 2, 11, 8, 19, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(2, 10, 5, 14, 2, 5, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(3, 19, 2, 10, 4, 18, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(4, 11, 2, 3, 16, 17, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(5, 10, 2, 12, 14, 7, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(6, 10, 4, 12, 10, 5, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(7, 21, 5, 14, 14, 3, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(8, 9, 5, 7, 18, 18, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(9, 9, 6, 20, 16, 4, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(10, 19, 4, 2, 1, 5, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(11, 21, 2, 16, 2, 18, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(12, 15, 6, 3, 13, 15, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(13, 17, 2, 12, 13, 12, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(14, 21, 6, 8, 19, 18, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(15, 21, 6, 2, 6, 15, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(16, 21, 1, 17, 9, 14, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(17, 25, 1, 17, 17, 1, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(18, 16, 4, 7, 1, 16, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(19, 20, 4, 20, 6, 9, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(20, 18, 1, 16, 20, 14, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(21, 15, 6, 1, 6, 3, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(22, 18, 1, 1, 7, 20, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(23, 15, 3, 1, 7, 17, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(24, 13, 2, 1, 5, 8, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(25, 26, 1, 1, 3, 19, '07:00:00', '12:00:00', '2019-09-26 06:01:56', '2019-09-26 06:01:56');

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
(1, 'administrator.png', 'admin@starbhak.com', 'administrator', '$2y$10$72OV6GFcHOnW7Wmoaq5k9eaS4ha2UvCRZGhIk5OASAN22edizslPG', 0, 1, NULL, NULL, '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(2, 'admin-kesiswaan.png', 'admin-kesiswaan@starbhak.com', 'adminkesiswaan', '$2y$10$/rcIXByvRgVDOYcWo0L8EevCYPQMIRJ/298iL9DeyucW9YWvzBn0.', 0, 2, NULL, NULL, '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(3, 'admin-kurikulum.png', 'admin-kurikulum@starbhak.com', 'adminkurikulum', '$2y$10$47mI1YLFY3UlLwNITtsmuuXvDP.P6gn7MAzIUV6ECOaTaYHV/D3U6', 0, 3, NULL, NULL, '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(4, 'admin-sarpras.png', 'admin-sarpras@starbhak.com', 'adminsarpras', '$2y$10$OYQu/NJ94peizGU7tk7tJOTTQCnM27vAbwcONaSmq90kzfQyP2rlq', 0, 4, NULL, NULL, '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(5, 'admin-kantin.png', 'admin-kantin@starbhak.com', 'adminkantin', '$2y$10$3gGkFI6D93ryn3cveoUk4OZ5t46lc0xAtbE7XMVE16sO/mHwe/uCK', 0, 5, NULL, NULL, '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(6, 'guru.png', 'guru@starbhak.com', 'guru', '$2y$10$Ca4OHXBSxiGN74.5zVMelOS6wbE05uT8Io9zGtTL3w/RromMkGbnG', 0, 6, NULL, NULL, '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(7, 'siswa.png', 'siswa@starbhak.com', 'siswa', '$2y$10$TQETDqBC/tCISbfqFV/VSOrXOasu8RH6XxEwiNyEFEHypP6NZX1F6', 95999, 7, NULL, NULL, '2019-09-26 06:01:50', '2019-09-26 10:12:46'),
(8, 'penjual.png', 'penjual@starbhak.com', 'penjual', '$2y$10$aMd6Pw9KMvGiLxbnZzedCeLNhdwsda45Wu2Oxi47CV6K6Q7gQr2Qy', 4000, 8, NULL, NULL, '2019-09-26 06:01:50', '2019-09-26 10:12:46'),
(9, '8_ANDIKA.png', 'oskar.usada@gmail.co.id', 'hnurdiyanti', '$2y$10$nFIurM5VDMO5dbTnfrHKNulcYmLhkcq7yV54XK461YkEk6fAu/dMG', 0, 6, NULL, NULL, '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(10, '8_ANDIKA.png', 'eriyanti@gmail.co.id', 'osuartini', '$2y$10$QKriKkB/oS2AT2Sjp0jwo.9OZFeJwZeGJhhxGIdMO9BCWDRaFpIBe', 0, 6, NULL, NULL, '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(11, '8_ANDIKA.png', 'cusada@yahoo.co.id', 'oni.sihotang', '$2y$10$kk14M43xd1a.SM6XEJpOvOOV1hny0EIeqQswLkCCeF9.Fwk7LtvOa', 0, 6, NULL, NULL, '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(12, '8_ANDIKA.png', 'puput74@damanik.com', 'karen83', '$2y$10$3weBAX7p6r.I8BDv0HvmmOR9vZiMTPBe8KphWvOuUGUKB2M77FK0u', 0, 6, NULL, NULL, '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(13, '8_ANDIKA.png', 'tamba.yosef@yahoo.co.id', 'humaira.nuraini', '$2y$10$zp5fvxBkHNnwUYmXoOzCVuE0BLH72nRlM4sO2m2D0DeUMK6.QxgoG', 0, 6, NULL, NULL, '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(14, '8_ANDIKA.png', 'ozy.winarsih@wibowo.name', 'radika75', '$2y$10$b/CLssnZ/flmqNPWZVEDueqqpit6AK5Q0N3SMUCZPaDgFhJqNjS2W', 0, 6, NULL, NULL, '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(15, '8_ANDIKA.png', 'nuraini.eman@gmail.com', 'restu.nasyiah', '$2y$10$bGQ5b3ticwMLnpW2sTlmye0QecdOi12BkWEyYq/jUnjs/zREJhMJG', 0, 6, NULL, NULL, '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(16, '8_ANDIKA.png', 'lintang00@purnawati.com', 'simbolon.mila', '$2y$10$/Lnfhm/FXHhkYfNYu688dO6jNqHTdqTa22THY5BMQPMP9VqtvV0GO', 0, 6, NULL, NULL, '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(17, '8_ANDIKA.png', 'tantri.maulana@hidayanto.desa.id', 'ramadan.irnanto', '$2y$10$ddJ6l5fmzhmlRsDTn9hJkO1XbaXNSaH8XddpPSbkMGFXz/4PjwPfm', 0, 6, NULL, NULL, '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(18, '8_ANDIKA.png', 'psuryatmi@hidayat.name', 'unjani.siregar', '$2y$10$UeRuJbv9aUdAdcWsl4D8s.Zdlu2Y7Eu4kx5iNbDPE66v0CLJZUdBq', 0, 6, NULL, NULL, '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(19, '8_ANDIKA.png', 'karimah.nuraini@yahoo.co.id', 'waluyo.sabrina', '$2y$10$7Asuq0p6hJmrVJCeBz/6lOoqTP4iRAd0BlRyQjOk9ycgMb02WEOwW', 0, 6, NULL, NULL, '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(20, '8_ANDIKA.png', 'dwi.waskita@prastuti.mil.id', 'wacana.bagya', '$2y$10$tnJvYRs74.8uGfBnH7D2T.MlZVQgHxsC3nXffzyqq9gG6BG/GocD.', 0, 6, NULL, NULL, '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(21, '8_ANDIKA.png', 'rnamaga@yahoo.co.id', 'qsaputra', '$2y$10$unT5bdpOKeGxJcMqBde6V.Vr7if/X51b082pVouxNxAc3r17rPohC', 0, 6, NULL, NULL, '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(22, '8_ANDIKA.png', 'halima58@tamba.biz.id', 'purwanti.anita', '$2y$10$S18kI6n.kQkc4vUOZ4bz5.v.5sPV6sx.82XbR2UvNjWPe7lkZvAf.', 0, 6, NULL, NULL, '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(23, '8_ANDIKA.png', 'prabowo.nadine@riyanti.web.id', 'dinda.hariyah', '$2y$10$szU1PnHDtcU4GpD3tU4/6ODqRa9vNzlewAteWzEZCSfHu6wA5GjYu', 0, 6, NULL, NULL, '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(24, '8_ANDIKA.png', 'saadat.mandala@tamba.or.id', 'nabila.melani', '$2y$10$Rarr26WhCQ7CdopagJc4Duvnd0vcRHtVLiRUJRhqMgAGvmJunyRUi', 0, 6, NULL, NULL, '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(25, '8_ANDIKA.png', 'riyanti.dodo@maryadi.asia', 'calista.prastuti', '$2y$10$hYChPezv79rPvL0vmLdh4.R04Rs8cALg9GF58Kp0mMWwx/Oh47L0G', 0, 6, NULL, NULL, '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(26, '8_ANDIKA.png', 'ppranowo@gmail.co.id', 'rina.nainggolan', '$2y$10$OxTUZFuEvZzh/wcdlPJEoOkYCEMks0reHgmaDLu23/zR/D42V6.KK', 0, 6, NULL, NULL, '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(27, '8_ANDIKA.png', 'ana.hakim@mustofa.go.id', 'wijaya.maimunah', '$2y$10$jl2K1a5lR7LWb21c84x4OeOR56J1aKbnLRgHE9N6WlQ8Mwuti8hCq', 0, 6, NULL, NULL, '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(28, '8_ANDIKA.png', 'cinta.susanti@yahoo.co.id', 'clara.pudjiastuti', '$2y$10$X3Id2ocY3c9zKA1PrAURAuejyg0RFXf91J09xcbJgbFqeS.CvIDqm', 0, 6, NULL, NULL, '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(29, '8_ANDIKA.png', 'susanti.anita@maulana.tv', 'npertiwi', '$2y$10$jFW1VyuMZD1EMzCAZlKW6Ouwrlgthspyo5d6U/iRvDvKVbDx2cV.G', 0, 7, NULL, NULL, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(30, '8_ANDIKA.png', 'manah67@gmail.co.id', 'belinda.nasyiah', '$2y$10$86NlLHHyV.QLCFx1s/BI4u3.4aTGTFiPmN1IVPBrreZO/YyB35R/u', 0, 7, NULL, NULL, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(31, '8_ANDIKA.png', 'ghakim@widodo.desa.id', 'uriyanti', '$2y$10$DkQGvrZ6/JBlYF2eWViAFu20/ub0AlbocSE19dyZnsxGqIS1VGzZq', 0, 7, NULL, NULL, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(32, '8_ANDIKA.png', 'gnugroho@yahoo.co.id', 'ifa45', '$2y$10$eXKBctKXXHEhwKxJy4WxvuVDZOj.DRzUMyoBZmWMGSNXz/GdMK9KG', 0, 7, NULL, NULL, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(33, '8_ANDIKA.png', 'tantri.safitri@suwarno.sch.id', 'esaptono', '$2y$10$V8mBZyGoSQQeS1cQh3B3QuXuX7PtZf1fyzuG0AvNAgE3nkk411MGa', 0, 7, NULL, NULL, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(34, '8_ANDIKA.png', 'hamzah.purwanti@hutapea.co', 'rahmawati.rafid', '$2y$10$FNuzzso/AueqPxWYqSmFHuW7jOzed8JZuhZO2RQSEajR88bv65qjO', 0, 7, NULL, NULL, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(35, '8_ANDIKA.png', 'qmansur@gmail.co.id', 'kayla.simbolon', '$2y$10$RkOignfRkJVUl5mXk4OWq.O2kOCfYO1uzPvahNLun3wbsjW2iFHTq', 0, 7, NULL, NULL, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(36, '8_ANDIKA.png', 'athamrin@santoso.info', 'anggraini.daliman', '$2y$10$J0zqhSdiXyVa/cEbHetCCunXHJvrh2C3Bfs7pbpChDo4XwdoObaOm', 0, 7, NULL, NULL, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(37, '8_ANDIKA.png', 'mandala.kenari@winarsih.name', 'ohartati', '$2y$10$byiT7i3hKvH.ubC2H0IYmexBf01pC2y3ky2.DOGZzTpaH.3QtjP..', 0, 7, NULL, NULL, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(38, '8_ANDIKA.png', 'ozulaika@yahoo.com', 'gabriella.natsir', '$2y$10$izEpQHfPv1TnnKnp1FB1nO9iI9ww.KWmxUl8QJ00Okf1MFuTcrmm2', 0, 7, NULL, NULL, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(39, '8_ANDIKA.png', 'permata.reksa@yahoo.co.id', 'cici06', '$2y$10$PzdympjJ0fObiFAH9QzxjeloGm3ShYWGYFsON42.oAzC.rCaxlFLy', 0, 7, NULL, NULL, '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(40, '8_ANDIKA.png', 'mandriani@sitorus.co', 'wahyudin.jagapati', '$2y$10$nBdhaGhwvj0ChSXGGKLlb.S9hda9jr7wKtImdKuVZ8YgyQmYbccoq', 0, 7, NULL, NULL, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(41, '8_ANDIKA.png', 'pangestu25@yahoo.co.id', 'qori.permata', '$2y$10$haUmZgzP1fiEgrkMVdZ4KOxShQoZ6thH0DZarXeKZ5scpHiJg6UBm', 0, 7, NULL, NULL, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(42, '8_ANDIKA.png', 'ulya.puspasari@permata.mil.id', 'mulyani.kala', '$2y$10$wpq/74B641zqn95rMwnIoe8T1I81bqqJ253tm9gmPE3YO5jOs674G', 0, 7, NULL, NULL, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(43, '8_ANDIKA.png', 'rini08@ramadan.tv', 'darimin.sihotang', '$2y$10$3BV2ptAd9sOo0okkhwA6geAkIoQhPq.KjrghhVpIhPlrg1TbVdnwC', 0, 7, NULL, NULL, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(44, '8_ANDIKA.png', 'najib.kusumo@yahoo.com', 'caraka.siregar', '$2y$10$j2Owwda62zptueJkJBfvDuhdDRBlbPgSx7zNTLy/mJKYKM9DhdKkK', 0, 7, NULL, NULL, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(45, '8_ANDIKA.png', 'ejanuar@firmansyah.net', 'teddy.waluyo', '$2y$10$Eq1W2m3l0kVZxBnPUXenxu9dbwQi0ue3Nc4zpcZ80eUnESGkk7dYW', 0, 7, NULL, NULL, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(46, '8_ANDIKA.png', 'hmelani@yahoo.com', 'cengkal84', '$2y$10$8e/7XnDZvOxIVugQKsE/3.FNvzQgfDYOuenOKYcXSkoXQI8EEZL/u', 0, 7, NULL, NULL, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(47, '8_ANDIKA.png', 'bmulyani@iswahyudi.my.id', 'mayasari.almira', '$2y$10$jirBShV6SLpFCX5TkixWdOZInDsY/g0undFp4x0h.1//LogLS5AM.', 0, 7, NULL, NULL, '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(48, '8_ANDIKA.png', 'nadia28@sihombing.mil.id', 'vwidiastuti', '$2y$10$m0IjMRrTirUEWfAEprRGnudZHowPTFvUcfUHO.FjgsdYgKSHIEIK.', 0, 7, NULL, NULL, '2019-09-26 06:01:56', '2019-09-26 06:01:56');

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
(1, 'Administrator', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(2, 'Admin Kesiswaan', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(3, 'Admin Kurikulum', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(4, 'Admin Sarpras', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(5, 'Admin Kantin', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(6, 'Guru Pengajar', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(7, 'Siswa', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(8, 'Penjual', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:50', '2019-09-26 06:01:50'),
(9, 'Purwadi Ajimat Mandala S.Pd', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(10, 'Warta Sihombing', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(11, 'Simon Marsito Narpati', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(12, 'Wira Siregar', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(13, 'Hasna Palastri S.Ked', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(14, 'Gina Kania Wastuti S.Farm', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(15, 'Maya Citra Pertiwi S.Psi', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:53', '2019-09-26 06:01:53'),
(16, 'Edward Santoso', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(17, 'Iriana Uchita Hariyah S.Sos', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(18, 'Zaenab Andriani', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(19, 'Mulyanto Anom Tampubolon', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(20, 'Gamani Gunawan', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(21, 'Almira Wani Yulianti', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(22, 'Jati Pradana', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(23, 'Perkasa Firmansyah S.E.', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(24, 'Tantri Fujiati S.Ked', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(25, 'Saadat Tasnim Tarihoran S.IP', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(26, 'Salsabila Restu Wijayanti', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(27, 'Warta Daliman Maulana', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(28, 'Joko Hidayanto M.Kom.', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:54', '2019-09-26 06:01:54'),
(29, 'Kartika Iriana Haryanti S.Farm', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(30, 'Budi Mandala', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(31, 'Olivia Haryanti', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(32, 'Garan Pranata Samosir', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(33, 'Rafi Dabukke', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(34, 'Asirwanda Prabowo', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(35, 'Maimunah Anggraini', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(36, 'Kawaya Prayoga', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(37, 'Saka Januar M.Pd', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(38, 'Tri Daliono Anggriawan S.Pt', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(39, 'Mulyanto Niyaga Pradana S.Psi', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:55', '2019-09-26 06:01:55'),
(40, 'Lalita Wulandari', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(41, 'Dono Maheswara', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(42, 'Yusuf Hendra Gunarto', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(43, 'Dariati Mandala S.Kom', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(44, 'Vinsen Situmorang', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(45, 'Atma Sihombing', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(46, 'Gatra Rajasa', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(47, 'Rizki Zulkarnain', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:56', '2019-09-26 06:01:56'),
(48, 'Novi Rahmawati', '0', '0', '0', '1970-01-01', '0', '0', '2019-09-26 06:01:56', '2019-09-26 06:01:56');

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
,`teacher` varchar(100)
,`student` varchar(100)
,`violation` mediumtext
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
,`class` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_student_grade`
-- (See below for the actual view)
--
CREATE TABLE `v_student_grade` (
`id` bigint(20) unsigned
,`students` varchar(100)
,`section` text
,`section_name` text
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
,`teacher` varchar(100)
,`day` int(11)
,`class` varchar(50)
,`subject` varchar(100)
,`time_in` time
,`time_out` time
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kantin_payments`  AS  (select `kantin_payments`.`id` AS `id`,(select `kantin_shops`.`name` from `kantin_shops` where (`kantin_shops`.`id_owner` = `kantin_payments`.`id_seller`)) AS `shop`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `kantin_payments`.`id_buyer`)) AS `customer`,(select `kantin_inventories`.`name` from `kantin_inventories` where (`kantin_inventories`.`id` = `kantin_payments`.`id_inventory`)) AS `item`,`kantin_payments`.`qty` AS `qty`,`kantin_payments`.`total` AS `total`,`kantin_payments`.`created_at` AS `created_at`,`kantin_payments`.`updated_at` AS `updated_at` from `kantin_payments`) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kesiswaan_reports`  AS  (select `kesiswaan_reports`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `kesiswaan_reports`.`id_teacher`)) AS `teacher`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `kesiswaan_reports`.`id_student`)) AS `student`,(select `kesiswaan_violation`.`name` from `kesiswaan_violation` where (`kesiswaan_violation`.`id` = `kesiswaan_reports`.`id_violation`)) AS `violation` from `kesiswaan_reports`) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sarpras_borrower`  AS  (select `sarpras_borrower`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `sarpras_borrower`.`id_user`)) AS `user`,(select `sarpras_inventories`.`name` from `sarpras_inventories` where (`sarpras_inventories`.`id` = `sarpras_borrower`.`id_inventory`)) AS `item`,(select `rooms`.`alias` from `rooms` where (`rooms`.`id` = `sarpras_borrower`.`id_room`)) AS `room`,`sarpras_borrower`.`status` AS `status` from `sarpras_borrower`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_students`
--
DROP TABLE IF EXISTS `v_students`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_students`  AS  (select `students`.`id_user` AS `id_user`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `students`.`id_user`)) AS `name`,`students`.`nipd` AS `nipd`,`students`.`nisn` AS `nisn`,(select `class`.`name` from `class` where (`class`.`id` = `students`.`id_class`)) AS `class` from `students`) ;

-- --------------------------------------------------------

--
-- Structure for view `v_student_grade`
--
DROP TABLE IF EXISTS `v_student_grade`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_student_grade`  AS  (select `student_grade`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `student_grade`.`id_students`)) AS `students`,`student_grade`.`section` AS `section`,`student_grade`.`section_name` AS `section_name`,`student_grade`.`score` AS `score` from `student_grade`) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_teaching_data`  AS  (select `teaching_data`.`id` AS `id`,(select `users_data`.`name` from `users_data` where (`users_data`.`id_user` = `teaching_data`.`id_teacher`)) AS `teacher`,`teaching_data`.`day` AS `day`,(select `class`.`name` from `class` where (`class`.`id` = `teaching_data`.`id_class`)) AS `class`,(select `subjects`.`name` from `subjects` where (`subjects`.`id` = `teaching_data`.`id_subject`)) AS `subject`,`teaching_data`.`time_in` AS `time_in`,`teaching_data`.`time_out` AS `time_out` from `teaching_data`) ;

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance_data`
--
ALTER TABLE `attendance_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kesiswaan_violation`
--
ALTER TABLE `kesiswaan_violation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sarpras_inventories`
--
ALTER TABLE `sarpras_inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `student_grade`
--
ALTER TABLE `student_grade`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
