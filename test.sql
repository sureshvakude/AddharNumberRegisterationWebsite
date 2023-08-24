-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2022 at 12:50 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `anrlog`
--

CREATE TABLE `anrlog` (
  `id` int(11) NOT NULL,
  `AadharNum` bigint(11) NOT NULL,
  `PassWord` varchar(11) NOT NULL,
  `FirstName` varchar(200) NOT NULL,
  `LastName` varchar(200) NOT NULL,
  `MotherName` varchar(200) NOT NULL,
  `FatherName` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Gender` varchar(200) NOT NULL,
  `DOB` varchar(20) NOT NULL,
  `Course` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anrlog`
--

INSERT INTO `anrlog` (`id`, `AadharNum`, `PassWord`, `FirstName`, `LastName`, `MotherName`, `FatherName`, `Address`, `Gender`, `DOB`, `Course`, `Email`) VALUES
(1, 544517010028, 'suresh1111', 'suresh', 'vakude', 'bharathi', 'sanjay', 'shivajinagar 6th lane, nippani', 'male', '0000-00-00', 'Btech', 'sureshvakude8906@gmail.com'),
(2, 231792204217, 'Dipak@123', 'dipak', 'patil', 'sarika', 'dattu', 'saundalaga', 'male', '2001-05-28', 'Btech', 'dipakpatil@gmail.com'),
(3, 227184743046, 'Ratan@123', 'Ratan', 'karate', 'sakshi', 'suresh', 'shinoli', 'male', '2013-02-14', 'BBa', 'ratan@gmail');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anrlog`
--
ALTER TABLE `anrlog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anrlog`
--
ALTER TABLE `anrlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
