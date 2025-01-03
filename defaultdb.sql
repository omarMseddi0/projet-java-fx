-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2025 at 08:34 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `defaultdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bmi`
--

CREATE TABLE `bmi` (
  `id` int(11) NOT NULL,
  `weight` double DEFAULT NULL,
  `recorded_date` date DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `recorded_month` varchar(20) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `bmi_value` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bmi`
--

INSERT INTO `bmi` (`id`, `weight`, `recorded_date`, `fk_customer_id`, `recorded_month`, `height`, `bmi_value`) VALUES
(1, 60, '2024-01-20', 1, 'January', 1.65, 22),
(2, 75, '2024-01-22', 2, 'January', 1.8, 23.1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `gender` enum('MALE','FEMALE') NOT NULL,
  `weight` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `monthly_plan` int(11) DEFAULT NULL,
  `nic` varchar(20) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `salt` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `current_status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `password`, `username`, `gender`, `weight`, `dob`, `monthly_plan`, `nic`, `is_active`, `salt`, `address`, `current_status`) VALUES
(1, 'Alice', 'Brown', 'alice.brown@example.com', '5551234567', 'hashed_password3', 'alicebrown', 'FEMALE', '60kg', '1990-04-25', 1, 'NIC789012', 1, 'salt3', '123 Maple Street', 1),
(2, 'Bob', 'Johnson', 'bob.johnson@example.com', '5559876543', 'hashed_password4', 'bobjohnson', 'MALE', '75kg', '1985-08-10', 2, 'NIC345678', 1, 'salt4', '456 Oak Avenue', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `designation` enum('TRAINER','MANAGER','ADMIN') NOT NULL,
  `nic_number` varchar(20) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  `gender` enum('MALE','FEMALE') NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `access` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `current_status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `designation`, `nic_number`, `salary`, `gender`, `phone_number`, `joining_date`, `username`, `password`, `salt`, `access`, `email`, `current_status`) VALUES
(1, 'John', 'Doe', 'TRAINER', 'NIC123456', 40000, 'MALE', '1234567890', '2023-01-15', 'johndoe', 'hashed_password1', 'salt1', 1, 'john.doe@example.com', 1),
(2, 'Jane', 'Smith', 'MANAGER', 'NIC654321', 60000, 'FEMALE', '0987654321', '2022-05-20', 'janesmith', 'hashed_password2', 'salt2', 2, 'jane.smith@example.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL,
  `selected_date` date DEFAULT NULL,
  `current_status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `description`, `created_date`, `amount`, `month`, `year`, `fk_employee_id`, `selected_date`, `current_status`) VALUES
(1, 'Gym Maintenance', '2024-01-10', 5000, 'January', '2024', 1, '2024-01-09', 1),
(2, 'Equipment Purchase', '2024-01-12', 15000, 'January', '2024', 2, '2024-01-11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `PACKAGE_NO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `title`, `amount`, `description`, `PACKAGE_NO`) VALUES
(1, 'Beginner Plan', 2000, 'Suitable for beginners with basic access.', 1),
(2, 'Starter Plan', 3000, 'Ideal for those who want to get started.', 2),
(3, 'Advanced Plan', 5000, 'For advanced users with full access.', 3);

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `current_status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`id`, `heading`, `email`, `description`, `created_date`, `username`, `reply`, `status`, `current_status`) VALUES
(1, 'Membership Inquiry', 'alice.brown@example.com', 'I would like to know more about the Starter Plan.', '2024-01-15', 'alicebrown', NULL, 0, 1),
(2, 'Feedback', 'bob.johnson@example.com', 'Great facilities and trainers!', '2024-01-16', 'bobjohnson', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `revenues`
--

CREATE TABLE `revenues` (
  `id` int(11) NOT NULL,
  `for_month` varchar(20) DEFAULT NULL,
  `for_year` varchar(4) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `revenues`
--

INSERT INTO `revenues` (`id`, `for_month`, `for_year`, `updated_date`, `amount`) VALUES
(1, 'January', '2024', '2024-01-31', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `created_date` date DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `transaction_number` varchar(50) NOT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_owner_name` varchar(100) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `created_date`, `amount`, `transaction_number`, `bank_name`, `account_owner_name`, `fk_customer_id`, `status`) VALUES
(1, '2024-01-01', 2000, 'TXN1001', 'Bank A', 'Alice Brown', 1, 0),
(2, '2024-01-05', 3000, 'TXN1002', 'Bank B', 'Bob Johnson', 2, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bmi`
--
ALTER TABLE `bmi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bmi_customer_id` (`fk_customer_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `nic` (`nic`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nic_number` (`nic_number`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `PACKAGE_NO` (`PACKAGE_NO`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_queries_username` (`username`);

--
-- Indexes for table `revenues`
--
ALTER TABLE `revenues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `for_month` (`for_month`,`for_year`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_number` (`transaction_number`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `idx_transaction_number` (`transaction_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bmi`
--
ALTER TABLE `bmi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `revenues`
--
ALTER TABLE `revenues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bmi`
--
ALTER TABLE `bmi`
  ADD CONSTRAINT `bmi_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
