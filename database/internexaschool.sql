-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 31, 2023 at 11:00 AM
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
-- Database: `internexaschool_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_calendars`
--

CREATE TABLE `academic_calendars` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `title` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_id` bigint UNSIGNED DEFAULT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint UNSIGNED NOT NULL,
  `class_section_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `feedback` text COLLATE utf8mb4_unicode_ci,
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
  `remark` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects`
--

CREATE TABLE `class_subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` int NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Compulsory / Elective',
  `subject_id` int NOT NULL,
  `elective_subject_group_id` int DEFAULT NULL COMMENT 'if type=Elective',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `grade` tinytext COLLATE utf8mb4_unicode_ci,
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
  `grade` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `modal_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modal_id` bigint UNSIGNED NOT NULL,
  `file_name` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_thumbnail` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1 = File Upload, 2 = Youtube Link, 3 = Video Upload, 4 = Other Link',
  `file_url` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint UNSIGNED NOT NULL,
  `starting_range` int NOT NULL,
  `ending_range` int NOT NULL,
  `grade` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_rtl` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1=>active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(2, 'role-create', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(3, 'role-edit', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(4, 'role-delete', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(5, 'medium-list', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(6, 'medium-create', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(7, 'medium-edit', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(8, 'medium-delete', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(9, 'section-list', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(10, 'section-create', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(11, 'section-edit', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(12, 'section-delete', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(13, 'class-list', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(14, 'class-create', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(15, 'class-edit', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(16, 'class-delete', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(17, 'subject-list', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(18, 'subject-create', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(19, 'subject-edit', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(20, 'subject-delete', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(21, 'teacher-list', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(22, 'teacher-create', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(23, 'teacher-edit', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(24, 'teacher-delete', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(25, 'class-teacher-list', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(26, 'class-teacher-create', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(27, 'class-teacher-edit', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(28, 'class-teacher-delete', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(29, 'parents-list', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(30, 'parents-create', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(31, 'parents-edit', 'web', '2023-08-30 23:44:10', '2023-08-30 23:44:10'),
(32, 'parents-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(33, 'session-year-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(34, 'session-year-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(35, 'session-year-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(36, 'session-year-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(37, 'student-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(38, 'student-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(39, 'student-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(40, 'student-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(41, 'category-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(42, 'category-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(43, 'category-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(44, 'category-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(45, 'subject-teacher-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(46, 'subject-teacher-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(47, 'subject-teacher-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(48, 'subject-teacher-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(49, 'timetable-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(50, 'timetable-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(51, 'timetable-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(52, 'timetable-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(53, 'attendance-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(54, 'attendance-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(55, 'attendance-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(56, 'attendance-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(57, 'holiday-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(58, 'holiday-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(59, 'holiday-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(60, 'holiday-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(61, 'announcement-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(62, 'announcement-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(63, 'announcement-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(64, 'announcement-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(65, 'slider-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(66, 'slider-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(67, 'slider-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(68, 'slider-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(69, 'class-timetable', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(70, 'teacher-timetable', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(71, 'student-assignment', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(72, 'subject-lesson', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(73, 'class-attendance', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(74, 'exam-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(75, 'exam-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(76, 'exam-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(77, 'exam-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(78, 'exam-upload-marks', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(79, 'setting-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(80, 'fcm-setting-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(81, 'assignment-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(82, 'assignment-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(83, 'assignment-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(84, 'assignment-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(85, 'assignment-submission', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(86, 'email-setting-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(87, 'privacy-policy', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(88, 'contact-us', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(89, 'about-us', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(90, 'student-reset-password', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(91, 'reset-password-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(92, 'student-change-password', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(93, 'promote-student-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(94, 'promote-student-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(95, 'promote-student-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(96, 'promote-student-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(97, 'language-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(98, 'language-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(99, 'language-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(100, 'language-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(101, 'lesson-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(102, 'lesson-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(103, 'lesson-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(104, 'lesson-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(105, 'topic-list', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(106, 'topic-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(107, 'topic-edit', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(108, 'topic-delete', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(109, 'class-teacher', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(110, 'terms-condition', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(111, 'assign-class-to-new-student', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(112, 'exam-timetable-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(113, 'grade-create', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(114, 'update-admin-profile', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(115, 'exam-result', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(2, 'Teacher', 'web', '2023-08-30 23:44:11', '2023-08-30 23:44:11'),
(3, 'Parent', 'web', '2023-08-30 23:44:12', '2023-08-30 23:44:12'),
(4, 'Student', 'web', '2023-08-30 23:44:12', '2023-08-30 23:44:12');

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
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session_years`
--

CREATE TABLE `session_years` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, '2022-23', 1, '2022-06-01', '2023-04-30', '2023-08-30 23:44:23', '2023-08-30 23:44:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `message`) VALUES
(1, 'school_name', 'Internexa School'),
(2, 'school_email', 'admin@gmail.com'),
(3, 'school_phone', '9898125075'),
(4, 'school_address', 'India'),
(5, 'time_zone', 'Asia/Kolkata'),
(6, 'date_formate', 'd-m-Y'),
(7, 'time_formate', 'h:i A'),
(8, 'theme_color', '#4C5EA6'),
(9, 'system_version', '1.0.2'),
(10, 'session_year', '1'),
(11, 'school_tagline', 'school'),
(12, 'logo1', 'logo/TQqgNfkw68uPf3HUPOdc1PgwdIPHGyIvmBYtYBU7.svg'),
(13, 'logo2', 'logo/5Zq5Ay9Mt6aAPFkSeCb3U49PuD56bgpWE7yE0e5D.svg'),
(14, 'favicon', 'logo/rvF0JaTPJREU4OLfn6d5V4GInvqcjPpsxiVRhhoH.svg'),
(15, 'mail_mailer', 'smtp'),
(16, 'email_configration_verification', '1'),
(17, 'mail_host', 'sandbox.smtp.mailtrap.io'),
(18, 'mail_port', '2525'),
(19, 'mail_username', '90d1e03bde7844'),
(20, 'mail_password', '6162cd89bffce8'),
(21, 'mail_encryption', 'tls'),
(22, 'mail_send_from', 'kartikk4747@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `class_section_id` int NOT NULL,
  `category_id` int NOT NULL,
  `admission_no` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roll_number` int NOT NULL,
  `caste` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admission_date` date NOT NULL,
  `blood_group` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_new_admission` tinyint NOT NULL DEFAULT '1',
  `father_id` int DEFAULT NULL,
  `mother_id` int DEFAULT NULL,
  `guardian_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_color` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium_id` int NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Theory / Practical',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `qualification` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `note` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day` int NOT NULL COMMENT '1=monday,2=tuesday,3=wednesday,4=thursday,5=friday,6=saturday,7=sunday',
  `day_name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcm_id` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `current_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `reset_request` tinyint NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `email`, `fcm_id`, `email_verified_at`, `password`, `mobile`, `image`, `dob`, `current_address`, `permanent_address`, `status`, `reset_request`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Phoenix', 'Admin', 'male', 'superadmin@gmail.com', NULL, NULL, '$2y$10$CX8NYDJ7pj66eJx3fFQ9v.0hATHSOpbK2VlPPsEseXtX5Qdfr/F0i', '9898125075', 'user/UvlxZleDkdC5Io8NWyTaw8TerZjGI1o916sgcSir.svg', '1970-01-01', 'Drivein Road, Ahmedabad', 'Drivein Road, Ahmedabad', 1, 0, NULL, '2023-08-30 23:44:23', '2023-08-30 23:46:54', NULL);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_sections`
--
ALTER TABLE `class_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_subjects`
--
ALTER TABLE `class_subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elective_subject_groups`
--
ALTER TABLE `elective_subject_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_classes`
--
ALTER TABLE `exam_classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session_years`
--
ALTER TABLE `session_years`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_sessions`
--
ALTER TABLE `student_sessions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_subjects`
--
ALTER TABLE `student_subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
