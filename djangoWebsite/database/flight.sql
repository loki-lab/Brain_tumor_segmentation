-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 23, 2023 lúc 09:44 AM
-- Phiên bản máy phục vụ: 8.0.27
-- Phiên bản PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `flight`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add employee', 7, 'add_employee'),
(26, 'Can change employee', 7, 'change_employee'),
(27, 'Can delete employee', 7, 'delete_employee'),
(28, 'Can view employee', 7, 'view_employee'),
(29, 'Can add diseaseprogression', 8, 'add_diseaseprogression'),
(30, 'Can change diseaseprogression', 8, 'change_diseaseprogression'),
(31, 'Can delete diseaseprogression', 8, 'delete_diseaseprogression'),
(32, 'Can view diseaseprogression', 8, 'view_diseaseprogression'),
(33, 'Can add doctor', 9, 'add_doctor'),
(34, 'Can change doctor', 9, 'change_doctor'),
(35, 'Can delete doctor', 9, 'delete_doctor'),
(36, 'Can view doctor', 9, 'view_doctor'),
(37, 'Can add patient', 10, 'add_patient'),
(38, 'Can change patient', 10, 'change_patient'),
(39, 'Can delete patient', 10, 'delete_patient'),
(40, 'Can view patient', 10, 'view_patient'),
(41, 'Can add medicalappointmentschedule', 11, 'add_medicalappointmentschedule'),
(42, 'Can change medicalappointmentschedule', 11, 'change_medicalappointmentschedule'),
(43, 'Can delete medicalappointmentschedule', 11, 'delete_medicalappointmentschedule'),
(44, 'Can view medicalappointmentschedule', 11, 'view_medicalappointmentschedule'),
(45, 'Can add diseases', 12, 'add_diseases'),
(46, 'Can change diseases', 12, 'change_diseases'),
(47, 'Can delete diseases', 12, 'delete_diseases'),
(48, 'Can view diseases', 12, 'view_diseases'),
(49, 'Can add historypatient', 13, 'add_historypatient'),
(50, 'Can change historypatient', 13, 'change_historypatient'),
(51, 'Can delete historypatient', 13, 'delete_historypatient'),
(52, 'Can view historypatient', 13, 'view_historypatient'),
(53, 'Can add receptionist', 14, 'add_receptionist'),
(54, 'Can change receptionist', 14, 'change_receptionist'),
(55, 'Can delete receptionist', 14, 'delete_receptionist'),
(56, 'Can view receptionist', 14, 'view_receptionist'),
(57, 'Can add comment', 15, 'add_comment'),
(58, 'Can change comment', 15, 'change_comment'),
(59, 'Can delete comment', 15, 'delete_comment'),
(60, 'Can view comment', 15, 'view_comment'),
(61, 'Can add profile', 16, 'add_profile'),
(62, 'Can change profile', 16, 'change_profile'),
(63, 'Can delete profile', 16, 'delete_profile'),
(64, 'Can view profile', 16, 'view_profile');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$kDUaIevX1cmrlAx8CaF1Ke$Kj0FEw77LUfmWhTexUQzE1577dn4JTFQVCzWX8nIhBw=', '2023-07-03 07:58:35.000000', 1, 'test', 'manh', 'duong', 'test@gmail.com', 1, 1, '2023-07-03 07:58:21.000000'),
(2, 'pbkdf2_sha256$390000$Vx4eXSeoxPIRmc8M7bGNaT$0USJCGlI9lZAtTSVnZttSgY1PI6fGEwVk7aC14xoZAE=', '2023-07-23 09:29:20.631789', 1, 'admin1', 'manh', 'duong', 'admin1@gmail.com', 1, 1, '2023-07-04 07:27:17.000000'),
(3, 'pbkdf2_sha256$390000$7YDvutqbpM6f4RKTo8UpWq$GuAW0ItDvSMA89twAr9qr3+yXWipMdej+QXQZV38/4Y=', '2023-07-05 09:08:28.113251', 0, 'test001', 'test', 'er', 'testler001@gmail.com', 0, 1, '2023-07-04 21:05:28.000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 3, 3),
(4, 3, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 3, 15),
(16, 3, 16),
(17, 3, 17),
(18, 3, 18),
(19, 3, 19),
(20, 3, 20),
(21, 3, 21),
(22, 3, 22),
(23, 3, 23),
(24, 3, 24),
(25, 3, 25),
(26, 3, 26),
(27, 3, 27),
(28, 3, 28),
(29, 3, 29),
(30, 3, 30),
(31, 3, 31),
(32, 3, 32),
(33, 3, 33),
(34, 3, 34),
(35, 3, 35),
(36, 3, 36),
(37, 3, 37),
(38, 3, 38),
(39, 3, 39),
(40, 3, 40),
(41, 3, 41),
(42, 3, 42),
(43, 3, 43),
(44, 3, 44),
(45, 3, 45),
(46, 3, 46),
(47, 3, 47),
(48, 3, 48),
(49, 3, 49),
(50, 3, 50),
(51, 3, 51),
(52, 3, 52),
(53, 3, 53),
(54, 3, 54),
(55, 3, 55),
(56, 3, 56),
(57, 3, 57),
(58, 3, 58),
(59, 3, 59),
(60, 3, 60);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-07-03 08:01:58.737482', '6', 'Employee object (6)', 2, '[{\"changed\": {\"fields\": [\"Venue image\"]}}]', 7, 1),
(2, '2023-07-03 08:14:20.525010', '8', 'Employee object (8)', 2, '[{\"changed\": {\"fields\": [\"Venue image\"]}}]', 7, 1),
(3, '2023-07-03 08:18:06.167725', '7', 'Employee object (7)', 2, '[{\"changed\": {\"fields\": [\"Venue image\"]}}]', 7, 1),
(4, '2023-07-03 10:07:24.055352', '1', 'tranbahung', 1, '[{\"added\": {}}]', 9, 1),
(5, '2023-07-03 10:07:46.910087', '1', 'Đào Mẫu Sơn', 1, '[{\"added\": {}}]', 10, 1),
(6, '2023-07-03 10:08:09.267543', '1', 'asdasd', 1, '[{\"added\": {}}]', 15, 1),
(7, '2023-07-04 12:34:12.299983', '2', 'gjgh', 1, '[{\"added\": {}}]', 15, 2),
(8, '2023-07-04 18:34:59.094943', '3', 'lonmanis', 1, '[{\"added\": {}}]', 15, 2),
(9, '2023-07-04 21:05:28.710455', '3', 'test001', 1, '[{\"added\": {}}]', 4, 2),
(10, '2023-07-04 21:05:49.786525', '3', 'test001', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"User permissions\"]}}]', 4, 2),
(11, '2023-07-05 08:45:28.961594', '1', 'test001', 1, '[{\"added\": {}}]', 16, 2),
(12, '2023-07-05 18:35:36.673252', '2', 'dương', 1, '[{\"added\": {}}]', 9, 2),
(13, '2023-07-20 00:53:01.435246', '2', 'admin1', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 2),
(14, '2023-07-20 00:53:18.859718', '1', 'test', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 2),
(15, '2023-07-20 01:18:09.217707', '2', 'dương', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 9, 2),
(16, '2023-07-20 01:18:43.985561', '1', 'tranbahung', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 9, 2),
(17, '2023-07-20 01:19:32.446244', '2', 'Hiếu', 2, '[{\"changed\": {\"fields\": [\"Name\", \"NameLogin\"]}}]', 9, 2),
(18, '2023-07-20 01:20:19.204566', '1', 'BS01', 2, '[{\"changed\": {\"fields\": [\"Name\", \"NameLogin\", \"Faculty\"]}}]', 9, 2),
(19, '2023-07-20 01:20:35.634384', '2', 'BS00', 2, '[{\"changed\": {\"fields\": [\"NameLogin\"]}}]', 9, 2),
(20, '2023-07-20 02:50:43.824109', '3', 'Đào Mẫu Sơn', 1, '[{\"added\": {}}]', 10, 2),
(21, '2023-07-21 17:57:40.638412', '4', 'Đào Mẫu Sơn', 1, '[{\"added\": {}}]', 10, 2),
(22, '2023-07-21 17:57:50.016644', '4', 'Đào Mẫu Sơn', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 2),
(23, '2023-07-21 18:02:31.416346', '4', 'Đào Mẫu Sơn', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 2),
(24, '2023-07-21 18:02:36.940476', '4', 'Đào Mẫu Sơn', 2, '[]', 10, 2),
(25, '2023-07-21 18:02:44.220952', '4', 'Đào Mẫu Sơn', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 2),
(26, '2023-07-21 18:06:02.159731', '4', 'Đào Mẫu Sơn', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 2),
(27, '2023-07-22 08:58:59.386234', '17', 'asdasd', 1, '[{\"added\": {}}]', 10, 2),
(28, '2023-07-22 08:59:21.225427', '17', 'asdasd', 2, '[{\"changed\": {\"fields\": [\"DoctorID\"]}}]', 10, 2),
(29, '2023-07-22 08:59:40.952392', '17', 'asdasd', 2, '[{\"changed\": {\"fields\": [\"DoctorID\"]}}]', 10, 2),
(30, '2023-07-22 17:26:14.792335', '22', '[\'Name\']', 3, '', 10, 2),
(31, '2023-07-22 17:26:20.631718', '21', '[\'Name\']', 3, '', 10, 2),
(32, '2023-07-22 17:41:54.336416', '20', '[\'Name\']', 3, '', 10, 2),
(33, '2023-07-22 17:41:59.890454', '18', '[\'Name\']', 3, '', 10, 2),
(34, '2023-07-22 17:42:06.516912', '19', '[\'Name\']', 3, '', 10, 2),
(35, '2023-07-22 17:47:56.200111', '24', 'test2', 3, '', 10, 2),
(36, '2023-07-22 18:31:29.920704', '36', 'test4', 3, '', 10, 2),
(37, '2023-07-22 18:31:29.926802', '35', 'test4', 3, '', 10, 2),
(38, '2023-07-22 18:31:29.928801', '34', 'test4', 3, '', 10, 2),
(39, '2023-07-22 18:31:29.932759', '33', 'test4', 3, '', 10, 2),
(40, '2023-07-22 18:31:29.936758', '32', 'test4', 3, '', 10, 2),
(41, '2023-07-22 18:31:29.938783', '31', 'test4', 3, '', 10, 2),
(42, '2023-07-22 18:31:29.941081', '30', 'test3', 3, '', 10, 2),
(43, '2023-07-22 18:31:29.943016', '29', 'test3', 3, '', 10, 2),
(44, '2023-07-22 18:31:29.944983', '28', 'test3', 3, '', 10, 2),
(45, '2023-07-22 18:31:29.946883', '27', 'test3', 3, '', 10, 2),
(46, '2023-07-22 18:31:29.948884', '26', 'test3', 3, '', 10, 2),
(47, '2023-07-22 18:31:29.951428', '25', 'test2', 3, '', 10, 2),
(48, '2023-07-22 18:31:29.953737', '23', 'test', 3, '', 10, 2),
(49, '2023-07-22 19:17:12.128918', '48', 'test2', 3, '', 10, 2),
(50, '2023-07-22 19:17:12.137893', '47', 'test2', 3, '', 10, 2),
(51, '2023-07-22 19:17:12.140900', '46', 'test2', 3, '', 10, 2),
(52, '2023-07-22 19:17:12.143671', '45', 'test2', 3, '', 10, 2),
(53, '2023-07-22 19:17:12.146410', '44', 'test2', 3, '', 10, 2),
(54, '2023-07-22 19:17:12.149031', '43', 'test2', 3, '', 10, 2),
(55, '2023-07-22 19:17:12.151032', '42', 'test2', 3, '', 10, 2),
(56, '2023-07-22 19:17:12.155683', '41', 'test2', 3, '', 10, 2),
(57, '2023-07-22 19:17:12.159681', '40', 'test2', 3, '', 10, 2),
(58, '2023-07-22 19:17:12.162066', '39', 'test2', 3, '', 10, 2),
(59, '2023-07-22 19:17:12.164478', '38', 'test2', 3, '', 10, 2),
(60, '2023-07-22 19:17:12.166525', '37', 'test4', 3, '', 10, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(15, 'myapp', 'comment'),
(8, 'myapp', 'diseaseprogression'),
(12, 'myapp', 'diseases'),
(9, 'myapp', 'doctor'),
(7, 'myapp', 'employee'),
(13, 'myapp', 'historypatient'),
(11, 'myapp', 'medicalappointmentschedule'),
(10, 'myapp', 'patient'),
(16, 'myapp', 'profile'),
(14, 'myapp', 'receptionist'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-06-22 08:42:23.910964'),
(2, 'auth', '0001_initial', '2023-06-22 08:42:24.491864'),
(3, 'admin', '0001_initial', '2023-06-22 08:42:24.684488'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-06-22 08:42:24.699118'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-22 08:42:24.718235'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-06-22 08:42:24.892203'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-06-22 08:42:24.957222'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-06-22 08:42:24.991827'),
(9, 'auth', '0004_alter_user_username_opts', '2023-06-22 08:42:25.006834'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-06-22 08:42:25.070929'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-06-22 08:42:25.074930'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-06-22 08:42:25.087440'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-06-22 08:42:25.163369'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-06-22 08:42:25.236458'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-06-22 08:42:25.271911'),
(16, 'auth', '0011_update_proxy_permissions', '2023-06-22 08:42:25.285868'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-06-22 08:42:25.376914'),
(18, 'myapp', '0001_initial', '2023-06-22 08:42:25.408023'),
(19, 'sessions', '0001_initial', '2023-06-22 08:42:25.448899'),
(20, 'myapp', '0002_employee_venue_image', '2023-07-03 07:48:47.514805'),
(21, 'myapp', '0003_doctor_receptionist_patient_and_more', '2023-07-03 10:04:55.700071'),
(22, 'myapp', '0004_alter_comment_date_alter_comment_mriimages_profile', '2023-07-05 08:17:57.583950'),
(23, 'myapp', '0005_remove_historypatient_patientid_and_more', '2023-07-21 19:33:26.551338'),
(24, 'myapp', '0006_alter_patient_images', '2023-07-21 19:49:33.999331'),
(25, 'myapp', '0007_alter_patient_images', '2023-07-21 19:55:03.007073'),
(26, 'myapp', '0008_remove_patient_images_patient_image_and_more', '2023-07-21 20:08:30.258743'),
(27, 'myapp', '0009_remove_historypatient_patientid_and_more', '2023-07-21 20:08:30.719136'),
(28, 'myapp', '0010_alter_doctor_image_alter_patient_images', '2023-07-22 10:21:21.725730');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1ze8kfh9nl9jrwak20nmgyej5qq5bi9a', '.eJxVjEEOwiAQRe_C2hAKdGBcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEWWpx-t0jpwW0H-U7tNss0t3WZotwVedAur3Pm5-Vw_w4q9fqtFQwewI_JgCoGYzRZAyuwiM6gVU5ZR1EXjkysjUYDpBE9lyGVkYt4fwCzQDdZ:1qHu84:nVXPKOtHmZJ3Z6t5jZqKKB8LWpMf-s0UnxN7_mq2Izw', '2023-07-21 22:40:44.745753'),
('2etnqicjsxgdvz1ie93mw05wutmqs3j8', '.eJxVjEEOwiAQRe_C2hAKdGBcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEWWpx-t0jpwW0H-U7tNss0t3WZotwVedAur3Pm5-Vw_w4q9fqtFQwewI_JgCoGYzRZAyuwiM6gVU5ZR1EXjkysjUYDpBE9lyGVkYt4fwCzQDdZ:1qNVOy:v6niaeTJexRnSF_i2yxF0Br03QPRqfUYA-ZYcvYkzGc', '2023-08-06 09:29:20.670794'),
('kjdf6gvynwc1wqe17jrho4q3jil92xd5', '.eJxVjMEOwiAQRP-FsyFAYWU9eu83kIVFqRpISnsy_rtt0oPeJvPezFsEWpcS1p7nMLG4CC1Ov12k9Mx1B_ygem8ytbrMU5S7Ig_a5dg4v66H-3dQqJdtbbRiThGIUN-Qt5AZ7VlBcto5j4RglEkKoyb2PinwNjqAAS1Y1oP4fAHopjdE:1qGESB:ZR6alEJ6lY8QpJbYQvWKtuRxpX9vYUTRiw9y_s8g4tU', '2023-07-17 07:58:35.936670'),
('ljm5042exdhmvml61lwypl4uaglzrz9g', '.eJxVjEEOwiAQRe_C2hAKdGBcuvcMZIBBqoYmpV0Z765NutDtf-_9lwi0rTVsnZcwZXEWWpx-t0jpwW0H-U7tNss0t3WZotwVedAur3Pm5-Vw_w4q9fqtFQwewI_JgCoGYzRZAyuwiM6gVU5ZR1EXjkysjUYDpBE9lyGVkYt4fwCzQDdZ:1qGlfP:fwXHfkaNeZ_3lfwLT5s-zwRUGERektITLRTl6l_OBck', '2023-07-18 19:26:27.912525');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `myapp_comment`
--

CREATE TABLE `myapp_comment` (
  `id` bigint NOT NULL,
  `NameOfDisease` varchar(255) NOT NULL,
  `Date` date DEFAULT NULL,
  `ResultByDoctor` longtext NOT NULL,
  `DoctorID_id` bigint NOT NULL,
  `PatientID_id` bigint NOT NULL,
  `InputImage` varchar(100) DEFAULT NULL,
  `OutputImage` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `myapp_comment`
--

INSERT INTO `myapp_comment` (`id`, `NameOfDisease`, `Date`, `ResultByDoctor`, `DoctorID_id`, `PatientID_id`, `InputImage`, `OutputImage`) VALUES
(12, 'sdasd', '2023-07-20', 'asdasfasf', 1, 17, 'media/650814_WH0clwl.jpg', 'media/56-562038_kaito-kid-chibi_aIcqwOu.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `myapp_diseases`
--

CREATE TABLE `myapp_diseases` (
  `id` bigint NOT NULL,
  `NameDiseases` varchar(255) NOT NULL,
  `DoctorID_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `myapp_doctor`
--

CREATE TABLE `myapp_doctor` (
  `id` bigint NOT NULL,
  `name` varchar(30) NOT NULL,
  `NameLogin` varchar(255) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Faculty` varchar(255) NOT NULL,
  `Image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `myapp_doctor`
--

INSERT INTO `myapp_doctor` (`id`, `name`, `NameLogin`, `Password`, `Faculty`, `Image`) VALUES
(1, 'Trần Bá Hùng', 'BS01', '123', 'Phòng hồi sức cấp cứu', 'dfsf.jpg'),
(2, 'Nguyễn Thương Hiếu', 'BS00', '123', 'Phòng hồi sức cấp cứu', 'lovepik-doctor-image-png-image_401633016_wh1200.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `myapp_patient`
--

CREATE TABLE `myapp_patient` (
  `id` bigint NOT NULL,
  `Name` varchar(30) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `ExamDate` datetime(6) NOT NULL,
  `DoctorID_id` bigint NOT NULL,
  `images` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `myapp_patient`
--

INSERT INTO `myapp_patient` (`id`, `Name`, `DateOfBirth`, `ExamDate`, `DoctorID_id`, `images`) VALUES
(16, 'alhsdjnas', '2023-07-20', '2023-07-13 15:26:00.000000', 1, '362374312_599681778707331_5841194601186820181_n.png'),
(17, 'asdasd', '2023-07-26', '2023-07-11 08:58:55.000000', 1, 'media/2023-06-09_003813.png'),
(49, 'test2', '2023-07-20', '2023-07-13 15:26:00.000000', 1, 'media/1079551_LnxHn8N_0cH7M8h.png'),
(50, 'test2', '2023-07-20', '2023-07-13 15:26:00.000000', 1, 'media/1079551_LnxHn8N_qHTLlIB.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `myapp_profile`
--

CREATE TABLE `myapp_profile` (
  `id` bigint NOT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `myapp_profile`
--

INSERT INTO `myapp_profile` (`id`, `profile_image`, `user_id`) VALUES
(1, 'profiles/769526.png', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `myapp_receptionist`
--

CREATE TABLE `myapp_receptionist` (
  `id` bigint NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `NameLogin` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblemployee`
--

CREATE TABLE `tblemployee` (
  `id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `venue_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `tblemployee`
--

INSERT INTO `tblemployee` (`id`, `name`, `email`, `contact`, `venue_image`) VALUES
(6, 'test', 'testler911@gmail.com', 'test', 'images/650814.jpg'),
(7, 'manh duong', 'testler911@gmail.com', 'fdsdf', 'images/1079551.png'),
(8, 'foodmountain', 'testler911@gmail.com', 'ditmemay', 'images/1011170.png'),
(13, 'ss', 'aasss@gmail.com', 'a', ''),
(14, 'Sample 102', 'ducmanhbs2002@gmail.com', 'asad', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `myapp_comment`
--
ALTER TABLE `myapp_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_comment_DoctorID_id_2406772f_fk_myapp_doctor_id` (`DoctorID_id`),
  ADD KEY `myapp_comment_PatientID_id_a85181a0_fk_myapp_patient_id` (`PatientID_id`);

--
-- Chỉ mục cho bảng `myapp_diseases`
--
ALTER TABLE `myapp_diseases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_diseases_DoctorID_id_3591ceee_fk_myapp_doctor_id` (`DoctorID_id`);

--
-- Chỉ mục cho bảng `myapp_doctor`
--
ALTER TABLE `myapp_doctor`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `myapp_patient`
--
ALTER TABLE `myapp_patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_patient_DoctorID_id_94295d94_fk_myapp_doctor_id` (`DoctorID_id`);

--
-- Chỉ mục cho bảng `myapp_profile`
--
ALTER TABLE `myapp_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `myapp_receptionist`
--
ALTER TABLE `myapp_receptionist`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblemployee`
--
ALTER TABLE `tblemployee`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `myapp_comment`
--
ALTER TABLE `myapp_comment`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `myapp_diseases`
--
ALTER TABLE `myapp_diseases`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `myapp_doctor`
--
ALTER TABLE `myapp_doctor`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `myapp_patient`
--
ALTER TABLE `myapp_patient`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `myapp_profile`
--
ALTER TABLE `myapp_profile`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `myapp_receptionist`
--
ALTER TABLE `myapp_receptionist`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tblemployee`
--
ALTER TABLE `tblemployee`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `myapp_comment`
--
ALTER TABLE `myapp_comment`
  ADD CONSTRAINT `myapp_comment_DoctorID_id_2406772f_fk_myapp_doctor_id` FOREIGN KEY (`DoctorID_id`) REFERENCES `myapp_doctor` (`id`),
  ADD CONSTRAINT `myapp_comment_PatientID_id_a85181a0_fk_myapp_patient_id` FOREIGN KEY (`PatientID_id`) REFERENCES `myapp_patient` (`id`);

--
-- Các ràng buộc cho bảng `myapp_diseases`
--
ALTER TABLE `myapp_diseases`
  ADD CONSTRAINT `myapp_diseases_DoctorID_id_3591ceee_fk_myapp_doctor_id` FOREIGN KEY (`DoctorID_id`) REFERENCES `myapp_doctor` (`id`);

--
-- Các ràng buộc cho bảng `myapp_patient`
--
ALTER TABLE `myapp_patient`
  ADD CONSTRAINT `myapp_patient_DoctorID_id_94295d94_fk_myapp_doctor_id` FOREIGN KEY (`DoctorID_id`) REFERENCES `myapp_doctor` (`id`);

--
-- Các ràng buộc cho bảng `myapp_profile`
--
ALTER TABLE `myapp_profile`
  ADD CONSTRAINT `myapp_profile_user_id_9fe34268_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
