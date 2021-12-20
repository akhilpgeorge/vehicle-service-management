-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 20, 2021 at 04:32 PM
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
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `date_sched` datetime NOT NULL,
  `veh_model` varchar(50) NOT NULL,
  `veh_category` tinyint(1) NOT NULL DEFAULT 0,
  `veh_reg_no` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `comments` text DEFAULT NULL,
  `contact` bigint(15) NOT NULL,
  `bill_amount` int(10) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `date_sched`, `veh_model`, `veh_category`, `veh_reg_no`, `status`, `comments`, `contact`, `bill_amount`, `date_created`) VALUES
(13, 40, '2021-11-21 14:33:00', 'model', 2, 'KL 34 ewrsdf', 2, NULL, 8787878, NULL, '2021-11-07 14:35:30'),
(14, 40, '2021-11-21 00:00:00', 'asdsad', 2, 'KL 34 ewrsdf', 3, NULL, 24234324, 230, '2021-11-07 18:27:14'),
(15, 40, '2021-11-19 00:00:00', 'adssad', 2, 'KL 34 ewrsdf', 2, NULL, 24234324, NULL, '2021-11-08 19:19:41'),
(17, 40, '2021-11-26 00:00:00', 'model', 2, 'KL 34 ewrsdf', 0, NULL, 24234324, NULL, '2021-11-08 19:35:54'),
(18, 41, '2021-11-13 00:00:00', 'model', 2, 'KL 34 ewrsdf', 2, NULL, 24234324, NULL, '2021-11-13 21:43:41'),
(19, 41, '2021-11-14 00:00:00', 'model', 2, 'KL 34 ewrsdf', 2, NULL, 24234324, NULL, '2021-11-13 21:44:33'),
(20, 41, '2021-11-21 00:00:00', 'model', 4, 'KL 34 ewrsdf', 2, NULL, 24234324, NULL, '2021-11-13 22:14:41'),
(21, 41, '2021-11-27 00:00:00', 'model', 2, 'KL 34 ewrsdf', 0, 'asdasdsad,asdsadsad', 24234324, NULL, '2021-11-15 19:29:18'),
(22, 41, '2021-11-16 00:00:00', 'Tiago', 4, 'KL 34 6379', 1, NULL, 9496365058, NULL, '2021-11-15 19:32:23'),
(29, 40, '2021-11-26 00:00:00', 'sadasd', 2, 'KL 34 ewrsdf', 3, 'asdsadsad,asdsadsadsad,oil', 9496365058, 1000, '2021-11-24 21:39:18');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_settings`
--

CREATE TABLE `schedule_settings` (
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `date_create` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule_settings`
--

INSERT INTO `schedule_settings` (`meta_field`, `meta_value`, `date_create`) VALUES
('day_schedule', 'Monday,Tuesday,Wednesday,Thursday,Friday', '2021-09-02 19:55:37'),
('morning_schedule', '08:00,11:00', '2021-09-02 19:55:37'),
('afternoon_schedule', '13:00,16:00', '2021-09-02 19:55:37');

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
(40, 'user1', 'lname1', 'user@test.com', '6ad14ba9986e3615423dfca256d04e3f', 0, '2021-11-13 22:36:13'),
(41, 'admin', '', 'admin@test.com', '0192023a7bbd73250516f069df18b500', 1, '2021-11-02 20:31:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

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
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
