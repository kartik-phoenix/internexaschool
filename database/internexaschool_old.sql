-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 29, 2023 at 03:49 PM
-- Server version: 8.0.34-0ubuntu0.22.04.1
-- PHP Version: 8.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `internexaschool`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_calendars`
--

CREATE TABLE `academic_calendars` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_id` bigint UNSIGNED DEFAULT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `description`, `table_type`, `table_id`, `session_year_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 'test', '', NULL, 1, '2023-08-25 06:14:44', '2023-08-28 03:57:49', '2023-08-28 03:57:49'),
(2, 'Rakshabandhan', 'we have a holiday at rakshabandhan date: 30-08-2023.', '', NULL, 1, '2023-08-28 03:40:55', '2023-08-28 03:57:47', '2023-08-28 03:57:47'),
(3, 'Rakshabandhan', 'we have a holiday at rakshabandhan date: 30-08-2023.', '', NULL, 1, '2023-08-28 03:58:06', '2023-08-28 03:58:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint UNSIGNED NOT NULL,
  `class_section_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_date` datetime NOT NULL,
  `points` int DEFAULT NULL,
  `resubmission` tinyint(1) NOT NULL DEFAULT '0',
  `extra_days_for_resubmission` int DEFAULT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submissions`
--

CREATE TABLE `assignment_submissions` (
  `id` bigint UNSIGNED NOT NULL,
  `assignment_id` int NOT NULL,
  `student_id` int NOT NULL,
  `session_year_id` int NOT NULL,
  `feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `points` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 = Pending/In Review , 1 = Accepted , 2 = Rejected , 3 = Resubmitted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `class_section_id` int NOT NULL,
  `student_id` int NOT NULL,
  `session_year_id` int NOT NULL,
  `type` tinyint NOT NULL COMMENT '0=Absent, 1=Present',
  `date` date NOT NULL,
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SC', 1, '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(2, 'ST', 1, '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(3, 'OBC', 1, '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(4, 'General', 1, '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `medium_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '9', 2, '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(2, '10', 2, '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(3, 'Gujrati', 3, '2023-08-25 06:02:11', '2023-08-25 06:02:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_sections`
--

CREATE TABLE `class_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` int NOT NULL,
  `section_id` int NOT NULL,
  `class_teacher_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_sections`
--

INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `class_teacher_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(2, 1, 2, NULL, '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(3, 2, 1, NULL, '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(4, 2, 2, NULL, '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(5, 2, 3, NULL, '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(6, 3, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects`
--

CREATE TABLE `class_subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` int NOT NULL,
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Compulsory / Elective',
  `subject_id` int NOT NULL,
  `elective_subject_group_id` int DEFAULT NULL COMMENT 'if type=Elective',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_subjects`
--

INSERT INTO `class_subjects` (`id`, `class_id`, `type`, `subject_id`, `elective_subject_group_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 'Compulsory', 9, NULL, NULL, NULL, NULL),
(2, 3, 'Compulsory', 9, NULL, NULL, NULL, NULL),
(3, 3, 'Elective', 9, 1, NULL, NULL, NULL),
(4, 3, 'Elective', 9, 1, NULL, NULL, NULL),
(5, 2, 'Compulsory', 2, NULL, NULL, NULL, NULL),
(6, 2, 'Compulsory', 8, NULL, NULL, NULL, NULL),
(7, 2, 'Compulsory', 2, NULL, NULL, NULL, NULL),
(8, 2, 'Elective', 2, 2, NULL, NULL, NULL),
(9, 2, 'Elective', 4, 2, NULL, NULL, NULL),
(10, 2, 'Compulsory', 6, NULL, NULL, NULL, NULL),
(11, 2, 'Compulsory', 4, NULL, NULL, NULL, NULL),
(12, 2, 'Compulsory', 4, NULL, NULL, NULL, NULL),
(13, 2, 'Elective', 2, 3, NULL, NULL, NULL),
(14, 2, 'Elective', 7, 3, NULL, NULL, NULL),
(15, 1, 'Compulsory', 2, NULL, NULL, NULL, NULL),
(16, 1, 'Compulsory', 1, NULL, NULL, NULL, NULL),
(17, 1, 'Compulsory', 4, NULL, NULL, NULL, NULL),
(18, 1, 'Elective', 1, 4, NULL, NULL, NULL),
(19, 1, 'Elective', 2, 4, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `elective_subject_groups`
--

CREATE TABLE `elective_subject_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `total_subjects` int NOT NULL,
  `total_selectable_subjects` int NOT NULL,
  `class_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `elective_subject_groups`
--

INSERT INTO `elective_subject_groups` (`id`, `total_subjects`, `total_selectable_subjects`, `class_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 3, '2023-08-25 06:19:30', '2023-08-25 06:19:30', NULL),
(2, 2, 1, 2, '2023-08-25 06:19:52', '2023-08-25 06:19:52', NULL),
(3, 2, 1, 2, '2023-08-25 06:20:22', '2023-08-25 06:20:22', NULL),
(4, 2, 1, 1, '2023-08-28 05:44:47', '2023-08-28 05:44:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_year_id` int NOT NULL,
  `publish` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_classes`
--

CREATE TABLE `exam_classes` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` int NOT NULL,
  `class_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

CREATE TABLE `exam_marks` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_timetable_id` int NOT NULL,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `obtained_marks` int NOT NULL,
  `teacher_review` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passing_status` tinyint(1) NOT NULL COMMENT '1=Pass, 0=Fail',
  `session_year_id` int NOT NULL,
  `grade` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` int NOT NULL,
  `class_section_id` int NOT NULL,
  `student_id` int NOT NULL,
  `total_marks` int NOT NULL,
  `obtained_marks` int NOT NULL,
  `percentage` double(8,2) NOT NULL,
  `grade` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_timetables`
--

CREATE TABLE `exam_timetables` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` int NOT NULL,
  `class_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `total_marks` int NOT NULL,
  `passing_marks` int NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_id` int NOT NULL,
  `amount` double(8,2) NOT NULL,
  `due_date` date NOT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_paid`
--

CREATE TABLE `fees_paid` (
  `id` bigint UNSIGNED NOT NULL,
  `fees_id` int NOT NULL,
  `student_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=Not Paid,1=Paid',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_sub_types`
--

CREATE TABLE `fees_sub_types` (
  `id` bigint UNSIGNED NOT NULL,
  `fees_id` int NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `session_year_id` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint UNSIGNED NOT NULL,
  `modal_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `modal_id` bigint UNSIGNED NOT NULL,
  `file_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_thumbnail` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1 = File Upload, 2 = Youtube Link, 3 = Video Upload, 4 = Other Link',
  `file_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `modal_type`, `modal_id`, `file_name`, `file_thumbnail`, `type`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'App\\Models\\Announcement', 1, 'Screenshot 2023-07-21 160917.png', NULL, '1', 'announcement/8TuR3zqHrB7EAxxEbnYK0e9bmqEulARw1D62qW1D.png', '2023-08-25 06:14:44', '2023-08-25 06:14:44', NULL),
(2, 'App\\Models\\Announcement', 2, '7478776_64a42226c7e2d.jpg', NULL, '1', 'announcement/dOZwVpPhhDyxSL9BaA6z9qOOepDsZykr0qLKKd3Z.jpg', '2023-08-28 03:40:55', '2023-08-28 03:40:55', NULL),
(3, 'App\\Models\\Announcement', 2, '7478776_64a42226c7e2d.jpg', NULL, '1', 'announcement/sl7tqzoIdTtAW9VZwzsJK8V6t1IxGkKt9ojO44nQ.jpg', '2023-08-28 03:43:23', '2023-08-28 03:43:23', NULL),
(4, 'App\\Models\\Announcement', 2, '7478776_64a42226c7e2d.jpg', NULL, '1', 'announcement/Q2x6bwvxvWmnIzmsTp68zgWzfg2fvfmfDnP0eiqt.jpg', '2023-08-28 03:43:35', '2023-08-28 03:43:35', NULL),
(5, 'App\\Models\\Announcement', 3, '7478776_64a42226c7e2d.jpg', NULL, '1', 'announcement/FEkzkaBvZSKAaPCsnviMJGdI5sELBDBx7nWhlwqF.jpg', '2023-08-28 03:58:06', '2023-08-28 03:58:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint UNSIGNED NOT NULL,
  `starting_range` int NOT NULL,
  `ending_range` int NOT NULL,
  `grade` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `date`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, '2023-08-30', 'Rakshabandhan', 'we have a holiday at rakshabandhan date: 30-08-2023.', '2023-08-28 05:38:43', '2023-08-28 05:38:43');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_rtl` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1=>active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `file`, `is_rtl`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'English', 'ENG', 'ENG.json', 0, 0, '2023-08-25 05:00:17', '2023-08-25 05:00:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_section_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_topics`
--

CREATE TABLE `lesson_topics` (
  `id` bigint UNSIGNED NOT NULL,
  `lesson_id` int NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mediums`
--

CREATE TABLE `mediums` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mediums`
--

INSERT INTO `mediums` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Hindi', NULL, NULL, NULL),
(2, 'English', NULL, NULL, NULL),
(3, 'Gujarati', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_01_044234_create_settings_table', 1),
(6, '2022_04_01_091033_create_permission_tables', 1),
(7, '2022_04_01_105826_all_tables', 1),
(8, '2022_04_27_072441_parent_changes', 1),
(9, '2022_04_28_105419_add_day_name_to_timetables_table', 1),
(10, '2022_04_29_164836_add_class_section_id_to_timetables', 1),
(11, '2022_05_03_053843_add_lesson_files', 1),
(12, '2022_05_06_071034_create_holidays_table', 1),
(13, '2022_05_11_063841_add_sliders', 1),
(14, '2022_05_13_041458_add_date_to_session_years_table', 1),
(15, '2022_05_16_045021_add_class_secion_id_to_attendances', 1),
(16, '2022_05_19_053446_add_fcm_id_to_users', 1),
(17, '2022_05_31_133456_add_reset_request_to_users', 1),
(18, '2022_06_03_060653_create_student_sessions_table', 1),
(19, '2022_06_07_065946_create_languages_table', 1),
(20, '2022_07_18_044243_is_rtl_in_language', 1),
(21, '2022_07_25_103347_create_exams_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(4, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13),
(4, 'App\\Models\\User', 14);

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `first_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `email`, `mobile`, `occupation`, `image`, `dob`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 9, 'Ashokbhai', 'Vassani', 'Male', 'stupatent@gmail.com', '123123131', 'Cricketer', 'parents/LThJddb1yubeQQ8rgOf0iBZMPo1i5ans7ODAR0x5.jpg', '2023-09-11', '2023-08-28 02:54:17', '2023-08-28 03:35:35', NULL),
(8, 10, 'robin', 'hood', 'Female', 'stumother@gmail.com', '1231231231', 'Job', 'parents/zem8qTNUvTyYBP15Q38oZ3noMp0I7g3Jw8wRTTkR.jpg', '2023-08-28', '2023-08-28 02:54:17', '2023-08-28 03:36:11', NULL),
(9, 12, 'rameshbhai', 'rajubhai', 'Male', 'sandipparent@gmail.com', '1231231123', 'Cricketer', 'parents/72xSeYNPaWMudHOdsc1MWWFmQ51Zvz8BnwHriJxq.jpg', '2023-08-14', '2023-08-28 03:18:55', '2023-08-28 03:39:11', NULL),
(10, 13, 'bhavnaben', 'rameshbhai', 'Female', 'sandipmother@gmail.com', '121231231', 'Job', 'parents/zw24kaOJvcNeqdxfhrhlVcwvme3lhvotZYDtAD9W.jpg', '2023-08-28', '2023-08-28 03:18:55', '2023-08-28 03:52:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(2, 'role-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(3, 'role-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(4, 'role-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(5, 'medium-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(6, 'medium-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(7, 'medium-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(8, 'medium-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(9, 'section-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(10, 'section-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(11, 'section-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(12, 'section-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(13, 'class-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(14, 'class-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(15, 'class-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(16, 'class-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(17, 'subject-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(18, 'subject-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(19, 'subject-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(20, 'subject-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(21, 'teacher-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(22, 'teacher-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(23, 'teacher-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(24, 'teacher-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(25, 'class-teacher-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(26, 'class-teacher-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(27, 'class-teacher-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(28, 'class-teacher-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(29, 'parents-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(30, 'parents-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(31, 'parents-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(32, 'parents-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(33, 'session-year-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(34, 'session-year-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(35, 'session-year-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(36, 'session-year-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(37, 'student-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(38, 'student-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(39, 'student-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(40, 'student-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(41, 'category-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(42, 'category-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(43, 'category-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(44, 'category-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(45, 'subject-teacher-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(46, 'subject-teacher-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(47, 'subject-teacher-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(48, 'subject-teacher-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(49, 'timetable-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(50, 'timetable-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(51, 'timetable-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(52, 'timetable-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(53, 'attendance-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(54, 'attendance-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(55, 'attendance-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(56, 'attendance-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(57, 'holiday-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(58, 'holiday-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(59, 'holiday-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(60, 'holiday-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(61, 'announcement-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(62, 'announcement-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(63, 'announcement-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(64, 'announcement-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(65, 'slider-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(66, 'slider-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(67, 'slider-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(68, 'slider-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(69, 'class-timetable', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(70, 'teacher-timetable', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(71, 'student-assignment', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(72, 'subject-lesson', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(73, 'class-attendance', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(74, 'exam-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(75, 'exam-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(76, 'exam-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(77, 'exam-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(78, 'exam-upload-marks', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(79, 'setting-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(80, 'fcm-setting-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(81, 'assignment-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(82, 'assignment-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(83, 'assignment-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(84, 'assignment-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(85, 'assignment-submission', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(86, 'email-setting-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(87, 'privacy-policy', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(88, 'contact-us', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(89, 'about-us', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(90, 'student-reset-password', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(91, 'reset-password-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(92, 'student-change-password', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(93, 'promote-student-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(94, 'promote-student-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(95, 'promote-student-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(96, 'promote-student-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(97, 'language-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(98, 'language-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(99, 'language-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(100, 'language-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(101, 'lesson-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(102, 'lesson-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(103, 'lesson-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(104, 'lesson-delete', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(105, 'topic-list', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(106, 'topic-create', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(107, 'topic-edit', 'web', '2023-08-23 05:20:55', '2023-08-23 05:20:55'),
(108, 'topic-delete', 'web', '2023-08-23 05:20:56', '2023-08-23 05:20:56'),
(109, 'class-teacher', 'web', '2023-08-23 05:20:56', '2023-08-23 05:20:56'),
(110, 'terms-condition', 'web', '2023-08-23 05:20:56', '2023-08-23 05:20:56'),
(111, 'assign-class-to-new-student', 'web', '2023-08-23 05:20:56', '2023-08-23 05:20:56'),
(112, 'exam-timetable-create', 'web', '2023-08-23 05:20:56', '2023-08-23 05:20:56'),
(113, 'grade-create', 'web', '2023-08-23 05:20:56', '2023-08-23 05:20:56'),
(114, 'update-admin-profile', 'web', '2023-08-23 05:20:56', '2023-08-23 05:20:56'),
(115, 'exam-result', 'web', '2023-08-23 05:20:56', '2023-08-23 05:20:56');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 11, 'Kerry', '36818dde388cd1bab92cb4cd84fa6c1e7c1e0ca9572d9d05fd1ed7a8a365cbbe', '[\"*\"]', NULL, '2023-08-25 04:43:11', '2023-08-25 04:43:11'),
(2, 'App\\Models\\User', 13, 'ankur', 'd188d3f4c179e3a6a5e7f382450ae1199a3f0417f20d56e02de491c0ad76b31e', '[\"*\"]', NULL, '2023-08-25 05:26:44', '2023-08-25 05:26:44'),
(5, 'App\\Models\\User', 12, 'test', '7ee8ddfcb9e9407d22ae2dae97ff8458ea7b8c36d1a5fd4f57970417f2760421', '[\"*\"]', NULL, '2023-08-25 05:43:36', '2023-08-25 05:43:36'),
(9, 'App\\Models\\User', 11, 'Kerry', '62fb78dbd80969b45bc0ec64c7582a8ff56919f0e346089eaa3e9a166840916e', '[\"*\"]', NULL, '2023-08-25 06:06:17', '2023-08-25 06:06:17'),
(13, 'App\\Models\\User', 13, 'ankur', '964c287ebd7ad01b5d9efd8498f820303c337014a75a11036c4a8e10b137e6a3', '[\"*\"]', '2023-08-26 04:21:03', '2023-08-25 06:19:59', '2023-08-26 04:21:03'),
(14, 'App\\Models\\User', 12, 'test', 'c455271da5707e13cd98c8cb1a690a379eea4b0fbad509983ea165b27b1488b4', '[\"*\"]', NULL, '2023-08-25 23:44:26', '2023-08-25 23:44:26'),
(18, 'App\\Models\\User', 12, 'test', '11e9e95d7bf07f9a320321189aee071ccb4b0575ad3abce2b88c9e1c0262f3ac', '[\"*\"]', '2023-08-28 02:05:14', '2023-08-26 04:44:35', '2023-08-28 02:05:14'),
(19, 'App\\Models\\User', 13, 'ankur', '0de9339d34917713293f3279d1ef36a2fbeef85371a64c059a641c1887d567b3', '[\"*\"]', '2023-08-26 04:47:30', '2023-08-26 04:47:00', '2023-08-26 04:47:30'),
(20, 'App\\Models\\User', 9, 'Mitul \r\n', '36eaec340d1d566347cee3fc6d8dedfaa87f1dde11e9ea551afd567a4aedb15d', '[\"*\"]', '2023-08-28 03:11:29', '2023-08-28 03:10:39', '2023-08-28 03:11:29'),
(24, 'App\\Models\\User', 12, 'rameshbhai', '1341a1646415d1d895517c6c929550b09fe8f7b359abaad29397e23193c32d4c', '[\"*\"]', '2023-08-28 03:45:56', '2023-08-28 03:42:11', '2023-08-28 03:45:56'),
(29, 'App\\Models\\User', 14, 'sandip', '9400afd516d84a1c9e956a1650648dc71e23e25a900d6d599f2e53e18f6c02cb', '[\"*\"]', NULL, '2023-08-28 05:42:03', '2023-08-28 05:42:03'),
(30, 'App\\Models\\User', 14, 'sandip', '5c74d83e505bbebe0a43a8e940a69a930e05c69242f1c11cc6fd0440e42de21d', '[\"*\"]', '2023-08-28 05:46:08', '2023-08-28 05:42:40', '2023-08-28 05:46:08');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2023-08-23 05:20:56', '2023-08-23 05:20:56'),
(2, 'Teacher', 'web', '2023-08-23 05:20:56', '2023-08-23 05:20:56'),
(3, 'Parent', 'web', '2023-08-23 05:20:56', '2023-08-23 05:20:56'),
(4, 'Student', 'web', '2023-08-23 05:20:56', '2023-08-23 05:20:56');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(79, 1),
(80, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(37, 2),
(45, 2),
(49, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(78, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(115, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'A', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(2, 'B', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(3, 'C', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session_years`
--

CREATE TABLE `session_years` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session_years`
--

INSERT INTO `session_years` (`id`, `name`, `default`, `start_date`, `end_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2022-23', 1, '2022-06-01', '2023-04-30', '2023-08-23 05:22:06', '2023-08-29 04:48:58', NULL),
(2, '2023', 0, '2023-06-01', '2024-04-30', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(3, '2024', 0, '2024-06-01', '2025-04-30', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(4, '2025', 0, '2025-06-01', '2026-04-30', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `message`) VALUES
(1, 'school_name', 'Internexa School'),
(2, 'school_email', 'info@internexaschool.in'),
(3, 'school_phone', '1112223330'),
(4, 'school_address', 'India'),
(5, 'time_zone', 'Asia/Kolkata'),
(6, 'date_formate', 'd-m-Y'),
(7, 'time_formate', 'h:i A'),
(8, 'theme_color', '#4C5EA6'),
(9, 'session_year', '1'),
(10, 'mail_mailer', 'smtp'),
(11, 'email_configration_verification', '1'),
(12, 'mail_host', 'sandbox.smtp.mailtrap.io'),
(13, 'mail_port', '2525'),
(14, 'mail_username', '90d1e03bde7844'),
(15, 'mail_password', '6162cd89bffce8'),
(16, 'mail_encryption', 'tls'),
(17, 'mail_send_from', 'kartik.phoenixbs@gmail.com'),
(18, 'school_tagline', 'A Building With Four Walls And Tomorrow Inside'),
(19, 'logo1', 'logo/isnZDRRV90mg1O4Gujbzo6lBvaftoVgqVnai7Upy.svg'),
(20, 'logo2', 'logo/KPnm1m5zgjTrulKPd1znvI5tAOUp9hmA2CMSz0XR.svg'),
(21, 'favicon', 'logo/nfsXAdUilZsknwRPYcQfyheTMWjLkbXpDGEhAHUj.svg'),
(22, 'privacy_policy', '<p>Effective Date: 24-08-2023</p>\n<p><strong>Introduction</strong></p>\n<p>At Madhuvan Internation School, we are committed to safeguarding the privacy and security of our students, parents, staff, and other stakeholders. This Privacy Policy outlines how we collect, use, disclose, and protect personal information within our school community. By interacting with Madhuvan Internation School, you consent to the practices described in this policy.</p>\n<p><strong>Information We Collect</strong></p>\n<p>We collect and process various types of personal information to fulfill educational and administrative purposes. This includes, but is not limited to:</p>\n<ol>\n<li>\n<p>Student Information: This may include names, contact details, birthdates, academic records, health information, and photographs.</p>\n</li>\n<li>\n<p>Parent/Guardian Information: We collect contact details and emergency contact information for effective communication.</p>\n</li>\n<li>\n<p>Staff Information: For our employees, we collect personal and contact details, payroll information, and professional qualifications.</p>\n</li>\n<li>\n<p>School Activities: Information related to student participation in school events, extracurricular activities, and trips.</p>\n</li>\n<li>\n<p>Online Platforms: When using our digital platforms, we may collect IP addresses, browser information, and usage patterns for technical and analytical purposes.</p>\n</li>\n</ol>\n<p><strong>How We Use Information</strong></p>\n<p>We use personal information for the following purposes:</p>\n<ol>\n<li>\n<p>Education and Administration: To provide educational services, manage student records, and communicate with parents/guardians.</p>\n</li>\n<li>\n<p>Safety and Security: To ensure the well-being of our students and staff, including emergency notifications.</p>\n</li>\n<li>\n<p>Communication: To share school updates, events, and important information.</p>\n</li>\n<li>\n<p>Research and Analytics: To improve our educational programs and services.</p>\n</li>\n<li>\n<p>Legal and Regulatory Compliance: To fulfill our legal obligations.</p>\n</li>\n</ol>\n<p><strong>Information Sharing</strong></p>\n<p>We may share personal information with:</p>\n<ol>\n<li>\n<p>School Personnel: Relevant staff members for educational and administrative purposes.</p>\n</li>\n<li>\n<p>Third-Party Service Providers: We may engage trusted third parties to assist with various functions such as IT services, transportation, and catering.</p>\n</li>\n<li>\n<p>Legal Authorities: To comply with legal obligations or respond to legal requests.</p>\n</li>\n<li>\n<p>Parents/Guardians: Information may be shared as needed for the welfare of students.</p>\n</li>\n</ol>\n<p><strong>Data Security</strong></p>\n<p>We implement technical and organizational measures to protect personal information from unauthorized access, disclosure, alteration, or destruction. While we strive to maintain the highest standards of security, no method of data transmission or storage is entirely secure.</p>\n<p><strong>Your Choices</strong></p>\n<p>You have the right to access, correct, and delete your personal information. If you wish to do so or have any concerns about your data, please contact our designated Data Protection Officer (DPO)&nbsp;</p>\n<p><strong>Changes to the Privacy Policy</strong></p>\n<p>This Privacy Policy may be updated from time to time. We will notify you of significant changes through our official communication channels.</p>\n<p><strong>Consent</strong></p>\n<p>By continuing to engage with Madhuvan Internation School, you consent to the collection, use, and sharing of your personal information as described in this Privacy Policy.</p>\n<p>&nbsp;</p>'),
(23, 'contact_us', '<p><strong>Madhuvan International School</strong></p>\n<div class=\"TzHB6b cLjAic\" data-hveid=\"CFQQAA\" data-ved=\"2ahUKEwjy5O6W7vmAAxURamwGHYJzByAQ04gCKAB6BAhUEAA\">\n<div>\n<div class=\"sATSHe\">\n<div>\n<div class=\"B03h3d V14nKc i8qq8b ptcLIOszQJu__wholepage-card wp-ms\" data-hveid=\"CFAQAA\">\n<div class=\"UDZeY OTFaAf\">\n<div class=\"ceacV\">\n<div class=\"noQ1ef QsDR1c\">\n<div class=\"wDYxhc\" lang=\"en-IN\" data-attrid=\"kc:/local:edit info\" data-md=\"140\" data-hveid=\"CD8QAA\" data-ved=\"2ahUKEwjy5O6W7vmAAxURamwGHYJzByAQkG16BAg_EAA\">\n<div class=\"NgDbBb\">\n<div><strong>Address</strong>: TP No.-66, Block No.-701, Hazira-Sayan Rd, behind Gruham Empire, Kosad, Surat, Gujarat 394107</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>'),
(24, 'about_us', '<div class=\"PQbOE W2lMue\">\n<div class=\"u9sbk W2lMue\" role=\"heading\" aria-level=\"3\">From Madhuvan International School</div>\n</div>\n<div>Madhuvan International School has provide Best Education With Discipline and Spirituality knowledge in KG SECTION,PRIMARY SECTION,SECONDARY SECTION,HIGHER SECONDARY SECTION (GUJ.MED/ENG.MED) for inquiry call on +91 99243 1 8187</div>'),
(25, 'terms_condition', '<p><strong>Effective Date: 24-08-2023</strong></p>\n<p>These Terms &amp; Conditions (\"Terms\") outline the rules and guidelines for using the services and platforms provided by Madhuvan Internation School . By accessing or using any of our services, you agree to abide by these Terms. If you do not agree with these Terms, please refrain from using our services.</p>\n<p><strong>1. Acceptable Use</strong></p>\n<p>1.1. You agree to use our services for lawful purposes only and in a manner consistent with applicable laws and regulations.</p>\n<p>1.2. You shall not engage in any activity that could disrupt, damage, or impair our services or networks.</p>\n<p><strong>2. User Accounts</strong></p>\n<p>2.1. Access to certain features of our services may require you to create a user account. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.</p>\n<p>2.2. You must provide accurate and complete information when creating an account. You shall promptly update any changes to this information.</p>\n<p><strong>3. Content Usage</strong></p>\n<p>3.1. Any content provided by [School Name], including but not limited to text, images, videos, and documents, is intended solely for informational and educational purposes.</p>\n<p>3.2. You shall not reproduce, distribute, modify, or create derivative works based on our content without prior written consent.</p>\n<p><strong>4. Data Privacy</strong></p>\n<p>4.1. We collect and process personal information in accordance with our Privacy Policy. By using our services, you consent to our data practices as described therein.</p>\n<p>4.2. You are responsible for any personal data you share through our services, and you must obtain necessary consents before sharing any personal information.</p>\n<p><strong>5. Intellectual Property</strong></p>\n<p>5.1. All intellectual property rights related to our services, including but not limited to trademarks, logos, and content, are owned or licensed by Madhuvan Internation School.</p>\n<p>5.2. You shall not use our intellectual property without our prior written consent.</p>\n<p><strong>6. Limitation of Liability</strong></p>\n<p>6.1. Madhuvan Internation School is not liable for any direct, indirect, incidental, consequential, or punitive damages arising from the use of our services.</p>\n<p>6.2. We strive to provide accurate and up-to-date information, but we do not guarantee the accuracy, completeness, or reliability of our content.</p>\n<p><strong>7. Termination</strong></p>\n<p>7.1. We reserve the right to suspend, terminate, or restrict your access to our services at our discretion, without prior notice, if you violate these Terms or engage in any prohibited activities.</p>\n<p><strong>8. Changes to Terms</strong></p>\n<p>8.1. These Terms may be updated from time to time. We will notify users of any significant changes through appropriate communication channels.</p>\n<p><strong>9. Governing Law</strong></p>\n<p>9.1. These Terms are governed by the laws of [Jurisdiction]. Any disputes arising from or related to these Terms shall be subject to the exclusive jurisdiction of the courts in [Jurisdiction].</p>\n<p><strong>10. Contact Information</strong></p>\n<p>10.1. If you have any questions or concerns about these Terms, please contact us at [Contact Information].</p>\n<p>By using our services, you acknowledge that you have read, understood, and agreed to these Terms &amp; Conditions. If you do not agree with these Terms, please discontinue the use of our services.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `created_at`, `updated_at`) VALUES
(6, 'sliders/HdEaEDw7LbX9686Ooxos39B9NQAwbSQwMhOExNhQ.jpg', '2023-08-28 03:28:58', '2023-08-28 03:28:58'),
(10, 'sliders/XdJEzUVYhN8ALAM93Chv3iCvbDmLqI3Gb8egEzQN.jpg', '2023-08-28 03:50:22', '2023-08-28 03:50:22'),
(12, 'sliders/cbuwsLI8TNKvdt7Q8CHD7PvgsQ8G8Oit18zL4URa.jpg', '2023-08-28 03:50:42', '2023-08-28 03:50:42'),
(14, 'sliders/siqYUQLXtCbdMwk4hXW1OzkBbE76rD7UoXvcdowU.jpg', '2023-08-28 03:51:35', '2023-08-28 03:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `class_section_id` int NOT NULL,
  `category_id` int NOT NULL,
  `admission_no` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roll_number` int NOT NULL,
  `caste` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admission_date` date NOT NULL,
  `blood_group` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_new_admission` tinyint NOT NULL DEFAULT '1',
  `father_id` int DEFAULT NULL,
  `mother_id` int DEFAULT NULL,
  `guardian_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `class_section_id`, `category_id`, `admission_no`, `roll_number`, `caste`, `religion`, `admission_date`, `blood_group`, `height`, `weight`, `is_new_admission`, `father_id`, `mother_id`, `guardian_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 3, 1, '12345667', 1, 'Hindu', 'Hindu', '2022-04-01', 'B+', '5.5', '59', 1, 1, 2, 3, '2023-08-23 05:22:07', '2023-08-28 02:17:25', '2023-08-28 02:17:25'),
(2, 7, 1, 1, '2022-232', 1, 'Open', 'Hindu', '2023-08-25', 'AB+', '5.4', '72', 1, 3, 4, 0, '2023-08-25 03:32:35', '2023-08-28 02:17:22', '2023-08-28 02:17:22'),
(3, 10, 1, 4, '2022-233', 11, 'Patel', 'Hindu', '2023-08-25', 'B-', '180', '100', 1, 1, 5, 0, '2023-08-25 03:56:56', '2023-08-28 02:17:19', '2023-08-28 02:17:19'),
(4, 13, 1, 4, '2022-234', 2, 'Opem', 'Indian', '2023-08-09', 'B+', '5.5', '55', 1, 6, 5, 0, '2023-08-25 05:23:50', '2023-08-28 02:17:15', '2023-08-28 02:17:15'),
(5, 11, 4, 3, '2022-231', 372, 'Tempora et alias vel', 'Hic enim ut voluptas', '2023-08-28', 'B+', 'Soluta veritatis min', 'Laboris dolore debit', 1, 7, 8, 0, '2023-08-28 02:54:17', '2023-08-28 02:54:17', NULL),
(6, 14, 1, 4, '2022-236', 1, 'Patel', 'Hindu', '2023-08-28', 'O+', '168', '100', 1, 9, 10, 0, '2023-08-28 03:18:55', '2023-08-28 03:18:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_sessions`
--

CREATE TABLE `student_sessions` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` int NOT NULL,
  `class_section_id` int NOT NULL,
  `session_year_id` int NOT NULL,
  `result` tinyint NOT NULL DEFAULT '1' COMMENT '1=>Pass,0=>fail',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=>continue,0=>leave',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_subjects`
--

CREATE TABLE `student_subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `class_section_id` int NOT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_subjects`
--

INSERT INTO `student_subjects` (`id`, `student_id`, `subject_id`, `class_section_id`, `session_year_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 1, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_color` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium_id` int NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Theory / Practical',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `code`, `bg_color`, `image`, `medium_id`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Maths', 'MA', '#5031f7', 'subject.png', 2, 'Practical', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(2, 'Science', 'SC', '#5031f7', 'subject.png', 2, 'Practical', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(3, 'English', 'EN', '#5031f7', 'subject.png', 2, 'Theory', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(4, 'Gujarati', 'GJ', '#5031f7', 'subject.png', 2, 'Theory', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(5, 'Sanskrit', 'SN', '#5031f7', 'subject.png', 2, 'Theory', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(6, 'Hindi', 'HN', '#5031f7', 'subject.png', 2, 'Theory', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(7, 'Computer', 'CMP', '#5031f7', 'subject.png', 2, 'Practical', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(8, 'PT', 'PT', '#5031f7', 'subject.png', 2, 'Practical', '2023-08-23 05:22:06', '2023-08-23 05:22:06', NULL),
(9, 'Gujrati', 'GUJ', '#d6afaf', 'subjects/qic0ZQ4LoEFcykjch9q3iOIGeHb0WmEI6FfrW6Oz.png', 3, 'Theory', '2023-08-25 06:01:46', '2023-08-25 06:01:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject_teachers`
--

CREATE TABLE `subject_teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `class_section_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `qualification` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `qualification`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 8, 'BA Pass', '2023-08-25 03:48:45', '2023-08-25 03:48:45', NULL),
(2, 11, 'Qui rem ad sunt quia', '2023-08-25 04:00:39', '2023-08-28 02:17:53', '2023-08-28 02:17:53'),
(3, 14, 'MCA', '2023-08-28 01:27:02', '2023-08-28 02:17:49', '2023-08-28 02:17:49');

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `id` bigint UNSIGNED NOT NULL,
  `subject_teacher_id` int NOT NULL,
  `class_section_id` int NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day` int NOT NULL COMMENT '1=monday,2=tuesday,3=wednesday,4=thursday,5=friday,6=saturday,7=sunday',
  `day_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcm_id` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `current_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `reset_request` tinyint NOT NULL DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `email`, `fcm_id`, `email_verified_at`, `password`, `mobile`, `image`, `dob`, `current_address`, `permanent_address`, `status`, `reset_request`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'kartik', 'Kartik', 'male', 'admin@gmail.com', NULL, NULL, '$2y$10$TZ8TpOowRIEqZekhsy5pCu/ue.U6E3Crtn3VdhWVwQnOxGtXMuvXa', '1111111111', 'user/R4YIAiclRuTIIuurAR23Uh8i9lDySL1ljKP9i6aW.svg', '1970-01-01', 'Dolores sit laudanti', 'test', 1, 0, NULL, '2023-08-23 05:19:56', '2023-08-29 04:49:16', NULL),
(2, 'Sachin', 'Tendulkar', 'Male', 'father@gmail.com', NULL, NULL, '$2y$10$rwvfiE2D5dBVC4QoOS08LOqIeog.06KK/f53mNhcxu4vKMbZbs/bi', '1234567890', 'parents/user.png', NULL, 'Mumbai', 'Mumbai', 1, 0, NULL, '2023-08-23 05:22:07', '2023-08-23 05:22:07', NULL),
(3, 'Anjali', 'Tendulkar', 'Female', 'mother@gmail.com', NULL, NULL, '$2y$10$BLneJj70SZ5A62YmOfHlI.V08sXb4uIGrqHMmLnt3VxNt1EVX2BaK', '1234567890', 'parents/user.png', NULL, 'Mumbai', 'Mumbai', 1, 0, NULL, '2023-08-23 05:22:07', '2023-08-23 05:22:07', NULL),
(4, 'Arjun', 'Tendulkar', 'Male', 'student@gmail.com', NULL, NULL, '$2y$10$ZKM22O/gb4g.JgrugYEo5uasHv/OE12aJqfyH50B4R752Gl0jNU/K', '1234567890', 'students/user.png', NULL, 'Mumbai', 'Mumbai', 1, 0, NULL, '2023-08-23 05:22:07', '2023-08-23 05:22:07', NULL),
(5, 'Armando', 'Bradshaw', 'male', 'mifis@mailinator.com', NULL, NULL, '$2y$10$lISRPt8MksQcFOasslOWt.3nB/hpHqJnl0SxaxPCfRKzsLK/qNV0C', 'Voluptas quia occaec', 'teachers/oakrWDc01OlTpJcUNhmPhrq2ifpuk4g0UI9jhnjc.jpg', '2023-08-25', 'Id aut dolorem faci', 'Eveniet consequatur', 1, 0, NULL, '2023-08-25 03:43:41', '2023-08-25 03:43:41', NULL),
(6, 'sdc', 'sdc', 'Male', 'new@test.com', NULL, NULL, '$2y$10$chZcb/ul6BmNorNn.pZwleXu7DgKI90VbsNhh1Rtr0EOgeKDbY4Ne', '1231231231', 'parents/b7f84UBgknQWgkp7e7EI8QZ4cnsQu4nFzcumVdk0.jpg', '2023-08-16', NULL, NULL, 1, 0, NULL, '2023-08-25 04:33:04', '2023-08-25 04:33:04', NULL),
(7, 'Jarrod Cochran', 'Axel James', 'Female', 'test@gmail.com', NULL, NULL, '$2y$10$h/3f/nsr8T31Qd2.v6Axw.ghom6patbTkidz6T94MIK14Hm809Sbm', '123123131', 'parents/W7DpobOLgcKGesnZZBWo3pVBdIiBiSvUVzYyfwDE.jpg', '2023-08-23', NULL, NULL, 1, 0, NULL, '2023-08-25 04:33:04', '2023-08-25 04:33:04', NULL),
(8, 'pooja', 'Patel', 'female', 'pooja@gmail.com', NULL, NULL, '$2y$10$TZ8TpOowRIEqZekhsy5pCu/ue.U6E3Crtn3VdhWVwQnOxGtXMuvXa', '1231231321', 'teachers/1AHiT6TxF55fpoMVSAnWA13ZZ3MHWOdb7pNqdbUe.jpg', '2023-08-08', 'Proident quo nihil', 'Laboriosam dolorem', 1, 0, NULL, '2023-08-25 04:33:04', '2023-08-28 03:34:03', NULL),
(9, 'Ashokbhai', 'Vassani', 'Male', 'stupatent@gmail.com', '', NULL, '$2y$10$vbgn3YqVNxkBVfVVlytihuhriBJp2DmKSb0X8f/83W51adue56p.2', '123123131', 'parents/LThJddb1yubeQQ8rgOf0iBZMPo1i5ans7ODAR0x5.jpg', '2023-09-11', NULL, NULL, 1, 0, NULL, '2023-08-28 02:54:17', '2023-08-28 03:36:24', NULL),
(10, 'robin', 'hood', 'Female', 'stumother@gmail.com', NULL, NULL, '$2y$10$uztqBuWQhN.ogYvWRkpFvuodm3iFlIYk1z/1xfecnQeESssCQRfq.', '1231231231', 'parents/zem8qTNUvTyYBP15Q38oZ3noMp0I7g3Jw8wRTTkR.jpg', '2023-08-28', NULL, NULL, 1, 0, NULL, '2023-08-28 02:54:17', '2023-08-28 03:36:11', NULL),
(11, 'Kartik', 'Gadhiya', 'male', '2022-231', NULL, NULL, '$2y$10$FQbn9Fqle27W4jb55KNMQux0NUoT2eu89xeT6C0OwvTeC5klV/xCi', '1231231231', 'students/QyRpJHKEhXRpEsZqacqgtQalm0TlF7PwyqOkLYwv.jpg', '2000-01-01', 'Cumque deserunt mole', 'Incidunt aliqua Et', 1, 0, NULL, '2023-08-28 02:54:17', '2023-08-28 03:33:32', NULL),
(12, 'rameshbhai', 'rajubhai', 'Male', 'sandipparent@gmail.com', '', NULL, '$2y$10$tk.klgvqDc4FB9N.D3DEeuLRMwuxK87re1pe/vW99eWAp5x5.NhgG', '1231231123', 'parents/72xSeYNPaWMudHOdsc1MWWFmQ51Zvz8BnwHriJxq.jpg', '2023-08-14', NULL, NULL, 1, 0, NULL, '2023-08-28 03:18:55', '2023-08-28 05:41:28', NULL),
(13, 'bhavnaben', 'rameshbhai', 'Female', 'sandipmother@gmail.com', NULL, NULL, '$2y$10$A32mhoiEA7LAgz24ECQ//upDEl8QCpKEIclTRaNJT9UdiWeubJMz2', '121231231', 'parents/zw24kaOJvcNeqdxfhrhlVcwvme3lhvotZYDtAD9W.jpg', '2023-08-28', NULL, NULL, 1, 0, NULL, '2023-08-28 03:18:55', '2023-08-28 03:52:53', NULL),
(14, 'sandip', 'andani', 'female', '2022-236', 'cHPx_KCPQvS0X1kkqfI_TF:APA91bEBESob6t1Sn8mMBpeRdVYKJq4aqpOQoQTOGGKCf9b-rVRRn8JmBbJkNsNz8uNrBohTg6m5qfiHhqSZz2PL-9azb7dNgzQ-OvHDnwovKys6m_tqAdljVUImlW4y6i4gy2Mb2n86', NULL, '$2y$10$IfrRcWv6OtgvMyAbrb0CyOfrEpwMLPzRwBTPna/9Jn.4HClI/V9H6', '9909520146', 'students/VhVAIucMGFWpjjqROYNsNKKwJzxOFqux1QgiLbIZ.png', '2023-08-21', 'Dolores sit laudanti', 'Dolores sit laudanti', 1, 0, NULL, '2023-08-28 03:18:55', '2023-08-28 07:47:55', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_table_type_table_id_index` (`table_type`,`table_id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_subjects`
--
ALTER TABLE `class_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `elective_subject_groups`
--
ALTER TABLE `elective_subject_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_classes`
--
ALTER TABLE `exam_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_timetables`
--
ALTER TABLE `exam_timetables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_paid`
--
ALTER TABLE `fees_paid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_sub_types`
--
ALTER TABLE `fees_sub_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_modal_type_modal_id_index` (`modal_type`,`modal_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lesson_topics`
--
ALTER TABLE `lesson_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mediums`
--
ALTER TABLE `mediums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session_years`
--
ALTER TABLE `session_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_sessions`
--
ALTER TABLE `student_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_subjects`
--
ALTER TABLE `student_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `class_sections`
--
ALTER TABLE `class_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `class_subjects`
--
ALTER TABLE `class_subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `elective_subject_groups`
--
ALTER TABLE `elective_subject_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_classes`
--
ALTER TABLE `exam_classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_marks`
--
ALTER TABLE `exam_marks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_timetables`
--
ALTER TABLE `exam_timetables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_paid`
--
ALTER TABLE `fees_paid`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_sub_types`
--
ALTER TABLE `fees_sub_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson_topics`
--
ALTER TABLE `lesson_topics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mediums`
--
ALTER TABLE `mediums`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `session_years`
--
ALTER TABLE `session_years`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `student_sessions`
--
ALTER TABLE `student_sessions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_subjects`
--
ALTER TABLE `student_subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
