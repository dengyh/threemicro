-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2014-08-01 07:50:18
-- 服务器版本： 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `three_micro_test`
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
  `maxTime` int(11) NOT NULL,
  `isCompleted` tinyint(1) NOT NULL,
  `isReady` tinyint(1) NOT NULL,
  `firstRemark` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `secondRemark` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_activity_94741166` (`student_id`),
  KEY `activity_activity_c12e9d48` (`teacher_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `activity_activity`
--

INSERT INTO `activity_activity` (`id`, `title`, `location`, `status`, `campus`, `type`, `sponsor`, `content`, `student_id`, `teacher_id`, `nowNumber`, `totalNumber`, `deadline`, `startDateTime`, `endDateTime`, `signDateTime`, `maxTime`, `isCompleted`, `isReady`, `firstRemark`, `secondRemark`) VALUES
(1, '1758圣诞舞会', '三饭小广场', 'first', 'east', 'publicWelfare', '软件学院', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p><img src="/media/upload/20140730145722grid.jpg" /></p>\r\n</body>\r\n</html>', 'dengyh7', 'pml', 0, 50, '2014-07-30 16:00:00', '2014-08-07 16:00:00', '2014-08-13 16:00:00', '2014-07-30 07:00:04', 1, 0, 0, NULL, NULL);

--
-- 限制导出的表
--

--
-- 限制表 `activity_activity`
--
ALTER TABLE `activity_activity`
  ADD CONSTRAINT `student_id_refs_netid_a11bb343` FOREIGN KEY (`student_id`) REFERENCES `student_student` (`netid`),
  ADD CONSTRAINT `teacher_id_refs_tno_be701b2b` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_teacher` (`tno`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
