-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2014-08-22 11:10:49
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
  `deadline` datetime DEFAULT NULL,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  `signDateTime` datetime NOT NULL,
  `maxTime` int(11) NOT NULL,
  `isCompleted` tinyint(1) NOT NULL,
  `isReady` tinyint(1) NOT NULL,
  `firstRemark` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `secondRemark` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_activity_94741166` (`student_id`),
  KEY `activity_activity_c12e9d48` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `activity_location`
--

CREATE TABLE IF NOT EXISTS `activity_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `campus` varchar(16) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `activity_location`
--

INSERT INTO `activity_location` (`id`, `name`, `campus`) VALUES
(1, '明德学生活动中心', 'east'),
(2, '事务办舞蹈排练室', 'east'),
(3, '323会议室', 'east'),
(4, '324会议室', 'east'),
(5, '325会议室', 'east'),
(6, '326会议室', 'east'),
(7, '会议室', 'east'),
(8, '舞蹈室', 'east'),
(9, '音乐练习室', 'east'),
(10, '排练创作室', 'east'),
(11, '乐队练习室（1,2）', 'east'),
(12, '钢琴室（1~8）', 'east'),
(13, '乐团排练室', 'east'),
(14, '绘画室', 'east'),
(15, '录音室', 'east'),
(16, '讨论室（1~3）', 'east'),
(17, '文化沙龙', 'east'),
(18, '音乐沙龙', 'east'),
(19, '314会议室', 'south'),
(20, '401会议室', 'south'),
(21, '202音乐室', 'south'),
(22, '207公益社团会议室', 'south'),
(23, '榕园正厅', 'zhuhai'),
(24, '榕园偏厅', 'zhuhai'),
(25, '舞蹈室', 'zhuhai'),
(26, 'ET舞蹈室', 'zhuhai'),
(27, '文化沙龙室', 'zhuhai'),
(28, '桌球室', 'zhuhai'),
(29, '音乐教室', 'zhuhai'),
(30, '1饭广场', 'north'),
(31, '讲学厅', 'north'),
(32, '排练厅', 'north'),
(33, '会议室', 'north');

-- --------------------------------------------------------

--
-- 表的结构 `activity_occupation`
--

CREATE TABLE IF NOT EXISTS `activity_occupation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `isValid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_occupation_afbb987d` (`location_id`),
  KEY `activity_occupation_8005e431` (`activity_id`)
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
  `isMachine` tinyint(1) NOT NULL,
  `isCompleted` tinyint(1) NOT NULL,
  `isStarted` tinyint(1) NOT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `time` int(11) NOT NULL,
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
  `type` varchar(16) COLLATE utf8_bin NOT NULL,
  `time` varchar(64) COLLATE utf8_bin NOT NULL,
  `location` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `number` int(11) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=89 ;

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
(10, 'Can view group', 2, 'view_group'),
(11, 'Can view permission', 1, 'view_permission'),
(12, 'Can view user', 3, 'view_user'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add site', 6, 'add_site'),
(22, 'Can change site', 6, 'change_site'),
(23, 'Can delete site', 6, 'delete_site'),
(24, 'Can view site', 6, 'view_site'),
(25, 'Can add 公益活动', 7, 'add_activity'),
(26, 'Can change 公益活动', 7, 'change_activity'),
(27, 'Can delete 公益活动', 7, 'delete_activity'),
(28, 'Can add 附件', 8, 'add_submission'),
(29, 'Can change 附件', 8, 'change_submission'),
(30, 'Can delete 附件', 8, 'delete_submission'),
(31, 'Can add 报名者', 9, 'add_registrant'),
(32, 'Can change 报名者', 9, 'change_registrant'),
(33, 'Can delete 报名者', 9, 'delete_registrant'),
(34, 'Can add 活动地点', 10, 'add_location'),
(35, 'Can change 活动地点', 10, 'change_location'),
(36, 'Can delete 活动地点', 10, 'delete_location'),
(37, 'Can add 占用场地', 11, 'add_occupation'),
(38, 'Can change 占用场地', 11, 'change_occupation'),
(39, 'Can delete 占用场地', 11, 'delete_occupation'),
(40, 'Can view 公益活动', 7, 'view_activity'),
(41, 'Can view 占用场地', 11, 'view_occupation'),
(42, 'Can view 报名者', 9, 'view_registrant'),
(43, 'Can view 活动地点', 10, 'view_location'),
(44, 'Can view 附件', 8, 'view_submission'),
(45, 'Can add 团委', 12, 'add_committee'),
(46, 'Can change 团委', 12, 'change_committee'),
(47, 'Can delete 团委', 12, 'delete_committee'),
(48, 'Can add 社团', 13, 'add_societies'),
(49, 'Can change 社团', 13, 'change_societies'),
(50, 'Can delete 社团', 13, 'delete_societies'),
(51, 'Can view 团委', 12, 'view_committee'),
(52, 'Can view 社团', 13, 'view_societies'),
(53, 'Can add 反馈', 14, 'add_feedback'),
(54, 'Can change 反馈', 14, 'change_feedback'),
(55, 'Can delete 反馈', 14, 'delete_feedback'),
(56, 'Can view 反馈', 14, 'view_feedback'),
(57, 'Can add 团委负责人', 15, 'add_principal'),
(58, 'Can change 团委负责人', 15, 'change_principal'),
(59, 'Can delete 团委负责人', 15, 'delete_principal'),
(60, 'Can view 团委负责人', 15, 'view_principal'),
(61, 'Can add 学生', 16, 'add_student'),
(62, 'Can change 学生', 16, 'change_student'),
(63, 'Can delete 学生', 16, 'delete_student'),
(64, 'Can view 学生', 16, 'view_student'),
(65, 'Can add 业务指导老师', 17, 'add_teacher'),
(66, 'Can change 业务指导老师', 17, 'change_teacher'),
(67, 'Can delete 业务指导老师', 17, 'delete_teacher'),
(68, 'Can view 业务指导老师', 17, 'view_teacher'),
(69, 'Can add log entry', 18, 'add_logentry'),
(70, 'Can change log entry', 18, 'change_logentry'),
(71, 'Can delete log entry', 18, 'delete_logentry'),
(72, 'Can view log entry', 18, 'view_logentry'),
(73, 'Can add Bookmark', 19, 'add_bookmark'),
(74, 'Can change Bookmark', 19, 'change_bookmark'),
(75, 'Can delete Bookmark', 19, 'delete_bookmark'),
(76, 'Can add User Setting', 20, 'add_usersettings'),
(77, 'Can change User Setting', 20, 'change_usersettings'),
(78, 'Can delete User Setting', 20, 'delete_usersettings'),
(79, 'Can add User Widget', 21, 'add_userwidget'),
(80, 'Can change User Widget', 21, 'change_userwidget'),
(81, 'Can delete User Widget', 21, 'delete_userwidget'),
(82, 'Can view Bookmark', 19, 'view_bookmark'),
(83, 'Can view User Setting', 20, 'view_usersettings'),
(84, 'Can view User Widget', 21, 'view_userwidget'),
(85, 'Can add 申请表', 22, 'add_tableset'),
(86, 'Can change 申请表', 22, 'change_tableset'),
(87, 'Can delete 申请表', 22, 'delete_tableset'),
(88, 'Can view 申请表', 22, 'view_tableset');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$10000$BwozazIXrOqs$Av2GPYMgDMAWbJ5kZiUjk9DD7qXQxqw1261EFpUIBrU=', '2014-08-22 08:10:34', 1, 'dengyh', '', '', 'dengyh071@gmail.com', 1, 1, '2014-08-19 03:59:36'),
(2, 'pbkdf2_sha256$10000$nDOIV9pbjAtP$1t61EJjK5nZMPVdz0oh+OSkmPoh+i6Ip06oIZfrhzVE=', '2014-08-22 02:34:28', 0, 'east', 'committee', 'east', '', 1, 1, '2014-08-19 04:11:35'),
(3, 'pbkdf2_sha256$10000$BgoldddMjLW5$3vjPlhNwA4nrx0zB8aLLwVAw/ZV3QZC99Clhef+XI1Q=', '2014-08-19 04:21:06', 0, 'south', 'committee', 'south', '', 1, 1, '2014-08-19 04:21:06'),
(4, 'pbkdf2_sha256$10000$mhqczaXCkoyg$QlAo/uQDC4gNfA2tsx5/EWQh6BB44q7FRfKAsbfLWgk=', '2014-08-19 04:21:20', 0, 'north', 'committee', 'north', '', 1, 1, '2014-08-19 04:21:20'),
(5, 'pbkdf2_sha256$10000$xBb0WBEwke2g$2RI07qNpp3jwDoklWpelr1BgyqXVu4Oh9wOY3OMUP7k=', '2014-08-19 04:21:36', 0, 'zhuhai', 'committee', 'zhuhai', '', 1, 1, '2014-08-19 04:21:36'),
(6, 'pbkdf2_sha256$10000$aXItqLeWYy46$BYd3P1x/BWLDPIwpwuJJy0Nj75ELt/il7a3nBIWnbyU=', '2014-08-22 03:56:19', 0, 'zgf', 'teacher', 'zgf', '', 0, 1, '2014-08-19 04:22:56'),
(7, 'pbkdf2_sha256$10000$XqJk55e2qPEW$OGsZhD3yGse4JI8gqPpLZLQ1LCJz1ABpnAvkYRRQvU8=', '2014-08-19 04:23:05', 0, 'rjt', 'teacher', 'rjt', '', 0, 1, '2014-08-19 04:23:05'),
(8, 'pbkdf2_sha256$10000$MNKfgIneer5Y$DwqNhQiACZMLdZSpkTQgLX5YK8MOlmBsKgiSNjbKc70=', '2014-08-19 04:23:13', 0, 'ddp', 'teacher', 'ddp', '', 0, 1, '2014-08-19 04:23:13'),
(9, 'pbkdf2_sha256$10000$cTL5kWrVesO5$jkVqBojb2FdQmbpnVlvEZyA8U1lu+ZpgMLXH8BMK/9I=', '2014-08-19 04:23:20', 0, 'dbf', 'teacher', 'dbf', '', 0, 1, '2014-08-19 04:23:20'),
(10, 'pbkdf2_sha256$10000$Ml9SVGYHjwXj$eLJkLh72LxyCqg8VxjBMyVP1OxbdkJoBUXxEKdrxehI=', '2014-08-19 04:23:31', 0, 'pml', 'teacher', 'pml', '', 0, 1, '2014-08-19 04:23:31'),
(11, 'pbkdf2_sha256$10000$JB4JRLnaviqN$htiekGz/GmPJJ5VI7unWEC+M+xHUmQr7EOuf8ytA1Y0=', '2014-08-19 04:23:43', 0, 'chy', 'teacher', 'chy', '', 0, 1, '2014-08-19 04:23:43'),
(12, 'pbkdf2_sha256$10000$geAz1g83cbsj$+cHq2zdk4LhXS+um1xQu5hOjAkO2bKk3jpox1dJkbJU=', '2014-08-19 04:30:59', 0, 'hxy', 'teacher', 'hxy', '', 0, 1, '2014-08-19 04:30:59'),
(13, 'pbkdf2_sha256$10000$gFdoH9yaTxUY$qUIl5mIw9CZLsfLz3aE6bwlbXVwnNO7dQo657ig/V00=', '2014-08-19 04:31:10', 0, 'zsc', 'teacher', 'zsc', '', 0, 1, '2014-08-19 04:31:10'),
(14, 'pbkdf2_sha256$10000$Q4tmqQ3i9JFK$Q7tDdLeKNE97TnUd4ngQlx6u5ToGMYnvJFwu7ss1oPk=', '2014-08-22 08:46:44', 0, 'eastp', 'principal', 'east', '', 0, 1, '2014-08-19 04:31:57'),
(15, 'pbkdf2_sha256$10000$AkbUFkCMZ8rD$3NrpeKiUo4auHqt6zPZj7LbwjA/V2pE223yD8Q5RSbE=', '2014-08-19 04:32:34', 0, 'northp', 'principal', 'north', '', 0, 1, '2014-08-19 04:32:34'),
(16, 'pbkdf2_sha256$10000$odAfeVD5KlCG$fFnl+dsGVnTnTN7WkEgoesRfy1XLjhVejSRJdU9bYuk=', '2014-08-19 04:33:00', 0, 'southp', 'principal', 'south', '', 0, 1, '2014-08-19 04:33:00'),
(17, 'pbkdf2_sha256$10000$ZKArvNOd104S$TjseEaf/EFzaHxusy11TE0vUHhUsV4pH2ZnnQbZoIJU=', '2014-08-19 04:33:12', 0, 'zhuhaip', 'principal', 'zhuhai', '', 0, 1, '2014-08-19 04:33:12'),
(18, 'pbkdf2_sha256$10000$20XsYG2KAQFI$21ZLTnJiphUXojawHGBCC1fRDuXy2X5G/etT/aRtphc=', '2014-08-19 04:33:23', 0, 'allp', 'principal', 'all', '', 0, 1, '2014-08-19 04:33:23'),
(20, 'pbkdf2_sha256$10000$kxb67pfSU41B$0G6o64QasPhF7cfBaKM3osAHKJiYycjh8c+ORsn3hKQ=', '2014-08-22 03:56:57', 0, 'dengyh7', 'student', '', '', 0, 1, '2014-08-19 12:28:32'),
(21, 'pbkdf2_sha256$10000$hPemYR5Ppt5v$oA0aPfU25D+kTbwiTRrU5LC2+BlUfjpa6EjRfGdXCXI=', '2014-08-21 04:48:45', 0, 'chenqf5', 'student', '', '', 0, 1, '2014-08-21 04:48:43');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(17, 2, 34),
(18, 2, 35),
(19, 2, 36),
(20, 2, 43),
(21, 2, 48),
(22, 2, 49),
(23, 2, 50),
(24, 2, 52),
(33, 3, 34),
(34, 3, 35),
(35, 3, 36),
(36, 3, 43),
(37, 3, 48),
(38, 3, 49),
(39, 3, 50),
(40, 3, 52),
(25, 4, 34),
(26, 4, 35),
(27, 4, 36),
(28, 4, 43),
(29, 4, 48),
(30, 4, 49),
(31, 4, 50),
(32, 4, 52),
(41, 5, 34),
(42, 5, 35),
(43, 5, 36),
(44, 5, 43),
(45, 5, 48),
(46, 5, 49),
(47, 5, 50),
(48, 5, 52);

-- --------------------------------------------------------

--
-- 表的结构 `committee_committee`
--

CREATE TABLE IF NOT EXISTS `committee_committee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `wageNumber` varchar(32) COLLATE utf8_bin NOT NULL,
  `campus` varchar(16) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `committee_committee`
--

INSERT INTO `committee_committee` (`id`, `user_id`, `name`, `email`, `phone`, `wageNumber`, `campus`) VALUES
(1, 2, '东校区团委', 'east@zdtw.sysu.edu.cn', '13824418154', '88888888', 'east'),
(2, 3, '', '', '', '', 'south'),
(3, 4, '', '', '', '', 'north'),
(4, 5, '', '', '', '', 'zhuhai');

-- --------------------------------------------------------

--
-- 表的结构 `committee_societies`
--

CREATE TABLE IF NOT EXISTS `committee_societies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `committee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `committee_societies_75f552bd` (`committee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `committee_societies`
--

INSERT INTO `committee_societies` (`id`, `name`, `committee_id`) VALUES
(9, '微软俱乐部', 1),
(10, '广播台', 1),
(11, '广播台', 2),
(12, '中大青年', 2),
(13, '广播台', 4),
(14, 'Maxcell资源在线协会', 4),
(15, '红十字会', 3),
(16, '招生志愿者协会', 3);

-- --------------------------------------------------------

--
-- 表的结构 `committee_tableset`
--

CREATE TABLE IF NOT EXISTS `committee_tableset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(256) COLLATE utf8_bin NOT NULL,
  `committee_id` int(11) NOT NULL,
  `type` varchar(16) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `committee_tableset_75f552bd` (`committee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=23 ;

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
(8, '附件', 'activity', 'submission'),
(9, '报名者', 'activity', 'registrant'),
(10, '活动地点', 'activity', 'location'),
(11, '占用场地', 'activity', 'occupation'),
(12, '团委', 'committee', 'committee'),
(13, '社团', 'committee', 'societies'),
(14, '反馈', 'feedback', 'feedback'),
(15, '团委负责人', 'principal', 'principal'),
(16, '学生', 'student', 'student'),
(17, '业务指导老师', 'teacher', 'teacher'),
(18, 'log entry', 'admin', 'logentry'),
(19, 'Bookmark', 'xadmin', 'bookmark'),
(20, 'User Setting', 'xadmin', 'usersettings'),
(21, 'User Widget', 'xadmin', 'userwidget'),
(22, '申请表', 'committee', 'tableset');

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

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3cs0ejdm9oug293gp5ys4eyvkf88rclr', 'MzQ4ZDAwOTIxZTEwNzhlMGZmNjliODE0Y2ExN2Y2OTJhNzgzOTE1ZTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKARV1Lg==', '2014-09-04 04:48:46'),
('834yj72n4jhq5kekcyy39zvz2dqn4g55', 'ZjM1NGNiMTAzMjllNTEyNzllNDEwMGQ2MzNmMjFmNzc4MjRkMmU0MTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==', '2014-09-05 02:29:10'),
('gugjkru6pwjn38vei2dg0tr77y0ykthe', 'NDRjNWM4NTNiMWYyODdhMjRjYjEwZTVlNjk4YmNhMWM1MTM0NWNhOTqAAn1xAS4=', '2014-09-05 08:09:03'),
('k2ml4d588t0f644nbod4q9apqk4wjlt0', 'OWY5NjViZjk3NTIzNzJlMzBmYTY4YWI2NmViZGQzYjliN2M2MjE4NzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQ51Lg==', '2014-09-03 10:16:44'),
('lnztx0yubhginjysk1tjj6bfvgluv0qu', 'ODRlYmNkMTUxMTJjZjEyYWE4YjBmODMyOGUyODUzZDQzMjQyZDY0NTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKARR1Lg==', '2014-09-05 03:56:58'),
('p5mc9krl41uc7agcz4z5fhd3245pgifi', 'ODRlYmNkMTUxMTJjZjEyYWE4YjBmODMyOGUyODUzZDQzMjQyZDY0NTqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKARR1Lg==', '2014-09-02 12:28:34'),
('w47nunoylxyoho8pphbdn73cr2r0xwx4', 'OWY5NjViZjk3NTIzNzJlMzBmYTY4YWI2NmViZGQzYjliN2M2MjE4NzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQ51Lg==', '2014-09-05 08:46:44');

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
  `type` varchar(64) COLLATE utf8_bin NOT NULL,
  `isOpen` tinyint(1) NOT NULL,
  `isFinish` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `principal_principal`
--

CREATE TABLE IF NOT EXISTS `principal_principal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin NOT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `wageNumber` varchar(32) COLLATE utf8_bin NOT NULL,
  `campus` varchar(16) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `principal_principal`
--

INSERT INTO `principal_principal` (`id`, `user_id`, `name`, `email`, `phone`, `wageNumber`, `campus`) VALUES
(1, 14, '东校区校会管理员', 'dengyh071@gmail.com', '13824418154', '', 'east'),
(2, 16, '', '', '', '', 'south'),
(3, 15, '', '', '', '', 'north'),
(4, 17, '', '', '', '', 'zhuhai'),
(5, 18, '', '', '', '', 'all');

-- --------------------------------------------------------

--
-- 表的结构 `student_student`
--

CREATE TABLE IF NOT EXISTS `student_student` (
  `netid` varchar(16) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `college` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `grade` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `sno` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `societies` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `registTimes` int(11) NOT NULL,
  `completeTimes` int(11) NOT NULL,
  `totalTime` int(11) NOT NULL,
  `lastTime` datetime NOT NULL,
  `lastLastTime` datetime NOT NULL,
  PRIMARY KEY (`netid`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `student_student`
--

INSERT INTO `student_student` (`netid`, `name`, `email`, `phone`, `college`, `grade`, `sno`, `gender`, `societies`, `user_id`, `registTimes`, `completeTimes`, `totalTime`, `lastTime`, `lastLastTime`) VALUES
('chenqf5', '陈群锋', 'chenqf5@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 21, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('dengyh7', '邓宇恒', 'dengyh071@gmail.com', '13824418154', '软件学院', '2012级', '12330071', 'male', NULL, 20, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `teacher_teacher`
--

CREATE TABLE IF NOT EXISTS `teacher_teacher` (
  `tno` varchar(16) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `work` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `wageNumber` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `committee_id` int(11) NOT NULL,
  `societies_id` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`tno`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `teacher_teacher_75f552bd` (`committee_id`),
  KEY `teacher_teacher_8186ae78` (`societies_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `teacher_teacher`
--

INSERT INTO `teacher_teacher` (`tno`, `name`, `email`, `phone`, `gender`, `work`, `wageNumber`, `user_id`, `committee_id`, `societies_id`, `isActive`) VALUES
('chy', '常老师', '', '', NULL, '', '', 11, 1, 10, 1),
('dbf', 'DBF', '', '', NULL, '', '', 9, 4, 14, 1),
('ddp', 'DDP', '', '', NULL, '', '', 8, 4, 13, 1),
('hxy', '侯老师', '', '', NULL, '', '', 12, 3, 15, 1),
('pml', '潘老师', '', '', NULL, '', '', 10, 2, 11, 1),
('rjt', '任老师', '', '', NULL, '', '', 7, 2, 12, 1),
('zgf', '郑桂锋', 'zgf@mail.sysu.edu.cn', '12345678910', 'male', '中山大学软件学院', '88888888', 6, 1, 9, 1),
('zsc', '张老师', '', '', NULL, '', '', 13, 3, 16, 1);

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_bookmark`
--

CREATE TABLE IF NOT EXISTS `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `query` varchar(1000) COLLATE utf8_bin NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_6340c63c` (`user_id`),
  KEY `xadmin_bookmark_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_usersettings`
--

CREATE TABLE IF NOT EXISTS `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(256) COLLATE utf8_bin NOT NULL,
  `value` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_6340c63c` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `xadmin_usersettings`
--

INSERT INTO `xadmin_usersettings` (`id`, `user_id`, `key`, `value`) VALUES
(1, 1, 'dashboard:home:pos', ''),
(2, 2, 'dashboard:home:pos', '');

-- --------------------------------------------------------

--
-- 表的结构 `xadmin_userwidget`
--

CREATE TABLE IF NOT EXISTS `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `page_id` varchar(256) COLLATE utf8_bin NOT NULL,
  `widget_type` varchar(50) COLLATE utf8_bin NOT NULL,
  `value` longtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_6340c63c` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- 限制导出的表
--

--
-- 限制表 `activity_activity`
--
ALTER TABLE `activity_activity`
  ADD CONSTRAINT `student_id_refs_netid_a11bb343` FOREIGN KEY (`student_id`) REFERENCES `student_student` (`netid`),
  ADD CONSTRAINT `teacher_id_refs_tno_be701b2b` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_teacher` (`tno`);

--
-- 限制表 `activity_occupation`
--
ALTER TABLE `activity_occupation`
  ADD CONSTRAINT `activity_id_refs_id_8c713a13` FOREIGN KEY (`activity_id`) REFERENCES `activity_activity` (`id`),
  ADD CONSTRAINT `location_id_refs_id_88d435cd` FOREIGN KEY (`location_id`) REFERENCES `activity_location` (`id`);

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
  ADD CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `committee_committee`
--
ALTER TABLE `committee_committee`
  ADD CONSTRAINT `user_id_refs_id_6cce0b1e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `committee_societies`
--
ALTER TABLE `committee_societies`
  ADD CONSTRAINT `committee_id_refs_id_042a2c90` FOREIGN KEY (`committee_id`) REFERENCES `committee_committee` (`id`);

--
-- 限制表 `committee_tableset`
--
ALTER TABLE `committee_tableset`
  ADD CONSTRAINT `committee_id_refs_id_85afe804` FOREIGN KEY (`committee_id`) REFERENCES `committee_committee` (`id`);

--
-- 限制表 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
  ADD CONSTRAINT `committee_id_refs_id_0568ca9b` FOREIGN KEY (`committee_id`) REFERENCES `committee_committee` (`id`),
  ADD CONSTRAINT `societies_id_refs_id_1c0aa3ed` FOREIGN KEY (`societies_id`) REFERENCES `committee_societies` (`id`),
  ADD CONSTRAINT `user_id_refs_id_6a090b7e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `xadmin_bookmark`
--
ALTER TABLE `xadmin_bookmark`
  ADD CONSTRAINT `content_type_id_refs_id_af66fd92` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_91d2dce8` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `xadmin_usersettings`
--
ALTER TABLE `xadmin_usersettings`
  ADD CONSTRAINT `user_id_refs_id_a4128191` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `xadmin_userwidget`
--
ALTER TABLE `xadmin_userwidget`
  ADD CONSTRAINT `user_id_refs_id_97371ff7` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
