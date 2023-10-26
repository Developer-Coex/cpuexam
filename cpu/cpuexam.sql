-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2023 at 06:46 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cpuexam`
--

-- --------------------------------------------------------

--
-- Table structure for table `cpu_answers`
--

CREATE TABLE `cpu_answers` (
  `answer_id` bigint(20) UNSIGNED NOT NULL,
  `answer_question_id` bigint(20) UNSIGNED NOT NULL,
  `answer_description` text COLLATE utf8_unicode_ci NOT NULL,
  `answer_explanation` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer_isright` tinyint(1) NOT NULL DEFAULT 0,
  `answer_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `answer_position` bigint(20) UNSIGNED DEFAULT NULL,
  `answer_keyboard_key` smallint(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_answers`
--

INSERT INTO `cpu_answers` (`answer_id`, `answer_question_id`, `answer_description`, `answer_explanation`, `answer_isright`, `answer_enabled`, `answer_position`, `answer_keyboard_key`) VALUES
(1, 1, 'Answer 1', NULL, 0, 1, NULL, NULL),
(2, 1, 'Answer 2', NULL, 0, 1, NULL, NULL),
(3, 1, 'Answer 3 [Right]', NULL, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cpu_modules`
--

CREATE TABLE `cpu_modules` (
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `module_user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_modules`
--

INSERT INTO `cpu_modules` (`module_id`, `module_name`, `module_enabled`, `module_user_id`) VALUES
(1, 'default', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cpu_questions`
--

CREATE TABLE `cpu_questions` (
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `question_subject_id` bigint(20) UNSIGNED NOT NULL,
  `question_description` text COLLATE utf8_unicode_ci NOT NULL,
  `question_explanation` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_type` smallint(3) UNSIGNED NOT NULL DEFAULT 1,
  `question_difficulty` smallint(6) NOT NULL DEFAULT 1,
  `question_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `question_position` bigint(20) UNSIGNED DEFAULT NULL,
  `question_timer` smallint(10) DEFAULT NULL,
  `question_fullscreen` tinyint(1) NOT NULL DEFAULT 0,
  `question_inline_answers` tinyint(1) NOT NULL DEFAULT 0,
  `question_auto_next` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_questions`
--

INSERT INTO `cpu_questions` (`question_id`, `question_subject_id`, `question_description`, `question_explanation`, `question_type`, `question_difficulty`, `question_enabled`, `question_position`, `question_timer`, `question_fullscreen`, `question_inline_answers`, `question_auto_next`) VALUES
(1, 1, 'This is Testing Question Number 1', NULL, 1, 1, 1, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cpu_sessions`
--

CREATE TABLE `cpu_sessions` (
  `cpsession_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `cpsession_expiry` datetime NOT NULL,
  `cpsession_data` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_sessions`
--

INSERT INTO `cpu_sessions` (`cpsession_id`, `cpsession_expiry`, `cpsession_data`) VALUES
('a8c8d78ad7d7fca31036dfcfb4f53865', '2023-10-03 14:47:17', 'session_hash|s:32:\"6690d9adddd9b81a6ddbb0275fcd2d12\";session_user_id|i:1;session_user_name|s:12:\"- [fca31036]\";session_user_ip|s:39:\"0000:0000:0000:0000:0000:ffff:7f00:0001\";session_user_level|i:0;session_user_firstname|s:0:\"\";session_user_lastname|s:0:\"\";session_test_login|s:0:\"\";session_last_visit|i:1696333552;logout|b:1;');

-- --------------------------------------------------------

--
-- Table structure for table `cpu_sslcerts`
--

CREATE TABLE `cpu_sslcerts` (
  `ssl_id` bigint(20) UNSIGNED NOT NULL,
  `ssl_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ssl_hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ssl_end_date` datetime NOT NULL,
  `ssl_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `ssl_user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cpu_subjects`
--

CREATE TABLE `cpu_subjects` (
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `subject_module_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `subject_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `subject_user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_subjects`
--

INSERT INTO `cpu_subjects` (`subject_id`, `subject_module_id`, `subject_name`, `subject_description`, `subject_enabled`, `subject_user_id`) VALUES
(1, 1, 'Topic for test', 'This topic is user for testing purpose', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cpu_testgroups`
--

CREATE TABLE `cpu_testgroups` (
  `tstgrp_test_id` bigint(20) UNSIGNED NOT NULL,
  `tstgrp_group_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_testgroups`
--

INSERT INTO `cpu_testgroups` (`tstgrp_test_id`, `tstgrp_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cpu_tests`
--

CREATE TABLE `cpu_tests` (
  `test_id` bigint(20) UNSIGNED NOT NULL,
  `test_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `test_description` text COLLATE utf8_unicode_ci NOT NULL,
  `test_begin_time` datetime DEFAULT NULL,
  `test_end_time` datetime DEFAULT NULL,
  `test_duration_time` smallint(10) UNSIGNED NOT NULL DEFAULT 0,
  `test_ip_range` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '*.*.*.*',
  `test_results_to_users` tinyint(1) NOT NULL DEFAULT 0,
  `test_report_to_users` tinyint(1) NOT NULL DEFAULT 0,
  `test_score_right` decimal(10,3) DEFAULT 1.000,
  `test_score_wrong` decimal(10,3) DEFAULT 0.000,
  `test_score_unanswered` decimal(10,3) DEFAULT 0.000,
  `test_max_score` decimal(10,3) NOT NULL DEFAULT 0.000,
  `test_user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `test_score_threshold` decimal(10,3) DEFAULT 0.000,
  `test_random_questions_select` tinyint(1) NOT NULL DEFAULT 1,
  `test_random_questions_order` tinyint(1) NOT NULL DEFAULT 1,
  `test_questions_order_mode` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `test_random_answers_select` tinyint(1) NOT NULL DEFAULT 1,
  `test_random_answers_order` tinyint(1) NOT NULL DEFAULT 1,
  `test_answers_order_mode` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `test_comment_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `test_menu_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `test_noanswer_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `test_mcma_radio` tinyint(1) NOT NULL DEFAULT 1,
  `test_repeatable` tinyint(4) NOT NULL DEFAULT 0,
  `test_mcma_partial_score` tinyint(1) NOT NULL DEFAULT 1,
  `test_logout_on_timeout` tinyint(1) NOT NULL DEFAULT 0,
  `test_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_tests`
--

INSERT INTO `cpu_tests` (`test_id`, `test_name`, `test_description`, `test_begin_time`, `test_end_time`, `test_duration_time`, `test_ip_range`, `test_results_to_users`, `test_report_to_users`, `test_score_right`, `test_score_wrong`, `test_score_unanswered`, `test_max_score`, `test_user_id`, `test_score_threshold`, `test_random_questions_select`, `test_random_questions_order`, `test_questions_order_mode`, `test_random_answers_select`, `test_random_answers_order`, `test_answers_order_mode`, `test_comment_enabled`, `test_menu_enabled`, `test_noanswer_enabled`, `test_mcma_radio`, `test_repeatable`, `test_mcma_partial_score`, `test_logout_on_timeout`, `test_password`) VALUES
(1, 'Example Test 1', 'This is Example Test for testing Purpose ', '2023-10-01 13:18:00', '2023-10-04 13:18:00', 60, '*.*.*.*', 1, 1, '1.000', '0.000', '0.000', '1.000', 2, '0.000', 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cpu_testsslcerts`
--

CREATE TABLE `cpu_testsslcerts` (
  `tstssl_test_id` bigint(20) UNSIGNED NOT NULL,
  `tstssl_ssl_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cpu_tests_logs`
--

CREATE TABLE `cpu_tests_logs` (
  `testlog_id` bigint(20) UNSIGNED NOT NULL,
  `testlog_testuser_id` bigint(20) UNSIGNED NOT NULL,
  `testlog_user_ip` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `testlog_question_id` bigint(20) UNSIGNED NOT NULL,
  `testlog_answer_text` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `testlog_score` decimal(10,3) DEFAULT NULL,
  `testlog_creation_time` datetime DEFAULT NULL,
  `testlog_display_time` datetime DEFAULT NULL,
  `testlog_change_time` datetime DEFAULT NULL,
  `testlog_reaction_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `testlog_order` smallint(6) NOT NULL DEFAULT 1,
  `testlog_num_answers` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `testlog_comment` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_tests_logs`
--

INSERT INTO `cpu_tests_logs` (`testlog_id`, `testlog_testuser_id`, `testlog_user_ip`, `testlog_question_id`, `testlog_answer_text`, `testlog_score`, `testlog_creation_time`, `testlog_display_time`, `testlog_change_time`, `testlog_reaction_time`, `testlog_order`, `testlog_num_answers`, `testlog_comment`) VALUES
(1, 1, '0000:0000:0000:0000:0000:ffff:7f00:0001', 1, NULL, '1.000', '2023-10-03 11:09:47', '2023-10-03 11:09:47', '2023-10-03 11:10:33', 3419, 1, 2, NULL),
(2, 2, '0000:0000:0000:0000:0000:ffff:7f00:0001', 1, NULL, '0.000', '2023-10-03 12:02:39', '2023-10-03 12:02:39', '2023-10-03 12:04:05', 85550, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cpu_tests_logs_answers`
--

CREATE TABLE `cpu_tests_logs_answers` (
  `logansw_testlog_id` bigint(20) UNSIGNED NOT NULL,
  `logansw_answer_id` bigint(20) UNSIGNED NOT NULL,
  `logansw_selected` smallint(6) NOT NULL DEFAULT -1,
  `logansw_order` smallint(6) NOT NULL DEFAULT 1,
  `logansw_position` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_tests_logs_answers`
--

INSERT INTO `cpu_tests_logs_answers` (`logansw_testlog_id`, `logansw_answer_id`, `logansw_selected`, `logansw_order`, `logansw_position`) VALUES
(1, 2, 0, 1, NULL),
(1, 3, 1, 2, NULL),
(2, 2, 1, 2, NULL),
(2, 3, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cpu_tests_users`
--

CREATE TABLE `cpu_tests_users` (
  `testuser_id` bigint(20) UNSIGNED NOT NULL,
  `testuser_test_id` bigint(20) UNSIGNED NOT NULL,
  `testuser_user_id` bigint(20) UNSIGNED NOT NULL,
  `testuser_status` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `testuser_creation_time` datetime NOT NULL,
  `testuser_comment` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_tests_users`
--

INSERT INTO `cpu_tests_users` (`testuser_id`, `testuser_test_id`, `testuser_user_id`, `testuser_status`, `testuser_creation_time`, `testuser_comment`) VALUES
(1, 1, 2, 4, '2023-10-03 11:09:47', 'Terminate Exam'),
(2, 1, 3, 4, '2023-10-03 12:02:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cpu_testuser_stat`
--

CREATE TABLE `cpu_testuser_stat` (
  `tus_id` bigint(20) UNSIGNED NOT NULL,
  `tus_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_testuser_stat`
--

INSERT INTO `cpu_testuser_stat` (`tus_id`, `tus_date`) VALUES
(1, '2023-10-03 11:09:47'),
(2, '2023-10-03 12:02:39');

-- --------------------------------------------------------

--
-- Table structure for table `cpu_test_subjects`
--

CREATE TABLE `cpu_test_subjects` (
  `subjset_tsubset_id` bigint(20) UNSIGNED NOT NULL,
  `subjset_subject_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_test_subjects`
--

INSERT INTO `cpu_test_subjects` (`subjset_tsubset_id`, `subjset_subject_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cpu_test_subject_set`
--

CREATE TABLE `cpu_test_subject_set` (
  `tsubset_id` bigint(20) UNSIGNED NOT NULL,
  `tsubset_test_id` bigint(20) UNSIGNED NOT NULL,
  `tsubset_type` smallint(6) NOT NULL DEFAULT 1,
  `tsubset_difficulty` smallint(6) NOT NULL DEFAULT 1,
  `tsubset_quantity` smallint(6) NOT NULL DEFAULT 1,
  `tsubset_answers` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_test_subject_set`
--

INSERT INTO `cpu_test_subject_set` (`tsubset_id`, `tsubset_test_id`, `tsubset_type`, `tsubset_difficulty`, `tsubset_quantity`, `tsubset_answers`) VALUES
(1, 1, 0, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cpu_users`
--

CREATE TABLE `cpu_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_regdate` datetime NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `user_firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_birthdate` date DEFAULT NULL,
  `user_birthplace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_regnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_ssn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_level` smallint(3) UNSIGNED NOT NULL DEFAULT 1,
  `user_verifycode` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_otpkey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_users`
--

INSERT INTO `cpu_users` (`user_id`, `user_name`, `user_password`, `user_email`, `user_regdate`, `user_ip`, `user_firstname`, `user_lastname`, `user_birthdate`, `user_birthplace`, `user_regnumber`, `user_ssn`, `user_level`, `user_verifycode`, `user_otpkey`) VALUES
(1, 'anonymous', '$2y$10$Uj0i8eUQibn5S7Q2cl8k8ecAzwrK333uG8PWYe9iqz2kig9Ql36g6', NULL, '2001-01-01 01:01:01', '0.0.0.0', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(2, 'admin', '$2y$10$f4hALLkUK06EgTQ8b1OWTu4JFvRTXRc0cxqSz5sKaLKhCNGeLemTO', NULL, '2001-01-01 01:01:01', '127.0.0.0', NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(3, 'root', '$2y$10$mSmIbnxwallE8JmxMb/XRO0ePUmgKBMcCpmIGQuFp0UYPIn954v22', NULL, '2023-10-02 13:23:44', '0000:0000:0000:0000:0000:ffff:7f00:0001', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '6W3VRJHTGNQSPTZL');

-- --------------------------------------------------------

--
-- Table structure for table `cpu_user_groups`
--

CREATE TABLE `cpu_user_groups` (
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_user_groups`
--

INSERT INTO `cpu_user_groups` (`group_id`, `group_name`) VALUES
(1, 'default');

-- --------------------------------------------------------

--
-- Table structure for table `cpu_usrgroups`
--

CREATE TABLE `cpu_usrgroups` (
  `usrgrp_user_id` bigint(20) UNSIGNED NOT NULL,
  `usrgrp_group_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cpu_usrgroups`
--

INSERT INTO `cpu_usrgroups` (`usrgrp_user_id`, `usrgrp_group_id`) VALUES
(2, 1),
(3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cpu_answers`
--
ALTER TABLE `cpu_answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `p_answer_question_id` (`answer_question_id`);

--
-- Indexes for table `cpu_modules`
--
ALTER TABLE `cpu_modules`
  ADD PRIMARY KEY (`module_id`),
  ADD UNIQUE KEY `ak_module_name` (`module_name`),
  ADD KEY `p_module_user_id` (`module_user_id`);

--
-- Indexes for table `cpu_questions`
--
ALTER TABLE `cpu_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `p_question_subject_id` (`question_subject_id`);

--
-- Indexes for table `cpu_sessions`
--
ALTER TABLE `cpu_sessions`
  ADD PRIMARY KEY (`cpsession_id`);

--
-- Indexes for table `cpu_sslcerts`
--
ALTER TABLE `cpu_sslcerts`
  ADD PRIMARY KEY (`ssl_id`);

--
-- Indexes for table `cpu_subjects`
--
ALTER TABLE `cpu_subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `ak_subject_name` (`subject_module_id`,`subject_name`),
  ADD KEY `p_subject_user_id` (`subject_user_id`);

--
-- Indexes for table `cpu_testgroups`
--
ALTER TABLE `cpu_testgroups`
  ADD PRIMARY KEY (`tstgrp_test_id`,`tstgrp_group_id`),
  ADD KEY `p_tstgrp_test_id` (`tstgrp_test_id`),
  ADD KEY `p_tstgrp_group_id` (`tstgrp_group_id`);

--
-- Indexes for table `cpu_tests`
--
ALTER TABLE `cpu_tests`
  ADD PRIMARY KEY (`test_id`),
  ADD UNIQUE KEY `ak_test_name` (`test_name`),
  ADD KEY `p_test_user_id` (`test_user_id`);

--
-- Indexes for table `cpu_testsslcerts`
--
ALTER TABLE `cpu_testsslcerts`
  ADD PRIMARY KEY (`tstssl_test_id`,`tstssl_ssl_id`),
  ADD KEY `p_tstssl_test_id` (`tstssl_test_id`),
  ADD KEY `p_tstssl_ssl_id` (`tstssl_ssl_id`);

--
-- Indexes for table `cpu_tests_logs`
--
ALTER TABLE `cpu_tests_logs`
  ADD PRIMARY KEY (`testlog_id`),
  ADD UNIQUE KEY `ak_testuser_question` (`testlog_testuser_id`,`testlog_question_id`),
  ADD KEY `p_testlog_question_id` (`testlog_question_id`),
  ADD KEY `p_testlog_testuser_id` (`testlog_testuser_id`);

--
-- Indexes for table `cpu_tests_logs_answers`
--
ALTER TABLE `cpu_tests_logs_answers`
  ADD PRIMARY KEY (`logansw_testlog_id`,`logansw_answer_id`),
  ADD KEY `p_logansw_answer_id` (`logansw_answer_id`),
  ADD KEY `p_logansw_testlog_id` (`logansw_testlog_id`);

--
-- Indexes for table `cpu_tests_users`
--
ALTER TABLE `cpu_tests_users`
  ADD PRIMARY KEY (`testuser_id`),
  ADD UNIQUE KEY `ak_testuser` (`testuser_test_id`,`testuser_user_id`,`testuser_status`),
  ADD KEY `p_testuser_user_id` (`testuser_user_id`),
  ADD KEY `p_testuser_test_id` (`testuser_test_id`);

--
-- Indexes for table `cpu_testuser_stat`
--
ALTER TABLE `cpu_testuser_stat`
  ADD PRIMARY KEY (`tus_id`);

--
-- Indexes for table `cpu_test_subjects`
--
ALTER TABLE `cpu_test_subjects`
  ADD PRIMARY KEY (`subjset_tsubset_id`,`subjset_subject_id`),
  ADD KEY `p_subjset_subject_id` (`subjset_subject_id`),
  ADD KEY `p_subjset_tsubset_id` (`subjset_tsubset_id`);

--
-- Indexes for table `cpu_test_subject_set`
--
ALTER TABLE `cpu_test_subject_set`
  ADD PRIMARY KEY (`tsubset_id`),
  ADD KEY `p_tsubset_test_id` (`tsubset_test_id`);

--
-- Indexes for table `cpu_users`
--
ALTER TABLE `cpu_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `ak_user_name` (`user_name`),
  ADD UNIQUE KEY `user_verifycode` (`user_verifycode`),
  ADD UNIQUE KEY `ak_user_regnumber` (`user_regnumber`),
  ADD UNIQUE KEY `ak_user_ssn` (`user_ssn`);

--
-- Indexes for table `cpu_user_groups`
--
ALTER TABLE `cpu_user_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `group_name` (`group_name`);

--
-- Indexes for table `cpu_usrgroups`
--
ALTER TABLE `cpu_usrgroups`
  ADD PRIMARY KEY (`usrgrp_user_id`,`usrgrp_group_id`),
  ADD KEY `p_usrgrp_user_id` (`usrgrp_user_id`),
  ADD KEY `p_usrgrp_group_id` (`usrgrp_group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cpu_answers`
--
ALTER TABLE `cpu_answers`
  MODIFY `answer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cpu_modules`
--
ALTER TABLE `cpu_modules`
  MODIFY `module_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cpu_questions`
--
ALTER TABLE `cpu_questions`
  MODIFY `question_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cpu_sslcerts`
--
ALTER TABLE `cpu_sslcerts`
  MODIFY `ssl_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cpu_subjects`
--
ALTER TABLE `cpu_subjects`
  MODIFY `subject_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cpu_tests`
--
ALTER TABLE `cpu_tests`
  MODIFY `test_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cpu_tests_logs`
--
ALTER TABLE `cpu_tests_logs`
  MODIFY `testlog_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cpu_tests_users`
--
ALTER TABLE `cpu_tests_users`
  MODIFY `testuser_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cpu_testuser_stat`
--
ALTER TABLE `cpu_testuser_stat`
  MODIFY `tus_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cpu_test_subject_set`
--
ALTER TABLE `cpu_test_subject_set`
  MODIFY `tsubset_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cpu_users`
--
ALTER TABLE `cpu_users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cpu_user_groups`
--
ALTER TABLE `cpu_user_groups`
  MODIFY `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cpu_answers`
--
ALTER TABLE `cpu_answers`
  ADD CONSTRAINT `cpu_answers_ibfk_1` FOREIGN KEY (`answer_question_id`) REFERENCES `cpu_questions` (`question_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cpu_modules`
--
ALTER TABLE `cpu_modules`
  ADD CONSTRAINT `cpu_modules_ibfk_1` FOREIGN KEY (`module_user_id`) REFERENCES `cpu_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cpu_questions`
--
ALTER TABLE `cpu_questions`
  ADD CONSTRAINT `cpu_questions_ibfk_1` FOREIGN KEY (`question_subject_id`) REFERENCES `cpu_subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cpu_subjects`
--
ALTER TABLE `cpu_subjects`
  ADD CONSTRAINT `cpu_subjects_ibfk_1` FOREIGN KEY (`subject_user_id`) REFERENCES `cpu_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cpu_subjects_ibfk_2` FOREIGN KEY (`subject_module_id`) REFERENCES `cpu_modules` (`module_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cpu_testgroups`
--
ALTER TABLE `cpu_testgroups`
  ADD CONSTRAINT `cpu_testgroups_ibfk_1` FOREIGN KEY (`tstgrp_test_id`) REFERENCES `cpu_tests` (`test_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cpu_testgroups_ibfk_2` FOREIGN KEY (`tstgrp_group_id`) REFERENCES `cpu_user_groups` (`group_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cpu_tests`
--
ALTER TABLE `cpu_tests`
  ADD CONSTRAINT `cpu_tests_ibfk_1` FOREIGN KEY (`test_user_id`) REFERENCES `cpu_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cpu_testsslcerts`
--
ALTER TABLE `cpu_testsslcerts`
  ADD CONSTRAINT `cpu_testsslcerts_ibfk_1` FOREIGN KEY (`tstssl_test_id`) REFERENCES `cpu_tests` (`test_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cpu_testsslcerts_ibfk_2` FOREIGN KEY (`tstssl_ssl_id`) REFERENCES `cpu_sslcerts` (`ssl_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cpu_tests_logs`
--
ALTER TABLE `cpu_tests_logs`
  ADD CONSTRAINT `cpu_tests_logs_ibfk_1` FOREIGN KEY (`testlog_question_id`) REFERENCES `cpu_questions` (`question_id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `cpu_tests_logs_ibfk_2` FOREIGN KEY (`testlog_testuser_id`) REFERENCES `cpu_tests_users` (`testuser_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cpu_tests_logs_answers`
--
ALTER TABLE `cpu_tests_logs_answers`
  ADD CONSTRAINT `cpu_tests_logs_answers_ibfk_1` FOREIGN KEY (`logansw_answer_id`) REFERENCES `cpu_answers` (`answer_id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `cpu_tests_logs_answers_ibfk_2` FOREIGN KEY (`logansw_testlog_id`) REFERENCES `cpu_tests_logs` (`testlog_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cpu_tests_users`
--
ALTER TABLE `cpu_tests_users`
  ADD CONSTRAINT `cpu_tests_users_ibfk_1` FOREIGN KEY (`testuser_user_id`) REFERENCES `cpu_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cpu_tests_users_ibfk_2` FOREIGN KEY (`testuser_test_id`) REFERENCES `cpu_tests` (`test_id`) ON DELETE CASCADE;

--
-- Constraints for table `cpu_test_subjects`
--
ALTER TABLE `cpu_test_subjects`
  ADD CONSTRAINT `cpu_test_subjects_ibfk_1` FOREIGN KEY (`subjset_subject_id`) REFERENCES `cpu_subjects` (`subject_id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `cpu_test_subjects_ibfk_2` FOREIGN KEY (`subjset_tsubset_id`) REFERENCES `cpu_test_subject_set` (`tsubset_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cpu_test_subject_set`
--
ALTER TABLE `cpu_test_subject_set`
  ADD CONSTRAINT `cpu_test_subject_set_ibfk_1` FOREIGN KEY (`tsubset_test_id`) REFERENCES `cpu_tests` (`test_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `cpu_usrgroups`
--
ALTER TABLE `cpu_usrgroups`
  ADD CONSTRAINT `cpu_usrgroups_ibfk_1` FOREIGN KEY (`usrgrp_user_id`) REFERENCES `cpu_users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cpu_usrgroups_ibfk_2` FOREIGN KEY (`usrgrp_group_id`) REFERENCES `cpu_user_groups` (`group_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
