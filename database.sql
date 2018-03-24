-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2018 at 06:27 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `bus_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lat` float(20,10) NOT NULL,
  `lng` float(20,10) NOT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bus_busstop_relation`
--

CREATE TABLE `bus_busstop_relation` (
  `bus_id` varchar(20) NOT NULL,
  `bus_stop_id` varchar(20) NOT NULL,
  `crossed` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bus_stop`
--

CREATE TABLE `bus_stop` (
  `bus_stop_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lat` float(20,10) NOT NULL,
  `lng` float(20,10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uiu_id` varchar(9) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`bus_id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `bus_busstop_relation`
--
ALTER TABLE `bus_busstop_relation`
  ADD PRIMARY KEY (`bus_id`,`bus_stop_id`),
  ADD KEY `bus_id` (`bus_id`,`bus_stop_id`),
  ADD KEY `bus_stop_id` (`bus_stop_id`);

--
-- Indexes for table `bus_stop`
--
ALTER TABLE `bus_stop`
  ADD PRIMARY KEY (`bus_stop_id`),
  ADD KEY `bus_stop_id` (`bus_stop_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uiu_id`,`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus_busstop_relation`
--
ALTER TABLE `bus_busstop_relation`
  ADD CONSTRAINT `bus_busstop_relation_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bus_busstop_relation_ibfk_2` FOREIGN KEY (`bus_stop_id`) REFERENCES `bus_stop` (`bus_stop_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
