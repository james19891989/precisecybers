-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 24, 2023 at 12:03 PM
-- Server version: 10.5.21-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blinxcok_wkeo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `id` int(11) NOT NULL,
  `admin_firstname` varchar(255) NOT NULL,
  `admin_lastname` varchar(255) NOT NULL,
  `admin_username` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_phone` varchar(50) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`id`, `admin_firstname`, `admin_lastname`, `admin_username`, `admin_email`, `admin_phone`, `admin_password`, `password_reset_token`, `date_created`) VALUES
(3, 'Demo', 'User', 'demo', 'demo@mailinator.com', '+254712578954', 'fe01ce2a7fbac8fafaed7c982a04e229', NULL, '2023-01-15 11:51:39'),
(1, 'Benson', 'Makau', 'makaubenson', 'bensonmakau2000@gmail.com', '758413462', '8821fe54f8b9828c97081d56666b6cc9', NULL, '2023-01-14 13:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `budget_details`
--

CREATE TABLE `budget_details` (
  `id` int(11) NOT NULL,
  `budget_id` varchar(20) NOT NULL,
  `budget_name` varchar(255) NOT NULL,
  `budget` varchar(255) NOT NULL,
  `budget_year` bigint(20) NOT NULL,
  `budget_amount` float NOT NULL,
  `budget_date` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `budget_details`
--

INSERT INTO `budget_details` (`id`, `budget_id`, `budget_name`, `budget`, `budget_year`, `budget_amount`, `budget_date`, `date`) VALUES
(1, 'BGT01', 'Maseno Budget', '270000', 2020, 250000, '2020-02-01', '2023-01-16 11:59:39'),
(3, 'BGT02', 'Budget Neon', '285000', 2023, 240000, '2023-06-28', '2023-01-16 12:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `id` int(11) NOT NULL,
  `student_username` varchar(50) NOT NULL,
  `student_firstname` varchar(255) NOT NULL,
  `student_middlename` varchar(255) DEFAULT NULL,
  `student_lastname` varchar(255) NOT NULL,
  `student_email` varchar(50) NOT NULL,
  `student_phone` bigint(50) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`id`, `student_username`, `student_firstname`, `student_middlename`, `student_lastname`, `student_email`, `student_phone`, `date_created`) VALUES
(2, '35758564', 'George', NULL, 'Watson', 'wykizize@mailinator.com', 254790333257, '2023-01-15 10:39:21'),
(1, '37505349', 'Benson', 'Justus', 'Namolo', 'namoloandrew12@gmail.com', 254758413462, '2023-01-15 08:26:03'),
(7, 'Commodo velit minim', 'matyjurev', 'Charissa Marsh', 'Page', 'bywuvejyjy@mailinator.com', 19, '2023-01-16 10:33:24');

-- --------------------------------------------------------

--
-- Table structure for table `student_institution_details`
--

CREATE TABLE `student_institution_details` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `course_duration` int(20) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `yearOfStudy` bigint(20) NOT NULL,
  `currentSemester` bigint(20) NOT NULL,
  `student_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_institution_details`
--

INSERT INTO `student_institution_details` (`id`, `category`, `institution_name`, `course_name`, `course_duration`, `start_date`, `end_date`, `yearOfStudy`, `currentSemester`, `student_id`) VALUES
(1, 'University', 'Maseno University', 'B.S.c Information Technology', 4, '2019-08-19', '2022-12-16', 4, 2, '37505349'),
(2, 'Secondary', 'Duncan Hahn', 'High School Education', 61, '2002-05-01', '1989-02-14', 3, 1, '35758564');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`admin_username`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `budget_details`
--
ALTER TABLE `budget_details`
  ADD PRIMARY KEY (`budget_id`),
  ADD KEY `BUD` (`id`);

--
-- Indexes for table `student_details`
--
ALTER TABLE `student_details`
  ADD PRIMARY KEY (`student_username`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `student_institution_details`
--
ALTER TABLE `student_institution_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iiiddd` (`id`),
  ADD KEY `studentId` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `budget_details`
--
ALTER TABLE `budget_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_details`
--
ALTER TABLE `student_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `student_institution_details`
--
ALTER TABLE `student_institution_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `student_institution_details`
--
ALTER TABLE `student_institution_details`
  ADD CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `student_details` (`student_username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
