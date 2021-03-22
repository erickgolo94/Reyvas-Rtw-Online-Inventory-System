-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2021 at 03:37 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orsmsproto`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `id_brand` int(11) NOT NULL,
  `brand_description` varchar(255) NOT NULL,
  `isActive` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`id_brand`, `brand_description`, `isActive`) VALUES
(1, 'GUCCI', 0),
(2, 'ADDIDAS', 0),
(3, 'JAG', 0),
(4, 'FUBU', 0),
(5, 'TOMMY', 0),
(6, 'BLACK MAROON', 1),
(7, 'JEKKI JEANS', 1),
(8, 'HAVAINAS', 1),
(9, 'Xie Jeans', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `emp_id` int(11) NOT NULL,
  `emp_lastName` varchar(100) NOT NULL,
  `emp_firstName` varchar(100) NOT NULL,
  `emp_midInitial` char(2) DEFAULT NULL,
  `emp_position` varchar(255) NOT NULL,
  `id_sBranch` int(11) NOT NULL,
  `emp_password` varchar(255) NOT NULL,
  `isActive` int(1) NOT NULL,
  `userType` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`emp_id`, `emp_lastName`, `emp_firstName`, `emp_midInitial`, `emp_position`, `id_sBranch`, `emp_password`, `isActive`, `userType`) VALUES
(1, 'admin', 'admin', 'a', 'System Admin', 4, '21232f297a57a5a743894a0e4a801fc3', 0, 'ADMIN'),
(2, 'Morroco', 'Kaila', 'D', 'Assistant', 4, 'f549cd73f694aa6f5541b4ae30894eea', 0, 'STAFF');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_item`
--

CREATE TABLE `tbl_item` (
  `id_item` int(11) NOT NULL,
  `item_number` bigint(20) NOT NULL,
  `item_description` varchar(255) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `id_size` int(11) NOT NULL,
  `id_section` int(11) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `date_in` date DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_item`
--

INSERT INTO `tbl_item` (`id_item`, `item_number`, `item_description`, `id_brand`, `id_size`, `id_section`, `quantity`, `date_in`, `time_in`, `emp_id`) VALUES
(1, 0, 'Mens Pants', 3, 3, 1, -620, '0000-00-00', '00:00:00', 1),
(2, 0, 'T-shirt', 4, 4, 1, 1948, '0000-00-00', '00:00:00', 1),
(3, 0, 'T-shirt', 4, 3, 2, 1026, '0000-00-00', '00:00:00', 1),
(4, 3, 'Mens long-sleeve', 5, 2, 1, 3412, '0000-00-00', '00:00:00', 1),
(5, 3, 'Blouse', 1, 4, 2, 0, '0000-00-00', '00:00:00', 1),
(6, 3, 'POLO', 2, 2, 1, 3524, '0000-00-00', '00:00:00', 1),
(7, 3, 'Jogging Pants', 2, 2, 1, 928, '0000-00-00', '00:00:00', 1),
(8, 3, 'Jogging Pants', 2, 2, 2, 1, '0000-00-00', '00:00:00', 1),
(9, 8, 'Mens Pants', 3, 3, 1, 620, '0000-00-00', '00:00:00', 1),
(10, 9, 'Hiking Bag', 3, 3, 3, 189, '0000-00-00', '00:00:00', 6),
(11, 9, 'Jeans', 4, 4, 1, 146, '0000-00-00', '00:00:00', 6),
(12, 11, 'Blouse', 1, 4, 2, 2700, '0000-00-00', '00:00:00', 1),
(13, 11, 'Jogging Pants', 2, 2, 2, 3500, '0000-00-00', '00:00:00', 1),
(14, 11, 'Mens Pants', 3, 3, 1, 4500, '0000-00-00', '00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_itemclone`
--

CREATE TABLE `tbl_itemclone` (
  `id_item` int(11) NOT NULL,
  `item_number` bigint(20) NOT NULL,
  `item_description` varchar(255) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `id_size` int(11) NOT NULL,
  `id_section` int(11) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `date_in` date DEFAULT NULL,
  `time_in` time DEFAULT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_itemsection`
--

CREATE TABLE `tbl_itemsection` (
  `id_section` int(11) NOT NULL,
  `itemSectionDescription` varchar(20) DEFAULT NULL,
  `isActive` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_itemsection`
--

INSERT INTO `tbl_itemsection` (`id_section`, `itemSectionDescription`, `isActive`) VALUES
(1, 'MEN', 0),
(2, 'WOMEN', 0),
(3, 'OTHER', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_release`
--

CREATE TABLE `tbl_release` (
  `request_no` bigint(20) NOT NULL,
  `item_description` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `size` varchar(20) NOT NULL,
  `section` varchar(100) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `date_request` date DEFAULT NULL,
  `time_request` time DEFAULT NULL,
  `branch` varchar(255) NOT NULL,
  `date_release` date DEFAULT NULL,
  `time_release` time DEFAULT NULL,
  `release_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_release`
--

INSERT INTO `tbl_release` (`request_no`, `item_description`, `brand`, `size`, `section`, `quantity`, `date_request`, `time_request`, `branch`, `date_release`, `time_release`, `release_by`) VALUES
(0, 'Mens Pants', 'FUBU', 'SMALL', 'MEN', 100, '2021-02-14', '16:03:36', 'Maligaya Park Subd.', '2021-02-15', '21:37:28', 'Administrator'),
(3, 'Shoes', 'ADDIDAS', 'LARGE', 'MEN', 50, '2021-02-14', '16:06:57', 'Maligaya Park Subd.', '2021-02-15', '21:38:55', 'Administrator'),
(3, 'Shoes', 'ADDIDAS', 'LARGE', 'MEN', 50, '2021-02-14', '16:06:57', 'Maligaya Park Subd.', '2021-02-15', '21:39:59', 'Administrator'),
(3, 'Shoes', 'ADDIDAS', 'LARGE', 'MEN', 50, '2021-02-14', '16:06:57', 'Maligaya Park Subd.', '2021-02-15', '21:41:44', 'Administrator'),
(0, 'Jagger', 'ADDIDAS', 'MEDIUM', 'OTHERS', 10, '2021-02-14', '16:03:52', 'Maligaya Park Subd.', '2021-02-15', '21:44:35', 'Administrator'),
(0, 'Jagger', 'NIKE', 'MEDIUM', 'MEN', 199, '2021-02-14', '16:04:04', 'Maligaya Park Subd.', '2021-02-15', '21:44:43', 'Administrator'),
(5, 'Jagger', 'ADDIDAS', 'MEDIUM', 'OTHERS', 5, '2021-02-15', '22:04:15', 'Maligaya Park Subd.', '2021-02-15', '22:05:34', 'Administrator'),
(5, 'Jagger', 'ADDIDAS', 'MEDIUM', 'OTHERS', 5, '2021-02-15', '22:04:15', 'Maligaya Park Subd.', '2021-02-15', '22:06:48', 'Administrator'),
(5, 'Mens Pants', 'FUBU', 'SMALL', 'MEN', 3, '2021-02-15', '22:04:28', 'Maligaya Park Subd.', '2021-02-15', '22:08:06', 'Administrator'),
(5, 'Jagger', 'ADDIDAS', 'MEDIUM', 'OTHERS', 5, '2021-02-15', '22:04:15', 'Maligaya Park Subd.', '2021-02-15', '22:09:44', 'Administrator'),
(5, 'Jagger', 'ADDIDAS', 'MEDIUM', 'OTHERS', 5, '2021-02-15', '22:04:15', 'Maligaya Park Subd.', '2021-02-15', '22:10:33', 'Administrator'),
(0, 'Jagger', 'ADDIDAS', 'MEDIUM', 'OTHERS', 10, '2021-02-14', '16:03:52', 'Maligaya Park Subd.', '2021-02-15', '22:10:40', 'Administrator'),
(0, 'Mens Pants', 'FUBU', 'SMALL', 'MEN', 100, '2021-02-14', '16:03:36', 'Maligaya Park Subd.', '2021-02-15', '22:16:01', 'Administrator'),
(5, 'Mens Pants', 'FUBU', 'SMALL', 'MEN', 3, '2021-02-15', '22:04:28', 'Maligaya Park Subd.', '2021-02-15', '22:17:46', 'Administrator'),
(0, 'Jagger', 'ADDIDAS', 'MEDIUM', 'OTHERS', 10, '2021-02-14', '16:03:52', 'Maligaya Park Subd.', '2021-02-15', '22:17:55', 'Administrator'),
(0, 'Jagger', 'ADDIDAS', 'MEDIUM', 'OTHERS', 10, '2021-02-14', '16:03:52', 'Maligaya Park Subd.', '2021-02-15', '22:18:03', 'Administrator'),
(0, 'Jagger', 'ADDIDAS', 'MEDIUM', 'OTHERS', 10, '2021-02-14', '16:03:52', 'Maligaya Park Subd.', '2021-02-15', '22:18:22', 'Administrator'),
(3, 'Jagger', 'ADDIDAS', 'MEDIUM', 'OTHERS', 10, '2021-02-14', '16:06:47', 'Maligaya Park Subd.', '2021-02-15', '22:20:06', 'Administrator'),
(8, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-15', '22:21:25', 'Maligaya Park Subd.', '2021-02-15', '22:21:45', 'Administrator'),
(8, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-15', '22:21:25', 'Maligaya Park Subd.', '2021-02-15', '22:23:58', 'Administrator'),
(8, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-15', '22:21:25', 'Maligaya Park Subd.', '2021-02-15', '22:33:57', 'Administrator'),
(8, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-15', '22:21:25', 'Maligaya Park Subd.', '2021-02-15', '22:35:04', 'Administrator'),
(8, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-15', '22:21:25', 'Maligaya Park Subd.', '2021-02-15', '22:37:35', 'Administrator'),
(8, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-15', '22:21:25', 'Maligaya Park Subd.', '2021-02-15', '22:40:08', 'Administrator'),
(8, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-15', '22:21:25', 'Maligaya Park Subd.', '2021-02-16', '00:14:20', 'Administrator'),
(8, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-15', '22:21:25', 'Maligaya Park Subd.', '2021-02-16', '00:14:38', 'Administrator'),
(8, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-15', '22:21:25', 'Maligaya Park Subd.', '2021-02-16', '00:15:42', 'Administrator'),
(8, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-15', '22:21:25', 'Maligaya Park Subd.', '2021-02-16', '00:16:28', 'Administrator'),
(8, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-15', '22:21:25', 'Maligaya Park Subd.', '2021-02-16', '00:19:20', 'Administrator'),
(8, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-15', '22:21:25', 'Maligaya Park Subd.', '2021-02-16', '00:19:34', 'Administrator'),
(8, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-15', '22:21:25', 'Maligaya Park Subd.', '2021-02-16', '00:19:45', 'Administrator'),
(10, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 1, '2021-02-16', '13:54:05', 'Maligaya Park Subd.', '2021-02-16', '13:55:02', 'Administrator'),
(10, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 1, '2021-02-16', '13:54:05', 'Maligaya Park Subd.', '2021-02-16', '13:56:29', 'Administrator'),
(10, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-16', '13:54:18', 'Maligaya Park Subd.', '2021-02-16', '14:26:26', 'Administrator'),
(12, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 1, '2021-02-16', '14:27:47', 'Maligaya Park Subd.', '2021-02-16', '14:28:29', 'Administrator'),
(12, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 1, '2021-02-16', '14:27:47', 'Maligaya Park Subd.', '2021-02-16', '14:29:23', 'Administrator'),
(12, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 1, '2021-02-16', '14:27:47', 'Maligaya Park Subd.', '2021-02-16', '14:29:57', 'Administrator'),
(12, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 1, '2021-02-16', '14:27:47', 'Maligaya Park Subd.', '2021-02-16', '14:32:34', 'Administrator'),
(12, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 1, '2021-02-16', '14:27:47', 'Maligaya Park Subd.', '2021-02-16', '14:32:55', 'Administrator'),
(12, 'Jagger', 'NIKE', 'MEDIUM', 'MEN', 1, '2021-02-16', '14:27:56', 'Maligaya Park Subd.', '2021-02-16', '14:33:02', 'Administrator'),
(12, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 1, '2021-02-16', '14:27:47', 'Maligaya Park Subd.', '2021-02-16', '14:34:01', 'Administrator'),
(12, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 1, '2021-02-16', '14:27:47', 'Maligaya Park Subd.', '2021-02-16', '14:38:32', 'Administrator'),
(0, '', '', '', '', 0, '0000-00-00', '00:00:00', '', '2021-02-16', '14:38:39', 'Administrator'),
(12, 'Jagger', 'NIKE', 'MEDIUM', 'MEN', 1, '2021-02-16', '14:27:56', 'Maligaya Park Subd.', '2021-02-16', '14:39:29', 'Administrator'),
(12, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-16', '14:28:10', 'Maligaya Park Subd.', '2021-02-16', '14:39:46', 'Administrator'),
(10, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-16', '13:54:18', 'Maligaya Park Subd.', '2021-02-16', '14:39:50', 'Administrator'),
(12, 'Jagger', 'NIKE', 'MEDIUM', 'MEN', 1, '2021-02-16', '14:27:56', 'Maligaya Park Subd.', '2021-02-16', '15:01:22', 'Administrator'),
(12, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 1, '2021-02-16', '14:27:47', 'Maligaya Park Subd.', '2021-02-16', '15:08:59', 'Administrator'),
(12, 'Jagger', 'NIKE', 'MEDIUM', 'MEN', 1, '2021-02-16', '14:27:56', 'Maligaya Park Subd.', '2021-02-16', '15:09:55', 'Administrator'),
(15, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 1, '2021-02-16', '18:56:05', 'Maligaya Park Subd.', '2021-02-16', '18:56:30', 'Administrator'),
(15, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-16', '18:56:14', 'Maligaya Park Subd.', '2021-02-16', '18:58:51', 'Administrator'),
(17, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 1, '2021-02-16', '19:03:12', 'Maligaya Park Subd.', '2021-02-16', '19:04:41', 'Administrator'),
(17, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-16', '19:03:22', 'Maligaya Park Subd.', '2021-02-16', '19:05:06', 'Administrator'),
(19, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-16', '19:06:52', 'Maligaya Park Subd.', '2021-02-16', '19:07:12', 'Administrator'),
(19, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 1, '2021-02-16', '19:06:43', 'Maligaya Park Subd.', '2021-02-16', '19:11:47', 'Administrator'),
(21, 'Jagger', 'NIKE', 'MEDIUM', 'WOMEN', 1, '2021-02-16', '19:13:44', 'Maligaya Park Subd.', '2021-02-16', '19:14:06', 'Administrator'),
(21, 'Jagger', 'BLUE CORNER', 'SMALL', 'WOMEN', 2, '2021-02-16', '19:13:30', 'Maligaya Park Subd.', '2021-02-16', '19:15:28', 'Administrator'),
(23, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 20, '2021-02-16', '19:22:27', 'Maligaya Park Subd.', '2021-02-16', '19:23:07', 'Administrator'),
(26, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 12, '2021-02-16', '19:25:18', 'Maligaya Park Subd.', '2021-02-16', '19:25:45', 'Administrator'),
(26, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 10, '2021-02-16', '19:25:07', 'Maligaya Park Subd.', '2021-02-16', '19:25:52', 'Administrator'),
(28, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 10, '2021-02-16', '19:27:12', 'Maligaya Park Subd.', '2021-02-16', '19:27:57', 'Administrator'),
(28, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 10, '2021-02-16', '19:27:12', 'Maligaya Park Subd.', '2021-02-16', '19:28:10', 'Administrator'),
(26, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 10, '2021-02-16', '19:25:07', 'Maligaya Park Subd.', '2021-02-16', '19:28:30', 'Administrator'),
(32, 'Mens long-sleeve', 'BLUE CORNER', 'SMALL', 'MEN', 6, '2021-02-16', '19:30:41', 'Maligaya Park Subd.', '2021-02-16', '19:30:54', 'Administrator'),
(32, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 5, '2021-02-16', '19:30:35', 'Maligaya Park Subd.', '2021-02-16', '19:30:59', 'Administrator'),
(34, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 6, '2021-02-16', '23:21:06', 'Maligaya Park Subd.', '2021-02-16', '23:21:52', 'Administrator'),
(34, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 6, '2021-02-16', '23:21:06', 'Maligaya Park Subd.', '2021-02-16', '23:22:01', 'Administrator'),
(34, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 12, '2021-02-16', '23:21:27', 'Maligaya Park Subd.', '2021-02-16', '23:22:11', 'Administrator'),
(37, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 12, '2021-02-16', '23:23:09', 'Maligaya Park Subd.', '2021-02-16', '23:23:37', 'Administrator'),
(37, 'T-shirt', 'FUBU', 'LARGE', 'MEN', 6, '2021-02-16', '23:23:17', 'Maligaya Park Subd.', '2021-02-16', '23:23:49', 'Administrator'),
(39, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 6, '2021-02-16', '23:25:09', 'Maligaya Park Subd.', '2021-02-16', '23:25:36', 'Administrator'),
(39, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 6, '2021-02-16', '23:25:09', 'Maligaya Park Subd.', '2021-02-16', '23:25:56', 'Administrator'),
(39, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 23, '2021-02-16', '23:25:20', 'Maligaya Park Subd.', '2021-02-16', '23:26:06', 'Administrator'),
(41, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 1, '2021-02-16', '23:27:21', 'Maligaya Park Subd.', '2021-02-16', '23:27:56', 'Administrator'),
(45, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 1, '2021-02-16', '23:38:15', 'Maligaya Park Subd.', '2021-02-16', '23:38:53', 'Administrator'),
(45, 'T-shirt', 'FUBU', 'LARGE', 'MEN', 1, '2021-02-16', '23:38:21', 'Maligaya Park Subd.', '2021-02-16', '23:41:08', 'Administrator'),
(45, 'T-shirt', 'FUBU', 'LARGE', 'MEN', 1, '2021-02-16', '23:38:21', 'Maligaya Park Subd.', '2021-02-16', '23:42:09', 'Administrator'),
(48, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 1, '2021-02-17', '00:11:03', 'Maligaya Park Subd.', '2021-02-17', '17:44:24', 'Administrator'),
(48, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'WOMEN', 2, '2021-02-17', '00:11:12', 'Maligaya Park Subd.', '2021-02-17', '17:45:00', 'Administrator'),
(50, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 6, '2021-02-17', '17:45:46', 'Maligaya Park Subd.', '2021-02-17', '17:46:25', 'Administrator'),
(50, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 12, '2021-02-17', '17:45:37', 'Maligaya Park Subd.', '2021-02-17', '17:46:33', 'Administrator'),
(50, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 6, '2021-02-17', '17:45:30', 'Maligaya Park Subd.', '2021-02-17', '17:46:36', 'Administrator'),
(50, 'Mens Pants', 'NIKE', 'MEDIUM', 'MEN', 12, '2021-02-17', '17:45:22', 'Maligaya Park Subd.', '2021-02-17', '17:46:41', 'Administrator'),
(50, 'T-shirt', 'FUBU', 'LARGE', 'MEN', 12, '2021-02-17', '17:45:14', 'Maligaya Park Subd.', '2021-02-17', '17:46:45', 'Administrator'),
(55, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 3, '2021-02-17', '17:47:29', 'Maligaya Park Subd.', '2021-02-17', '17:47:44', 'Administrator'),
(55, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'WOMEN', 6, '2021-02-17', '17:47:23', 'Maligaya Park Subd.', '2021-02-17', '17:47:48', 'Administrator'),
(55, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 1, '2021-02-17', '17:47:15', 'Maligaya Park Subd.', '2021-02-17', '17:47:50', 'Administrator'),
(58, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 12, '2021-02-17', '17:48:28', 'Maligaya Park Subd.', '2021-02-17', '17:48:55', 'Administrator'),
(61, 'T-shirt', 'FUBU', 'LARGE', 'MEN', 12, '2021-02-17', '17:49:45', 'Maligaya Park Subd.', '2021-02-17', '17:50:00', 'Administrator'),
(61, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 2, '2021-02-17', '17:49:37', 'Maligaya Park Subd.', '2021-02-17', '17:50:09', 'Administrator'),
(61, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 12, '2021-02-17', '17:49:30', 'Maligaya Park Subd.', '2021-02-17', '17:50:14', 'Administrator'),
(64, 'Mens Pants', 'NIKE', 'MEDIUM', 'MEN', 1488, '2021-02-17', '17:52:45', 'Maligaya Park Subd.', '2021-02-17', '17:53:04', 'Administrator'),
(64, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 24, '2021-02-17', '17:52:37', 'Maligaya Park Subd.', '2021-02-17', '17:53:06', 'Administrator'),
(64, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 6, '2021-02-17', '17:52:25', 'Maligaya Park Subd.', '2021-02-17', '17:53:09', 'Administrator'),
(67, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 2, '2021-02-17', '17:54:54', 'Maligaya Park Subd.', '2021-02-17', '20:29:28', 'Administrator'),
(67, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 12, '2021-02-17', '17:54:49', 'Maligaya Park Subd.', '2021-02-17', '20:29:33', 'Administrator'),
(69, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 22, '2021-02-17', '17:55:23', 'Maligaya Park Subd.', '2021-02-18', '00:01:28', 'Administrator'),
(69, 'Mens long-sleeve', 'BLUE CORNER', 'SMALL', 'MEN', 12, '2021-02-17', '17:55:17', 'Maligaya Park Subd.', '2021-02-18', '00:01:32', 'Administrator'),
(69, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'WOMEN', 2, '2021-02-17', '17:55:05', 'Maligaya Park Subd.', '2021-02-18', '00:01:36', 'Administrator'),
(72, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 3, '2021-02-18', '22:49:39', 'Maligaya Park Subd.', '2021-02-18', '22:49:55', 'Administrator'),
(72, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 1, '2021-02-18', '22:49:32', 'Maligaya Park Subd.', '2021-02-18', '22:49:59', 'Administrator'),
(74, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 3, '2021-02-18', '23:16:25', 'Maligaya Park Subd.', '2021-02-18', '23:16:50', 'Administrator'),
(74, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 3, '2021-02-18', '23:16:04', 'Maligaya Park Subd.', '2021-02-18', '23:16:54', 'Administrator'),
(76, 'T-shirt', 'FUBU', 'LARGE', 'MEN', 8, '2021-02-18', '23:18:44', 'Maligaya Park Subd.', '2021-02-18', '23:19:02', 'Administrator'),
(76, 'Mens long-sleeve', 'BLUE CORNER', 'SMALL', 'MEN', 2, '2021-02-18', '23:18:34', 'Maligaya Park Subd.', '2021-02-18', '23:19:08', 'Administrator'),
(78, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 20, '2021-02-18', '23:29:14', 'Maligaya Park Subd.', '2021-02-18', '23:30:08', 'Administrator'),
(78, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 9, '2021-02-18', '23:29:00', 'Maligaya Park Subd.', '2021-02-18', '23:30:14', 'Administrator'),
(78, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 390, '2021-02-18', '23:28:23', 'Maligaya Park Subd.', '2021-02-18', '23:30:19', 'Administrator'),
(58, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 2, '2021-02-17', '17:48:42', 'Maligaya Park Subd.', '2021-02-20', '17:32:13', 'Administrator'),
(58, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 12, '2021-02-17', '17:48:35', 'Maligaya Park Subd.', '2021-02-20', '17:32:20', 'Administrator'),
(81, 'POLO', 'ADDIDAS', 'SMALL', 'MEN', 200, '2021-02-22', '08:59:12', 'Maligaya Park Subd.', '2021-02-22', '08:59:35', 'Administrator'),
(81, 'POLO', 'ADDIDAS', 'SMALL', 'MEN', 100, '2021-02-22', '08:58:57', 'Maligaya Park Subd.', '2021-02-22', '08:59:40', 'Administrator'),
(41, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 1, '2021-02-16', '23:27:27', 'Maligaya Park Subd.', '2021-02-23', '17:56:08', 'Administrator'),
(41, 'Mens long-sleeve', 'TOMMY', 'SMALL', 'MEN', 1, '2021-02-16', '23:27:41', 'Maligaya Park Subd.', '2021-02-23', '17:56:18', 'Administrator'),
(23, 'Mens Pants', 'JAG', 'MEDIUM', 'MEN', 50, '2021-02-16', '19:22:45', 'Maligaya Park Subd.', '2021-02-23', '17:56:22', 'Administrator'),
(83, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 12, '2021-02-23', '17:56:51', 'Maligaya Park Subd.', '2021-02-23', '17:57:05', 'Administrator'),
(83, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'WOMEN', 12, '2021-02-23', '17:56:42', 'Maligaya Park Subd.', '2021-02-23', '17:57:09', 'Administrator'),
(85, 'Mens Pants', 'JAG', 'MEDIUM', 'MEN', 570, '2021-02-27', '11:52:34', 'Maligaya Park Subd.', '2021-02-27', '11:52:58', 'Administrator'),
(86, 'Mens long-sleeve', 'TOMMY', 'SMALL', 'MEN', 9, '2021-03-03', '00:00:39', 'Maligaya', '2021-03-03', '00:00:57', 'Administrator'),
(86, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 8, '2021-03-03', '00:00:28', 'Maligaya', '2021-03-03', '00:01:02', 'Administrator'),
(86, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 5, '2021-03-03', '00:00:09', 'Maligaya', '2021-03-03', '00:01:06', 'Administrator'),
(89, 'Jeans', 'FUBU', 'LARGE', 'MEN', 5, '2021-03-06', '16:36:51', 'Maligaya', '2021-03-06', '16:54:38', 'Administrator'),
(0, '', '', '', '', 0, '0000-00-00', '00:00:00', '', '2021-03-06', '16:55:33', 'Administrator'),
(69, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 22, '2021-02-17', '17:55:23', 'Maligaya', '2021-03-06', '16:58:51', 'Administrator'),
(0, '', '', '', '', 0, '0000-00-00', '00:00:00', '', '2021-03-06', '16:58:53', 'Administrator'),
(0, '', '', '', '', 0, '0000-00-00', '00:00:00', '', '2021-03-06', '16:58:55', 'Administrator'),
(0, '', '', '', '', 0, '0000-00-00', '00:00:00', '', '2021-03-06', '16:58:56', 'Administrator'),
(0, '', '', '', '', 0, '0000-00-00', '00:00:00', '', '2021-03-06', '16:58:58', 'Administrator'),
(0, '', '', '', '', 0, '0000-00-00', '00:00:00', '', '2021-03-06', '16:58:59', 'Administrator'),
(0, '', '', '', '', 0, '0000-00-00', '00:00:00', '', '2021-03-06', '17:11:02', 'Administrator'),
(89, 'Jeans', 'FUBU', 'LARGE', 'MEN', 25, '2021-03-06', '16:33:24', 'Maligaya', '2021-03-06', '17:14:09', 'Administrator'),
(89, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 80, '2021-03-06', '16:12:03', 'Maligaya', '2021-03-06', '17:20:06', 'Administrator'),
(89, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'WOMEN', 50, '2021-03-06', '16:11:30', 'Maligaya', '2021-03-06', '17:21:03', 'Administrator'),
(93, 'Hiking Bag', 'JAG', 'MEDIUM', 'OTHER', 3, '2021-03-06', '16:39:02', 'Maligaya', '2021-03-06', '17:25:02', 'Administrator'),
(93, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 6, '2021-03-06', '16:38:55', 'Maligaya', '2021-03-06', '17:26:18', 'Administrator'),
(93, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 12, '2021-03-06', '16:38:43', 'Maligaya', '2021-03-06', '17:34:11', 'Administrator'),
(96, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'WOMEN', 8, '2021-03-06', '17:34:42', 'Maligaya', '2021-03-06', '17:34:57', 'Administrator'),
(96, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 3, '2021-03-06', '17:34:32', 'Maligaya', '2021-03-06', '17:35:01', 'Administrator'),
(99, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 100, '2021-03-06', '17:35:53', 'Maligaya', '2021-03-06', '17:36:11', 'Administrator'),
(99, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 5, '2021-03-06', '17:35:42', 'Maligaya', '2021-03-06', '17:36:15', 'Administrator'),
(102, 'Jeans', 'FUBU', 'LARGE', 'MEN', 10, '2021-03-06', '17:37:56', 'Maligaya', '2021-03-06', '17:38:29', 'Administrator'),
(102, 'POLO', 'ADDIDAS', 'SMALL', 'MEN', 100, '2021-03-06', '17:37:39', 'Maligaya', '2021-03-06', '17:38:37', 'Administrator'),
(105, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 100, '2021-03-06', '17:59:08', 'Maligaya', '2021-03-06', '17:59:43', 'Administrator'),
(108, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 100, '2021-03-06', '18:00:44', 'Maligaya', '2021-03-06', '18:01:01', 'Administrator'),
(108, 'Hiking Bag', 'JAG', 'MEDIUM', 'OTHER', 2, '2021-03-06', '18:00:36', 'Maligaya', '2021-03-06', '18:01:07', 'Administrator'),
(108, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 2, '2021-03-06', '18:00:28', 'Maligaya', '2021-03-06', '18:01:11', 'Administrator'),
(111, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'WOMEN', 1, '2021-03-06', '18:08:59', 'Maligaya', '2021-03-06', '18:25:40', 'Administrator'),
(113, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 2, '2021-03-06', '18:09:43', 'Maligaya', '2021-03-06', '18:25:44', 'Administrator'),
(115, 'POLO', 'ADDIDAS', 'SMALL', 'MEN', 6, '2021-03-06', '18:26:39', 'Maligaya', '2021-03-06', '18:27:16', 'Administrator'),
(115, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 8, '2021-03-06', '18:26:31', 'Maligaya', '2021-03-06', '18:27:20', 'Administrator'),
(121, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 10, '2021-03-06', '23:31:13', 'Maligaya', '2021-03-06', '23:31:39', 'Administrator'),
(121, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 10, '2021-03-06', '23:31:05', 'Maligaya', '2021-03-06', '23:31:43', 'Administrator'),
(121, 'POLO', 'ADDIDAS', 'SMALL', 'MEN', 4, '2021-03-06', '23:30:58', 'Maligaya', '2021-03-06', '23:31:47', 'Administrator'),
(118, 'Mens long-sleeve', 'TOMMY', 'SMALL', 'MEN', 10, '2021-03-06', '23:30:42', 'Maligaya', '2021-03-06', '23:31:51', 'Administrator'),
(118, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 10, '2021-03-06', '23:30:33', 'Maligaya', '2021-03-06', '23:31:54', 'Administrator'),
(118, 'Jeans', 'FUBU', 'LARGE', 'MEN', 10, '2021-03-06', '23:30:18', 'Maligaya', '2021-03-06', '23:31:58', 'Administrator'),
(124, 'POLO', 'ADDIDAS', 'SMALL', 'MEN', 12, '2021-03-08', '16:18:19', 'Maligaya', '2021-03-08', '16:18:44', 'Administrator'),
(127, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'WOMEN', 6, '2021-03-08', '16:19:31', 'Maligaya', '2021-03-08', '16:19:54', 'Administrator'),
(127, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 12, '2021-03-08', '16:19:21', 'Maligaya', '2021-03-08', '16:19:59', 'Administrator'),
(129, 'POLO', 'ADDIDAS', 'SMALL', 'MEN', 6, '2021-03-08', '21:47:22', 'Maligaya', '2021-03-08', '21:48:27', 'Administrator'),
(129, 'Jeans', 'FUBU', 'LARGE', 'MEN', 24, '2021-03-08', '21:47:13', 'Maligaya', '2021-03-08', '21:48:32', 'Administrator'),
(131, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'WOMEN', 1512, '2021-03-09', '15:21:06', 'Maligaya', '2021-03-09', '15:21:26', 'Administrator'),
(131, 'Blouse', 'GUCCI', 'LARGE', 'WOMEN', 2088, '2021-03-09', '15:20:08', 'Maligaya', '2021-03-09', '15:21:31', 'Administrator'),
(133, 'POLO', 'ADDIDAS', 'SMALL', 'MEN', 12, '2021-03-11', '20:51:10', 'Maligaya', '2021-03-11', '20:52:37', 'Administrator'),
(133, 'Jogging Pants', 'ADDIDAS', 'SMALL', 'MEN', 12, '2021-03-11', '20:51:02', 'Maligaya', '2021-03-11', '20:52:40', 'Administrator'),
(133, 'Jeans', 'FUBU', 'LARGE', 'MEN', 6, '2021-03-11', '20:50:42', 'Maligaya', '2021-03-11', '20:52:44', 'Administrator'),
(136, 'Mens long-sleeve', 'TOMMY', 'SMALL', 'MEN', 24, '2021-03-11', '20:52:10', 'Maligaya', '2021-03-11', '20:52:48', 'Administrator'),
(139, 'Mens long-sleeve', 'TOMMY', 'SMALL', 'MEN', 24, '2021-03-11', '20:55:53', 'Maligaya', '2021-03-11', '20:57:07', 'Administrator'),
(139, 'T-shirt', 'FUBU', 'LARGE', 'MEN', 12, '2021-03-11', '20:55:44', 'Maligaya', '2021-03-11', '20:57:11', 'Administrator'),
(139, 'Hiking Bag', 'JAG', 'MEDIUM', 'OTHER', 6, '2021-03-11', '20:55:31', 'Maligaya', '2021-03-11', '20:57:15', 'Administrator'),
(139, 'POLO', 'ADDIDAS', 'SMALL', 'MEN', 12, '2021-03-11', '20:55:17', 'Maligaya', '2021-03-11', '20:57:18', 'Administrator'),
(143, 'T-shirt', 'FUBU', 'MEDIUM', 'WOMEN', 24, '2021-03-11', '20:56:46', 'Maligaya', '2021-03-11', '20:57:22', 'Administrator'),
(143, 'POLO', 'ADDIDAS', 'SMALL', 'MEN', 24, '2021-03-11', '20:56:38', 'Maligaya', '2021-03-11', '20:57:26', 'Administrator'),
(143, 'Jeans', 'FUBU', 'LARGE', 'MEN', 24, '2021-03-11', '20:56:29', 'Maligaya', '2021-03-11', '20:57:29', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_request`
--

CREATE TABLE `tbl_request` (
  `id_request` int(11) NOT NULL,
  `request_no` bigint(20) NOT NULL,
  `id_item` int(11) DEFAULT NULL,
  `item_description` varchar(255) NOT NULL,
  `id_brand` bigint(20) NOT NULL,
  `id_size` bigint(20) NOT NULL,
  `id_section` bigint(20) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `date_request` date DEFAULT NULL,
  `time_request` time DEFAULT NULL,
  `id_sBranch` bigint(20) NOT NULL,
  `reqStatus` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_request`
--

INSERT INTO `tbl_request` (`id_request`, `request_no`, `id_item`, `item_description`, `id_brand`, `id_size`, `id_section`, `quantity`, `date_request`, `time_request`, `id_sBranch`, `reqStatus`) VALUES
(1, 0, 12, 'Mens Pants', 4, 2, 1, 100, '2021-02-14', '16:03:36', 1, 1),
(2, 0, 5, 'Jagger', 2, 3, 3, 10, '2021-02-14', '16:03:52', 1, 1),
(3, 0, 7, 'Jagger', 3, 3, 1, 199, '2021-02-14', '16:04:04', 1, 1),
(4, 3, 5, 'Jagger', 2, 3, 3, 10, '2021-02-14', '16:06:47', 1, 1),
(5, 3, 13, 'Shoes', 2, 4, 1, 50, '2021-02-14', '16:06:57', 1, 1),
(6, 5, 5, 'Jagger', 2, 3, 3, 5, '2021-02-15', '22:04:15', 1, 1),
(7, 5, 12, 'Mens Pants', 4, 2, 1, 3, '2021-02-15', '22:04:28', 1, 1),
(8, 5, 14, 'Jagger', 5, 2, 2, 2, '2021-02-15', '22:04:34', 1, 0),
(9, 8, 4, 'Jagger', 3, 3, 2, 1, '2021-02-15', '22:21:25', 1, 1),
(10, 8, 14, 'Jagger', 5, 2, 2, 1, '2021-02-15', '22:21:32', 1, 0),
(11, 10, 14, 'Jagger', 5, 2, 2, 1, '2021-02-16', '13:54:05', 1, 1),
(12, 10, 4, 'Jagger', 3, 3, 2, 1, '2021-02-16', '13:54:18', 1, 1),
(14, 12, 14, 'Jagger', 5, 2, 2, 1, '2021-02-16', '14:27:47', 1, 1),
(15, 12, 7, 'Jagger', 3, 3, 1, 1, '2021-02-16', '14:27:56', 1, 1),
(16, 12, 4, 'Jagger', 3, 3, 2, 1, '2021-02-16', '14:28:10', 1, 1),
(17, 15, 14, 'Jagger', 5, 2, 2, 1, '2021-02-16', '18:56:05', 1, 1),
(18, 15, 4, 'Jagger', 3, 3, 2, 1, '2021-02-16', '18:56:14', 1, 1),
(20, 17, 14, 'Jagger', 5, 2, 2, 1, '2021-02-16', '19:03:12', 1, 1),
(21, 17, 4, 'Jagger', 3, 3, 2, 1, '2021-02-16', '19:03:22', 1, 1),
(23, 19, 14, 'Jagger', 5, 2, 2, 1, '2021-02-16', '19:06:43', 1, 1),
(24, 19, 4, 'Jagger', 3, 3, 2, 1, '2021-02-16', '19:06:52', 1, 1),
(26, 21, 14, 'Jagger', 5, 2, 2, 2, '2021-02-16', '19:13:30', 1, 1),
(27, 21, 4, 'Jagger', 3, 3, 2, 1, '2021-02-16', '19:13:44', 1, 1),
(29, 23, 5, 'Blouse', 1, 4, 2, 20, '2021-02-16', '19:22:27', 1, 1),
(30, 23, 3, 'T-shirt', 4, 3, 2, 100, '2021-02-16', '19:22:36', 1, 0),
(31, 23, 1, 'Mens Pants', 3, 3, 1, 50, '2021-02-16', '19:22:45', 1, 1),
(32, 26, 7, 'Jogging Pants', 2, 2, 1, 10, '2021-02-16', '19:25:07', 1, 1),
(33, 26, 3, 'T-shirt', 4, 3, 2, 12, '2021-02-16', '19:25:18', 1, 1),
(35, 28, 7, 'Jogging Pants', 2, 2, 1, 10, '2021-02-16', '19:27:12', 1, 1),
(36, 28, 4, 'Mens long-sleeve', 5, 2, 1, 12, '2021-02-16', '19:27:22', 1, 0),
(37, 28, 3, 'T-shirt', 4, 3, 2, 12, '2021-02-16', '19:27:30', 1, 0),
(38, 28, 3, 'T-shirt', 4, 3, 2, 12, '2021-02-16', '19:27:30', 1, 0),
(42, 32, 7, 'Jogging Pants', 2, 2, 1, 5, '2021-02-16', '19:30:35', 1, 1),
(43, 32, 4, 'Mens long-sleeve', 5, 2, 1, 6, '2021-02-16', '19:30:41', 1, 1),
(44, 34, 7, 'Jogging Pants', 2, 2, 1, 6, '2021-02-16', '23:21:06', 1, 1),
(45, 34, 2, 'T-shirt', 4, 4, 1, 20, '2021-02-16', '23:21:16', 1, 0),
(46, 34, 5, 'Blouse', 1, 4, 2, 12, '2021-02-16', '23:21:27', 1, 1),
(47, 37, 7, 'Jogging Pants', 2, 2, 1, 12, '2021-02-16', '23:23:09', 1, 1),
(48, 37, 2, 'T-shirt', 4, 4, 1, 6, '2021-02-16', '23:23:17', 1, 1),
(50, 39, 5, 'Blouse', 1, 4, 2, 6, '2021-02-16', '23:25:09', 1, 1),
(51, 39, 7, 'Jogging Pants', 2, 2, 1, 23, '2021-02-16', '23:25:20', 1, 1),
(53, 41, 5, 'Blouse', 1, 4, 2, 1, '2021-02-16', '23:27:21', 1, 1),
(54, 41, 7, 'Jogging Pants', 2, 2, 1, 1, '2021-02-16', '23:27:27', 1, 1),
(55, 41, 8, 'Jogging Pants', 2, 2, 2, 1, '2021-02-16', '23:27:33', 1, 0),
(56, 41, 4, 'Mens long-sleeve', 5, 2, 1, 1, '2021-02-16', '23:27:41', 1, 1),
(60, 45, 3, 'T-shirt', 4, 3, 2, 1, '2021-02-16', '23:38:15', 1, 1),
(61, 45, 2, 'T-shirt', 4, 4, 1, 1, '2021-02-16', '23:38:21', 1, 1),
(62, 45, 1, 'Mens Pants', 3, 3, 1, 1, '2021-02-16', '23:38:39', 1, 0),
(63, 48, 7, 'Jogging Pants', 2, 2, 1, 1, '2021-02-17', '00:11:03', 1, 1),
(64, 48, 8, 'Jogging Pants', 2, 2, 2, 2, '2021-02-17', '00:11:12', 1, 1),
(65, 50, 2, 'T-shirt', 4, 4, 1, 12, '2021-02-17', '17:45:14', 1, 1),
(66, 50, 1, 'Mens Pants', 3, 3, 1, 12, '2021-02-17', '17:45:22', 1, 1),
(67, 50, 7, 'Jogging Pants', 2, 2, 1, 6, '2021-02-17', '17:45:30', 1, 1),
(68, 50, 5, 'Blouse', 1, 4, 2, 12, '2021-02-17', '17:45:37', 1, 1),
(69, 50, 3, 'T-shirt', 4, 3, 2, 6, '2021-02-17', '17:45:46', 1, 1),
(72, 55, 7, 'Jogging Pants', 2, 2, 1, 1, '2021-02-17', '17:47:15', 1, 1),
(73, 55, 8, 'Jogging Pants', 2, 2, 2, 6, '2021-02-17', '17:47:23', 1, 1),
(74, 55, 5, 'Blouse', 1, 4, 2, 3, '2021-02-17', '17:47:29', 1, 1),
(75, 58, 3, 'T-shirt', 4, 3, 2, 12, '2021-02-17', '17:48:28', 1, 1),
(76, 58, 7, 'Jogging Pants', 2, 2, 1, 12, '2021-02-17', '17:48:35', 1, 1),
(77, 58, 7, 'Jogging Pants', 2, 2, 1, 2, '2021-02-17', '17:48:42', 1, 1),
(78, 61, 5, 'Blouse', 1, 4, 2, 12, '2021-02-17', '17:49:30', 1, 1),
(79, 61, 7, 'Jogging Pants', 2, 2, 1, 2, '2021-02-17', '17:49:37', 1, 1),
(80, 61, 2, 'T-shirt', 4, 4, 1, 12, '2021-02-17', '17:49:45', 1, 1),
(81, 64, 5, 'Blouse', 1, 4, 2, 6, '2021-02-17', '17:52:25', 1, 1),
(82, 64, 3, 'T-shirt', 4, 3, 2, 24, '2021-02-17', '17:52:37', 1, 1),
(83, 64, 1, 'Mens Pants', 3, 3, 1, 1488, '2021-02-17', '17:52:45', 1, 1),
(84, 67, 5, 'Blouse', 1, 4, 2, 12, '2021-02-17', '17:54:49', 1, 1),
(85, 67, 7, 'Jogging Pants', 2, 2, 1, 2, '2021-02-17', '17:54:54', 1, 1),
(87, 69, 8, 'Jogging Pants', 2, 2, 2, 2, '2021-02-17', '17:55:05', 1, 1),
(88, 69, 4, 'Mens long-sleeve', 5, 2, 1, 12, '2021-02-17', '17:55:17', 1, 1),
(89, 69, 3, 'T-shirt', 4, 3, 2, 22, '2021-02-17', '17:55:23', 1, 1),
(90, 72, 5, 'Blouse', 1, 4, 2, 1, '2021-02-18', '22:49:32', 1, 1),
(91, 72, 7, 'Jogging Pants', 2, 2, 1, 3, '2021-02-18', '22:49:39', 1, 1),
(93, 74, 7, 'Jogging Pants', 2, 2, 1, 3, '2021-02-18', '23:16:04', 1, 1),
(94, 74, 3, 'T-shirt', 4, 3, 2, 3, '2021-02-18', '23:16:25', 1, 1),
(96, 76, 4, 'Mens long-sleeve', 5, 2, 1, 2, '2021-02-18', '23:18:34', 1, 1),
(97, 76, 2, 'T-shirt', 4, 4, 1, 8, '2021-02-18', '23:18:44', 1, 1),
(99, 78, 7, 'Jogging Pants', 2, 2, 1, 390, '2021-02-18', '23:28:23', 1, 1),
(100, 78, 5, 'Blouse', 1, 4, 2, 9, '2021-02-18', '23:29:00', 1, 1),
(101, 78, 3, 'T-shirt', 4, 3, 2, 20, '2021-02-18', '23:29:14', 1, 1),
(102, 81, 6, 'POLO', 2, 2, 1, 100, '2021-02-22', '08:58:57', 1, 1),
(103, 81, 6, 'POLO', 2, 2, 1, 200, '2021-02-22', '08:59:12', 1, 1),
(104, 83, 8, 'Jogging Pants', 2, 2, 2, 12, '2021-02-23', '17:56:42', 1, 1),
(105, 83, 3, 'T-shirt', 4, 3, 2, 12, '2021-02-23', '17:56:51', 1, 1),
(106, 85, 1, 'Mens Pants', 3, 3, 1, 570, '2021-02-27', '11:52:34', 1, 1),
(107, 86, 7, 'Jogging Pants', 2, 2, 1, 5, '2021-03-03', '00:00:09', 1, 1),
(108, 86, 3, 'T-shirt', 4, 3, 2, 8, '2021-03-03', '00:00:28', 1, 1),
(109, 86, 4, 'Mens long-sleeve', 5, 2, 1, 9, '2021-03-03', '00:00:39', 1, 1),
(110, 89, 8, 'Jogging Pants', 2, 2, 2, 50, '2021-03-06', '16:11:30', 1, 1),
(111, 89, 3, 'T-shirt', 4, 3, 2, 80, '2021-03-06', '16:12:03', 1, 1),
(112, 89, 11, 'Jeans', 4, 4, 1, 25, '2021-03-06', '16:33:24', 1, 1),
(113, 89, 11, 'Jeans', 4, 4, 1, 5, '2021-03-06', '16:36:51', 1, 1),
(117, 93, 7, 'Jogging Pants', 2, 2, 1, 12, '2021-03-06', '16:38:43', 1, 1),
(118, 93, 3, 'T-shirt', 4, 3, 2, 6, '2021-03-06', '16:38:55', 1, 1),
(119, 93, 10, 'Hiking Bag', 3, 3, 3, 3, '2021-03-06', '16:39:02', 1, 1),
(120, 96, 10, 'Hiking Bag', 3, 3, 3, 2, '2021-03-06', '17:34:21', 1, 0),
(121, 96, 7, 'Jogging Pants', 2, 2, 1, 3, '2021-03-06', '17:34:32', 1, 1),
(122, 96, 8, 'Jogging Pants', 2, 2, 2, 8, '2021-03-06', '17:34:42', 1, 1),
(123, 99, 3, 'T-shirt', 4, 3, 2, 2, '2021-03-06', '17:35:28', 1, 0),
(124, 99, 7, 'Jogging Pants', 2, 2, 1, 5, '2021-03-06', '17:35:42', 1, 1),
(125, 99, 5, 'Blouse', 1, 4, 2, 100, '2021-03-06', '17:35:53', 1, 1),
(126, 102, 5, 'Blouse', 1, 4, 2, 100, '2021-03-06', '17:37:28', 1, 0),
(127, 102, 6, 'POLO', 2, 2, 1, 100, '2021-03-06', '17:37:39', 1, 1),
(128, 102, 11, 'Jeans', 4, 4, 1, 10, '2021-03-06', '17:37:56', 1, 1),
(129, 105, 5, 'Blouse', 1, 4, 2, 100, '2021-03-06', '17:59:08', 1, 1),
(130, 105, 10, 'Hiking Bag', 3, 3, 3, 2, '2021-03-06', '17:59:16', 1, 0),
(131, 105, 3, 'T-shirt', 4, 3, 2, 2, '2021-03-06', '17:59:26', 1, 0),
(132, 108, 3, 'T-shirt', 4, 3, 2, 2, '2021-03-06', '18:00:28', 1, 1),
(133, 108, 10, 'Hiking Bag', 3, 3, 3, 2, '2021-03-06', '18:00:36', 1, 1),
(134, 108, 5, 'Blouse', 1, 4, 2, 100, '2021-03-06', '18:00:44', 1, 1),
(135, 111, 10, 'Hiking Bag', 3, 3, 3, 1, '2021-03-06', '18:08:53', 1, 0),
(136, 111, 8, 'Jogging Pants', 2, 2, 2, 1, '2021-03-06', '18:08:59', 1, 1),
(138, 113, 10, 'Hiking Bag', 3, 3, 3, 1, '2021-03-06', '18:09:34', 1, 0),
(139, 113, 7, 'Jogging Pants', 2, 2, 1, 2, '2021-03-06', '18:09:43', 1, 1),
(141, 115, 5, 'Blouse', 1, 4, 2, 100, '2021-03-06', '18:26:23', 1, 0),
(142, 115, 7, 'Jogging Pants', 2, 2, 1, 8, '2021-03-06', '18:26:31', 1, 1),
(143, 115, 6, 'POLO', 2, 2, 1, 6, '2021-03-06', '18:26:39', 1, 1),
(144, 118, 11, 'Jeans', 4, 4, 1, 10, '2021-03-06', '23:30:18', 1, 1),
(145, 118, 7, 'Jogging Pants', 2, 2, 1, 10, '2021-03-06', '23:30:33', 1, 1),
(146, 118, 4, 'Mens long-sleeve', 5, 2, 1, 10, '2021-03-06', '23:30:42', 1, 1),
(147, 121, 6, 'POLO', 2, 2, 1, 4, '2021-03-06', '23:30:58', 1, 1),
(148, 121, 3, 'T-shirt', 4, 3, 2, 10, '2021-03-06', '23:31:05', 1, 1),
(149, 121, 3, 'T-shirt', 4, 3, 2, 10, '2021-03-06', '23:31:13', 1, 1),
(150, 124, 8, 'Jogging Pants', 2, 2, 2, 9, '2021-03-08', '16:17:58', 1, 0),
(151, 124, 3, 'T-shirt', 4, 3, 2, 12, '2021-03-08', '16:18:05', 1, 0),
(152, 124, 6, 'POLO', 2, 2, 1, 12, '2021-03-08', '16:18:19', 1, 1),
(153, 127, 5, 'Blouse', 1, 4, 2, 12, '2021-03-08', '16:19:21', 1, 1),
(154, 127, 8, 'Jogging Pants', 2, 2, 2, 6, '2021-03-08', '16:19:31', 1, 1),
(155, 129, 11, 'Jeans', 4, 4, 1, 24, '2021-03-08', '21:47:13', 1, 1),
(156, 129, 6, 'POLO', 2, 2, 1, 6, '2021-03-08', '21:47:22', 1, 1),
(157, 131, 5, 'Blouse', 1, 4, 2, 2088, '2021-03-09', '15:20:08', 1, 1),
(158, 131, 8, 'Jogging Pants', 2, 2, 2, 1512, '2021-03-09', '15:21:06', 1, 1),
(159, 133, 11, 'Jeans', 4, 4, 1, 6, '2021-03-11', '20:50:42', 1, 1),
(160, 133, 7, 'Jogging Pants', 2, 2, 1, 12, '2021-03-11', '20:51:02', 1, 1),
(161, 133, 6, 'POLO', 2, 2, 1, 12, '2021-03-11', '20:51:10', 1, 1),
(162, 136, 5, 'Blouse', 1, 4, 2, 12, '2021-03-11', '20:51:47', 1, 0),
(163, 136, 3, 'T-shirt', 4, 3, 2, 24, '2021-03-11', '20:51:59', 1, 0),
(164, 136, 4, 'Mens long-sleeve', 5, 2, 1, 24, '2021-03-11', '20:52:10', 1, 1),
(165, 139, 6, 'POLO', 2, 2, 1, 12, '2021-03-11', '20:55:17', 1, 1),
(166, 139, 10, 'Hiking Bag', 3, 3, 3, 6, '2021-03-11', '20:55:31', 1, 1),
(167, 139, 2, 'T-shirt', 4, 4, 1, 12, '2021-03-11', '20:55:44', 1, 1),
(168, 139, 4, 'Mens long-sleeve', 5, 2, 1, 24, '2021-03-11', '20:55:53', 1, 1),
(172, 143, 11, 'Jeans', 4, 4, 1, 24, '2021-03-11', '20:56:29', 1, 1),
(173, 143, 6, 'POLO', 2, 2, 1, 24, '2021-03-11', '20:56:38', 1, 1),
(174, 143, 3, 'T-shirt', 4, 3, 2, 24, '2021-03-11', '20:56:46', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_requestclone`
--

CREATE TABLE `tbl_requestclone` (
  `id_request` int(11) NOT NULL,
  `request_no` bigint(20) NOT NULL,
  `id_item` bigint(20) NOT NULL,
  `item_description` varchar(255) NOT NULL,
  `id_brand` bigint(20) NOT NULL,
  `id_size` bigint(20) NOT NULL,
  `id_section` bigint(20) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `date_request` date DEFAULT NULL,
  `time_request` time DEFAULT NULL,
  `id_sBranch` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sizes`
--

CREATE TABLE `tbl_sizes` (
  `id_size` int(11) NOT NULL,
  `size_description` varchar(10) NOT NULL,
  `isActive` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sizes`
--

INSERT INTO `tbl_sizes` (`id_size`, `size_description`, `isActive`) VALUES
(1, 'X-SMALL', 0),
(2, 'SMALL', 0),
(3, 'MEDIUM', 0),
(4, 'LARGE', 0),
(5, 'X-LARGE', 0),
(6, '2XL', 1),
(7, '3XL', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_storebranch`
--

CREATE TABLE `tbl_storebranch` (
  `id_sBranch` int(11) NOT NULL,
  `branch_name` varchar(225) NOT NULL,
  `branch_address` varchar(255) NOT NULL,
  `branch_contact` varchar(20) NOT NULL,
  `isActive` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_storebranch`
--

INSERT INTO `tbl_storebranch` (`id_sBranch`, `branch_name`, `branch_address`, `branch_contact`, `isActive`) VALUES
(1, 'Maligaya', '#056 vill', '0941-4561-983', 1),
(2, 'Bagong', '#065 Villiongco St.', '0938-4561-983', 0),
(3, 'NEW', 'NEW', '0318404566', 1),
(4, 'Pasig Branch', 'Sitio Batong lobo', '0987-873-123', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_employee`
-- (See below for the actual view)
--
CREATE TABLE `vw_employee` (
`emp_id` int(11)
,`employee` varchar(204)
,`emp_position` varchar(255)
,`branch_name` varchar(225)
,`emp_password` varchar(255)
,`isActive` int(1)
,`userType` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_itemdetails`
-- (See below for the actual view)
--
CREATE TABLE `vw_itemdetails` (
`id_item` int(11)
,`item_number` bigint(20)
,`item_description` varchar(255)
,`brand_description` varchar(255)
,`size_description` varchar(10)
,`quantity` bigint(20)
,`date_in` date
,`time_in` time
,`itemSectionDescription` varchar(20)
,`employee` varchar(201)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_items`
-- (See below for the actual view)
--
CREATE TABLE `vw_items` (
`item_description` varchar(255)
,`brand_description` varchar(255)
,`itemSectionDescription` varchar(20)
,`quantity` bigint(20)
,`size_description` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_itemwhishlist`
-- (See below for the actual view)
--
CREATE TABLE `vw_itemwhishlist` (
`id_request` int(11)
,`request_no` bigint(20)
,`id_item` int(11)
,`item_description` varchar(255)
,`brand_description` varchar(255)
,`size_description` varchar(10)
,`itemSectionDescription` varchar(20)
,`quantity` bigint(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_selectitem`
-- (See below for the actual view)
--
CREATE TABLE `vw_selectitem` (
`id_item` int(11)
,`item_description` varchar(255)
,`brand_description` varchar(255)
,`size_description` varchar(10)
,`itemSectionDescription` varchar(20)
,`quantity` bigint(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_selectrequest`
-- (See below for the actual view)
--
CREATE TABLE `vw_selectrequest` (
`request_no` bigint(20)
,`id_item` int(11)
,`item_description` varchar(255)
,`brand_description` varchar(255)
,`size_description` varchar(10)
,`itemSectionDescription` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_temporyitem`
-- (See below for the actual view)
--
CREATE TABLE `vw_temporyitem` (
`id_item` int(11)
,`item_number` bigint(20)
,`item_description` varchar(255)
,`brand_description` varchar(255)
,`size_description` varchar(10)
,`itemSectionDescription` varchar(20)
,`quantity` bigint(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_viewitemrequest`
-- (See below for the actual view)
--
CREATE TABLE `vw_viewitemrequest` (
`id_item` int(11)
,`item_description` varchar(255)
,`brand_description` varchar(255)
,`size_description` varchar(10)
,`itemSectionDescription` varchar(20)
,`quantity` decimal(41,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_viewitems`
-- (See below for the actual view)
--
CREATE TABLE `vw_viewitems` (
`item_number` bigint(20)
,`item_description` varchar(255)
,`brand_description` varchar(255)
,`size_description` varchar(10)
,`itemSectionDescription` varchar(20)
,`quantity` decimal(41,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_viewrequestlist`
-- (See below for the actual view)
--
CREATE TABLE `vw_viewrequestlist` (
`id_request` int(11)
,`request_no` bigint(20)
,`id_item` bigint(20)
,`item_description` varchar(255)
,`brand_description` varchar(255)
,`size_description` varchar(10)
,`itemSectionDescription` varchar(20)
,`quantity` bigint(20)
,`date_request` date
,`time_request` time
,`branch_name` varchar(225)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_viewrequestrelease`
-- (See below for the actual view)
--
CREATE TABLE `vw_viewrequestrelease` (
`request_no` bigint(20)
,`item_description` varchar(255)
,`brand_description` varchar(255)
,`size_description` varchar(10)
,`itemSectionDescription` varchar(20)
,`date_request` date
,`time_request` time
,`branch_name` varchar(225)
,`reqStatus` int(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_viewtbl_request`
-- (See below for the actual view)
--
CREATE TABLE `vw_viewtbl_request` (
`id_request` int(11)
,`id_item` int(11)
,`request_no` bigint(20)
,`item_description` varchar(255)
,`brand_description` varchar(255)
,`size_description` varchar(10)
,`itemSectionDescription` varchar(20)
,`quantity` bigint(20)
,`date_request` date
,`time_request` time
,`branch_name` varchar(225)
,`reqStatus` int(1)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_employee`
--
DROP TABLE IF EXISTS `vw_employee`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_employee`  AS  select `e`.`emp_id` AS `emp_id`,concat_ws(' ',`e`.`emp_lastName`,`e`.`emp_firstName`,`e`.`emp_midInitial`) AS `employee`,`e`.`emp_position` AS `emp_position`,`sb`.`branch_name` AS `branch_name`,`e`.`emp_password` AS `emp_password`,`e`.`isActive` AS `isActive`,`e`.`userType` AS `userType` from (`tbl_employee` `e` join `tbl_storebranch` `sb` on((`e`.`id_sBranch` = `sb`.`id_sBranch`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_itemdetails`
--
DROP TABLE IF EXISTS `vw_itemdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_itemdetails`  AS  select `i`.`id_item` AS `id_item`,`i`.`item_number` AS `item_number`,`i`.`item_description` AS `item_description`,`b`.`brand_description` AS `brand_description`,`s`.`size_description` AS `size_description`,`i`.`quantity` AS `quantity`,`i`.`date_in` AS `date_in`,`i`.`time_in` AS `time_in`,`sc`.`itemSectionDescription` AS `itemSectionDescription`,concat_ws(' ',`e`.`emp_firstName`,`e`.`emp_lastName`) AS `employee` from (((((`tbl_item` `i` join `tbl_brand` `b` on((`i`.`id_brand` = `b`.`id_brand`))) join `tbl_sizes` `s` on((`i`.`id_size` = `s`.`id_size`))) join `tbl_itemsection` `sc` on((`i`.`id_section` = `sc`.`id_section`))) join `tbl_employee` `e` on((`i`.`emp_id` = `e`.`emp_id`))) join `tbl_storebranch` `sb` on((`e`.`id_sBranch` = `sb`.`id_sBranch`))) order by `i`.`id_item` desc ;

-- --------------------------------------------------------

--
-- Structure for view `vw_items`
--
DROP TABLE IF EXISTS `vw_items`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_items`  AS  select distinct `i`.`item_description` AS `item_description`,`b`.`brand_description` AS `brand_description`,`isec`.`itemSectionDescription` AS `itemSectionDescription`,`i`.`quantity` AS `quantity`,`s`.`size_description` AS `size_description` from (((`tbl_item` `i` join `tbl_brand` `b` on((`i`.`id_brand` = `b`.`id_brand`))) join `tbl_itemsection` `isec` on((`i`.`id_section` = `isec`.`id_section`))) join `tbl_sizes` `s` on((`i`.`id_size` = `s`.`id_size`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_itemwhishlist`
--
DROP TABLE IF EXISTS `vw_itemwhishlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_itemwhishlist`  AS  select `rq`.`id_request` AS `id_request`,`rq`.`request_no` AS `request_no`,`rq`.`id_item` AS `id_item`,`rq`.`item_description` AS `item_description`,`b`.`brand_description` AS `brand_description`,`s`.`size_description` AS `size_description`,`isec`.`itemSectionDescription` AS `itemSectionDescription`,`rq`.`quantity` AS `quantity` from (((`tbl_request` `rq` join `tbl_brand` `b` on((`rq`.`id_brand` = `b`.`id_brand`))) join `tbl_sizes` `s` on((`rq`.`id_size` = `s`.`id_size`))) join `tbl_itemsection` `isec` on((`rq`.`id_section` = `isec`.`id_section`))) order by `rq`.`request_no` desc ;

-- --------------------------------------------------------

--
-- Structure for view `vw_selectitem`
--
DROP TABLE IF EXISTS `vw_selectitem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_selectitem`  AS  select `i`.`id_item` AS `id_item`,`i`.`item_description` AS `item_description`,`b`.`brand_description` AS `brand_description`,`s`.`size_description` AS `size_description`,`sc`.`itemSectionDescription` AS `itemSectionDescription`,`i`.`quantity` AS `quantity` from (((`tbl_itemclone` `i` join `tbl_brand` `b` on((`i`.`id_brand` = `b`.`id_brand`))) join `tbl_sizes` `s` on((`i`.`id_size` = `s`.`id_size`))) join `tbl_itemsection` `sc` on((`i`.`id_section` = `sc`.`id_section`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_selectrequest`
--
DROP TABLE IF EXISTS `vw_selectrequest`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_selectrequest`  AS  select `r`.`request_no` AS `request_no`,`r`.`id_item` AS `id_item`,`r`.`item_description` AS `item_description`,`b`.`brand_description` AS `brand_description`,`s`.`size_description` AS `size_description`,`isec`.`itemSectionDescription` AS `itemSectionDescription` from (((`tbl_request` `r` join `tbl_brand` `b` on((`r`.`id_brand` = `b`.`id_brand`))) join `tbl_sizes` `s` on((`r`.`id_size` = `s`.`id_size`))) join `tbl_itemsection` `isec` on((`r`.`id_section` = `isec`.`id_section`))) group by `r`.`request_no` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_temporyitem`
--
DROP TABLE IF EXISTS `vw_temporyitem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_temporyitem`  AS  select `i`.`id_item` AS `id_item`,`i`.`item_number` AS `item_number`,`i`.`item_description` AS `item_description`,`b`.`brand_description` AS `brand_description`,`s`.`size_description` AS `size_description`,`sc`.`itemSectionDescription` AS `itemSectionDescription`,`i`.`quantity` AS `quantity` from (((`tbl_itemclone` `i` join `tbl_brand` `b` on((`i`.`id_brand` = `b`.`id_brand`))) join `tbl_sizes` `s` on((`i`.`id_size` = `s`.`id_size`))) join `tbl_itemsection` `sc` on((`i`.`id_section` = `sc`.`id_section`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_viewitemrequest`
--
DROP TABLE IF EXISTS `vw_viewitemrequest`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_viewitemrequest`  AS  select `i`.`id_item` AS `id_item`,`i`.`item_description` AS `item_description`,`b`.`brand_description` AS `brand_description`,`s`.`size_description` AS `size_description`,`isec`.`itemSectionDescription` AS `itemSectionDescription`,sum(`i`.`quantity`) AS `quantity` from (((`tbl_item` `i` join `tbl_brand` `b` on((`i`.`id_brand` = `b`.`id_brand`))) join `tbl_sizes` `s` on((`i`.`id_size` = `s`.`id_size`))) join `tbl_itemsection` `isec` on((`i`.`id_section` = `isec`.`id_section`))) group by `i`.`item_description`,`b`.`brand_description`,`s`.`size_description`,`isec`.`itemSectionDescription` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_viewitems`
--
DROP TABLE IF EXISTS `vw_viewitems`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_viewitems`  AS  select `i`.`item_number` AS `item_number`,`i`.`item_description` AS `item_description`,`b`.`brand_description` AS `brand_description`,`s`.`size_description` AS `size_description`,`sc`.`itemSectionDescription` AS `itemSectionDescription`,sum(`i`.`quantity`) AS `quantity` from (((`tbl_item` `i` join `tbl_brand` `b` on((`i`.`id_brand` = `b`.`id_brand`))) join `tbl_sizes` `s` on((`i`.`id_size` = `s`.`id_size`))) join `tbl_itemsection` `sc` on((`i`.`id_section` = `sc`.`id_section`))) group by `i`.`item_description`,`b`.`brand_description`,`s`.`size_description`,`sc`.`itemSectionDescription` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_viewrequestlist`
--
DROP TABLE IF EXISTS `vw_viewrequestlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_viewrequestlist`  AS  select `rqc`.`id_request` AS `id_request`,`rqc`.`request_no` AS `request_no`,`rqc`.`id_item` AS `id_item`,`rqc`.`item_description` AS `item_description`,`b`.`brand_description` AS `brand_description`,`s`.`size_description` AS `size_description`,`isec`.`itemSectionDescription` AS `itemSectionDescription`,`rqc`.`quantity` AS `quantity`,`rqc`.`date_request` AS `date_request`,`rqc`.`time_request` AS `time_request`,`br`.`branch_name` AS `branch_name` from ((((`tbl_requestclone` `rqc` join `tbl_brand` `b` on((`rqc`.`id_brand` = `b`.`id_brand`))) join `tbl_sizes` `s` on((`rqc`.`id_size` = `s`.`id_size`))) join `tbl_itemsection` `isec` on((`rqc`.`id_section` = `isec`.`id_section`))) join `tbl_storebranch` `br` on((`rqc`.`id_sBranch` = `br`.`id_sBranch`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_viewrequestrelease`
--
DROP TABLE IF EXISTS `vw_viewrequestrelease`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_viewrequestrelease`  AS  select `r`.`request_no` AS `request_no`,`r`.`item_description` AS `item_description`,`b`.`brand_description` AS `brand_description`,`s`.`size_description` AS `size_description`,`isec`.`itemSectionDescription` AS `itemSectionDescription`,`r`.`date_request` AS `date_request`,`r`.`time_request` AS `time_request`,`br`.`branch_name` AS `branch_name`,`r`.`reqStatus` AS `reqStatus` from ((((`tbl_request` `r` join `tbl_brand` `b` on((`r`.`id_brand` = `b`.`id_brand`))) join `tbl_sizes` `s` on((`r`.`id_size` = `s`.`id_size`))) join `tbl_itemsection` `isec` on((`r`.`id_section` = `isec`.`id_section`))) join `tbl_storebranch` `br` on((`r`.`id_sBranch` = `br`.`id_sBranch`))) group by `r`.`request_no` having (`r`.`reqStatus` = 0) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_viewtbl_request`
--
DROP TABLE IF EXISTS `vw_viewtbl_request`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_viewtbl_request`  AS  select `r`.`id_request` AS `id_request`,`r`.`id_item` AS `id_item`,`r`.`request_no` AS `request_no`,`r`.`item_description` AS `item_description`,`b`.`brand_description` AS `brand_description`,`s`.`size_description` AS `size_description`,`isec`.`itemSectionDescription` AS `itemSectionDescription`,`r`.`quantity` AS `quantity`,`r`.`date_request` AS `date_request`,`r`.`time_request` AS `time_request`,`br`.`branch_name` AS `branch_name`,`r`.`reqStatus` AS `reqStatus` from ((((`tbl_request` `r` join `tbl_brand` `b` on((`r`.`id_brand` = `b`.`id_brand`))) join `tbl_sizes` `s` on((`r`.`id_size` = `s`.`id_size`))) join `tbl_itemsection` `isec` on((`r`.`id_section` = `isec`.`id_section`))) join `tbl_storebranch` `br` on((`r`.`id_sBranch` = `br`.`id_sBranch`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`id_brand`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `tbl_item`
--
ALTER TABLE `tbl_item`
  ADD PRIMARY KEY (`id_item`);

--
-- Indexes for table `tbl_itemclone`
--
ALTER TABLE `tbl_itemclone`
  ADD PRIMARY KEY (`id_item`);

--
-- Indexes for table `tbl_itemsection`
--
ALTER TABLE `tbl_itemsection`
  ADD PRIMARY KEY (`id_section`);

--
-- Indexes for table `tbl_request`
--
ALTER TABLE `tbl_request`
  ADD PRIMARY KEY (`id_request`);

--
-- Indexes for table `tbl_requestclone`
--
ALTER TABLE `tbl_requestclone`
  ADD PRIMARY KEY (`id_request`);

--
-- Indexes for table `tbl_sizes`
--
ALTER TABLE `tbl_sizes`
  ADD PRIMARY KEY (`id_size`);

--
-- Indexes for table `tbl_storebranch`
--
ALTER TABLE `tbl_storebranch`
  ADD PRIMARY KEY (`id_sBranch`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_item`
--
ALTER TABLE `tbl_item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_itemclone`
--
ALTER TABLE `tbl_itemclone`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_itemsection`
--
ALTER TABLE `tbl_itemsection`
  MODIFY `id_section` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_request`
--
ALTER TABLE `tbl_request`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `tbl_requestclone`
--
ALTER TABLE `tbl_requestclone`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sizes`
--
ALTER TABLE `tbl_sizes`
  MODIFY `id_size` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_storebranch`
--
ALTER TABLE `tbl_storebranch`
  MODIFY `id_sBranch` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
