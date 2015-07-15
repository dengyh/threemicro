-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2014-07-25 14:03:15
-- 服务器版本: 5.6.14
-- PHP 版本: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `three_micro_test`
--

-- --------------------------------------------------------

--
-- 表的结构 `activity_activity`
--

CREATE TABLE IF NOT EXISTS `activity_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_bin NOT NULL,
  `location` varchar(64) COLLATE utf8_bin NOT NULL,
  `status` varchar(16) COLLATE utf8_bin NOT NULL,
  `campus` varchar(16) COLLATE utf8_bin NOT NULL,
  `type` varchar(16) COLLATE utf8_bin NOT NULL,
  `sponsor` varchar(32) COLLATE utf8_bin NOT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL,
  `student_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `teacher_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `nowNumber` int(11) NOT NULL,
  `totalNumber` int(11) NOT NULL,
  `deadline` datetime NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime NOT NULL,
  `signDateTime` datetime NOT NULL,
  `maxTime` time NOT NULL,
  `isCompleted` tinyint(1) NOT NULL,
  `isReady` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_activity_94741166` (`student_id`),
  KEY `activity_activity_c12e9d48` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `activity_registrant`
--

CREATE TABLE IF NOT EXISTS `activity_registrant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `netid` varchar(16) COLLATE utf8_bin NOT NULL,
  `activity_id` int(11) NOT NULL,
  `registTime` datetime NOT NULL,
  `isPass` tinyint(1) NOT NULL,
  `isSelected` tinyint(1) NOT NULL,
  `isCompleted` tinyint(1) NOT NULL,
  `isStarted` tinyint(1) NOT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_registrant_8005e431` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `activity_submission`
--

CREATE TABLE IF NOT EXISTS `activity_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(32) COLLATE utf8_bin NOT NULL,
  `file` varchar(100) COLLATE utf8_bin NOT NULL,
  `activity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_submission_8005e431` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add site', 6, 'add_site'),
(17, 'Can change site', 6, 'change_site'),
(18, 'Can delete site', 6, 'delete_site'),
(19, 'Can add 公益活动', 7, 'add_activity'),
(20, 'Can change 公益活动', 7, 'change_activity'),
(21, 'Can delete 公益活动', 7, 'delete_activity'),
(22, 'Can add submission', 8, 'add_submission'),
(23, 'Can change submission', 8, 'change_submission'),
(24, 'Can delete submission', 8, 'delete_submission'),
(25, 'Can add 报名者', 9, 'add_registrant'),
(26, 'Can change 报名者', 9, 'change_registrant'),
(27, 'Can delete 报名者', 9, 'delete_registrant'),
(28, 'Can add 团委', 10, 'add_committee'),
(29, 'Can change 团委', 10, 'change_committee'),
(30, 'Can delete 团委', 10, 'delete_committee'),
(31, 'Can add 反馈', 11, 'add_feedback'),
(32, 'Can change 反馈', 11, 'change_feedback'),
(33, 'Can delete 反馈', 11, 'delete_feedback'),
(34, 'Can add 团委负责人', 12, 'add_principal'),
(35, 'Can change 团委负责人', 12, 'change_principal'),
(36, 'Can delete 团委负责人', 12, 'delete_principal'),
(37, 'Can add 学生', 13, 'add_student'),
(38, 'Can change 学生', 13, 'change_student'),
(39, 'Can delete 学生', 13, 'delete_student'),
(40, 'Can add 业务指导老师', 14, 'add_teacher'),
(41, 'Can change 业务指导老师', 14, 'change_teacher'),
(42, 'Can delete 业务指导老师', 14, 'delete_teacher');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$10000$taNwIuKn4GHg$qA2/xKr3qC5JZGtf6BhXTFPuDFIXfeUR/iGIiQchN5M=', '2014-07-25 08:30:49', 1, 'dengyh', '', '', 'dengyh071@gmail.com', 1, 1, '2014-07-25 08:30:49'),
(2, 'pbkdf2_sha256$10000$tQU3V4xEosvg$hARjZ6jdlZF8BDPJR0mTFj0RokcdX0iN5DTSSivXFkk=', '2014-07-25 10:53:42', 0, 'east', 'committee', 'east', '', 0, 1, '2014-07-25 10:53:42'),
(4, 'pbkdf2_sha256$10000$G2I3APjpralG$zf3AoXbfE01SS0ATZ3dRS4xivesX5T/+9cBmt2X5nOo=', '2014-07-25 10:55:16', 0, 'south', 'committee', 'south', '', 0, 1, '2014-07-25 10:55:16'),
(5, 'pbkdf2_sha256$10000$aumuMolXxu5b$beY8fGrMpaSxPYy0rkVe7IVdWb50uLciy/lfRZ0tA0k=', '2014-07-25 10:56:43', 0, 'north', 'committee', 'north', '', 0, 1, '2014-07-25 10:56:43'),
(6, 'pbkdf2_sha256$10000$w9uC0cB8a0zi$tok/GnsmBgDzDSgR/3LV8FqeFtRhAYX6D+o35/2JMU8=', '2014-07-25 10:57:01', 0, 'zhuhai', 'committee', 'zhuhai', '', 0, 1, '2014-07-25 10:57:01'),
(7, 'pbkdf2_sha256$10000$HEL2RXCmRnH3$5iVUCDC/3we3dKTqMKV4RENzk33D3+1F0wNmTvbSpjg=', '2014-07-25 11:07:31', 0, 'zgf', 'teacher', 'zgf', '', 0, 1, '2014-07-25 11:07:31'),
(8, 'pbkdf2_sha256$10000$boCTcQ9xhAJR$NjZDMEy0bvhZGic8VIq4Yu3IZ6fXTHmOmPuWmFtuktM=', '2014-07-25 11:07:52', 0, 'chy', 'teacher', 'chy', '', 0, 1, '2014-07-25 11:07:52'),
(9, 'pbkdf2_sha256$10000$EN1iTb06eA0e$EuSgQPlqLhcDHiiyS/JLB5FhvMT3ZLJtlc+RqBv/IZM=', '2014-07-25 11:08:15', 0, 'pml', 'teacher', 'pml', '', 0, 1, '2014-07-25 11:08:15'),
(10, 'pbkdf2_sha256$10000$FlIOwvl7X7f7$j6WBXUbGQrCDM5MIcCf1zaNNihNRi5ZBJf33g8s+Rlk=', '2014-07-25 11:08:49', 0, 'rjt', 'teacher', 'rjt', '', 0, 1, '2014-07-25 11:08:49'),
(11, 'pbkdf2_sha256$10000$any0yIwbviUm$yUViDVSwmw4UPq3RG4aEXB57QvVy48HKiUrYoSEWB2k=', '2014-07-25 11:09:03', 0, 'hxy', 'teacher', 'hxy', '', 0, 1, '2014-07-25 11:09:03'),
(12, 'pbkdf2_sha256$10000$TysFEOjQAxlr$RBl1k+TeQ/l4URD1csXEWby8m2QfvrSm0Szkawe/RDs=', '2014-07-25 11:09:14', 0, 'zsc', 'teacher', 'zsc', '', 0, 1, '2014-07-25 11:09:14'),
(13, 'pbkdf2_sha256$10000$gxlPKGDyQ1wc$pMRmRbo/Cqz0ZOTlXRjxCD2oDVNGhBcV54NfGTFbVss=', '2014-07-25 11:09:29', 0, 'ddp', 'teacher', 'ddp', '', 0, 1, '2014-07-25 11:09:29'),
(14, 'pbkdf2_sha256$10000$2BKQrm6Uil4V$Tj8Wk+1ZxsrqOszurXir1aOidnxEsSHFr5GlgobiYSo=', '2014-07-25 11:09:46', 0, 'dbf', 'teacher', 'dbf', '', 0, 1, '2014-07-25 11:09:46'),
(15, 'pbkdf2_sha256$10000$t7Wtxwd2zdEE$mk6H/+Z4cZfdzVTf2ddKlsIXlNrIVU1+6/YVdZ4YMfM=', '2014-07-25 11:17:02', 0, 'eastp', 'principal', 'east', '', 0, 1, '2014-07-25 11:17:02'),
(16, 'pbkdf2_sha256$10000$53Yq8NVPRgHU$kZZbItJyPLvRCqXcr/RU9rzxVhnwC7P4gKAahBupKx8=', '2014-07-25 11:17:20', 0, 'southp', 'principal', 'south', '', 0, 1, '2014-07-25 11:17:20'),
(17, 'pbkdf2_sha256$10000$GK5mTrCYehL9$0P+wE2olud92T6IgVAjwxTvbIUwq4gBpJTjrfcKHpLU=', '2014-07-25 11:17:47', 0, 'northp', 'principal', 'north', '', 0, 1, '2014-07-25 11:17:47'),
(18, 'pbkdf2_sha256$10000$tG4ziRAXJ1sv$LPkO+AgG+wiJyclQCAORf3KSsGXqAIAXeu/KTww4yu4=', '2014-07-25 11:18:04', 0, 'zhuhaip', 'principal', 'zhuhai', '', 0, 1, '2014-07-25 11:18:04'),
(19, 'pbkdf2_sha256$10000$bsiGf5NNNnLh$eUrZYQyPwHOjN9Oc8asetRx1ditrI0K5dJsfct+sb6s=', '2014-07-25 11:19:36', 0, 'allp', 'principal', 'all', '', 0, 1, '2014-07-25 11:19:36');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `committee_committee`
--

CREATE TABLE IF NOT EXISTS `committee_committee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(75) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `campus` varchar(16) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `committee_committee`
--

INSERT INTO `committee_committee` (`id`, `user_id`, `email`, `phone`, `campus`) VALUES
(1, 4, 'south@sysu.edu.cn', '075532958886', 'south'),
(2, 2, 'east@sysu.edu.cn', '075532958886', 'east'),
(3, 5, 'north@sysu.edu.cn', '075532958886', 'north'),
(4, 6, 'zhuhai@sysu.edu.cn', '075532958886', 'zhuhai');

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'site', 'sites', 'site'),
(7, '公益活动', 'activity', 'activity'),
(8, 'submission', 'activity', 'submission'),
(9, '报名者', 'activity', 'registrant'),
(10, '团委', 'committee', 'committee'),
(11, '反馈', 'feedback', 'feedback'),
(12, '团委负责人', 'principal', 'principal'),
(13, '学生', 'student', 'student'),
(14, '业务指导老师', 'teacher', 'teacher');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_bin NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- 表的结构 `feedback_feedback`
--

CREATE TABLE IF NOT EXISTS `feedback_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `netid` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL,
  `datetime` datetime NOT NULL,
  `campus` varchar(16) COLLATE utf8_bin NOT NULL,
  `name` varchar(16) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin NOT NULL,
  `isOpen` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `principal_principal`
--

CREATE TABLE IF NOT EXISTS `principal_principal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(75) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `campus` varchar(16) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `principal_principal`
--

INSERT INTO `principal_principal` (`id`, `user_id`, `email`, `phone`, `campus`) VALUES
(1, 16, 'southp@sysu.edu.cn', '075532958886', 'south'),
(2, 15, 'eastp@sysu.edu.cn', '075532958886', 'east'),
(3, 17, 'northp@sysu.edu.cn', '075532958886', 'north'),
(4, 18, 'zhuhaip@sysu.edu.cn', '075532958886', 'zhuhai'),
(5, 19, 'allp@sysu.edu.cn', '075532958886', 'all');

-- --------------------------------------------------------

--
-- 表的结构 `student_student`
--

CREATE TABLE IF NOT EXISTS `student_student` (
  `netid` varchar(16) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `registTimes` int(11) NOT NULL,
  `completeTimes` int(11) NOT NULL,
  `totalTime` decimal(5,1) NOT NULL,
  `lastTime` datetime NOT NULL,
  `lastLastTime` datetime NOT NULL,
  PRIMARY KEY (`netid`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `teacher_teacher`
--

CREATE TABLE IF NOT EXISTS `teacher_teacher` (
  `tno` varchar(16) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `committee_id` int(11) NOT NULL,
  PRIMARY KEY (`tno`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `teacher_teacher_75f552bd` (`committee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `teacher_teacher`
--

INSERT INTO `teacher_teacher` (`tno`, `name`, `email`, `phone`, `user_id`, `committee_id`) VALUES
('chy', 'chy', 'chy@sysu.edu.cn', '075532958886', 8, 1),
('dbf', 'dbf', 'dbf@sysu.edu.cn', '075532958886', 14, 4),
('ddp', 'ddp', 'ddp@sysu.edu.cn', '075532958886', 13, 4),
('hxy', 'hxy', 'hxy@sysu.edu.cn', '075532958886', 11, 3),
('pml', 'pml', 'pml@sysu.edu.cn', '075532958886', 9, 2),
('rjt', 'rjt', 'rjt@sysu.edu.cn', '075532958886', 10, 2),
('zgf', 'zgf', 'zgf@sysu.edu.cn', '075532958886', 7, 1),
('zsc', 'zsc', 'zsc@sysu.edu.cn', '075532958886', 12, 3);

--
-- 限制导出的表
--

--
-- 限制表 `activity_activity`
--
ALTER TABLE `activity_activity`
  ADD CONSTRAINT `teacher_id_refs_tno_be701b2b` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_teacher` (`tno`),
  ADD CONSTRAINT `student_id_refs_netid_a11bb343` FOREIGN KEY (`student_id`) REFERENCES `student_student` (`netid`);

--
-- 限制表 `activity_registrant`
--
ALTER TABLE `activity_registrant`
  ADD CONSTRAINT `activity_id_refs_id_1de58894` FOREIGN KEY (`activity_id`) REFERENCES `activity_activity` (`id`);

--
-- 限制表 `activity_submission`
--
ALTER TABLE `activity_submission`
  ADD CONSTRAINT `activity_id_refs_id_becedef4` FOREIGN KEY (`activity_id`) REFERENCES `activity_activity` (`id`);

--
-- 限制表 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- 限制表 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 限制表 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- 限制表 `committee_committee`
--
ALTER TABLE `committee_committee`
  ADD CONSTRAINT `user_id_refs_id_6cce0b1e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `principal_principal`
--
ALTER TABLE `principal_principal`
  ADD CONSTRAINT `user_id_refs_id_3e0547d5` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `student_student`
--
ALTER TABLE `student_student`
  ADD CONSTRAINT `user_id_refs_id_6e3649f6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `teacher_teacher`
--
ALTER TABLE `teacher_teacher`
  ADD CONSTRAINT `user_id_refs_id_6a090b7e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `committee_id_refs_id_0568ca9b` FOREIGN KEY (`committee_id`) REFERENCES `committee_committee` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
