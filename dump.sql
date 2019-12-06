-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 06, 2019 at 01:28 PM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `schoolhub`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_student` (IN `id` INT)  BEGIN
SELECT * FROM students WHERE students.id_user = id;
END$$

DELIMITER ;

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
(1, 1, 'Informasi', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(2, 1, 'Pemberitahuan', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(3, 1, 'Pengumuman', '2019-12-06 13:28:03', '2019-12-06 13:28:03');

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
(1, 6, 'KELAS COBA', '2019-12-06 13:25:28', '2019-12-06 13:25:28'),
(2, 13, '12 RPL 1', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(3, 17, '12 RPL 2', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(4, 16, '10 RPL 3', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(5, 25, '12 RPL 4', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(6, 20, '12 RPL 5', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(7, 24, '11 RPL 6', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(8, 21, '12 RPL 7', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(9, 13, '11 RPL 8', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(10, 18, '10 RPL 9', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(11, 11, '11 RPL 10', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(12, 25, '10 RPL 11', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(13, 19, '12 RPL 12', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(14, 17, '12 RPL 13', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(15, 22, '11 RPL 14', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(16, 10, '10 RPL 15', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(17, 13, '12 RPL 16', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(18, 14, '11 RPL 17', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(19, 27, '10 RPL 18', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(20, 28, '11 RPL 19', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(21, 16, '11 RPL 20', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(22, 18, '12 RPL 21', '2019-12-06 13:28:01', '2019-12-06 13:28:01');

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
(1, 1, 'Makanan', 'makanan.png', 1000, 10, '2019-12-06 13:25:30', '2019-12-06 13:25:30'),
(2, 1, 'Minuman', 'minuman.png', 1000, 10, '2019-12-06 13:25:30', '2019-12-06 13:25:30');

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
(1, 8, 'Warung Penjual', 'warungpenjual.png', 'Warung Penjual lorem dorem.', '2019-12-06 13:25:30', '2019-12-06 13:25:30');

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
(1, 6, 7, 1, 'Tervalidasi', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(2, 6, 7, 2, 'Tervalidasi', '2019-12-06 13:28:03', '2019-12-06 13:28:03');

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
(1, 'Pelanggaran Ke-1', 12, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(2, 'Pelanggaran Ke-2', 56, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(3, 'Pelanggaran Ke-3', 89, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(4, 'Pelanggaran Ke-4', 24, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(5, 'Pelanggaran Ke-5', 89, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(6, 'Pelanggaran Ke-6', 85, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(7, 'Pelanggaran Ke-7', 44, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(8, 'Pelanggaran Ke-8', 73, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(9, 'Pelanggaran Ke-9', 21, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(10, 'Pelanggaran Ke-10', 17, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(11, 'Pelanggaran Ke-11', 39, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(12, 'Pelanggaran Ke-12', 31, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(13, 'Pelanggaran Ke-13', 87, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(14, 'Pelanggaran Ke-14', 55, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(15, 'Pelanggaran Ke-15', 58, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(16, 'Pelanggaran Ke-16', 17, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(17, 'Pelanggaran Ke-17', 22, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(18, 'Pelanggaran Ke-18', 40, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(19, 'Pelanggaran Ke-19', 77, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(20, 'Pelanggaran Ke-20', 92, '2019-12-06 13:28:03', '2019-12-06 13:28:03');

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
(36, '2019_11_13_093317_create_user_today_pages_table', 1),
(37, '2019_12_06_090941_create_notifications_table', 1);

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
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('message','alert','warning') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_sender` bigint(20) UNSIGNED NOT NULL,
  `id_recepient` bigint(20) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `id_sender`, `id_recepient`, `message`, `viewed`, `created_at`, `updated_at`) VALUES
(1, 'warning', 2, 7, 'Sebuah pelanggaran atas nama anda telah terdaftar. Periksa halaman Pelanggaran Kesiswaan untuk melihat laporan ini.', 0, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(2, 'warning', 2, 7, 'Sebuah pelanggaran atas nama anda telah terdaftar. Periksa halaman Pelanggaran Kesiswaan untuk melihat laporan ini.', 0, '2019-12-06 13:28:03', '2019-12-06 13:28:03');

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
(1, 'Administrator', '2019-12-06 13:25:26', '2019-12-06 13:25:26'),
(2, 'Admin Kesiswaan', '2019-12-06 13:25:26', '2019-12-06 13:25:26'),
(3, 'Admin Kurikulum', '2019-12-06 13:25:26', '2019-12-06 13:25:26'),
(4, 'Admin Sarpras', '2019-12-06 13:25:26', '2019-12-06 13:25:26'),
(5, 'Admin Kantin', '2019-12-06 13:25:26', '2019-12-06 13:25:26'),
(6, 'Guru', '2019-12-06 13:25:26', '2019-12-06 13:25:26'),
(7, 'Siswa', '2019-12-06 13:25:26', '2019-12-06 13:25:26'),
(8, 'Penjual', '2019-12-06 13:25:26', '2019-12-06 13:25:26');

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
(1, 1, 'Ruang Teori 1', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(2, 2, 'Ruang Teori 2', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(3, 3, 'Ruang Teori 3', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(4, 4, 'Ruang Teori 4', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(5, 5, 'Ruang Teori 5', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(6, 6, 'Ruang Teori 6', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(7, 7, 'Ruang Teori 7', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(8, 8, 'Ruang Teori 8', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(9, 9, 'Ruang Teori 9', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(10, 10, 'Ruang Teori 10', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(11, 1, 'Ruang Lab 1', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(12, 2, 'Ruang Lab 2', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(13, 3, 'Ruang Lab 3', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(14, 4, 'Ruang Lab 4', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(15, 5, 'Ruang Lab 5', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(16, 6, 'Ruang Lab 6', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(17, 7, 'Ruang Lab 7', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(18, 8, 'Ruang Lab 8', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(19, 9, 'Ruang Lab 9', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(20, 10, 'Ruang Lab 10', '2019-12-06 13:28:02', '2019-12-06 13:28:02');

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
(1, 7, 1, 1, 'Belum Dikembalikan', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(2, 7, 2, 1, 'Belum Dikembalikan', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(3, 7, 3, 1, 'Belum Dikembalikan', '2019-12-06 13:28:03', '2019-12-06 13:28:03');

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
(1, 'PRYK-1', 'Proyektor 1', 'proyektor.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(2, 'PRYK-2', 'Proyektor 2', 'proyektor.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(3, 'PRYK-3', 'Proyektor 3', 'proyektor.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(4, 'PRYK-4', 'Proyektor 4', 'proyektor.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(5, 'PRYK-5', 'Proyektor 5', 'proyektor.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(6, 'PRYK-6', 'Proyektor 6', 'proyektor.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(7, 'PRYK-7', 'Proyektor 7', 'proyektor.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(8, 'PRYK-8', 'Proyektor 8', 'proyektor.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(9, 'PRYK-9', 'Proyektor 9', 'proyektor.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(10, 'PRYK-10', 'Proyektor 10', 'proyektor.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(11, 'STPK-1', 'Stopkontak 1', 'stopkontak.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(12, 'STPK-2', 'Stopkontak 2', 'stopkontak.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(13, 'STPK-3', 'Stopkontak 3', 'stopkontak.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(14, 'STPK-4', 'Stopkontak 4', 'stopkontak.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(15, 'STPK-5', 'Stopkontak 5', 'stopkontak.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(16, 'STPK-6', 'Stopkontak 6', 'stopkontak.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(17, 'STPK-7', 'Stopkontak 7', 'stopkontak.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(18, 'STPK-8', 'Stopkontak 8', 'stopkontak.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(19, 'STPK-9', 'Stopkontak 9', 'stopkontak.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(20, 'STPK-10', 'Stopkontak 10', 'stopkontak.jpg', 'Tersedia', '2019-12-06 13:28:03', '2019-12-06 13:28:03');

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
(7, '123456789', '123456789', 1, '2019-12-06 13:25:28', '2019-12-06 13:25:28'),
(29, '553003988', '179662900', 2, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(30, '320986663', '343292257', 11, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(31, '882593934', '618434499', 14, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(32, '237218372', '918480540', 17, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(33, '685417625', '362497213', 21, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(34, '322680822', '161810098', 11, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(35, '428262239', '728334396', 14, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(36, '250486644', '222455737', 10, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(37, '38523581', '509851939', 19, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(38, '416584700', '921954435', 17, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(39, '484415063', '314940869', 14, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(40, '476578044', '39286859', 17, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(41, '596778578', '283937863', 15, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(42, '743753866', '503893890', 4, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(43, '808664518', '430110465', 11, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(44, '861754140', '225087125', 1, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(45, '36023527', '393102358', 17, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(46, '359951876', '488596707', 21, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(47, '18723619', '188821495', 16, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(48, '943824676', '942409503', 2, '2019-12-06 13:28:02', '2019-12-06 13:28:02');

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
(1, 1, 7, '3.1', 'Pengenalan Database', 80, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(2, 1, 7, '3.2', 'Database Tingkat Lanjut', 78, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(3, 1, 7, '3.3', 'Penerapan Database', 80, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(4, 1, 7, '3.4', 'Database dan PHP', 70, '2019-12-06 13:28:03', '2019-12-06 13:28:03');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('N','L','C','C1','C2','C3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `code`, `name`, `type`, `minimum`, `created_at`, `updated_at`) VALUES
(1, 'MP-1', 'Mata Pelajaran 1', 'C3', 80, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(2, 'MP-2', 'Mata Pelajaran 2', 'C1', 78, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(3, 'MP-3', 'Mata Pelajaran 3', 'C2', 80, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(4, 'MP-4', 'Mata Pelajaran 4', 'C3', 78, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(5, 'MP-5', 'Mata Pelajaran 5', 'C3', 79, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(6, 'MP-6', 'Mata Pelajaran 6', 'C3', 76, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(7, 'MP-7', 'Mata Pelajaran 7', 'C1', 79, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(8, 'MP-8', 'Mata Pelajaran 8', 'C3', 76, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(9, 'MP-9', 'Mata Pelajaran 9', 'C2', 80, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(10, 'MP-10', 'Mata Pelajaran 10', 'C2', 76, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(11, 'MP-11', 'Mata Pelajaran 11', 'C2', 76, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(12, 'MP-12', 'Mata Pelajaran 12', 'C1', 78, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(13, 'MP-13', 'Mata Pelajaran 13', 'C3', 78, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(14, 'MP-14', 'Mata Pelajaran 14', 'C3', 76, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(15, 'MP-15', 'Mata Pelajaran 15', 'C2', 75, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(16, 'MP-16', 'Mata Pelajaran 16', 'C1', 79, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(17, 'MP-17', 'Mata Pelajaran 17', 'C2', 79, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(18, 'MP-18', 'Mata Pelajaran 18', 'C2', 77, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(19, 'MP-19', 'Mata Pelajaran 19', 'C3', 76, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(20, 'MP-20', 'Mata Pelajaran 20', 'C1', 75, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(21, 'MP-21-1', 'Mata Pelajaran 21-1', 'N', 80, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(22, 'MP-21-2', 'Mata Pelajaran 21-2', 'N', 76, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(23, 'MP-21-3', 'Mata Pelajaran 21-3', 'N', 75, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(24, 'MP-21-4', 'Mata Pelajaran 21-4', 'N', 77, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(25, 'MP-21-5', 'Mata Pelajaran 21-5', 'N', 79, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(26, 'MP-21-6', 'Mata Pelajaran 21-6', 'N', 79, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(27, 'MP-21-7', 'Mata Pelajaran 21-7', 'N', 77, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(28, 'MP-21-8', 'Mata Pelajaran 21-8', 'N', 78, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(29, 'MP-21-9', 'Mata Pelajaran 21-9', 'N', 75, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(30, 'MP-21-10', 'Mata Pelajaran 21-10', 'N', 78, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(31, 'MP-21-1', 'Mata Pelajaran 21-1', 'L', 75, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(32, 'MP-21-2', 'Mata Pelajaran 21-2', 'L', 79, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(33, 'MP-21-3', 'Mata Pelajaran 21-3', 'L', 80, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(34, 'MP-21-4', 'Mata Pelajaran 21-4', 'L', 75, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(35, 'MP-21-5', 'Mata Pelajaran 21-5', 'L', 80, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(36, 'MP-21-6', 'Mata Pelajaran 21-6', 'L', 80, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(37, 'MP-21-7', 'Mata Pelajaran 21-7', 'L', 78, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(38, 'MP-21-8', 'Mata Pelajaran 21-8', 'L', 80, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(39, 'MP-21-9', 'Mata Pelajaran 21-9', 'L', 75, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(40, 'MP-21-10', 'Mata Pelajaran 21-10', 'L', 76, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(41, 'MP-21-1', 'Mata Pelajaran 21-1', 'C', 78, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(42, 'MP-21-2', 'Mata Pelajaran 21-2', 'C', 78, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(43, 'MP-21-3', 'Mata Pelajaran 21-3', 'C', 76, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(44, 'MP-21-4', 'Mata Pelajaran 21-4', 'C', 80, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(45, 'MP-21-5', 'Mata Pelajaran 21-5', 'C', 76, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(46, 'MP-21-6', 'Mata Pelajaran 21-6', 'C', 75, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(47, 'MP-21-7', 'Mata Pelajaran 21-7', 'C', 76, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(48, 'MP-21-8', 'Mata Pelajaran 21-8', 'C', 75, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(49, 'MP-21-9', 'Mata Pelajaran 21-9', 'C', 78, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(50, 'MP-21-10', 'Mata Pelajaran 21-10', 'C', 79, '2019-12-06 13:28:02', '2019-12-06 13:28:02');

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
(6, '123456789', '2019-12-06 13:25:28', '2019-12-06 13:25:28'),
(9, '270021959', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(10, '214396100', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(11, '974417115', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(12, '419731997', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(13, '950095912', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(14, '453201007', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(15, '631592998', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(16, '298931602', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(17, '630605213', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(18, '973583442', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(19, '922652286', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(20, '989509398', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(21, '325742931', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(22, '171479034', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(23, '546989678', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(24, '941578962', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(25, '650737320', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(26, '53193833', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(27, '890128519', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(28, '606396246', '2019-12-06 13:28:01', '2019-12-06 13:28:01');

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
(1, 11, 3, 14, 5, 12, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(2, 10, 6, 8, 10, 16, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(3, 21, 5, 4, 5, 13, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(4, 19, 3, 7, 8, 5, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(5, 24, 3, 18, 16, 20, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(6, 12, 5, 6, 15, 17, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(7, 12, 6, 8, 19, 17, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(8, 22, 5, 3, 16, 16, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(9, 14, 2, 3, 2, 6, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(10, 26, 2, 17, 9, 9, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(11, 22, 5, 9, 13, 5, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(12, 22, 3, 17, 5, 12, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(13, 20, 4, 9, 16, 18, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(14, 13, 6, 18, 15, 1, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(15, 12, 5, 20, 12, 12, '07:00:00', '12:00:00', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(16, 10, 4, 13, 20, 5, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(17, 19, 4, 7, 19, 18, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(18, 18, 1, 13, 2, 15, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(19, 25, 1, 18, 14, 12, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(20, 26, 2, 1, 13, 13, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(21, 18, 4, 1, 15, 11, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(22, 14, 1, 1, 20, 17, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(23, 18, 4, 1, 9, 20, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(24, 17, 3, 1, 3, 18, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(25, 22, 3, 1, 16, 13, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(26, 6, 2, 1, 9, 20, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(27, 6, 2, 1, 13, 1, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(28, 6, 6, 1, 17, 12, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(29, 6, 6, 1, 18, 16, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(30, 6, 5, 1, 15, 3, '07:00:00', '12:00:00', '2019-12-06 13:28:03', '2019-12-06 13:28:03');

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
(1, 1, '3.1', '[UH] Pengenalan Database', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(2, 1, '3.2', '[UH] Database Tingkat Lanjut', '2019-12-06 13:28:03', '2019-12-06 13:28:03');

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
(1, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(2, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(3, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(4, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(5, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(6, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(7, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(8, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(9, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(10, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(11, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(12, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(13, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(14, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(15, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(16, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(17, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(18, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(19, 1, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(20, 2, 'Ini adalah contoh soal ulangan, value 1 adalah jawaban benar!', '[{\"id\":1,\"text\":\"Benar\"},{\"id\":2,\"text\":\"Salah\"},{\"id\":3,\"text\":\"Salah\"},{\"id\":4,\"text\":\"Salah\"},{\"id\":5,\"text\":\"Salah\"}]', 1, '2019-12-06 13:28:03', '2019-12-06 13:28:03');

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
(1, 1, 7, '123456789-PGNLNDB', '2019-12-06 13:28:03', '2019-12-06 13:28:03'),
(2, 2, 7, '123456789-DBTGTLNJT', '2019-12-06 13:28:03', '2019-12-06 13:28:03');

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
(1, 'administrator.png', 'admin@starbhak.com', 'administrator', '$2y$10$rNbTv2sSHlnw/gOU4jh5m.vUEYv9RIIXKgwEnRH3LBaCcAOpasJ8q', 0, 1, NULL, NULL, '2019-12-06 13:25:26', '2019-12-06 13:25:26'),
(2, 'admin-kesiswaan.png', 'admin-kesiswaan@starbhak.com', 'adminkesiswaan', '$2y$10$Dds6rKg2seUZ7j3WAkG/LOoZ1lLtnVppB1iiP3xpsznRlIRK57BzS', 0, 2, NULL, NULL, '2019-12-06 13:25:26', '2019-12-06 13:25:26'),
(3, 'admin-kurikulum.png', 'admin-kurikulum@starbhak.com', 'adminkurikulum', '$2y$10$0c.9ICAb15IUxMYrNDZ2OOhg1aKVouN5LkssOJuf.MSHx0grDWjFa', 0, 3, NULL, NULL, '2019-12-06 13:25:27', '2019-12-06 13:25:27'),
(4, 'admin-sarpras.png', 'admin-sarpras@starbhak.com', 'adminsarpras', '$2y$10$qz83bkveASL9mrAHnUCBr.hfWrDVqHJhTUn/Fqhpp9whDxczmc9Ie', 0, 4, NULL, NULL, '2019-12-06 13:25:27', '2019-12-06 13:25:27'),
(5, 'admin-kantin.png', 'admin-kantin@starbhak.com', 'adminkantin', '$2y$10$R3HT0eSkLPAHUq6dMcxw4eriH4LJIkQctkV9SlmBf/yHv5ouPVQvC', 100000, 5, NULL, NULL, '2019-12-06 13:25:27', '2019-12-06 13:25:27'),
(6, 'guru.png', 'guru@starbhak.com', 'guru', '$2y$10$NS2hHrRI9YFhhXeOxdoVGOlLYhRyyxsYGTZ9yJ4krJSe8JsW/uRZO', 0, 6, NULL, NULL, '2019-12-06 13:25:27', '2019-12-06 13:25:27'),
(7, 'siswa.png', 'siswa@starbhak.com', 'siswa', '$2y$10$Wyz/2oZjCQ72XQXRqXvbxu7I2c.3aBdbFJKOeOnSQKCAmXHZ7ML52', 10000, 7, NULL, NULL, '2019-12-06 13:25:27', '2019-12-06 13:25:27'),
(8, 'penjual.png', 'penjual@starbhak.com', 'penjual', '$2y$10$v7E1muDN4zDHq2NvldEUY.k9pxVZ/w.m..rvwK.EIqwYuL7aGp2Su', 10000, 8, NULL, NULL, '2019-12-06 13:25:27', '2019-12-06 13:25:27'),
(9, '8_ANDIKA.png', 'qori47@yahoo.co.id', 'tamba.yulia', '$2y$10$Cq1s443PJreA7aSmcdorwu0pj/ubkY7VB.WaPfEJJapfjBBjkgS0a', 0, 6, NULL, NULL, '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(10, '8_ANDIKA.png', 'maimunah.januar@yahoo.com', 'samiah.hutasoit', '$2y$10$4jJh4xzAW6EWJ2f0bDmZ.ezgRJVh9rWX4DF8nJe2C.c49z66XkkrS', 0, 6, NULL, NULL, '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(11, '8_ANDIKA.png', 'wijaya.vanya@yahoo.com', 'mpalastri', '$2y$10$wEWAsVL1y1BrARpyCl17buLCAkN/2U16bO1g8AsUdacUiibJAf3Im', 0, 6, NULL, NULL, '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(12, '8_ANDIKA.png', 'salimah54@yahoo.co.id', 'pfirmansyah', '$2y$10$ePPYqFrX2VFSO9qA.usoIOauPIkWZulXYa2b4HG/6AjAMkr3zlpRK', 0, 6, NULL, NULL, '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(13, '8_ANDIKA.png', 'kania.latupono@yahoo.com', 'nuraini.titin', '$2y$10$O1xQGWXDEkgF5q2.mALc1uV7rF1FMJSpzOQTBpST6yoLE5J3QRLdW', 0, 6, NULL, NULL, '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(14, '8_ANDIKA.png', 'sari.marpaung@namaga.in', 'jaya82', '$2y$10$DGizD/CI4i/BA3X9QrG93OUxbZIHLQYNV/YsCOx.Sn.1up8kmJjHC', 0, 6, NULL, NULL, '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(15, '8_ANDIKA.png', 'blaksita@yahoo.com', 'yulia87', '$2y$10$/4HpNLBhX/VjefdAdNn8Cuq0hCr7SwMVsa9EMXzChb.8qfGO/gUvi', 0, 6, NULL, NULL, '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(16, '8_ANDIKA.png', 'jtampubolon@yahoo.co.id', 'suryono.luluh', '$2y$10$m41CIo.AsH6Cwr0iLomba.shLLop1UlpEu051LjXxZQZJqX54q0hO', 0, 6, NULL, NULL, '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(17, '8_ANDIKA.png', 'diah86@mulyani.ac.id', 'widiastuti.gasti', '$2y$10$XHC7RkUtkPeuHuZI35PXYOpA9fIKJP5QcIaAsFr.ucElxEqcm8ztW', 0, 6, NULL, NULL, '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(18, '8_ANDIKA.png', 'fpranowo@gmail.co.id', 'rika62', '$2y$10$/bLJA/nq7Nv62FmH0YG/3uHYRxWpEXt601GqU9b4rXI4Hn77W3w06', 0, 6, NULL, NULL, '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(19, '8_ANDIKA.png', 'padmi20@laksita.my.id', 'xnuraini', '$2y$10$OkUlrwinQ9YoJ970uFnK7uTSavFJrmp94TCycibl5c69d/eB3Q/7C', 0, 6, NULL, NULL, '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(20, '8_ANDIKA.png', 'malika.ardianto@hassanah.ac.id', 'cici78', '$2y$10$vs3A94xmJpoknzMaZQDjW.AFOoat2r7j37q.Bkbe/kpuXpXCgYBNW', 0, 6, NULL, NULL, '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(21, '8_ANDIKA.png', 'waluyo.betania@gunawan.name', 'kariman.pudjiastuti', '$2y$10$QF8QQljm/bDj50vRjFIH4uOG4uZUrr7bM0yMQ.zlqkN7DajrFYyiO', 0, 6, NULL, NULL, '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(22, '8_ANDIKA.png', 'maida70@gmail.co.id', 'ppurnawati', '$2y$10$EqEw8vZcjPPOk3ADfC.OW.sE.LKaSmegZUwHt.PzZA2C13oiMRP1G', 0, 6, NULL, NULL, '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(23, '8_ANDIKA.png', 'maulana.michelle@gmail.co.id', 'wakiman.prasasta', '$2y$10$D/xVR4Goy56yZ8PX6qftm.vgFQ7i5imfQArIfDTLVJ8nhPj026dfK', 0, 6, NULL, NULL, '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(24, '8_ANDIKA.png', 'rahman67@yahoo.co.id', 'utami.sari', '$2y$10$sLcb8I7gfdWeeOoHGuNMe.rT24XhwDOdQkVGTt3xGQ/4M7x63O01u', 0, 6, NULL, NULL, '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(25, '8_ANDIKA.png', 'elisa49@gmail.co.id', 'garang51', '$2y$10$oNCACscBK7393ONlxYrB6.7uyY7R4UvEs29RGzpkV7MgYE9oIdnHW', 0, 6, NULL, NULL, '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(26, '8_ANDIKA.png', 'yuliarti.kacung@yahoo.com', 'paramita.tamba', '$2y$10$4tb2yS0Yq/wAsYLjNexUMO0thLlBY1Flf2ZuW0YZRZPcTdb/cht5G', 0, 6, NULL, NULL, '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(27, '8_ANDIKA.png', 'mrajata@gmail.co.id', 'raina09', '$2y$10$rwWCfP3ga0SpkOqeRh6hSO7bO/8DfLWvyvYOQnZhGFs4ukkCfM6Ka', 0, 6, NULL, NULL, '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(28, '8_ANDIKA.png', 'marwata.handayani@gmail.co.id', 'oman40', '$2y$10$N6ctvhn0tgYj7oQO4x1rhepPIRL.3vf3lMIKmjTuoY7xaSsHxApJa', 0, 6, NULL, NULL, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(29, '8_ANDIKA.png', 'lala.napitupulu@utami.or.id', 'bakiadi.yulianti', '$2y$10$xoYwwdB3npQ06c0P38KX.uiusVr6rkdx5omPsavMeK5fdNwenG0qS', 0, 7, NULL, NULL, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(30, '8_ANDIKA.png', 'starihoran@wahyuni.biz.id', 'mpertiwi', '$2y$10$VP5b35fwYthqMevW9gitU.flKrSK4lhes4Hwi.k8Rtzs77keHze3C', 0, 7, NULL, NULL, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(31, '8_ANDIKA.png', 'haryanti.maida@gmail.com', 'cakrabirawa15', '$2y$10$y9Rn2pbSpo4tOEF0GrMQteVarcSW5cMggB2qW5jiwfKBkXDJ6lMh2', 0, 7, NULL, NULL, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(32, '8_ANDIKA.png', 'dabukke.eka@prastuti.ac.id', 'humaira.suartini', '$2y$10$N62424H5ci3oxSiTOjqnreLuLsDDkfaQl8/qBUX0zXk1eY2T.XLEy', 0, 7, NULL, NULL, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(33, '8_ANDIKA.png', 'patricia82@gmail.com', 'wpertiwi', '$2y$10$qsqCLQLRY.TpFgphl/aPueX9Xq3UUtc/6Ceap5c3PvLBk0fcemlmK', 0, 7, NULL, NULL, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(34, '8_ANDIKA.png', 'winarsih.karen@sitompul.web.id', 'endah.widiastuti', '$2y$10$vtdKO4Y.LYkT2QCMKIzIG.7PaOzVPGcGmkam1P02U6RYeD4z40eEW', 0, 7, NULL, NULL, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(35, '8_ANDIKA.png', 'rahmawati.yuni@simbolon.sch.id', 'ika.pradipta', '$2y$10$FPtphHzutfx1PQes1rR98.lP44xEOp7Zlfr0O06L6vcQX.PJKRg3K', 0, 7, NULL, NULL, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(36, '8_ANDIKA.png', 'balangga04@purwanti.co', 'kuswandari.salsabila', '$2y$10$jX0q/i6QRfWTXCf5wd1AJeEfZmWELSnIWU6hJejMYBEhlFPBtF2Qq', 0, 7, NULL, NULL, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(37, '8_ANDIKA.png', 'oni63@gmail.com', 'zmaryadi', '$2y$10$m64KRWZfAWXdYZduHK9P9OWpAOdNRUnvTYuGsWZ/0SNWAXs/auhSq', 0, 7, NULL, NULL, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(38, '8_ANDIKA.png', 'ciaobella17@gmail.com', 'adriansyah.genta', '$2y$10$UgmrwhBrptd5pp69QboYeejAMal3cGBOhNhyHyeQ6sS9izei2ZGD2', 0, 7, NULL, NULL, '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(39, '8_ANDIKA.png', 'padma.siregar@yahoo.com', 'cici.susanti', '$2y$10$nGHyz6sjXknrcif7ImN44.zKaH9cVqvRvD3D24qPAUoNXp/xJC5FG', 0, 7, NULL, NULL, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(40, '8_ANDIKA.png', 'laksmiwati.ratih@yahoo.co.id', 'gprastuti', '$2y$10$3WHIGpUmdkD80sviVSl.euEIqMV3RiKnHNG6pkjTB7Dj4rFqn3hH.', 0, 7, NULL, NULL, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(41, '8_ANDIKA.png', 'rhassanah@yahoo.co.id', 'prayitna.mandasari', '$2y$10$xk/QmW5B84GN9DvxizwZjOZIefApVWNsLBxDBEYxT5tPSMy/.lKpC', 0, 7, NULL, NULL, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(42, '8_ANDIKA.png', 'esalahudin@gmail.co.id', 'dsaptono', '$2y$10$0ZhEgE8HGx/vdzbdrPPi..FrqtZIQnNUkVNinGDgxOoU5LKuwIV3m', 0, 7, NULL, NULL, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(43, '8_ANDIKA.png', 'novi.hariyah@yahoo.com', 'onasyidah', '$2y$10$JbEUtFLmUv0U9xvUfb1oXuAj2tP2ZBy5rCRANZrN90ISZPUNSjz8a', 0, 7, NULL, NULL, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(44, '8_ANDIKA.png', 'simanjuntak.luluh@yahoo.co.id', 'wasita.septi', '$2y$10$V8.oKOLEdGs/AhRl0Dix9OzElqX7zLgk35Ds3l5eMYC9z.pmDKV8S', 0, 7, NULL, NULL, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(45, '8_ANDIKA.png', 'luis93@hartati.my.id', 'kharyanti', '$2y$10$54MWpembPHPx2Y31hqRDyuVxKLz3nWRZEA2HC7mGsPBQvL/kOVLCa', 0, 7, NULL, NULL, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(46, '8_ANDIKA.png', 'harjaya73@yahoo.co.id', 'cahyo.firmansyah', '$2y$10$6QZlzKHRWyskjHBUPFjzxerLfCQVmWdpfdolM6Mf3Ol266IwXjIle', 0, 7, NULL, NULL, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(47, '8_ANDIKA.png', 'nsihotang@gmail.co.id', 'julia58', '$2y$10$J7MGu4I/5YPz8Nn1dbMmuuVJp7vAWYVLnAdzZnD0Ut5lSDEILMAYa', 0, 7, NULL, NULL, '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(48, '8_ANDIKA.png', 'fagustina@siregar.org', 'tpudjiastuti', '$2y$10$qbpz.x0ZzJWEcv73eUwO8.s.g1mCiib2mtNZYeGVbV.ksV.ueriAq', 0, 7, NULL, NULL, '2019-12-06 13:28:02', '2019-12-06 13:28:02');

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
(1, 'Administrator', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:25:28', '2019-12-06 13:25:28'),
(2, 'Admin Kesiswaan', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:25:28', '2019-12-06 13:25:28'),
(3, 'Admin Kurikulum', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:25:28', '2019-12-06 13:25:28'),
(4, 'Admin Sarpras', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:25:28', '2019-12-06 13:25:28'),
(5, 'Admin Kantin', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:25:28', '2019-12-06 13:25:28'),
(6, 'Guru Pengajar', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:25:28', '2019-12-06 13:25:28'),
(7, 'Siswa', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:25:28', '2019-12-06 13:25:28'),
(8, 'Penjual', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:25:28', '2019-12-06 13:25:28'),
(9, 'Galur Galih Januar', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(10, 'Koko Sihombing', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(11, 'Ghaliyati Julia Lailasari', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(12, 'Kartika Wulandari', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(13, 'Tira Astuti', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(14, 'Yosef Saptono', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(15, 'Dirja Hairyanto Mahendra S.Pt', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:27:59', '2019-12-06 13:27:59'),
(16, 'Ani Nuraini', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(17, 'Wakiman Cager Suwarno M.Kom.', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(18, 'Rahayu Purwanti', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(19, 'Raisa Nurdiyanti S.Kom', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(20, 'Jarwa Prabowo', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(21, 'Raina Yuliarti S.Sos', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(22, 'Abyasa Pradana S.Gz', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(23, 'Amelia Mandasari', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(24, 'Elisa Zahra Oktaviani', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(25, 'Oskar Manullang', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(26, 'Nasim Marpaung', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(27, 'Kartika Yance Yuniar', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:00', '2019-12-06 13:28:00'),
(28, 'Indah Widiastuti', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(29, 'Tasnim Jumari Waskita', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(30, 'Kardi Suwarno', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(31, 'Rosman Waluyo', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(32, 'Wadi Kuswoyo S.Gz', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(33, 'Hesti Novitasari M.TI.', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(34, 'Shania Maryati S.T.', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(35, 'Ida Wijayanti', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(36, 'Mutia Hastuti S.H.', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(37, 'Halima Fujiati M.Farm', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(38, 'Lintang Eli Wulandari', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:01', '2019-12-06 13:28:01'),
(39, 'Harsaya Sirait', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(40, 'Pranawa Marsito Gunarto', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(41, 'Bambang Uwais', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(42, 'Halima Safitri', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(43, 'Dono Adiarja Maulana', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(44, 'Talia Mandasari M.Kom.', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(45, 'Pia Wulandari', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(46, 'Wadi Simanjuntak', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(47, 'Maryanto Harto Pradipta', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:02', '2019-12-06 13:28:02'),
(48, 'Ajimin Damanik', '0', '0', '0', '1970-01-01', '0', '0', '2019-12-06 13:28:02', '2019-12-06 13:28:02');

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_id_sender_foreign` (`id_sender`),
  ADD KEY `notifications_id_recepient_foreign` (`id_recepient`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_id_recepient_foreign` FOREIGN KEY (`id_recepient`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_id_sender_foreign` FOREIGN KEY (`id_sender`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `test_sessions_id_student_foreign` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `test_sessions_id_token_foreign` FOREIGN KEY (`id_token`) REFERENCES `test_tokens` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `user_today_pages_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;
