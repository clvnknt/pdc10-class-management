-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2022 at 10:07 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pdc10_classes`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `class_code` varchar(255) NOT NULL,
  `employee_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `description`, `class_code`, `employee_number`) VALUES
(1, 'Professional Domain Course 1', 'Programming Course', 'PDC10', '20-4956-234'),
(4, 'Information Assurance and Security', 'Data Privacy Course', 'IAS10', '24-9485-960'),
(5, 'Professional Elective 2', 'Another Programming Course', 'ITE20', '19-2344-219');

-- --------------------------------------------------------

--
-- Table structure for table `class_rosters`
--

CREATE TABLE `class_rosters` (
  `id` int(11) NOT NULL,
  `class_code` varchar(20) NOT NULL,
  `student_number` varchar(255) NOT NULL,
  `enrolled_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class_rosters`
--

INSERT INTO `class_rosters` (`id`, `class_code`, `student_number`, `enrolled_at`) VALUES
(1, 'AIM10', '20-1887-789', '2022-10-25 19:12:42'),
(2, 'IAS10', '19-7893-098', '2022-10-25 19:24:21'),
(4, 'IPT10', '12-342034-3423', '0000-00-00 00:00:00'),
(5, 'ITE20', '18-4536-897', '2022-10-24 17:25:21'),
(6, 'PDC10', '19-7893-098', '2022-10-25 16:22:21'),
(7, 'PDC20', '21-9879-098', '0000-00-00 00:00:00'),
(8, 'SIP10', '19-7893-098', '2022-10-26 04:06:09');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `student_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `program` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `student_number`, `email`, `contact_number`, `program`) VALUES
(1, 'Ron Ruselle', 'Bangsil', '14-0456-849', 'bangsil.ronruselle@auf.edu.ph', '09158045416', 'BSIT'),
(2, 'Bobby Marcko', 'Cruz', '18-2495-458', 'cruz.bobbymarcko@auf.edu.ph', '0997772344', 'BSIT'),
(3, 'Jello', 'Mangune', '19-0155-942', 'mangune.jello@auf.edu.ph', '0997472352', 'BSIT'),
(4, 'David Aaron', 'Echon', '19-0544-234', 'echon.davidaaron@auf.edu.ph', '0997476791', 'BSIT'),
(5, 'Jeremiah', 'Quiambao', '19-4444-221', 'quiambao.jeremiah@auf.edu.ph', '0987546722', 'BSIT');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `employee_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `first_name`, `last_name`, `email`, `contact_number`, `employee_number`) VALUES
(1, 'Romack', 'Natividad', 'natividad.romack@auf.edu.ph', '098745674849', '20-4956-234'),
(2, 'Renato Dan', 'Pablo', 'pablo.renatodan@auf.edu.ph', '093335675921', '19-2344-219'),
(3, 'Ray', 'Nicolas', 'nicolas.ray@auf.edu.ph', '093335674456', '24-9485-960');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_number` (`employee_number`),
  ADD KEY `class_code` (`class_code`);

--
-- Indexes for table `class_rosters`
--
ALTER TABLE `class_rosters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_code` (`class_code`),
  ADD KEY `student_number` (`student_number`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_number` (`student_number`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_number` (`employee_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `class_rosters`
--
ALTER TABLE `class_rosters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `teachers` (`employee_number`);

--
-- Constraints for table `class_rosters`
--
ALTER TABLE `class_rosters`
  ADD CONSTRAINT `class_rosters_ibfk_1` FOREIGN KEY (`class_code`) REFERENCES `classes` (`class_code`),
  ADD CONSTRAINT `class_rosters_ibfk_2` FOREIGN KEY (`student_number`) REFERENCES `students` (`student_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
