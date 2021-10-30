-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 30, 2021 at 02:08 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vehicle`
--

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(10) NOT NULL,
  `category` varchar(200) NOT NULL,
  `model` varchar(200) NOT NULL,
  `date` varchar(10) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `category`, `model`, `date`, `created_on`, `user_id`) VALUES
(30, '2', 'asdsad', '02/02/1997', '2021-10-15 13:43:15', 19);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Vehicle Service Management system'),
(6, 'short_name', 'PASS-PHP'),
(11, 'logo', 'uploads/1630631400_clinic-logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1630631400_clinic-cover.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` int(5) NOT NULL DEFAULT 0,
  `created_on` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `user_type`, `created_on`) VALUES
(19, 'Akhil', 'sadsada', 'akhilpgeorge@gmail.com', '$2y$10$IXrzPZz8/0yaeYLEs3gWBekyjruFwvg5kWu1zCIrttNJ3U72QXxb2', 0, '2021-10-27 22:26:56'),
(20, 'Akhil1', 'sadsada2', 'akhilpgeorge@gmail.com1', '$2y$10$IXrzPZz8/0yaeYLEs3gWBekyjruFwvg5kWu1zCIrttNJ3U72QXxb3', 1, '2021-10-27 22:26:56'),
(21, 'Akhil2', 'sadsada3', 'akhilpgeorge@gmail.com2', '$2y$10$IXrzPZz8/0yaeYLEs3gWBekyjruFwvg5kWu1zCIrttNJ3U72QXxb4', 0, '2021-10-27 22:26:56'),
(22, 'Akhil3', 'sadsada4', 'akhilpgeorge@gmail.com3', '$2y$10$IXrzPZz8/0yaeYLEs3gWBekyjruFwvg5kWu1zCIrttNJ3U72QXxb5', 0, '2021-10-27 22:26:56'),
(23, 'Akhil4', 'sadsada5', 'akhilpgeorge@gmail.com4', '$2y$10$IXrzPZz8/0yaeYLEs3gWBekyjruFwvg5kWu1zCIrttNJ3U72QXxb6', 0, '2021-10-27 22:26:56'),
(24, 'Akhil5', 'sadsada6', 'akhilpgeorge@gmail.com5', '$2y$10$IXrzPZz8/0yaeYLEs3gWBekyjruFwvg5kWu1zCIrttNJ3U72QXxb7', 0, '2021-10-27 22:26:56'),
(25, 'Akhil6', 'sadsada7', 'akhilpgeorge@gmail.com6', '$2y$10$IXrzPZz8/0yaeYLEs3gWBekyjruFwvg5kWu1zCIrttNJ3U72QXxb8', 0, '2021-10-27 22:26:56'),
(26, 'Akhil7', 'sadsada8', 'akhilpgeorge@gmail.com7', '$2y$10$IXrzPZz8/0yaeYLEs3gWBekyjruFwvg5kWu1zCIrttNJ3U72QXxb9', 0, '2021-10-27 22:26:56'),
(36, 'admin', '', 'admin@test.com', '0192023a7bbd73250516f069df18b500', 1, '2021-10-29 22:25:25'),
(37, 'user', '', 'user@test.com', '6ad14ba9986e3615423dfca256d04e3f', 0, '2021-10-29 22:26:08'),
(38, 'sdfsadsad', '', 'user@test.com1', '6ad14ba9986e3615423dfca256d04e3f', 0, '2021-10-30 15:06:44'),
(39, 'asdasdsa', '', 'user@test.com134', '6ad14ba9986e3615423dfca256d04e3f', 0, '2021-10-30 17:15:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
