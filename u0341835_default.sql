-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Хост: localhost:3306
-- Час створення: Квт 29 2017 р., 09:50
-- Версія сервера: 5.6.33-79.0
-- Версія PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База даних: `u0341835_default`
--

-- --------------------------------------------------------

--
-- Структура таблиці `db_adm`
--

CREATE TABLE IF NOT EXISTS `db_adm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(55) NOT NULL,
  `pass` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `db_adm`
--

INSERT INTO `db_adm` (`id`, `login`, `pass`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Структура таблиці `db_chat`
--

CREATE TABLE IF NOT EXISTS `db_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) CHARACTER SET cp1250 NOT NULL,
  `tekst` text NOT NULL,
  `date_add` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Структура таблиці `db_deposit`
--

CREATE TABLE IF NOT EXISTS `db_deposit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_user` int(12) NOT NULL,
  `login` varchar(55) NOT NULL,
  `date_start` int(13) NOT NULL,
  `date_end` int(13) NOT NULL,
  `summa` float NOT NULL,
  `percent` float NOT NULL,
  `count` int(13) NOT NULL,
  `count_full` int(13) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=27 ;

--
-- Дамп даних таблиці `db_deposit`
--

INSERT INTO `db_deposit` (`id`, `id_user`, `login`, `date_start`, `date_end`, `summa`, `percent`, `count`, `count_full`, `status`) VALUES
(26, 1, '111111', 1493224775, 1493571342, 10, 50, 1, 1, 1),
(25, 1, '111111', 1493224771, 1493572377, 10, 50, 1, 1, 1),
(24, 1, '111111', 1493224768, 1493587010, 10, 50, 1, 1, 1),
(23, 1, '111111', 1493224766, 1493587010, 10, 50, 1, 1, 1),
(22, 1, '111111', 1493224763, 1493588135, 10, 50, 1, 1, 1),
(21, 1, '111111', 1493224761, 1493590177, 10, 50, 1, 1, 1),
(20, 1, '111111', 1493224755, 1493604595, 10, 50, 1, 1, 1),
(19, 1, '111111', 1493224506, 1493604632, 10, 50, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `db_insert`
--

CREATE TABLE IF NOT EXISTS `db_insert` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login` varchar(55) NOT NULL,
  `user_id` int(13) NOT NULL,
  `summa` float NOT NULL,
  `batch` varchar(55) NOT NULL,
  `date` int(13) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=20 ;

--
-- Дамп даних таблиці `db_insert`
--

INSERT INTO `db_insert` (`id`, `login`, `user_id`, `summa`, `batch`, `date`, `status`) VALUES
(19, '', 1, 1, '', 1493228727, 0),
(18, '', 1, 2, '', 1493228473, 0),
(17, '33', 1, 1, '', 1493228278, 0),
(16, '', 0, 0, '', 1493228049, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `db_insert_payeer`
--

CREATE TABLE IF NOT EXISTS `db_insert_payeer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `summa` double NOT NULL,
  `user_id` int(10) NOT NULL,
  `login` varchar(55) NOT NULL,
  `date` int(13) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=44 ;

--
-- Дамп даних таблиці `db_insert_payeer`
--

INSERT INTO `db_insert_payeer` (`id`, `summa`, `user_id`, `login`, `date`, `status`) VALUES
(43, 1, 3, 'kaktus1988', 1493384926, 0),
(42, 10, 3, 'kaktus1988', 1493267994, 0),
(41, 1, 1, '111111', 1493232609, 0),
(40, 1, 1, '111111', 1493232180, 1),
(36, 1, 1, '111111', 1493228646, 0),
(37, 1, 1, '111111', 1493228671, 0),
(38, 1, 1, '111111', 1493228695, 1),
(39, 1, 10, '113111', 1493229027, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `db_news`
--

CREATE TABLE IF NOT EXISTS `db_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(13) NOT NULL,
  `title` text NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Структура таблиці `db_stats`
--

CREATE TABLE IF NOT EXISTS `db_stats` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `popol` float NOT NULL,
  `vivod` float NOT NULL,
  `user` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `db_stats`
--

INSERT INTO `db_stats` (`id`, `popol`, `vivod`, `user`) VALUES
(1, 19, 8, 3);

-- --------------------------------------------------------

--
-- Структура таблиці `db_users`
--

CREATE TABLE IF NOT EXISTS `db_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login` varchar(55) CHARACTER SET cp1251 NOT NULL,
  `pass` varchar(55) CHARACTER SET cp1251 NOT NULL,
  `refer` int(10) NOT NULL,
  `money_in` float NOT NULL,
  `money_out` float NOT NULL,
  `ref_sum` float NOT NULL,
  `ip` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `db_users`
--

INSERT INTO `db_users` (`id`, `login`, `pass`, `refer`, `money_in`, `money_out`, `ref_sum`, `ip`) VALUES
(1, '111111', 'a9606d22963858dd1b24397c3ab51101', 1, 44, 40, 8, '176.32.5.141'),
(2, 'zzzzzzzzzz5', 'd69556c14f74a88daa88a41a54ba8665', 1, 0, 0, 0, '91.219.62.74'),
(3, 'kaktus1988', '37787ba022cb51e731e7a878a9c77580', 1, 0, 0, 0, '31.211.13.239');

-- --------------------------------------------------------

--
-- Структура таблиці `db_vivod`
--

CREATE TABLE IF NOT EXISTS `db_vivod` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login` varchar(55) NOT NULL,
  `user_id` int(10) NOT NULL,
  `summa` float NOT NULL,
  `batch` varchar(55) NOT NULL,
  `date` int(13) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 AUTO_INCREMENT=13 ;

--
-- Дамп даних таблиці `db_vivod`
--

INSERT INTO `db_vivod` (`id`, `login`, `user_id`, `summa`, `batch`, `date`, `status`) VALUES
(12, '111111', 1, 7, 'P6106795', 1493233458, 1),
(11, '111111', 1, 1, 'P6106795', 1493226156, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
