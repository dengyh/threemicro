-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 11 月 19 日 21:57
-- 服务器版本: 5.5.39
-- PHP 版本: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `three_micro`
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
  `societies_id` int(11) NOT NULL,
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
  KEY `activity_activity_8186ae78` (`societies_id`),
  KEY `activity_activity_c12e9d48` (`teacher_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `activity_activity`
--

INSERT INTO `activity_activity` (`id`, `title`, `location`, `status`, `campus`, `type`, `sponsor`, `content`, `student_id`, `societies_id`, `teacher_id`, `nowNumber`, `totalNumber`, `deadline`, `startDateTime`, `endDateTime`, `signDateTime`, `maxTime`, `isCompleted`, `isReady`, `firstRemark`, `secondRemark`) VALUES
(14, '珠海校区网球比赛', '田径场', 'success', 'zhuhai', 'nonPublicWelfare', '中山大学学生会', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'fangzy3', 3, '130185', 0, 11, NULL, '2014-09-09 01:00:00', '2014-09-09 09:00:00', '2014-11-19 04:50:56', 0, 0, 0, '同意', '同意'),
(15, '中山大学校道接力比赛', '中山大学珠海校区逸仙大道', 'success', 'zhuhai', 'publicWelfare', '珠海校区学生会', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'fangzy3', 3, '130185', 0, 100, '2014-09-09 13:00:00', '2014-09-08 23:00:00', '2014-09-09 09:00:00', '2014-11-19 04:59:53', 360000, 0, 0, '同意', '同意'),
(16, '中山大学启航支教', '农村', 'success', 'zhuhai', 'publicWelfare', '中山大学珠海校区学生会', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'fangzy3', 3, '130185', 0, 22, '2014-11-19 01:00:00', '2014-11-18 01:00:00', '2014-11-18 09:00:00', '2014-11-19 05:21:01', 79200, 0, 0, '同意', '同意'),
(17, '跳崖比赛', '悬崖', 'success', 'zhuhai', 'nonPublicWelfare', '学生会', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'fangzy3', 3, '130185', 0, 11, NULL, '2014-09-08 16:00:00', '2014-09-08 16:00:00', '2014-11-19 05:47:56', 0, 0, 0, '同意', '同意跳崖'),
(18, '榕九攀岩训练', '榕园9栋', 'first', 'zhuhai', 'publicWelfare', '团工委', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a3c703ee697a03c2f703e0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'linb7', 4, '130185', 0, 11, '2014-11-18 16:00:00', '2014-11-24 16:00:00', '2014-11-27 16:00:00', '2014-11-19 06:26:16', 39600, 0, 0, NULL, NULL),
(19, 'test', '榕四328', 'first', 'zhuhai', 'nonPublicWelfare', '团工委', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'huangcht3', 5, '130185', 0, 111, NULL, '2014-11-18 16:00:00', '2014-11-22 16:00:00', '2014-11-19 08:00:18', 0, 0, 0, NULL, NULL),
(20, 'test', '榕园', 'faild', 'zhuhai', 'nonPublicWelfare', '团工委办公室', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'huangcht3', 5, '888888', 0, 222, NULL, '2014-11-18 16:00:00', '2014-11-22 16:00:00', '2014-11-19 08:16:38', 0, 0, 0, '提交的表格（资料）这里没有看到', '资料为空'),
(21, 'newtest', '榕园', 'faild', 'zhuhai', 'nonPublicWelfare', '办公室', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'huangcht3', 5, '888888', 0, 333, NULL, '2014-11-18 16:00:00', '2014-11-22 16:00:00', '2014-11-19 08:26:33', 0, 0, 0, '不行', NULL),
(22, '中山大学跳崖比赛', '珠海校区悬崖', 'success', 'zhuhai', 'nonPublicWelfare', '珠海校区学生会', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'fangzy3', 3, '130185', 0, 11, NULL, '2014-09-08 16:00:00', '2014-09-08 16:00:00', '2014-11-19 11:37:03', 0, 0, 0, '可以跳崖', '好活动'),
(23, '中山大学支教', '乡里面', 'first', 'zhuhai', 'nonPublicWelfare', '校团委', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'fangzy3', 3, '130185', 0, 22, NULL, '2014-09-08 16:00:00', '2014-09-08 16:00:00', '2014-11-19 12:30:53', 0, 0, 0, NULL, NULL),
(24, '中山大学珠海校区唐家义教', '唐家小学', 'first', 'zhuhai', 'publicWelfare', '中山大学珠海校区学生会', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a3c703e3c696d67207372633d222f6d656469612f75706c6f61642f32303134313131393230343034312e706e672220616c743d22e4b8ade5b1b1e5a4a7e5ada6e78fa0e6b5b7e6a0a1e58cbae59490e5aeb6e4b989e69599222077696474683d2233343022206865696768743d2231333822202f3e31e38081e6b4bbe58aa8e5908de5ad97efbc9ae4b8ade5b1b1e5a4a7e5ada6e78fa0e6b5b7e6a0a1e58cbae59490e5aeb6e5b08fe5ada6e694afe6959920266e6273703b32e38081e6b4bbe58aa8e4b8bbe58a9ee696b9efbc9ae4b8ade5b1b1e5a4a7e5ada6e78fa0e6b5b7e6a0a1e58cbae59ba2e5b7a5e5a794efbc8ce689bfe58a9ee696b9e4b8ade5b1b1e5a4a7e5ada6e78fa0e6b5b7e6a0a1e58cbae5ada6e7949fe4bc9a20332ee6b4bbe58aa8e6a682e8a681efbc9ae5b0b1e698afe4b880e7bea4e4babae8b791e58ebbe5bd93e5858de8b4b9e88081e5b8882034e38081e8b59ee58aa9e68385e586b5efbc9ae697a028e58886e992b1e6b2a1e69c89e5958aefbc8920266e6273703b35e38081e5a496e8afb7e59889e5aebeefbc9ae69ca8e69c89e69ca8e69c892036e38081e6b4bbe58aa8e59cb0e696b9e5928ce697b6e997b4efbc9ae59ca8e59490e5aeb6e5b08fe5ada6efbc8ce4b880e5b9b4e5958ae69c89e69ca8e69c89efbc813c2f703e0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'fangzy3', 3, '130185', 0, 200, '2014-09-09 16:00:00', '2014-09-08 16:00:00', '2014-09-08 16:00:00', '2014-11-19 12:43:07', 72000, 0, 0, NULL, NULL),
(25, 'testing', '榕园4号', 'first', 'zhuhai', 'nonPublicWelfare', '团工委办公室', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a3c703e3c696d67207372633d222f6d656469612f75706c6f61642f32303134313131393231343232342e706e672220616c743d22222077696474683d223132363922206865696768743d2234343322202f3e3c2f703e0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'huangcht3', 5, '888888', 0, 123, NULL, '2014-11-18 16:00:00', '2014-11-22 16:00:00', '2014-11-19 13:43:19', 0, 0, 0, NULL, NULL),
(26, 'test11', '风雨球场', 'first', 'zhuhai', 'nonPublicWelfare', '团工委办公室', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a3c703e3c696d67207372633d222f6d656469612f75706c6f61642f32303134313131393231343732312e706e672220616c743d22222077696474683d2236303022206865696768743d2232303922202f3e3c2f703e0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'huangcht3', 5, '888888', 0, 221, NULL, '2014-11-19 16:00:00', '2014-11-22 16:00:00', '2014-11-19 13:47:56', 0, 0, 0, NULL, NULL),
(27, 'testing12', '榕园4号', 'first', 'zhuhai', 'nonPublicWelfare', '团工委办公室', 0x3c21444f43545950452068746d6c3e0d0a3c68746d6c3e0d0a3c686561643e0d0a3c2f686561643e0d0a3c626f64793e0d0a0d0a3c2f626f64793e0d0a3c2f68746d6c3e, 'huangcht3', 5, '888888', 0, 1, NULL, '2014-11-25 16:00:00', '2014-11-29 16:00:00', '2014-11-19 13:49:26', 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `activity_attachment`
--

CREATE TABLE IF NOT EXISTS `activity_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `file` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_attachment_8005e431` (`activity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `activity_attachment`
--

INSERT INTO `activity_attachment` (`id`, `description`, `file`, `activity_id`) VALUES
(1, '中山大学珠海校区学生会唐家义教策划书', 'files/20141119204307attachment.docx', 24),
(2, '中山大学珠海校区学生会唐家义教宣传品', 'files/20141119204307attachment.png', 24);

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

--
-- 转存表中的数据 `activity_occupation`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `activity_registrant`
--

INSERT INTO `activity_registrant` (`id`, `netid`, `activity_id`, `registTime`, `isPass`, `isSelected`, `isMachine`, `isCompleted`, `isStarted`, `startTime`, `endTime`, `time`) VALUES
(1, 'fangzy3', 16, '2014-11-19 05:41:10', 0, 0, 0, 0, 0, NULL, NULL, 0),
(2, 'dengyh7', 16, '2014-11-19 05:44:23', 0, 0, 0, 0, 0, NULL, NULL, 0),
(3, 'linb7', 16, '2014-11-19 06:24:27', 0, 0, 0, 0, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `activity_submission`
--

CREATE TABLE IF NOT EXISTS `activity_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `file` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(16) COLLATE utf8_bin NOT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `location` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `number` int(11) NOT NULL,
  `chairNumber` int(11) NOT NULL,
  `otherNumber` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_submission_8005e431` (`activity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `activity_submission`
--

INSERT INTO `activity_submission` (`id`, `description`, `file`, `type`, `startTime`, `endTime`, `location`, `number`, `chairNumber`, `otherNumber`, `activity_id`) VALUES
(1, NULL, 'files/20141119125953chair.docx', 'chair', '2014-09-08 23:00:00', '2014-09-09 09:00:00', NULL, 20, 30, '红布2个', 15),
(2, NULL, 'files/20141119132101chair.docx', 'chair', '2014-11-17 23:00:00', '2014-11-18 09:00:00', NULL, 30, 30, '红布3个', 16),
(3, NULL, 'files/20141119132101poster.docx', 'poster', '2014-11-15 23:00:00', '2014-11-18 09:00:00', 'tianJinBanner', 0, 0, '无', 16),
(4, NULL, 'files/20141119193703classroom.docx', 'classroom', '2014-09-08 16:00:00', '2014-09-08 16:00:00', 'ordinaryClassroom', 0, 0, '无', 22),
(5, NULL, 'files/20141119203053classroom.docx', 'classroom', '2014-09-08 16:00:00', '2014-09-08 16:00:00', 'ordinaryClassroom', 0, 0, '无', 23),
(6, NULL, 'files/20141119204307chair.docx', 'chair', '2014-09-08 16:00:00', '2014-09-08 16:00:00', NULL, 2, 20, '红布1个', 24);

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

--
-- 转存表中的数据 `auth_group`
--


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

--
-- 转存表中的数据 `auth_group_permissions`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=97 ;

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
(88, 'Can view 申请表', 22, 'view_tableset'),
(89, 'Can add 附件', 23, 'add_attachment'),
(90, 'Can change 附件', 23, 'change_attachment'),
(91, 'Can delete 附件', 23, 'delete_attachment'),
(92, 'Can view 附件', 23, 'view_attachment'),
(93, 'Can add 业务指导老师', 24, 'add_teacher'),
(94, 'Can change 业务指导老师', 24, 'change_teacher'),
(95, 'Can delete 业务指导老师', 24, 'delete_teacher'),
(96, 'Can view 业务指导老师', 24, 'view_teacher');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=191 ;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$10000$BwozazIXrOqs$Av2GPYMgDMAWbJ5kZiUjk9DD7qXQxqw1261EFpUIBrU=', '2014-08-23 01:51:05', 1, 'dengyh', '', '', 'dengyh071@gmail.com', 1, 1, '2014-08-19 03:59:36'),
(2, 'pbkdf2_sha256$10000$nDOIV9pbjAtP$1t61EJjK5nZMPVdz0oh+OSkmPoh+i6Ip06oIZfrhzVE=', '2014-11-02 16:09:43', 0, 'east', 'committee', 'east', '', 1, 1, '2014-08-19 04:11:35'),
(3, 'pbkdf2_sha256$10000$BgoldddMjLW5$3vjPlhNwA4nrx0zB8aLLwVAw/ZV3QZC99Clhef+XI1Q=', '2014-08-25 09:54:31', 0, 'south', 'committee', 'south', '', 1, 1, '2014-08-19 04:21:06'),
(4, 'pbkdf2_sha256$10000$mhqczaXCkoyg$QlAo/uQDC4gNfA2tsx5/EWQh6BB44q7FRfKAsbfLWgk=', '2014-08-19 04:21:20', 0, 'north', 'committee', 'north', '', 1, 1, '2014-08-19 04:21:20'),
(5, 'pbkdf2_sha256$10000$xBb0WBEwke2g$2RI07qNpp3jwDoklWpelr1BgyqXVu4Oh9wOY3OMUP7k=', '2014-11-19 13:52:07', 0, 'zhuhai', 'committee', 'zhuhai', '', 1, 1, '2014-08-19 04:21:36'),
(6, 'pbkdf2_sha256$10000$aXItqLeWYy46$BYd3P1x/BWLDPIwpwuJJy0Nj75ELt/il7a3nBIWnbyU=', '2014-11-03 06:49:08', 0, 'zgf', 'teacher', 'zgf', '', 0, 1, '2014-08-19 04:22:56'),
(7, 'pbkdf2_sha256$10000$XqJk55e2qPEW$OGsZhD3yGse4JI8gqPpLZLQ1LCJz1ABpnAvkYRRQvU8=', '2014-09-25 16:21:04', 0, 'rjt', 'teacher', 'rjt', '', 0, 1, '2014-08-19 04:23:05'),
(8, 'pbkdf2_sha256$10000$MNKfgIneer5Y$DwqNhQiACZMLdZSpkTQgLX5YK8MOlmBsKgiSNjbKc70=', '2014-11-19 09:33:37', 0, 'ddp', 'teacher', 'ddp', '', 0, 1, '2014-08-19 04:23:13'),
(9, 'pbkdf2_sha256$10000$cTL5kWrVesO5$jkVqBojb2FdQmbpnVlvEZyA8U1lu+ZpgMLXH8BMK/9I=', '2014-08-19 04:23:20', 0, 'dbf', 'teacher', 'dbf', '', 0, 1, '2014-08-19 04:23:20'),
(10, 'pbkdf2_sha256$10000$Ml9SVGYHjwXj$eLJkLh72LxyCqg8VxjBMyVP1OxbdkJoBUXxEKdrxehI=', '2014-08-25 09:45:49', 0, 'pml', 'teacher', 'pml', '', 0, 1, '2014-08-19 04:23:31'),
(11, 'pbkdf2_sha256$10000$JB4JRLnaviqN$htiekGz/GmPJJ5VI7unWEC+M+xHUmQr7EOuf8ytA1Y0=', '2014-08-25 13:13:34', 0, 'chy', 'teacher', 'chy', '', 0, 1, '2014-08-19 04:23:43'),
(12, 'pbkdf2_sha256$10000$geAz1g83cbsj$+cHq2zdk4LhXS+um1xQu5hOjAkO2bKk3jpox1dJkbJU=', '2014-08-19 04:30:59', 0, 'hxy', 'teacher', 'hxy', '', 0, 1, '2014-08-19 04:30:59'),
(13, 'pbkdf2_sha256$10000$gFdoH9yaTxUY$qUIl5mIw9CZLsfLz3aE6bwlbXVwnNO7dQo657ig/V00=', '2014-08-25 11:40:02', 0, 'zsc', 'teacher', 'zsc', '', 0, 1, '2014-08-19 04:31:10'),
(14, 'pbkdf2_sha256$10000$Q4tmqQ3i9JFK$Q7tDdLeKNE97TnUd4ngQlx6u5ToGMYnvJFwu7ss1oPk=', '2014-08-25 12:50:37', 0, 'eastp', 'principal', 'east', '', 0, 1, '2014-08-19 04:31:57'),
(15, 'pbkdf2_sha256$10000$AkbUFkCMZ8rD$3NrpeKiUo4auHqt6zPZj7LbwjA/V2pE223yD8Q5RSbE=', '2014-08-19 04:32:34', 0, 'northp', 'principal', 'north', '', 0, 1, '2014-08-19 04:32:34'),
(16, 'pbkdf2_sha256$10000$odAfeVD5KlCG$fFnl+dsGVnTnTN7WkEgoesRfy1XLjhVejSRJdU9bYuk=', '2014-08-19 04:33:00', 0, 'southp', 'principal', 'south', '', 0, 1, '2014-08-19 04:33:00'),
(17, 'pbkdf2_sha256$10000$ZKArvNOd104S$TjseEaf/EFzaHxusy11TE0vUHhUsV4pH2ZnnQbZoIJU=', '2014-08-19 04:33:12', 0, 'zhuhaip', 'principal', 'zhuhai', '', 0, 1, '2014-08-19 04:33:12'),
(18, 'pbkdf2_sha256$10000$20XsYG2KAQFI$21ZLTnJiphUXojawHGBCC1fRDuXy2X5G/etT/aRtphc=', '2014-08-19 04:33:23', 0, 'allp', 'principal', 'all', '', 0, 1, '2014-08-19 04:33:23'),
(20, 'pbkdf2_sha256$10000$kxb67pfSU41B$0G6o64QasPhF7cfBaKM3osAHKJiYycjh8c+ORsn3hKQ=', '2014-11-19 13:49:43', 1, 'dengyh7', 'student', '', '', 1, 1, '2014-08-19 12:28:32'),
(21, 'pbkdf2_sha256$10000$hPemYR5Ppt5v$oA0aPfU25D+kTbwiTRrU5LC2+BlUfjpa6EjRfGdXCXI=', '2014-11-18 21:49:15', 0, 'chenqf5', 'student', '', '', 0, 1, '2014-08-21 04:48:43'),
(22, 'pbkdf2_sha256$10000$Zh3VlsWkuWBw$ytlZziQzNB4jqQCeZtu8GzllJ55u2CEhrivk7F6EewU=', '2014-11-19 13:54:50', 0, 'fangzy3', 'student', '', '', 0, 1, '2014-11-05 06:59:57'),
(24, 'pbkdf2_sha256$10000$VUM0TpkbLXfU$KYh2ihk4IpFyf+PyR/NuAXAqiiu6k9OQwyE4O1UWIcM=', '2014-11-18 22:03:36', 0, '123456', 'teacher', '123456', '', 0, 1, '2014-11-17 06:41:05'),
(25, 'pbkdf2_sha256$10000$AeVr0XHum174$tK445qk520oEYcKf25EXXytck/osDlv42QoUMwA+uEw=', '2014-11-18 23:30:54', 0, '12345', 'teacher', '12345', '', 0, 1, '2014-11-17 06:42:14'),
(28, 'pbkdf2_sha256$10000$RMfvdwE8mXOb$0eGoHIxvKF3q4pq8f6X9OsLF9NCa9N+fJT56RwcatYc=', '2014-11-18 21:47:48', 0, '222222', 'teacher', '222222', '', 0, 1, '2014-11-17 06:44:26'),
(29, 'pbkdf2_sha256$10000$31U07SjvIimB$tqASQ00uhCZLw6EhrhHSL+Jril3CoUvJyNdlvvZ1EKI=', '2014-11-17 06:44:36', 0, '333333', 'teacher', '333333', '', 0, 1, '2014-11-17 06:44:36'),
(30, 'pbkdf2_sha256$10000$MMKG8eauDU0A$oWRN7BKGof5kCVPTjGylvgKBvqF9FWIW57WCP1tJUDg=', '2014-11-17 06:44:46', 0, '444444', 'teacher', '444444', '', 0, 1, '2014-11-17 06:44:46'),
(31, 'pbkdf2_sha256$10000$mpS7lZOLwsM0$WA4AV0e0/Mx209aNe8rM6PfnZOk44qVKC5bFmwacucE=', '2014-11-18 22:01:25', 0, 'chenjw85', 'student', '', '', 0, 1, '2014-11-18 21:16:50'),
(32, 'pbkdf2_sha256$10000$51W5oD54PHmn$5/rDoXGqt6ir5xujlh7vSNJUoj2oiKRuPWbFZT1XqJk=', '2014-11-19 04:20:05', 0, 'tangqb3', 'student', '', '', 0, 1, '2014-11-18 16:01:29'),
(36, 'pbkdf2_sha256$10000$sDSEmubKaNuI$E7gyl3Crbzkdg470t4CJw9VazHDJEd2Aave+rjUkFjo=', '2014-11-18 23:02:51', 0, 'mamt3', 'student', '', '', 0, 1, '2014-11-18 23:02:50'),
(58, 'pbkdf2_sha256$10000$bUWGnPpcfvrQ$C9DpLqASSy+Fh0kIFZGX970NQ23nWrM/pjyCjEz+ugo=', '2014-11-19 01:31:03', 0, 'xuym8', 'student', '', '', 0, 1, '2014-11-19 01:28:57'),
(60, 'pbkdf2_sha256$10000$1JUGVGXMlFqe$XYVaj6UZ/ttQ+6oufWov0S6PjnXvBzY0VzLsqyQdLNQ=', '2014-11-19 02:08:37', 0, 'huangxy45', 'student', '', '', 0, 1, '2014-11-19 02:00:25'),
(61, 'pbkdf2_sha256$10000$pV0ux3FskE4Y$FeOhqBJQXggPww/mo3VQ9P6WtbpCFC8TR/E1eeAriGQ=', '2014-11-19 02:18:42', 0, 'luoxch7', 'student', '', '', 0, 1, '2014-11-19 02:18:42'),
(63, 'pbkdf2_sha256$10000$jqGjusXhb1z9$ZM1pHewxuFdtXzQ0A74W4cAPDfvNT/bc8zRUeCcwfxQ=', '2014-11-19 03:23:37', 0, 'caipl', 'student', '', '', 0, 1, '2014-11-19 03:16:22'),
(67, 'pbkdf2_sha256$10000$OMmxJQtZXivG$Z67s+AY0iS9jFToQhqN+0GgSZwrTb8wdx/pLr7Blbo8=', '2014-11-19 04:15:30', 0, 'mudr', 'student', '', '', 0, 1, '2014-11-19 04:15:30'),
(68, 'pbkdf2_sha256$10000$Ura5hoBalMyj$5uiMpPkmEZB3ulns1t/yY9yIsJzfPs8uLStLMHv2SPA=', '2014-11-19 12:44:23', 0, '130185', 'teacher', '130185', '', 0, 1, '2014-11-19 04:41:42'),
(69, 'pbkdf2_sha256$10000$gPisp3EluSEV$Pep03f7oI/oh4NJfUL/enEzPb6HWgy7v9P60fYkXRJo=', '2014-11-19 06:17:36', 0, 'Liql8', 'student', '', '', 0, 1, '2014-11-19 06:17:36'),
(70, 'pbkdf2_sha256$10000$LsxNhwLQ985k$PSYO1na+cgqM/XjKfxKbK6MVgP7EzKfrgaHoI29xViQ=', '2014-11-19 06:24:15', 0, 'linb7', 'student', '', '', 0, 1, '2014-11-19 06:23:05'),
(71, 'pbkdf2_sha256$10000$qTWjWxzeKjF2$WzO2THf/5fD/LNyB1BnNKkSiGNnLNUnH/bDEserVe4o=', '2014-11-19 08:00:41', 0, '654321', 'teacher', '654321', '', 0, 0, '2014-11-19 07:39:57'),
(72, 'pbkdf2_sha256$10000$CNt9HKE765j3$uk8ml5ykv6AFYbzCJI2C8BDQRRpHQTBh/ZKDhU2iNns=', '2014-11-19 13:48:27', 0, 'huangcht3', 'student', '', '', 0, 1, '2014-11-19 07:42:01'),
(75, 'pbkdf2_sha256$10000$tD6zgd9ZBwl9$QUMsWX+gvmsXQOZgWMCDRsomWtIvQHmhK9qTMDeg/0U=', '2014-11-19 08:14:25', 0, '999999', 'teacher', '999999', '', 0, 0, '2014-11-19 08:12:55'),
(76, 'pbkdf2_sha256$10000$b1FDDthq5HnZ$f5UHtDkcEBR9S7yIrdOHTQyuyth7QgFDa5/z1UhonZI=', '2014-11-19 13:50:06', 0, '888888', 'teacher', '888888', '', 0, 1, '2014-11-19 08:13:16'),
(77, 'pbkdf2_sha256$10000$vP2jgCGR7XG3$ld7JbeVQFNJeTNbSTTuqRFcZXOjsMP45znO/LD6rLVY=', '2014-11-19 10:27:09', 0, '139233', 'teacher', '139233', '', 0, 1, '2014-11-19 10:27:09'),
(78, 'pbkdf2_sha256$10000$EV8AwqsGjvTx$WmDgnf/Q7hqef4IVmCmeJbuCwJ+yALOzM0p5kYMeKrk=', '2014-11-19 10:31:23', 0, '060158', 'teacher', '060158', '', 0, 1, '2014-11-19 10:31:23'),
(79, 'pbkdf2_sha256$10000$NSgbPgjVRSD8$yAYMK9GuNB5pEnp5nBVa3gozb7FJhW8dMZmdEjrG+u8=', '2014-11-19 10:32:07', 0, '140188', 'teacher', '140188', '', 0, 1, '2014-11-19 10:32:07'),
(80, 'pbkdf2_sha256$10000$VYSL8wtwSAFJ$t2rrxePL68o91uCySUV3xd2/AT8yYI91qpF4cxlYOww=', '2014-11-19 10:32:38', 0, '120159', 'teacher', '120159', '', 0, 1, '2014-11-19 10:32:38'),
(81, 'pbkdf2_sha256$10000$paoLKq2Rn4ns$Z5woR9VdGqmm1zf8xq89wIqTZOBuLQc9Knf+mf2EaWk=', '2014-11-19 10:33:45', 0, '149015', 'teacher', '149015', '', 0, 1, '2014-11-19 10:33:45'),
(82, 'pbkdf2_sha256$10000$glPCR1Z4EqiH$PAH3I54mJzMnBXAUob0xC7PgNYNdMHgKG09dDfl4jv4=', '2014-11-19 10:34:04', 0, '139001', 'teacher', '139001', '', 0, 1, '2014-11-19 10:34:04'),
(83, 'pbkdf2_sha256$10000$lV6syy5odp59$O6pjdSk8g2ZNAbH6jzCGQFynpAzPwdlrJFLKbrOH93U=', '2014-11-19 10:34:07', 0, '129218', 'teacher', '129218', '', 0, 1, '2014-11-19 10:34:07'),
(84, 'pbkdf2_sha256$10000$JhgLOQVcEAqF$s22bTyXTz44cd93jtunIaC4mxv9F/S2JZGpjT8OFZpk=', '2014-11-19 10:34:32', 0, '139100', 'teacher', '139100', '', 0, 1, '2014-11-19 10:34:32'),
(85, 'pbkdf2_sha256$10000$1rKObh1X4p14$u97NgcTFiJuJmoIxFRnzSA7eCcTVMjHeCbEAaUgzxqQ=', '2014-11-19 10:35:25', 0, '139003', 'teacher', '139003', '', 0, 1, '2014-11-19 10:35:25'),
(86, 'pbkdf2_sha256$10000$j7cmM9s8N4W2$ssQHni6TEVX7sQJI/aDrJanx/Xiap6BCo4+X3OUZwvc=', '2014-11-19 10:36:39', 0, '119097', 'teacher', '119097', '', 0, 1, '2014-11-19 10:36:39'),
(87, 'pbkdf2_sha256$10000$0GJZkR3v2rCK$tBdAM4WUiYrIGONaaEPno3HfTQxRe8FtCPpeXff5GVY=', '2014-11-19 10:36:57', 0, '139101', 'teacher', '139101', '', 0, 1, '2014-11-19 10:36:57'),
(88, 'pbkdf2_sha256$10000$HtYs1zt3KXeS$4EL1noDAg5NAeQKcdO2i+0lNPyQ+lF9cYTYvw50FnyE=', '2014-11-19 10:37:07', 0, '130200', 'teacher', '130200', '', 0, 1, '2014-11-19 10:37:07'),
(89, 'pbkdf2_sha256$10000$jbANzzHf8tny$xMVScBliYybPb0Aeq3imSm0+xTgre45SvqMI6Xm5ujI=', '2014-11-19 10:37:23', 0, '149147', 'teacher', '149147', '', 0, 1, '2014-11-19 10:37:23'),
(90, 'pbkdf2_sha256$10000$VeOva5cnv5pl$UWNEaFOtcixAld3BDhSjrGcFw5lTuCIBF5Y9duOe9L8=', '2014-11-19 10:37:54', 0, '099101', 'teacher', '099101', '', 0, 1, '2014-11-19 10:37:54'),
(91, 'pbkdf2_sha256$10000$1VctIv9rYcik$4KF6SDQ/WTG2Zv/Z5WfyMQ5ngDHusgth8Pyn40bZj94=', '2014-11-19 12:34:46', 0, 'zhouln6', 'student', '', '', 0, 1, '2014-11-19 10:52:40'),
(94, 'pbkdf2_sha256$10000$d7vzvb0NT7e4$1MI17skzEtHJeWzptStX88mVz+G+1tGMpohJl7tB9aU=', '2014-11-19 10:55:11', 0, '006745', 'teacher', '006745', '', 0, 1, '2014-11-19 10:55:11'),
(95, 'pbkdf2_sha256$10000$imeCbufBTq8l$KNVkcVC5STBy/AMdTyvxG6WiaiPLaewk3DBbPn6nfoo=', '2014-11-19 10:55:57', 0, '006750', 'teacher', '006750', '', 0, 1, '2014-11-19 10:55:57'),
(96, 'pbkdf2_sha256$10000$03dor5gdnNgs$doVIDw7Vh7FYCZGktgb8+FM8m1dDbm/JfARfHBflMPs=', '2014-11-19 10:57:36', 0, '110096', 'teacher', '110096', '', 0, 1, '2014-11-19 10:57:36'),
(97, 'pbkdf2_sha256$10000$RlQXmmXRUAzz$uHakicv1r9cpmCkef5xoMhIqsN28Lcb+he28UzjPMtw=', '2014-11-19 10:57:37', 0, '006361', 'teacher', '006361', '', 0, 1, '2014-11-19 10:57:37'),
(98, 'pbkdf2_sha256$10000$YrwzTTvsfXsY$Nemjj09E6ezTzxiThh4K/IghLh2zYbkYIWDXku9WpVE=', '2014-11-19 10:58:05', 0, '130186', 'teacher', '130186', '', 0, 1, '2014-11-19 10:58:05'),
(99, 'pbkdf2_sha256$10000$SRTTVbVoGSvA$B69dg137thFKRrqscDtcDCoGLLQwWYIxFdW2/t5uiUo=', '2014-11-19 10:58:40', 0, '004924', 'teacher', '004924', '', 0, 1, '2014-11-19 10:58:40'),
(100, 'pbkdf2_sha256$10000$C5P6qHFBWeNw$xbDfTZ8MmHbJHAXQMY67ApXyIXnmZHlEPzfkwaJkQMY=', '2014-11-19 10:58:49', 0, '070204', 'teacher', '070204', '', 0, 1, '2014-11-19 10:58:49'),
(101, 'pbkdf2_sha256$10000$w4LVs5oNo5su$uXh390gDV1FtySJR7SdQXBnsECC63N3DzTs9RhyPfEA=', '2014-11-19 10:59:13', 0, '140178', 'teacher', '140178', '', 0, 1, '2014-11-19 10:59:13'),
(102, 'pbkdf2_sha256$10000$GUz2cJyP6AYJ$efapAclO2d8SIFdC4QQHTcVCKYUTD/XJO0aVl0utJnc=', '2014-11-19 10:59:28', 0, '006591', 'teacher', '006591', '', 0, 1, '2014-11-19 10:59:28'),
(103, 'pbkdf2_sha256$10000$X1P8p8dYJIuq$CuAmSRrs1z3rJUERT1K89mHiTxvSFqxLo2xgW6US7x0=', '2014-11-19 11:00:24', 0, '014035', 'teacher', '014035', '', 0, 1, '2014-11-19 11:00:24'),
(104, 'pbkdf2_sha256$10000$868p27RQbaZI$0dfZ0tQvL9N2wZM+X+HhJTcuEdYmkt+MbALW9feXfg8=', '2014-11-19 11:00:27', 0, '119153', 'teacher', '119153', '', 0, 1, '2014-11-19 11:00:27'),
(105, 'pbkdf2_sha256$10000$QpFD5Wylnn3X$HhdMKvfDYHK/ooeV1MoVeZu2XYfnatjh/t4Rm9bkcM4=', '2014-11-19 11:00:50', 0, '119156', 'teacher', '119156', '', 0, 1, '2014-11-19 11:00:50'),
(106, 'pbkdf2_sha256$10000$jKXDqejudxT0$p5z2mQf9mmEVomgY9OusxUbAztKVcXBgLcJ+lIY0z9s=', '2014-11-19 11:01:03', 0, '006759', 'teacher', '006759', '', 0, 1, '2014-11-19 11:01:03'),
(107, 'pbkdf2_sha256$10000$jpVO9LfTpTpy$DIf26hx0KiiU80T4hkuobBdO+xFsC1nqN7NYu2GVwzg=', '2014-11-19 11:01:26', 0, '119154', 'teacher', '119154', '', 0, 1, '2014-11-19 11:01:26'),
(108, 'pbkdf2_sha256$10000$Uslsp53K0HOt$mC4xG/SKbs2ya1MNEhTAMW/EsYpv8FqrDWshz2tXZx8=', '2014-11-19 11:01:48', 0, '120158', 'teacher', '120158', '', 0, 1, '2014-11-19 11:01:48'),
(109, 'pbkdf2_sha256$10000$qB55ZtNAfs5U$leXnZNlmvkGJaDNqcKFhLWSZfuTgqFnjMsuV3dryjkw=', '2014-11-19 11:02:09', 0, '006668', 'teacher', '006668', '', 0, 1, '2014-11-19 11:02:09'),
(110, 'pbkdf2_sha256$10000$iyzb4STBmGYv$36dhFWKKlz1mwdIR6faRO++8GaEABVmn1r2brLKqJPU=', '2014-11-19 11:02:40', 0, '040089', 'teacher', '040089', '', 0, 1, '2014-11-19 11:02:40'),
(111, 'pbkdf2_sha256$10000$ljW8oBDC5aj9$T/0ZnIByYhPQSLBZsiswYOK9IToG1q8z2XJZcIUHmUE=', '2014-11-19 11:02:47', 0, '006185', 'teacher', '006185', '', 0, 1, '2014-11-19 11:02:47'),
(112, 'pbkdf2_sha256$10000$lS7RrYmKhjR8$ky67HNIdEdTmDfSR0gFt72kcqnQRC6xmTck+PErcNtk=', '2014-11-19 11:03:03', 0, '079097', 'teacher', '079097', '', 0, 1, '2014-11-19 11:03:03'),
(113, 'pbkdf2_sha256$10000$x56LUAEjOWQh$3/hGCXhXDuCQ5hOmV+8B0Zzx1+nuJNOVlNCWoxRoShY=', '2014-11-19 11:03:21', 0, '080078', 'teacher', '080078', '', 0, 1, '2014-11-19 11:03:21'),
(114, 'pbkdf2_sha256$10000$WdsE5xgJHTSQ$XQE5GjuHXhPXWatk9GOTWlEgLxo+RnRN7l7dOvdBpic=', '2014-11-19 11:03:32', 0, '120213', 'teacher', '120213', '', 0, 1, '2014-11-19 11:03:32'),
(115, 'pbkdf2_sha256$10000$J7GvKB3Fj8MR$7aPlhHRMxap2SOpohu1tJgduhvELaHXoZp+NxeVG3Qw=', '2014-11-19 11:03:57', 0, '014020', 'teacher', '014020', '', 0, 1, '2014-11-19 11:03:57'),
(116, 'pbkdf2_sha256$10000$MVMuLOvuxhOh$S+MD42b1GjsPDuofoszb/ctwNWSV4rqPGeQiw6FtbEg=', '2014-11-19 11:04:01', 0, '120126', 'teacher', '120126', '', 0, 1, '2014-11-19 11:04:01'),
(117, 'pbkdf2_sha256$10000$vMAtCitaRM9B$rasZppfeqBBuIfhBukaFQVg17P7pKx2ACZT1cRxxTgA=', '2014-11-19 11:04:21', 0, '004949', 'teacher', '004949', '', 0, 1, '2014-11-19 11:04:21'),
(118, 'pbkdf2_sha256$10000$RCMIpIdr6V7h$RskRISJSRtazt4Y4SJInR32s4DTMWEWKiRcYr+jupA0=', '2014-11-19 11:04:43', 0, '109126', 'teacher', '109126', '', 0, 1, '2014-11-19 11:04:43'),
(119, 'pbkdf2_sha256$10000$EbeBJonQd0qr$7jY4QFydrG1UQN72WdBrLM75EnOinmr7O4pMkj8zkh8=', '2014-11-19 11:04:43', 0, '099161', 'teacher', '099161', '', 0, 1, '2014-11-19 11:04:43'),
(120, 'pbkdf2_sha256$10000$XquFBxUbhIFy$XTetX8pckZVH1YomCx8DpQm9u3WVLeln993x8JjkrwQ=', '2014-11-19 11:05:03', 0, '006179', 'teacher', '006179', '', 0, 1, '2014-11-19 11:05:03'),
(121, 'pbkdf2_sha256$10000$reAmpBdPdlDU$2MxCbM71R6i9K+znAoekGBxzdIp493WaGg1TceAk0dY=', '2014-11-19 11:05:19', 0, '099002', 'teacher', '099002', '', 0, 1, '2014-11-19 11:05:19'),
(122, 'pbkdf2_sha256$10000$yxAvjv5zq2bj$0sQmZpXNH6rYVk0i03SaNtKxsMHUQhzP/tcgeZLSLRg=', '2014-11-19 11:05:19', 0, '109150', 'teacher', '109150', '', 0, 1, '2014-11-19 11:05:19'),
(123, 'pbkdf2_sha256$10000$N81Gfpuy0lea$ziJtP06+fNbXnGAm4ovIA0ihLIIbIHzGAo89FAxgo34=', '2014-11-19 11:05:54', 0, '006715', 'teacher', '006715', '', 0, 1, '2014-11-19 11:05:54'),
(124, 'pbkdf2_sha256$10000$n8ZycUJDfqzx$2tVAA4UY8c5SwiwMqhOEzInnUOs1KP/A0eP7z2m1ZFY=', '2014-11-19 11:06:10', 0, '119104', 'teacher', '119104', '', 0, 1, '2014-11-19 11:06:10'),
(125, 'pbkdf2_sha256$10000$if3MhQrZChYd$XF/MjfD/fR83C6pMlaVOS6ATKcDWFX2xeAI/1WVvfrQ=', '2014-11-19 11:06:24', 0, '006721', 'teacher', '006721', '', 0, 1, '2014-11-19 11:06:24'),
(126, 'pbkdf2_sha256$10000$LYKYhMdsW0Fn$vYG/x/MQGxU12ylwXoOdjoMvvghp3TGokvYQZAAwuKw=', '2014-11-19 11:06:56', 0, '059012', 'teacher', '059012', '', 0, 1, '2014-11-19 11:06:56'),
(127, 'pbkdf2_sha256$10000$o8bMCTC6iQBY$+YK4siG/CD0ZCp6Boaui9h/FkuPars6321ev4G7MyBg=', '2014-11-19 11:06:58', 0, '014116', 'teacher', '014116', '', 0, 1, '2014-11-19 11:06:58'),
(128, 'pbkdf2_sha256$10000$Pb1IGw6Zi4Xf$n7fkGhzdibpkQIoEeQRQis9p2jT5SlsxerwHIEtvn90=', '2014-11-19 11:07:23', 0, '129100', 'teacher', '129100', '', 0, 1, '2014-11-19 11:07:23'),
(129, 'pbkdf2_sha256$10000$wZspUn1MU3p7$7FD0u/Zhz1M8MSC5ZHUzmYSdYXkQfsZct0PP/EpwE6A=', '2014-11-19 11:07:31', 0, '110062', 'teacher', '110062', '', 0, 1, '2014-11-19 11:07:31'),
(130, 'pbkdf2_sha256$10000$c5KgIFFjv4hk$q+11G+GxvOzvmcnDJaQ+c6vWPAlUGiQo1vJ+OsRc8j4=', '2014-11-19 11:07:46', 0, '100108', 'teacher', '100108', '', 0, 1, '2014-11-19 11:07:46'),
(131, 'pbkdf2_sha256$10000$vn2EwcZiAAph$vEWn+XXVu0Q2Cn8gEYftBvyJKMuxhpgYyJkwEUEPKYs=', '2014-11-19 11:08:04', 0, '059226', 'teacher', '059226', '', 0, 1, '2014-11-19 11:08:04'),
(132, 'pbkdf2_sha256$10000$gXKS1LCJI1WE$d4b3cDtAISxclaWfQOqucctr8fb202xCJkTJRmHRtkk=', '2014-11-19 11:08:11', 0, '139263', 'teacher', '139263', '', 0, 1, '2014-11-19 11:08:11'),
(133, 'pbkdf2_sha256$10000$KP2hsPAJ5fv3$1v8M5wl2GRKEyaW5zl9SZ2oRK5JymZsmPrkV+zbWrFY=', '2014-11-19 11:08:32', 0, '020130', 'teacher', '020130', '', 0, 1, '2014-11-19 11:08:32'),
(134, 'pbkdf2_sha256$10000$9byPiuHThLet$fCfmnY8odvFxGY3Br4M1ZTeS6E4DX2SKfXgPDT1J/n0=', '2014-11-19 11:08:53', 0, '020027', 'teacher', '020027', '', 0, 1, '2014-11-19 11:08:53'),
(135, 'pbkdf2_sha256$10000$WuOmKPNUz3QM$6/1usW+ABQcTRbomE/RKvmMteoQL9zdt6/MxQ4XSUTM=', '2014-11-19 11:09:08', 0, '069252', 'teacher', '069252', '', 0, 1, '2014-11-19 11:09:08'),
(136, 'pbkdf2_sha256$10000$nliV9ASh1Mtw$XIsO4n5/0ln64TD4NyGMa6LzRy38j1CdOeD8htfmfAw=', '2014-11-19 11:09:29', 0, '139046', 'teacher', '139046', '', 0, 1, '2014-11-19 11:09:29'),
(137, 'pbkdf2_sha256$10000$BnSr2Be6a4B7$JfmbG8FCNDLy7hbQdpztvHU2aC2O78WGxCCRUNl8woY=', '2014-11-19 11:09:59', 0, '004050', 'teacher', '004050', '', 0, 1, '2014-11-19 11:09:59'),
(138, 'pbkdf2_sha256$10000$hFBYABfahSuj$WSfZhY2dBi50Bll7bQ+P+rFJoxCAT1OEWnTpXtUx5fM=', '2014-11-19 11:10:12', 0, '006061', 'teacher', '006061', '', 0, 1, '2014-11-19 11:10:12'),
(139, 'pbkdf2_sha256$10000$EZ4yndruA8Pw$COMzLYAHroxi2yXeEpS6tQd1vuoA4zuE1htnPF1bh+I=', '2014-11-19 11:10:39', 0, '020186', 'teacher', '020186', '', 0, 1, '2014-11-19 11:10:39'),
(140, 'pbkdf2_sha256$10000$igaIFbUp7FSj$qyiNCtdQ0/A9Rlp/6Z9fIiNS9rifEfjbxS00TOMa/x0=', '2014-11-19 11:11:07', 0, '080069', 'teacher', '080069', '', 0, 1, '2014-11-19 11:11:07'),
(141, 'pbkdf2_sha256$10000$USj2uaZoTdI0$viFoThlc/5dkRxf7C8MibVAoal2l6QkXrK5Xc/Nh9zw=', '2014-11-19 11:25:09', 0, '109054', 'teacher', '109054', '', 0, 1, '2014-11-19 11:25:09'),
(142, 'pbkdf2_sha256$10000$rbNLtQbueokN$5rdzqEWOa7cdALVlaXOUkYaE4KMc2wE63Jtkk+rPTz0=', '2014-11-19 11:27:40', 0, 'fangzhy3', 'student', '', '', 0, 1, '2014-11-19 11:27:40'),
(143, 'pbkdf2_sha256$10000$rVpXDgUzvBQI$ZgHmx/Bd+gkEZcEAY5CM7SYumGl06V0U2U7JzxmONCc=', '2014-11-19 11:30:34', 0, '850961', 'teacher', '850961', '', 0, 1, '2014-11-19 11:30:34'),
(144, 'pbkdf2_sha256$10000$rXteKbrzNAVN$wWU6S3s4l4AgjxQY+nhJMFFaPhCf0X0vv+dxMjkiDO8=', '2014-11-19 11:45:46', 0, '140191', 'teacher', '140191', '', 0, 1, '2014-11-19 11:45:46'),
(145, 'pbkdf2_sha256$10000$Wj8v6gtLChWl$CVaPEyuO/3gSxhU34J4sEIkpmKS4e+pg50YN7iy/NBQ=', '2014-11-19 11:46:08', 0, '149116', 'teacher', '149116', '', 0, 1, '2014-11-19 11:46:08'),
(146, 'pbkdf2_sha256$10000$e4PyGyr8HVnO$wiAf9J83b4Lfjh2vN/ADXh4CsWmXHC/UthUOJ/b/ADM=', '2014-11-19 11:46:56', 0, '139132', 'teacher', '139132', '', 0, 1, '2014-11-19 11:46:56'),
(147, 'pbkdf2_sha256$10000$cZe7Rzv0UAfn$DVzkJRQabajJv7wqpBCr+r9XsB/FxYUTrXhSmCSl18w=', '2014-11-19 11:47:16', 0, '119072', 'teacher', '119072', '', 0, 1, '2014-11-19 11:47:16'),
(148, 'pbkdf2_sha256$10000$ooPCgreUmRPA$Abav8ASzxmxn16q/idqSOwBj9YUh2HB5uth8Po3whwI=', '2014-11-19 11:47:37', 0, '129251', 'teacher', '129251', '', 0, 1, '2014-11-19 11:47:37'),
(149, 'pbkdf2_sha256$10000$RWiOWBnpepm3$RGTFIYUdj4IPVuLaHI8Mm9TIitPyRjQliVojabaeWGE=', '2014-11-19 11:48:47', 0, '139052', 'teacher', '139052', '', 0, 1, '2014-11-19 11:48:47'),
(150, 'pbkdf2_sha256$10000$cgarzBH2QoZQ$WsDeOvlTmrP4+Zky+qsas1qOviokyz4ANyvj/ptzfAs=', '2014-11-19 11:49:08', 0, '130198', 'teacher', '130198', '', 0, 1, '2014-11-19 11:49:08'),
(151, 'pbkdf2_sha256$10000$WSufmG3DQr1P$XGj5S5KvEpn6Lg9cJ850qVtOYH7uSCOl/vzCMYpFrCw=', '2014-11-19 11:49:27', 0, '120082', 'teacher', '120082', '', 0, 1, '2014-11-19 11:49:27'),
(152, 'pbkdf2_sha256$10000$QT5sfq1WF4uL$+djF7lWF2N6qa6+bCKr1rbVvUzVSSDeivcXIu6gY7ZY=', '2014-11-19 11:49:45', 0, '119240', 'teacher', '119240', '', 0, 1, '2014-11-19 11:49:45'),
(153, 'pbkdf2_sha256$10000$zI95HdPezgs1$jLwEsaXW2gWjprAjyPX1cIYn4o2Ainq2tG79LRDRdx0=', '2014-11-19 11:50:02', 0, '120165', 'teacher', '120165', '', 0, 1, '2014-11-19 11:50:02'),
(154, 'pbkdf2_sha256$10000$Gz1YKP0XCuaz$AXQ8HMSLSoEue0Ppi5UtwO5956UYeCDewql7KgOrRYQ=', '2014-11-19 11:50:22', 0, '120171', 'teacher', '120171', '', 0, 1, '2014-11-19 11:50:22'),
(155, 'pbkdf2_sha256$10000$8LQ5PBdlq1ru$8dk9Cuuj0JYg6ItUHvfubN4KIN53IZzIoHsevynxcAE=', '2014-11-19 11:50:45', 0, '139276', 'teacher', '139276', '', 0, 1, '2014-11-19 11:50:45'),
(156, 'pbkdf2_sha256$10000$ZnLF6FcDTtXQ$Tx9/4gtnqlJfXiymD5B6LVu3UJ5d6vH8I1gwyznitdU=', '2014-11-19 11:51:04', 0, '120101', 'teacher', '120101', '', 0, 1, '2014-11-19 11:51:04'),
(157, 'pbkdf2_sha256$10000$mbJ0xThqWbTY$67xQKATvzcsJw7yVAicZjOsmhjcd0UdYmlIrCfTXDa0=', '2014-11-19 11:52:33', 0, '030119', 'teacher', '030119', '', 0, 1, '2014-11-19 11:52:33'),
(158, 'pbkdf2_sha256$10000$nGs0TRTYTqSF$1P+J1K2FxUdcdMr/g7d7tLp0gOupleI8xrjbIfMg/sk=', '2014-11-19 11:52:48', 0, '120104', 'teacher', '120104', '', 0, 1, '2014-11-19 11:52:48'),
(159, 'pbkdf2_sha256$10000$S35LVoagTjNT$pXd13RNaL6mMWfhAyWG9YD/kpb+vj+4soxvxhd02ASU=', '2014-11-19 12:14:23', 0, 'luozq3', 'student', '', '', 0, 1, '2014-11-19 12:14:22'),
(161, 'pbkdf2_sha256$10000$gOjQp2ToUEZl$j2xWnRTMDGGS2SvQedLQ+Wot2V5m2k/s1XcwCrLCGqY=', '2014-11-19 13:04:29', 0, 'chenklin', 'student', '', '', 0, 1, '2014-11-19 13:04:00'),
(164, 'pbkdf2_sha256$10000$ur1LAOFQrl34$58CwON6fdUdB5sO7sKhZ5xEb0Ul2ar8Zwex2YYLNhZw=', '2014-11-19 13:31:41', 0, 'Liangzhh27', 'student', '', '', 0, 1, '2014-11-19 13:31:01'),
(167, 'pbkdf2_sha256$10000$rkKKJuN2JbLD$km+bl0gcYVIUF92RuYXsEbKgDSzf6M7vEIGhJ/En3uU=', '2014-11-19 13:50:35', 0, 'wuyu38', 'student', '', '', 0, 1, '2014-11-19 13:50:15'),
(185, 'pbkdf2_sha256$10000$zHqC5ylC0aMx$du37LQbEg7S44tl7xOq86VFGe2JLgFkniTg0UdhYKSE=', '2014-11-19 13:55:18', 0, 'zhanghq8', 'student', '', '', 0, 1, '2014-11-19 13:55:18'),
(190, 'pbkdf2_sha256$10000$1xfH5EjnOwwm$NtUIYQ5Y1hfHPwENa4YdBsTTxVdcV6Bh8edCJY6ILPQ=', '2014-11-19 13:57:41', 0, 'lixy76', 'student', '', '', 0, 1, '2014-11-19 13:57:40');

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

--
-- 转存表中的数据 `auth_user_groups`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=120 ;

--
-- 转存表中的数据 `committee_societies`
--

INSERT INTO `committee_societies` (`id`, `name`, `committee_id`) VALUES
(3, '中山大学珠海校区学生会', 4),
(4, '中山大学珠海校区广播台', 4),
(5, '团工委办公室', 4),
(6, '民族乐团', 4),
(7, '珠海校区合唱团', 4),
(8, '珠海校区舞蹈团', 4),
(9, '珠海校区话剧社', 4),
(10, '珠海校区管弦乐团', 4),
(11, '珠海校区ET街舞社', 4),
(12, 'will动漫协会珠海分会', 4),
(13, '乐元素', 4),
(14, '青年科技协会', 4),
(15, '摄影协会', 4),
(16, '天文学社', 4),
(17, '创业协会', 4),
(18, '岭南剧社珠海分社', 4),
(19, '岭南书画社', 4),
(20, '棋类协会', 4),
(21, '游泳协会', 4),
(22, '职业生涯发展协会', 4),
(23, '岭南诗词研习社', 4),
(24, '经济学社', 4),
(25, '跆拳道协会', 4),
(26, '武术协会', 4),
(27, '轮滑协会', 4),
(28, '魔防工作室', 4),
(29, '珠海校区逸仙书社', 4),
(30, '岩舞者协会', 4),
(31, '金字塔学社', 4),
(32, '自行车协会', 4),
(33, '探险协会', 4),
(34, '粤语协会', 4),
(35, '健康生活协会', 4),
(36, '定向运动协会', 4),
(37, '紫荆诗社', 4),
(38, '台球协会', 4),
(39, '旅游协会', 4),
(40, '美食文化协会', 4),
(41, '英语演讲协会Toast masters', 4),
(42, '影视协会', 4),
(43, '珠海校区外语协会', 4),
(44, '集邮协会', 4),
(45, 'Maxcell资源在线协会', 4),
(46, '灯谜协会', 4),
(47, '魔术协会', 4),
(48, '网球协会', 4),
(49, '足球协会', 4),
(50, '中大青年传媒', 4),
(51, '篮球协会', 4),
(52, '珠海校区广播台', 4),
(53, '中珠All share义务服务协会', 4),
(54, '棒垒球协会', 4),
(55, '求进报社', 4),
(56, '红十字会珠海校区分会', 4),
(57, '乒乓球协会', 4),
(58, '排球协会', 4),
(59, '青年志愿者协会', 4),
(60, '羽毛球协会', 4),
(61, '爱心同盟', 4),
(62, '爱心助学协会', 4),
(63, '校园安全文明宣传协会', 4),
(64, '招生宣传志愿者协会', 4),
(65, '海精灵志愿者协会', 4),
(66, '学生校友协会', 4),
(67, 'Enactus', 4),
(68, '中山大学绿叶社', 4),
(69, '绿色青年组织', 4),
(70, '雁行社', 4),
(71, '党员服务队', 4),
(72, '宿舍管理委员会', 4),
(73, '马克思主义研修班', 4),
(74, '中山大学珠海校区记者站', 4),
(75, '海洋学院学生会', 4),
(76, '海洋学院团委', 4),
(77, '移动信息工程学院团委', 4),
(78, '移动信息工程学院学生会', 4),
(79, '海洋学院新闻中心', 4),
(80, '地球科学与地质工程学院学生会', 4),
(81, '移动信息工程学院学生学术发展中心', 4),
(82, '岭南学院珠海校区团总支', 4),
(83, '地球科学与地质工程学院蓝炎俱乐部', 4),
(84, '岭南学院珠海校区学生会', 4),
(85, '移动信息工程学院新闻中心', 4),
(86, '岭南学院大使馆（珠海分馆）', 4),
(87, '地球科学与地质工程学院辩论队', 4),
(88, '地球科学与地质工程学院团支部', 4),
(89, '岭南通讯社（珠海分社）', 4),
(90, '国际商学院团委', 4),
(91, '地理科学与规划学院团委学生会凝炬基金会', 4),
(92, '国际商学院学生会', 4),
(93, '翻译学院学生会', 4),
(94, '国际商学院职业拓展协会', 4),
(95, '翻译学院团委', 4),
(96, '地理科学与规划学院团委学生会		', 4),
(97, '翻译学院留学生接待团', 4),
(98, '地理科学与规划学院阳光之家		', 4),
(99, '国际商学院学术交流协会', 4),
(101, '翻译学院新闻中心', 4),
(102, '国际商学院资讯社', 4),
(104, '中文系学生会', 4),
(105, '中文系团总支', 4),
(106, '中山大学红学社', 4),
(107, '旅游学院学生会', 4),
(108, '外国语学院团总支', 4),
(109, '外国语学院学生会', 4),
(110, '中法核工程与技术学院一点公益', 4),
(111, '历史学系学生会', 4),
(112, '历史学系团总支', 4),
(113, '旅游学院团委', 4),
(114, '中法核工程与技术学院团委学生会联合会', 4),
(115, '旅游学院凝炬基金会', 4),
(116, '旅游学院CMAA俱乐部', 4),
(117, '旅游学院学生校友协会', 4),
(118, '旅游学院会展协会', 4),
(119, '中山大学珠海校区研究生学生会', 4);

-- --------------------------------------------------------

--
-- 表的结构 `committee_societies_teachers`
--

CREATE TABLE IF NOT EXISTS `committee_societies_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `societies_id` int(11) NOT NULL,
  `teacher_id` varchar(16) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `societies_id` (`societies_id`,`teacher_id`),
  KEY `committee_societies_teachers_8186ae78` (`societies_id`),
  KEY `committee_societies_teachers_c12e9d48` (`teacher_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=247 ;

--
-- 转存表中的数据 `committee_societies_teachers`
--

INSERT INTO `committee_societies_teachers` (`id`, `societies_id`, `teacher_id`) VALUES
(1, 3, '130185'),
(2, 4, '130185'),
(6, 5, '888888'),
(7, 6, '006745'),
(8, 6, '130185'),
(9, 7, '006750'),
(10, 8, '006361'),
(11, 8, '130185'),
(12, 9, '006750'),
(13, 9, '130185'),
(14, 10, '006745'),
(15, 10, '130185'),
(17, 11, '139233'),
(16, 11, '140188'),
(19, 12, '119153'),
(18, 12, '119156'),
(21, 13, '119097'),
(20, 13, '149147'),
(23, 14, '060158'),
(22, 14, '130185'),
(25, 15, '130200'),
(24, 15, '140188'),
(26, 16, '130200'),
(27, 17, '130185'),
(28, 17, '139263'),
(29, 18, '070204'),
(30, 19, '006591'),
(31, 20, '020186'),
(32, 20, '080069'),
(34, 21, '006061'),
(33, 21, '149147'),
(35, 22, '006668'),
(36, 22, '120158'),
(37, 23, '006185'),
(38, 23, '120159'),
(40, 24, '139001'),
(39, 24, '149147'),
(41, 25, '069252'),
(42, 26, '020130'),
(43, 26, '119097'),
(44, 27, '120159'),
(45, 27, '140188'),
(46, 28, '119154'),
(47, 28, '139003'),
(48, 29, '080078'),
(49, 29, '149015'),
(50, 30, '059226'),
(51, 30, '099161'),
(53, 31, '120126'),
(52, 31, '139100'),
(54, 32, '100108'),
(55, 32, '139003'),
(56, 33, '059226'),
(57, 33, '139003'),
(59, 34, '099161'),
(58, 34, '119097'),
(60, 35, '006759'),
(61, 35, '139233'),
(62, 36, '129100'),
(63, 36, '130200'),
(64, 37, '120159'),
(65, 37, '139101'),
(67, 38, '014116'),
(66, 38, '130200'),
(68, 39, '129218'),
(69, 39, '139233'),
(70, 40, '119097'),
(71, 40, '139003'),
(72, 41, '119104'),
(73, 42, '014035'),
(75, 43, '109054'),
(74, 43, '109150'),
(77, 44, '139003'),
(76, 44, '139263'),
(78, 45, '130185'),
(79, 46, '120159'),
(80, 46, '139001'),
(82, 47, '130200'),
(81, 47, '140188'),
(84, 48, '006715'),
(83, 48, '006721'),
(85, 49, '006715'),
(87, 50, '130185'),
(86, 50, '140178'),
(89, 51, '006179'),
(88, 51, '099002'),
(91, 52, '004924'),
(90, 52, '130185'),
(93, 53, '099161'),
(92, 53, '140188'),
(95, 54, '004949'),
(94, 54, '109126'),
(97, 55, '110096'),
(96, 55, '130186'),
(99, 56, '099161'),
(98, 56, '850961'),
(100, 57, '014020'),
(101, 57, '120213'),
(103, 58, '079097'),
(102, 58, '099101'),
(105, 59, '130185'),
(104, 59, '850961'),
(106, 60, '040089'),
(107, 60, '139003'),
(108, 61, '850961'),
(109, 62, '129218'),
(110, 62, '139100'),
(111, 63, '006715'),
(112, 63, '059012'),
(113, 64, '110062'),
(115, 65, '020027'),
(114, 65, '139263'),
(116, 66, '139003'),
(117, 66, '139046'),
(119, 67, '004050'),
(118, 67, '130185'),
(120, 68, '129218'),
(121, 68, '139003'),
(122, 69, '006715'),
(124, 70, '030119'),
(125, 70, '120104'),
(123, 70, '140178'),
(127, 71, '030119'),
(128, 71, '120104'),
(126, 71, '140178'),
(130, 72, '030119'),
(131, 72, '120104'),
(129, 72, '140178'),
(133, 73, '030119'),
(134, 73, '120104'),
(132, 73, '140178'),
(136, 74, '030119'),
(137, 74, '120104'),
(135, 74, '140178'),
(138, 75, '120165'),
(139, 75, '149015'),
(140, 76, '120165'),
(141, 76, '149015'),
(143, 77, '130200'),
(144, 77, '139101'),
(142, 77, '140188'),
(146, 78, '130200'),
(147, 78, '139101'),
(145, 78, '140188'),
(148, 79, '120165'),
(149, 79, '149015'),
(150, 80, '120101'),
(152, 81, '130200'),
(153, 81, '139101'),
(151, 81, '140188'),
(154, 82, '139001'),
(155, 83, '120101'),
(156, 84, '139001'),
(158, 85, '130200'),
(159, 85, '139101'),
(157, 85, '140188'),
(160, 86, '139001'),
(161, 87, '120101'),
(162, 88, '120101'),
(163, 89, '139001'),
(167, 90, '119240'),
(168, 90, '120082'),
(166, 90, '129251'),
(164, 90, '130198'),
(165, 90, '139052'),
(169, 91, '129218'),
(170, 91, '139003'),
(174, 92, '119240'),
(175, 92, '120082'),
(173, 92, '129251'),
(171, 92, '130198'),
(172, 92, '139052'),
(180, 93, '099161'),
(179, 93, '109054'),
(178, 93, '119072'),
(177, 93, '139132'),
(176, 93, '149116'),
(184, 94, '119240'),
(185, 94, '120082'),
(183, 94, '129251'),
(181, 94, '130198'),
(182, 94, '139052'),
(190, 95, '099161'),
(189, 95, '109054'),
(188, 95, '119072'),
(187, 95, '139132'),
(186, 95, '149116'),
(191, 96, '129218'),
(192, 96, '139003'),
(197, 97, '099161'),
(196, 97, '109054'),
(195, 97, '119072'),
(194, 97, '139132'),
(193, 97, '149116'),
(198, 98, '129218'),
(199, 98, '139003'),
(203, 99, '119240'),
(204, 99, '120082'),
(202, 99, '129251'),
(200, 99, '130198'),
(201, 99, '139052'),
(210, 101, '099161'),
(209, 101, '109054'),
(208, 101, '119072'),
(207, 101, '139132'),
(206, 101, '149116'),
(214, 102, '119240'),
(215, 102, '120082'),
(213, 102, '129251'),
(211, 102, '130198'),
(212, 102, '139052'),
(217, 104, '120159'),
(218, 105, '120159'),
(219, 106, '120159'),
(220, 107, '099101'),
(221, 107, '139233'),
(222, 107, '140191'),
(223, 108, '149147'),
(224, 109, '149147'),
(225, 110, '120171'),
(226, 110, '139276'),
(227, 111, '139100'),
(228, 112, '139100'),
(229, 113, '099101'),
(230, 113, '139233'),
(231, 113, '140191'),
(232, 114, '120171'),
(233, 114, '139276'),
(234, 115, '099101'),
(235, 115, '139233'),
(236, 115, '140191'),
(237, 116, '099101'),
(238, 116, '139233'),
(239, 116, '140191'),
(240, 117, '099101'),
(241, 117, '139233'),
(242, 117, '140191'),
(243, 118, '099101'),
(244, 118, '139233'),
(245, 118, '140191'),
(246, 119, '130185');

-- --------------------------------------------------------

--
-- 表的结构 `committee_tableset`
--

CREATE TABLE IF NOT EXISTS `committee_tableset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(256) COLLATE utf8_bin NOT NULL,
  `committee_id` int(11) NOT NULL,
  `file` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `committee_tableset_75f552bd` (`committee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=41 ;

--
-- 转存表中的数据 `committee_tableset`
--

INSERT INTO `committee_tableset` (`id`, `description`, `committee_id`, `file`) VALUES
(3, '课室借用申请表', 3, 'tables/申请表课室借用申请表_3.doc'),
(4, '北校区活动室、会议室使用申请表', 3, 'tables/排讲会北校区活动室会议室使用申请表.doc'),
(5, '中山大学外来大（中）型客车、工程车入校申请表', 3, 'tables/申请表中山大学外来大中型客车工程车入校申请表.doc'),
(6, '北校区团工委借用物资申请表', 3, 'tables/申请表北校区团工委借用物资申请表.docx'),
(7, '中山大学临时占用场地举办室外宣传活动申请表', 3, 'tables/申请表中山大学临时占用场地举办室外宣传活动申请表.doc'),
(8, '北校区活动室、会议室使用申请表', 3, 'tables/排讲会北校区活动室会议室使用申请表_1.doc'),
(9, '北校区宣传品内容审核申请表', 3, 'tables/申请表北校区宣传品内容审核申请表.doc'),
(10, '中山大学临时使用课室申请表2011', 1, 'tables/中山大学临时使用课室申请表2011.doc'),
(11, '校团委会议室借用申请表（新）', 1, 'tables/校团委会议室借用申请表新.docx'),
(12, '东校区舞蹈室使用申请表', 1, 'tables/东校区舞蹈室使用申请表.doc'),
(13, '中山大学东校区明德学生活动中心使用申请表及使用须知', 1, 'tables/中山大学东校区明德学生活动中心使用申请表及使用须知.docx'),
(14, '中山大学东校区长桌借用申请表', 1, 'tables/中山大学东校区长桌借用申请表.doc'),
(15, '中山大学东校区折叠椅借用申请表', 1, 'tables/中山大学东校区折叠椅借用申请表.doc'),
(16, '中山大学南校区学生活动物资借用申请表', 2, 'tables/中山大学南校区学生活动物资借用申请表.doc'),
(17, '课室申请表', 2, 'tables/课室申请表.doc'),
(18, '中山大学悬挂横幅及张贴广告申请表', 2, 'tables/中山大学悬挂横幅及张贴广告申请表.doc'),
(19, '【舞厅、讲学厅、多功能厅】使用登记表', 2, 'tables/舞厅讲学厅多功能厅使用登记表.doc'),
(20, '怀士堂【小礼堂】使用登记表', 2, 'tables/怀士堂小礼堂使用登记表.doc'),
(21, '梁銶琚堂【大礼堂】使用登记表', 2, 'tables/梁銶琚堂大礼堂使用登记表.doc'),
(22, '临时占用场地申请表', 2, 'tables/临时占用场地申请表.doc'),
(23, '三教学术报告厅申请表', 2, 'tables/三教学术报告厅申请表.doc'),
(24, '校办场地【舞厅、讲学厅、多功能厅、小礼堂、大礼堂】使用申请表1', 2, 'tables/校办场地舞厅讲学厅多功能厅小礼堂大礼堂使用申请表1.doc'),
(25, '【314、401】熊德龙会议室预约申请回执单3个版', 2, 'tables/314401熊德龙会议室预约申请回执单3个版.doc'),
(26, '外来大、中型客车入校申请表', 2, 'tables/外来大中型客车入校申请表.doc'),
(27, '举办大型活动申请表', 2, 'tables/举办大型活动申请表.doc'),
(28, '中山大学学生活动申请表', 2, 'tables/中山大学学生活动申请表.doc'),
(29, '学生团体名称变更申请表 水印版', 2, 'tables/学生团体名称变更申请表_水印版.doc'),
(30, '中山大学学生团体印章使用情况备案登记表', 2, 'tables/中山大学学生团体印章使用情况备案登记表.pdf'),
(31, '中山大学学生团体制章申请表', 2, 'tables/中山大学学生团体制章申请表.pdf'),
(32, '中山大学外来大、中型客车入校申情表', 4, 'tables/中山大学外来大中型客车入校申情表.doc'),
(33, 'F519 F520超大课室申请表', 4, 'tables/F519_F520超大课室申请表.doc'),
(34, '课室申请表', 4, 'tables/课室申请表_1.doc'),
(35, '保卫办小板凳申请表', 4, 'tables/保卫办小板凳申请表.docx'),
(36, '物资申请（电源线专用）', 4, 'tables/物资申请电源线专用.doc'),
(37, '物资申请表', 4, 'tables/物资申请表.doc'),
(38, '场地申请表10.11更新', 4, 'tables/场地申请表10.11更新.doc'),
(39, '场地申请表10.11更新', 4, 'tables/场地申请表10.11更新_1.doc'),
(40, '宣传品申请表', 4, 'tables/宣传品申请表.doc');

-- --------------------------------------------------------

--
-- 表的结构 `committee_teacher`
--

CREATE TABLE IF NOT EXISTS `committee_teacher` (
  `tno` varchar(16) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(75) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `gender` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `work` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `wageNumber` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `committee_id` int(11) NOT NULL,
  PRIMARY KEY (`tno`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `committee_teacher_75f552bd` (`committee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `committee_teacher`
--

INSERT INTO `committee_teacher` (`tno`, `name`, `email`, `phone`, `gender`, `work`, `wageNumber`, `user_id`, `isActive`, `committee_id`) VALUES
('004050', '卓鸥', NULL, NULL, NULL, NULL, NULL, 137, 1, 4),
('004924', '阮文江', NULL, NULL, NULL, NULL, NULL, 99, 1, 4),
('004949', '何江海', NULL, NULL, NULL, NULL, NULL, 117, 1, 4),
('006061', '康寅', NULL, NULL, NULL, NULL, NULL, 138, 1, 4),
('006179', '宋花香', NULL, NULL, NULL, NULL, NULL, 120, 1, 4),
('006185', '张海鸥', NULL, NULL, NULL, NULL, NULL, 111, 1, 4),
('006361', '武昌林', NULL, NULL, NULL, NULL, NULL, 97, 1, 4),
('006591', '钟东', NULL, NULL, NULL, NULL, NULL, 102, 1, 4),
('006668', '万海峰', NULL, NULL, NULL, NULL, NULL, 109, 1, 4),
('006715', '黎运钦', NULL, NULL, NULL, NULL, NULL, 123, 1, 4),
('006721', '周才', NULL, NULL, NULL, NULL, NULL, 125, 1, 4),
('006745', '蒋琴', NULL, NULL, NULL, NULL, NULL, 94, 1, 4),
('006750', '周莉', NULL, NULL, NULL, NULL, NULL, 95, 1, 4),
('006759', '杨茜', NULL, NULL, NULL, NULL, NULL, 106, 1, 4),
('014020', '张晓红', NULL, NULL, NULL, NULL, NULL, 115, 1, 4),
('014035', '阙迪文', NULL, NULL, NULL, NULL, NULL, 103, 1, 4),
('014116', '杨波', NULL, NULL, NULL, NULL, NULL, 127, 1, 4),
('020027', '吴玉萍', NULL, NULL, NULL, NULL, NULL, 134, 1, 4),
('020130', '尚瑞花', NULL, NULL, NULL, NULL, NULL, 133, 1, 4),
('020186', '蔡永茂', NULL, NULL, NULL, NULL, NULL, 139, 1, 4),
('030119', '殷敏', NULL, NULL, NULL, NULL, NULL, 157, 1, 4),
('040089', '武东海', NULL, NULL, NULL, NULL, NULL, 110, 1, 4),
('059012', '李东升', NULL, NULL, NULL, NULL, NULL, 126, 1, 4),
('059226', '王子恒', NULL, NULL, NULL, NULL, NULL, 131, 1, 4),
('060158', '刘泽炀', NULL, NULL, NULL, NULL, NULL, 78, 1, 4),
('069252', '黄帼婷', NULL, NULL, NULL, NULL, NULL, 135, 1, 4),
('070204', '秦彧', NULL, NULL, NULL, NULL, NULL, 100, 1, 4),
('079097', '王守力', NULL, NULL, NULL, NULL, NULL, 112, 1, 4),
('080069', '代中现', NULL, NULL, NULL, NULL, NULL, 140, 1, 4),
('080078', '周玉兰', NULL, NULL, NULL, NULL, NULL, 113, 1, 4),
('099002', '王迪', NULL, NULL, NULL, NULL, NULL, 121, 1, 4),
('099101', '王雪燕', NULL, NULL, NULL, NULL, NULL, 90, 1, 4),
('099161', '宋海峰', NULL, NULL, NULL, NULL, NULL, 119, 1, 4),
('100108', '邱楚东', NULL, NULL, NULL, NULL, NULL, 130, 1, 4),
('109054', '穆小路', NULL, NULL, NULL, NULL, NULL, 141, 1, 4),
('109126', '张红星', NULL, NULL, NULL, NULL, NULL, 118, 1, 4),
('109150', '齐金鑫', NULL, NULL, NULL, NULL, NULL, 122, 1, 4),
('110062', '吴立坚', NULL, NULL, NULL, NULL, NULL, 129, 1, 4),
('110096', '郭予填', NULL, NULL, NULL, NULL, NULL, 96, 1, 4),
('119072', '叶玮茵', NULL, NULL, NULL, NULL, NULL, 147, 1, 4),
('119097', '徐侨妹', NULL, NULL, NULL, NULL, NULL, 86, 1, 4),
('119104', '于洋', NULL, NULL, NULL, NULL, NULL, 124, 1, 4),
('119153', '陈碧华', NULL, NULL, NULL, NULL, NULL, 104, 1, 4),
('119154', '王华斌', NULL, NULL, NULL, NULL, NULL, 107, 1, 4),
('119156', '赵冉', NULL, NULL, NULL, NULL, NULL, 105, 1, 4),
('119240', '徐颖', NULL, NULL, NULL, NULL, NULL, 152, 1, 4),
('120082', '杜小芳', NULL, NULL, NULL, NULL, NULL, 151, 1, 4),
('120101', '曾白玉', NULL, NULL, NULL, NULL, NULL, 156, 1, 4),
('120104', '周樱捷', NULL, NULL, NULL, NULL, NULL, 158, 1, 4),
('120126', '肖瑜', NULL, NULL, NULL, NULL, NULL, 116, 1, 4),
('120158', '董哲', NULL, NULL, NULL, NULL, NULL, 108, 1, 4),
('120159', '柳翠嫦', NULL, NULL, NULL, NULL, NULL, 80, 1, 4),
('120165', '汪帼英', NULL, NULL, NULL, NULL, NULL, 153, 1, 4),
('120171', '赵静', NULL, NULL, NULL, NULL, NULL, 154, 1, 4),
('120213', '苑占江', NULL, NULL, NULL, NULL, NULL, 114, 1, 4),
('129100', '欧阳建飞', NULL, NULL, NULL, NULL, NULL, 128, 1, 4),
('129218', '孟祥韵', NULL, NULL, NULL, NULL, NULL, 83, 1, 4),
('129251', '刘如晓', NULL, NULL, NULL, NULL, NULL, 148, 1, 4),
('130185', '蒋文涵', NULL, NULL, NULL, NULL, NULL, 68, 1, 4),
('130186', '卢思颖', NULL, NULL, NULL, NULL, NULL, 98, 1, 4),
('130198', '黄殷', NULL, NULL, NULL, NULL, NULL, 150, 1, 4),
('130200', '林仪', NULL, NULL, NULL, NULL, NULL, 88, 1, 4),
('139001', '杨奇', NULL, NULL, NULL, NULL, NULL, 82, 1, 4),
('139003', '陈素玲', NULL, NULL, NULL, NULL, NULL, 85, 1, 4),
('139046', '邵筠', NULL, NULL, NULL, NULL, NULL, 136, 1, 4),
('139052', '崔丹', NULL, NULL, NULL, NULL, NULL, 149, 1, 4),
('139100', '常璐显', NULL, NULL, NULL, NULL, NULL, 84, 1, 4),
('139101', '蒋莉荛', NULL, NULL, NULL, NULL, NULL, 87, 1, 4),
('139132', '黄佳玮', NULL, NULL, NULL, NULL, NULL, 146, 1, 4),
('139233', '陆泉', NULL, NULL, NULL, NULL, NULL, 77, 1, 4),
('139263', '侯冬伟', NULL, NULL, NULL, NULL, NULL, 132, 1, 4),
('139276', '马雷妮', NULL, NULL, NULL, NULL, NULL, 155, 1, 4),
('140178', '胡薇琳', NULL, NULL, NULL, NULL, NULL, 101, 1, 4),
('140188', '谢丹琼', NULL, NULL, NULL, NULL, NULL, 79, 1, 4),
('140191', '张洋', NULL, NULL, NULL, NULL, NULL, 144, 1, 4),
('149015', '方茂', NULL, NULL, NULL, NULL, NULL, 81, 1, 4),
('149116', '王梦雪', NULL, NULL, NULL, NULL, NULL, 145, 1, 4),
('149147', '林璐', NULL, NULL, NULL, NULL, NULL, 89, 1, 4),
('654321', '团工委办公室', NULL, NULL, NULL, NULL, NULL, 71, 0, 4),
('850961', '李红艳', NULL, NULL, NULL, NULL, NULL, 143, 1, 4),
('888888', '办公室', NULL, NULL, NULL, NULL, NULL, 76, 1, 4),
('999999', '团工委办公室', NULL, NULL, NULL, NULL, NULL, 75, 0, 4);

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

--
-- 转存表中的数据 `django_admin_log`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=25 ;

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
(22, '申请表', 'committee', 'tableset'),
(23, '附件', 'activity', 'attachment'),
(24, '业务指导老师', 'committee', 'teacher');

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
('10ggi64osqt4dy2glu4quu0lf0kblz67', 0x597a51334e6d5135596d55785957526a4f4441795a6d526a4d3255785a6d4e694e7a6b304e44517a4d57566b4f546c684e7a67785a447141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415156314c673d3d, '2014-12-03 09:55:17'),
('178b4gv9n6zpjxm1t3ofdr7kkyi0vgyp', 0x4d5451304e5451354f4751334d7a5130595463774e5451334d7a526a4e4455784e446b3159324a6a5a4745334f4756685a4451324e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415342314c673d3d, '2014-12-03 04:20:05'),
('2sgutvu7g84rs4haq1ncbrvqqrc8kw3s', 0x59544d79595455795957566c5a6a5134596d5a6a4e5441334e6d5130596d59334e32466b4e6a51794d5459354d6a646c4d4759334d6a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b41525a314c673d3d, '2014-12-03 13:54:50'),
('33ux5eoc2fi3mpd5q7w4alalp3ffk1wy', 0x4f44526c596d4e6b4d5455784d544a6a5a6a457959574534596a426d4f444d794f4755794f44557a5a44517a4d6a51795a4459304e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415252314c673d3d, '2014-10-09 16:32:38'),
('3cs0ejdm9oug293gp5ys4eyvkf88rclr', 0x4d7a51345a4441774f5449785a5445774e7a686c4d475a6d4e6a6c694f444530593245784e3259324f544a684e7a677a4f5445315a547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415256314c673d3d, '2014-09-04 04:48:46'),
('3tb7v8rxog6ue78kgzz67w1c61zntm1f', 0x4e44526a4e574d344e544e694d5759794f4464684d6a526a596a45775a54566c4e6a6b34596d4e684d574d314d544d304e574e684f547141416e31784153343d, '2014-12-03 12:47:28'),
('41walspjoz43kmicb7lou6mxn91133oy', 0x4e44526a4e574d344e544e694d5759794f4464684d6a526a596a45775a54566c4e6a6b34596d4e684d574d314d544d304e574e684f547141416e31784153343d, '2014-09-11 02:26:32'),
('471axxd7371j8xf2h568zwdcydr1g9v7', 0x59324d324f5445314e7a4133596d4d775a44646b597a6b314d4449324e6d4e694f446c6d4f44497a4f544a69596a49334d32557a596a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415674314c673d3d, '2014-12-03 12:34:46'),
('47ugb0byql5r47pr8y627s3ytjj26bmj', 0x4e6a4577596d51355a4441344d324e6b5a446b78596d526a595441794f4451304e6d51325a546c6a4e3251355a446b335a5749355a547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b41515a314c673d3d, '2014-09-05 09:35:17'),
('47yvw5w6c5auxjj7vbk0sfug2t26owb5', 0x4f5456685a6a4d7a4f54466b595749314e6a646c4e3249314e57526b4d324a695a6a55344d444934595755334e6a59324e4445344d6a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b417163416453343d, '2014-12-03 13:50:35'),
('4q1lrl98ecof74szv0fzf67el5pvit0r', 0x4e5446685a445268595459324d5467334f545a6a597a6b344d5745354e6a45324f474e6c5954597959324d304e4441325a6a566a4f547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415470314c673d3d, '2014-12-03 01:31:03'),
('5bz6f1qprlxp7jr51tgc2d0aazkt93zk', 0x59544d79595455795957566c5a6a5134596d5a6a4e5441334e6d5130596d59334e32466b4e6a51794d5459354d6a646c4d4759334d6a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b41525a314c673d3d, '2014-11-19 06:59:57'),
('62emqgl3gqqvc32vl5nh4pug4op6x08g', 0x4d7a51345a4441774f5449785a5445774e7a686c4d475a6d4e6a6c694f444530593245784e3259324f544a684e7a677a4f5445315a547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415256314c673d3d, '2014-09-11 02:36:49'),
('6eqrmbwywkutujzptn7dgqo8cm9r8t8a', 0x5a6a49335a5441334f4441794e5755334f546c6b4d5459784f4745315a4749325a4467354e6a45344e4749304d44497859574e6b4d447141416e317841536856436b784a5531526655565646556c6c594351414141474e76625731706448526c5a58454356516c7a62324e705a5852705a584e7841345a7842465541686c5553583246316447686664584e6c636c396959574e725a57356b56536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a46554e583246316447686664584e6c636c39705a496f4242585575, '2014-12-03 11:54:23'),
('6j4ghlqr66rtm406mn7aphsd6larok3q', 0x4e44526a4e574d344e544e694d5759794f4464684d6a526a596a45775a54566c4e6a6b34596d4e684d574d314d544d304e574e684f547141416e31784153343d, '2014-09-06 11:40:02'),
('7vsufwfk6q2fnz84pqpxh37zj478u51e', 0x4e44526a4e574d344e544e694d5759794f4464684d6a526a596a45775a54566c4e6a6b34596d4e684d574d314d544d304e574e684f547141416e31784153343d, '2014-10-29 04:31:34'),
('7vzbvosuk0nvlgqlnz1teakestmxlepw', 0x4f47557a5a444e6d4d7a4d794e6a59304e7a5a6a4f47526c4d32466c4d574e684f5442694f4746684d54646c593245304d57457a4f447141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415478314c673d3d, '2014-12-03 02:08:37'),
('834yj72n4jhq5kekcyy39zvz2dqn4g55', 0x5a6a4d314e474e694d54417a4d6a6c6c4e5445794e7a6c6c4e4445774d4751324d7a4e6d4d6a466d4e7a63344d6a526b4d6d55304d547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b41514a314c673d3d, '2014-09-05 02:29:10'),
('8kidktlzzfivdjhgiwbzs1ybbsvlnsl8', 0x4e44526a4e574d344e544e694d5759794f4464684d6a526a596a45775a54566c4e6a6b34596d4e684d574d314d544d304e574e684f547141416e31784153343d, '2014-12-02 15:19:07'),
('8vwf40cz44o3hpc5crpuq2ifuwm4dnux', 0x4e446c6c4f44557a4d6a68684e6a4a6a4e325a6d5932466b4f54466c4d6d4d3359325a6d4e6a6b344d6a51335a545a694f57466c596a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415431314c673d3d, '2014-12-03 02:18:42'),
('9q4q7hnuqxe6ctpi81puth17u9li3tmo', 0x597a51334e6d5135596d55785957526a4f4441795a6d526a4d3255785a6d4e694e7a6b304e44517a4d57566b4f546c684e7a67785a447141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415156314c673d3d, '2014-11-19 05:39:24'),
('a2l35wjus9dobxpsv9egal1k4jywy5et', 0x4e7a6331596a4133595751785a6d49334e4442684e5455345a446c684d6a4d784e6a55354d44553159574e6b4f5451784d7a557a4d7a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415568314c673d3d, '2014-12-03 13:48:27'),
('b3zx0rkynlt7saoiwop0e5atn2dikds3', 0x4e44526a4e574d344e544e694d5759794f4464684d6a526a596a45775a54566c4e6a6b34596d4e684d574d314d544d304e574e684f547141416e31784153343d, '2014-09-15 02:57:26'),
('brgxpaqcukjt58tj6l03w5m11my69p7e', 0x4e7a6331596a4133595751785a6d49334e4442684e5455345a446c684d6a4d784e6a55354d44553159574e6b4f5451784d7a557a4d7a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415568314c673d3d, '2014-12-03 07:42:02'),
('bywobop335ljntkmy9l49nqs597tx34p', 0x4d6d4d7a4e574d304f44677a4f474d324f44497a59324d324d7a6b314e324d7a5a4463355a446c6c4f57517a4d5441345954497a4f447141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415578314c673d3d, '2014-12-03 13:50:06'),
('c2z94o31tirribn5qphsk5uq0kfr9q90', 0x4e6a67324d5459314f5749304e444d7a5a6a6b7a597a55344e4464695a4749334d544d314e47566b4f4446694d6a426b4e4459774e6a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b41555a314c673d3d, '2014-12-03 06:23:05'),
('cxc6d6gegc3cwwswmz3o7dhjur13b2kj', 0x597a51334e6d5135596d55785957526a4f4441795a6d526a4d3255785a6d4e694e7a6b304e44517a4d57566b4f546c684e7a67785a447141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415156314c673d3d, '2014-12-02 23:31:32'),
('dryz16o63m3kzqntsg7mlsjhbkdr38h6', 0x4e44526a4e574d344e544e694d5759794f4464684d6a526a596a45775a54566c4e6a6b34596d4e684d574d314d544d304e574e684f547141416e31784153343d, '2014-12-03 05:38:54'),
('epnapmop2bgyb2zixsxxxd63ywsqydzd', 0x597a51334e6d5135596d55785957526a4f4441795a6d526a4d3255785a6d4e694e7a6b304e44517a4d57566b4f546c684e7a67785a447141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415156314c673d3d, '2014-12-03 06:26:29'),
('f9qtxdmqqjppl601r214o87pxt38103w', 0x4f5456685a6a4d7a4f54466b595749314e6a646c4e3249314e57526b4d324a695a6a55344d444934595755334e6a59324e4445344d6a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b417163416453343d, '2014-12-03 13:50:35'),
('fjssswcwg41kwvre4dyh3g1y2ou1v43d', 0x4f44526c596d4e6b4d5455784d544a6a5a6a457959574534596a426d4f444d794f4755794f44557a5a44517a4d6a51795a4459304e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415252314c673d3d, '2014-09-11 04:17:53'),
('gugjkru6pwjn38vei2dg0tr77y0ykthe', 0x4e44526a4e574d344e544e694d5759794f4464684d6a526a596a45775a54566c4e6a6b34596d4e684d574d314d544d304e574e684f547141416e31784153343d, '2014-09-05 08:09:03'),
('habpliurg4eiu7u7u7a1sa5ocidzpywv', 0x4f44526c596d4e6b4d5455784d544a6a5a6a457959574534596a426d4f444d794f4755794f44557a5a44517a4d6a51795a4459304e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415252314c673d3d, '2014-09-08 10:36:30'),
('hw2lw0qtistj2ff9otydw8y1ydxj8kl2', 0x4d7a686d597a646859574d335a6a45314d475a694e6a426d4d6a6b304e5755784f4467774e444d324f5467314e5751795a446b30596a7141416e317841536856436b784a5531526655565646556c6c594351414141474e76625731706448526c5a58454356516c7a62324e705a5852705a584e7841345a7842465541686c554e583246316447686664584e6c636c39705a496f4242565553583246316447686664584e6c636c396959574e725a57356b56536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a485575, '2014-12-03 12:35:25'),
('i888q59otga887jm2mrxvgskjku3plp9', 0x4f544d30596d517a4e7a41774d44466c4d6a526b4d7a45314d5455784e6d55774f574d304f5746684f5755795954686d4e6a67304e7a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b417145416453343d, '2014-12-03 13:04:01'),
('i8npkoxoq9ckufrl9fl67l6ttpnhunyu', 0x4d6a41324f474535596a566b596d49325a4449334f4468684d5452684e6d4a684e5445784e7a426d4d444d794f446b35596a4a694d547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b417038416453343d, '2014-12-03 12:14:23'),
('ifbkqp7tipwm49qk51aqboy9zdwszqzx', 0x4e44526a4e574d344e544e694d5759794f4464684d6a526a596a45775a54566c4e6a6b34596d4e684d574d314d544d304e574e684f547141416e31784153343d, '2014-09-11 04:17:14'),
('ilqvrvdc1ns0ind48nf51rgf2khtknnf', 0x4f5456685a6a4d7a4f54466b595749314e6a646c4e3249314e57526b4d324a695a6a55344d444934595755334e6a59324e4445344d6a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b417163416453343d, '2014-12-03 13:50:34'),
('izpaps15j2rt7p9lizlbk7okswqf7es7', 0x4e5459344e546b7a4d6d4d304f575a6d5a6d4668596a41784e5463794e575a6c4d7a526d4d544a694e44553059546734596a526b5a6a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b417151416453343d, '2014-12-03 13:31:01'),
('javqygom4aytya3nez7g04wei4kuxbis', 0x4f5759774e7a5a68596a6b774f544e6b596d526b593251304d444a6d4d6a42685a5451304f546731596a6b7a4d7a686a4f44517a4d447141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415352314c673d3d, '2014-12-02 23:02:51'),
('jc69hpmtznlt5sulzar75xjk4g2l1419', 0x4e7a67354e4759774e4755305a445a6d4e4755345a544d775a6a56684d32526d4f5456694e4755314d4749775a544532595751304f547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b41726b416453343d, '2014-12-03 13:55:18'),
('k2ml4d588t0f644nbod4q9apqk4wjlt0', 0x4f5759354e6a56695a6a6b334e54497a4e7a4a6c4d7a426d59545934595749324e6d56695a47517a596a6c694e324d324d6a45344e7a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415135314c673d3d, '2014-09-03 10:16:44'),
('kaac7tb2655s35p31nlscrt8c2wzz3wg', 0x4f5456685a6a4d7a4f54466b595749314e6a646c4e3249314e57526b4d324a695a6a55344d444934595755334e6a59324e4445344d6a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b417163416453343d, '2014-12-03 13:50:35'),
('kl8l7umorqj3kdcnkd42gziuvwrkls8r', 0x4e44526a4e574d344e544e694d5759794f4464684d6a526a596a45775a54566c4e6a6b34596d4e684d574d314d544d304e574e684f547141416e31784153343d, '2014-09-08 13:13:15'),
('kl9d2on3tbuv6r6cpkq68gx4c42jjft5', 0x4f44526c596d4e6b4d5455784d544a6a5a6a457959574534596a426d4f444d794f4755794f44557a5a44517a4d6a51795a4459304e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415252314c673d3d, '2014-09-06 10:13:41'),
('l1ddsmskyeduqt44h224he454jjwyoo8', 0x4e44526a4e574d344e544e694d5759794f4464684d6a526a596a45775a54566c4e6a6b34596d4e684d574d314d544d304e574e684f547141416e31784153343d, '2014-12-02 23:02:13'),
('l5u3a58t2cahvi0asiidlt5inkw6kzvp', 0x4f44526c596d4e6b4d5455784d544a6a5a6a457959574534596a426d4f444d794f4755794f44557a5a44517a4d6a51795a4459304e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415252314c673d3d, '2014-09-11 04:27:54'),
('lkx90ncmim6bafebbga9ztjkt43fy94z', 0x4e44526a4e574d344e544e694d5759794f4464684d6a526a596a45775a54566c4e6a6b34596d4e684d574d314d544d304e574e684f547141416e31784153343d, '2014-12-03 13:46:26'),
('lnztx0yubhginjysk1tjj6bfvgluv0qu', 0x4f44526c596d4e6b4d5455784d544a6a5a6a457959574534596a426d4f444d794f4755794f44557a5a44517a4d6a51795a4459304e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415252314c673d3d, '2014-09-05 03:56:58'),
('lqh5g0ce7edsra1arp8ykv79781hi902', 0x597a51334e6d5135596d55785957526a4f4441795a6d526a4d3255785a6d4e694e7a6b304e44517a4d57566b4f546c684e7a67785a447141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415156314c673d3d, '2014-11-30 06:01:10'),
('lqrmleoar5winjd8fa8ph7nq0vyv9oh6', 0x4f44526c596d4e6b4d5455784d544a6a5a6a457959574534596a426d4f444d794f4755794f44557a5a44517a4d6a51795a4459304e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415252314c673d3d, '2014-10-29 04:32:18'),
('mmohgykweqqepaf28jlrtyzj50lsroho', 0x4f44526c596d4e6b4d5455784d544a6a5a6a457959574534596a426d4f444d794f4755794f44557a5a44517a4d6a51795a4459304e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415252314c673d3d, '2014-09-11 07:19:00'),
('mr8s05bewzfp5d35cudoir3253lzvvhp', 0x4f47557a5a444e6d4d7a4d794e6a59304e7a5a6a4f47526c4d32466c4d574e684f5442694f4746684d54646c593245304d57457a4f447141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415478314c673d3d, '2014-12-03 02:00:26'),
('ndoxqobb2c1deiacxkue8dkhd9qg3tzg', 0x4d444177595441305a4749784d5751774f446b775a6a45324d444135596a4e6a4e6a526c5a44526c4d6a55314d4467784d5441354f547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415556314c673d3d, '2014-12-03 06:17:36'),
('oo06vuwmrl8rrg0kr6jsuf6cj8gk4auz', 0x4e5446685a445268595459324d5467334f545a6a597a6b344d5745354e6a45324f474e6c5954597959324d304e4441325a6a566a4f547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415470314c673d3d, '2014-12-03 01:28:58'),
('p5mc9krl41uc7agcz4z5fhd3245pgifi', 0x4f44526c596d4e6b4d5455784d544a6a5a6a457959574534596a426d4f444d794f4755794f44557a5a44517a4d6a51795a4459304e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415252314c673d3d, '2014-09-02 12:28:34'),
('q4bxou1euj6arzs8p0d9vwumsu3o696m', 0x4f544d30596d517a4e7a41774d44466c4d6a526b4d7a45314d5455784e6d55774f574d304f5746684f5755795954686d4e6a67304e7a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b417145416453343d, '2014-12-03 13:04:29'),
('q7iwzi9h5tk4bywkg0bidjtbil14n341', 0x4e57493059574d324e544e6d4e6a6335597a5a6b4e57597a4e7a42695a44493159324579593255325a6d5268596d526b4d6a6b7a597a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b41554e314c673d3d, '2014-12-03 04:15:30'),
('qr8h749ajdgwlnzwei7mo4abpcfddzg5', 0x597a51334e6d5135596d55785957526a4f4441795a6d526a4d3255785a6d4e694e7a6b304e44517a4d57566b4f546c684e7a67785a447141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415156314c673d3d, '2014-12-03 10:16:08'),
('r9leu4oxttavpn12rkhlplx8lzvmopz3', 0x4f44526c596d4e6b4d5455784d544a6a5a6a457959574534596a426d4f444d794f4755794f44557a5a44517a4d6a51795a4459304e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415252314c673d3d, '2014-09-08 03:55:06'),
('reo5snx87avc714h6jidea6d1n6n4awu', 0x4e3249354d6d457a596a4a694e32497a4e474e6a4d5451355a6d4a6a4f544a6b4d6d52684e3251794d6a55334e5756695a4468685a6a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b41526c314c673d3d, '2014-12-02 22:05:52'),
('ryhitzuj2ti6chg38wpqv3anprp2wdbn', 0x4d5451304e5451354f4751334d7a5130595463774e5451334d7a526a4e4455784e446b3159324a6a5a4745334f4756685a4451324e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415342314c673d3d, '2014-12-02 16:01:29'),
('sby0wkq1rjq12n3mn9b25zjtk3i63sm3', 0x4e7a67344e475578596a45794e6d59784e7a41785a5451334e5449344e6a49325957597a5a6a677a4d446c6d597a63794e7a526c4e7a7141416e317841536856436b784a5531526655565646556c6c594351414141474e76625731706448526c5a5845435651683059574a735a584e6c64484544686e45455651434756524a6659585630614639316332567958324a685932746c626d52564b5752715957356e6279356a62323530636d6c694c6d463164476775596d466a613256755a484d755457396b5a57784359574e725a57356b5651316659585630614639316332567958326c6b696745556453343d, '2014-10-02 10:19:26'),
('sgir47gpjxfctximg2yajdv39o87euf2', 0x4f5456685a6a4d7a4f54466b595749314e6a646c4e3249314e57526b4d324a695a6a55344d444934595755334e6a59324e4445344d6a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b417163416453343d, '2014-12-03 13:50:35'),
('to79k7pbcv8g2guq1t90ukph1eqdfbh1', 0x4f5456685a6a4d7a4f54466b595749314e6a646c4e3249314e57526b4d324a695a6a55344d444934595755334e6a59324e4445344d6a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b417163416453343d, '2014-12-03 13:50:15'),
('uq6t64drztj385xer3gyxhtsu1og7zoh', 0x5a5463314d7a566a5a6d526c4f5755305932526c4f4459314e7a67794d3245324f5759354f444d7a595449314d47466c597a63774f547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415439314c673d3d, '2014-12-03 03:16:23'),
('vxmvknx5vivrrup1ccpjif6np9jt1emo', 0x4d574a6d4f5451794f54686d4f5449774e474d344f4459334e6d49785a5467784d4459784f5751334e7a67334e325a6d4e7a41315a6a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b417234416453343d, '2014-12-03 13:57:41'),
('w3cgndzkxiryrhqz8bqeyvhr87a14tbi', 0x5a6a4d314e474e694d54417a4d6a6c6c4e5445794e7a6c6c4e4445774d4751324d7a4e6d4d6a466d4e7a63344d6a526b4d6d55304d547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b41514a314c673d3d, '2014-09-08 08:35:16'),
('wm50vfoa2fnifuh964rbi0mz2bo50h1o', 0x4e546735597a6733596a4a6d4e6a6b304e6d55344d44646c4e4449324d47466a5a6a42684d32466d4e7a55345a6a646c4d54677a5a547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b416f34416453343d, '2014-12-03 11:27:40'),
('wurdjt0w0r2y7sdn2p04vwllm91dxc0k', 0x59324d324f5445314e7a4133596d4d775a44646b597a6b314d4449324e6d4e694f446c6d4f44497a4f544a69596a49334d32557a596a7141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415674314c673d3d, '2014-12-03 10:52:41'),
('y6k5rttfr5uo9an6bu9jcxd89pzr3jmh', 0x4e44526a4e574d344e544e694d5759794f4464684d6a526a596a45775a54566c4e6a6b34596d4e684d574d314d544d304e574e684f547141416e31784153343d, '2014-12-03 03:27:09'),
('y6u4atjrhwjzg6qk40chalbtfg9ti3en', 0x4f44526c596d4e6b4d5455784d544a6a5a6a457959574534596a426d4f444d794f4755794f44557a5a44517a4d6a51795a4459304e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415252314c673d3d, '2014-09-06 10:18:09'),
('y7oht7bayu6g2jnlxgeay3fkdbx6f59u', 0x4d7a51345a4441774f5449785a5445774e7a686c4d475a6d4e6a6c694f444530593245784e3259324f544a684e7a677a4f5445315a547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415256314c673d3d, '2014-12-02 21:49:15'),
('ybe7xxp81xg1k3qj450s5hrfoemk84zm', 0x5a5751355a54553259324d30596d4531596d4a6b597a466b4e5451775a6a55774d546c6c5a4745794d4752684d7a4a6d4f5751774f447141416e317841536856436b784a5531526655565646556c6c594351414141474e76625731706448526c5a58454356516c7a62324e705a5852705a584e7841345a784246554463443078635157475651316659585630614639316332567958326c6b6967454656524a6659585630614639316332567958324a685932746c626d52564b5752715957356e6279356a62323530636d6c694c6d463164476775596d466a613256755a484d755457396b5a57784359574e725a57356b6453343d, '2014-12-03 12:29:27'),
('zacbwld0da3opmzjaqnb40g721f2orgc', 0x4f44526c596d4e6b4d5455784d544a6a5a6a457959574534596a426d4f444d794f4755794f44557a5a44517a4d6a51795a4459304e547141416e317841536856456c39686458526f5833567a5a584a66596d466a613256755a48454356536c6b616d46755a3238755932397564484a70596935686458526f4c6d4a685932746c626d527a4c6b31765a475673516d466a613256755a4845445651316659585630614639316332567958326c6b6351534b415252314c673d3d, '2014-12-03 13:49:43');

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
  `reply` longtext COLLATE utf8_bin,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `isOpen` tinyint(1) NOT NULL,
  `isFinish` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `feedback_feedback`
--

INSERT INTO `feedback_feedback` (`id`, `netid`, `content`, `datetime`, `campus`, `name`, `phone`, `email`, `reply`, `type`, `isOpen`, `isFinish`) VALUES
(1, '匿名', 0xe4b8ade5b1b1e5a4a7e5ada6e59ba2e5a794e5908ce5ada6e4bbacefbc8ce682a8e4bbace5a5bdefbc81e69cace4babae698afe59ca8e4b89ce6a0a1e58cbae58f82e58aa0e4b9a1e99587e7baaae5a794e589afe4b9a6e8aeb0e59fb9e8aeade78fade79a84e5ada6e59198efbc8ce69c89e4b880e4ba8be683b3e8afb7e5a4a7e5aeb6e883bde58f91e58aa8e58a9be9878fe5b8aee5bf99e79a84e38082e4bb8ae5a4a9efbc883139e58fb7efbc89e4b88ae58d88e4b883e782b9e58d8ae887b3e585abe782b9e69c9fe997b4efbc8ce68891e5908ce4ba8be59ca8e4b89ce6a0a1e58cbae7acace4b880e9a5ade5a082e59083e697a9e9a490efbc8ce5908ee69da5e58f91e78eb0e992b1e58c85e4b88de8a781e4ba86efbc8ce59b9ee5a4b4e5868de689bee683b3e4b88de588b0e4ba86e38082e5b88ce69c9be59ba2e5a794e5908ce5ada6e4bbace883bde58f91e58aa8e4b89ce6a0a1e58cbae79a84e5908ce5ada6e4bbace5b8aee5bf99e5afbbe59b9ee992b1e58c85e9878ce79a84e8baabe4bbbde8af81e38081e9a9bee9a9b6e8af81e7ad89e8af81e4bbb6e38082e8af81e4bbb6e4babae5908de698afe9bb8ee5ba86e6b7b1efbc8ce88287e5ba86e5b882e5b081e5bc80e58ebfe4babaefbc8ce88194e7b3bbe794b5e8af9d3133393239383538353338e38082e4b887e58886e6849fe8b0a2efbd9ee8afb7e7bb99e4ba88e5b8aee5bf99efbc81efbc81, '2014-11-19 06:20:33', 'east', '素怡', '13660951916', 'zq_suyi@126.com', NULL, NULL, 1, 0),
(2, '匿名', 0xe4b8ade5b1b1e5a4a7e5ada6e59ba2e5a794e5908ce5ada6e4bbacefbc8ce682a8e4bbace5a5bdefbc81e69cace4babae698afe59ca8e4b89ce6a0a1e58cbae58f82e58aa0e4b9a1e99587e7baaae5a794e589afe4b9a6e8aeb0e59fb9e8aeade78fade79a84e5ada6e59198efbc8ce69c89e4b880e4ba8be683b3e8afb7e5a4a7e5aeb6e883bde58f91e58aa8e58a9be9878fe5b8aee5bf99e79a84e38082e4bb8ae5a4a9efbc883139e58fb7efbc89e4b88ae58d88e4b883e782b9e58d8ae887b3e585abe782b9e69c9fe997b4efbc8ce68891e5908ce4ba8be59ca8e4b89ce6a0a1e58cbae7acace4b880e9a5ade5a082e59083e697a9e9a490efbc8ce5908ee69da5e58f91e78eb0e992b1e58c85e4b88de8a781e4ba86efbc8ce59b9ee5a4b4e5868de689bee683b3e4b88de588b0e4ba86e38082e5b88ce69c9be59ba2e5a794e5908ce5ada6e4bbace883bde58f91e58aa8e4b89ce6a0a1e58cbae79a84e5908ce5ada6e4bbace5b8aee5bf99e5afbbe59b9ee992b1e58c85e9878ce79a84e8baabe4bbbde8af81e38081e9a9bee9a9b6e8af81e7ad89e8af81e4bbb6e38082e8af81e4bbb6e4babae5908de698afe9bb8ee5ba86e6b7b1efbc8ce88287e5ba86e5b882e5b081e5bc80e58ebfe4babaefbc8ce88194e7b3bbe794b5e8af9d3133393239383538353338e38082e4b887e58886e6849fe8b0a2efbd9ee8afb7e7bb99e4ba88e5b8aee5bf99efbc81efbc81, '2014-11-19 06:20:45', 'east', '素怡', '13660951916', 'zq_suyi@126.com', NULL, NULL, 1, 0);

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
('Liangzhh27', '梁证涵', '524602104@qq.com', '15919158039', '翻译学院', '2014级', '14308227', 'male', NULL, 164, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('Liql8', 'Liql8', 'Liql8@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 69, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('caipl', 'caipl', 'caipl@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 63, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('chenjw85', '陈家炜', 'chenjw85@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 31, 0, 0, 0, '2014-11-18 21:59:54', '2013-12-31 16:00:00'),
('chenklin', 'chenklin', 'chenklin@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 161, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('chenqf5', '陈群锋', '604590172@qq.com', '13824420755', '软件学院', '2012级', '12330031', 'male', NULL, 21, 1, 1, 5499, '2014-08-28 02:37:44', '2013-12-31 16:00:00'),
('dengyh7', '邓宇恒', 'dengyh071@gmail.com', '13824418154', '软件学院', '2012级', '12330071', 'male', NULL, 20, 1, 1, 7218, '2014-11-19 05:44:23', '2014-08-25 09:41:42'),
('fangzhy3', 'fangzhy3', 'fangzhy3@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 142, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('fangzy3', '方梓彦', 'fangzy3@mail2.sysu.edu.cn', '13631217327', '历史学系', '2013级', '130185', 'male', NULL, 22, 0, 0, 0, '2014-11-19 05:41:10', '2013-12-31 16:00:00'),
('huangcht3', '黄创涛', '1046943363@qq.com', '13631252452', '移动信息工程学院', '2012级', '12353070', 'male', NULL, 72, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('huangxy45', 'huangxy45', 'huangxy45@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 60, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('linb7', 'linb7', 'linb7@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 70, 0, 0, 0, '2014-11-19 06:24:27', '2013-12-31 16:00:00'),
('lixy76', 'lixy76', 'lixy76@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 190, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('luoxch7', 'luoxch7', 'luoxch7@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 61, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('luozq3', 'luozq3', 'luozq3@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 159, 0, 0, 0, '2013-12-31 16:00:00', '1999-12-31 16:00:00'),
('mamt3', 'mamt3', 'mamt3@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 36, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('mudr', 'mudr', 'mudr@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 67, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('tangqb3', 'tangqb3', 'tangqb3@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 32, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('wuyu38', '吴愈', '707857717@qq.com', '15919161182', '地理科学与规划学院', '2014级', '14305019', 'male', NULL, 167, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('xuym8', 'xuym8', 'xuym8@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 58, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('zhanghq8', 'zhanghq8', 'zhanghq8@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 185, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00'),
('zhouln6', 'zhouln6', 'zhouln6@mail2.sysu.edu.cn', NULL, NULL, NULL, NULL, NULL, NULL, 91, 0, 0, 0, '2013-12-31 16:00:00', '2013-12-31 16:00:00');

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

--
-- 转存表中的数据 `xadmin_bookmark`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `xadmin_usersettings`
--

INSERT INTO `xadmin_usersettings` (`id`, `user_id`, `key`, `value`) VALUES
(1, 1, 'dashboard:home:pos', ''),
(2, 2, 'dashboard:home:pos', ''),
(3, 20, 'dashboard:home:pos', ''),
(4, 5, 'dashboard:home:pos', '');

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
-- 转存表中的数据 `xadmin_userwidget`
--


--
-- 限制导出的表
--

--
-- 限制表 `activity_activity`
--
ALTER TABLE `activity_activity`
  ADD CONSTRAINT `societies_id_refs_id_7e36210b` FOREIGN KEY (`societies_id`) REFERENCES `committee_societies` (`id`),
  ADD CONSTRAINT `student_id_refs_netid_a11bb343` FOREIGN KEY (`student_id`) REFERENCES `student_student` (`netid`),
  ADD CONSTRAINT `teacher_id_refs_tno_86cf2f63` FOREIGN KEY (`teacher_id`) REFERENCES `committee_teacher` (`tno`);

--
-- 限制表 `activity_attachment`
--
ALTER TABLE `activity_attachment`
  ADD CONSTRAINT `activity_id_refs_id_51b473bd` FOREIGN KEY (`activity_id`) REFERENCES `activity_activity` (`id`);

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
-- 限制表 `committee_societies_teachers`
--
ALTER TABLE `committee_societies_teachers`
  ADD CONSTRAINT `societies_id_refs_id_6955a1c6` FOREIGN KEY (`societies_id`) REFERENCES `committee_societies` (`id`),
  ADD CONSTRAINT `teacher_id_refs_tno_750c640a` FOREIGN KEY (`teacher_id`) REFERENCES `committee_teacher` (`tno`);

--
-- 限制表 `committee_tableset`
--
ALTER TABLE `committee_tableset`
  ADD CONSTRAINT `committee_id_refs_id_85afe804` FOREIGN KEY (`committee_id`) REFERENCES `committee_committee` (`id`);

--
-- 限制表 `committee_teacher`
--
ALTER TABLE `committee_teacher`
  ADD CONSTRAINT `committee_id_refs_id_7e6d7f70` FOREIGN KEY (`committee_id`) REFERENCES `committee_committee` (`id`),
  ADD CONSTRAINT `user_id_refs_id_90dd3a68` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
