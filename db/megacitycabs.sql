-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 04, 2025 at 05:29 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `megacitycabs`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `booking_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `customer_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `driver_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `car_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pickup_location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dropoff_location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `distance` decimal(10,2) DEFAULT NULL,
  `booking_status` enum('pending','confirmed','completed','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'pending',
  `total_fare` decimal(10,2) DEFAULT NULL,
  `payment_status` enum('pending','paid','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'pending',
  `hire_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hire_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `booking_number` (`booking_number`) USING BTREE,
  KEY `customer_id` (`customer_id`) USING BTREE,
  KEY `driver_id` (`driver_id`) USING BTREE,
  KEY `car_id` (`car_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `booking_number`, `customer_id`, `driver_id`, `car_id`, `pickup_location`, `dropoff_location`, `distance`, `booking_status`, `total_fare`, `payment_status`, `hire_date`, `created_at`, `updated_at`, `hire_time`) VALUES
('78b33eb5-a576-43a2-9c6c-5aa7316615b1', 'BOOK-058524', '021eecf0-ac96-4346-a152-27f159f0e6c6', '1e7d09ae-a125-456f-b009-d10f99ed2909', '1d58c65f-1c85-4532-b966-9a2333cc9c31', 'colombo', 'katunayaka', 14.54, 'completed', 746.83, 'pending', '2025-04-04', '2025-04-04 16:55:42', '2025-04-04 16:59:06', '22:26'),
('ab8e2ee9-fb46-42bc-840d-e992b6ce23ed', 'BOOK-423178', '021eecf0-ac96-4346-a152-27f159f0e6c6', '1e7d09ae-a125-456f-b009-d10f99ed2909', '1d58c65f-1c85-4532-b966-9a2333cc9c31', 'colombo', 'katunayaka', 43.65, 'completed', 2212.63, 'paid', '2025-04-05', '2025-04-04 16:54:30', '2025-04-04 16:59:13', '22:27'),
('d2eea357-5eea-4b39-a27a-a5ffb4563fb2', 'BOOK-268518', '021eecf0-ac96-4346-a152-27f159f0e6c6', '13b3d62a-908e-4779-8df2-7386f3b59a3c', '5bd16504-ef2d-440d-8117-dc846d5340ee', 'colombo', 'katunayaka', 24.69, 'confirmed', 1254.48, 'pending', '2025-04-04', '2025-04-04 16:57:22', '2025-04-04 16:57:28', '22:27');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
CREATE TABLE IF NOT EXISTS `cars` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `plate_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `year` year NOT NULL,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `status` enum('available','unavailable','maintenance') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `plate_number` (`plate_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `plate_number`, `model`, `brand`, `year`, `color`, `capacity`, `status`, `created_at`, `updated_at`) VALUES
('1d58c65f-1c85-4532-b966-9a2333cc9c31', 'TX-7850', 'Altima', 'Nissan', '2023', 'Silver', 4, 'available', NULL, NULL),
('5bd16504-ef2d-440d-8117-dc846d5340ee', 'TX-1023', 'Corolla', 'Toyota', '2021', 'Yellow', 4, 'available', NULL, NULL),
('8c99a3d0-dcb1-437c-bb74-7ea58932a389', 'TX-3341', 'Elantra', 'Hyundai', '2022', 'Blue', 4, 'available', NULL, NULL),
('c6960637-4c1c-494c-b82c-79cbe00df6b1', 'TX-4987', 'Civic', 'Honda', '2020', 'White', 4, 'available', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contact_no` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  UNIQUE KEY `contact_no` (`contact_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `address`, `contact_no`, `created_at`, `updated_at`) VALUES
('021eecf0-ac96-4346-a152-27f159f0e6c6', '021eecf0-ac96-4346-a152-27f159f0e6c6', 'colombo', '0786756934', '2025-04-04 16:53:55', '2025-04-04 16:53:55'),
('b6d60a6f-d8d1-42ef-8f24-1de6e73f85fb', 'b6d60a6f-d8d1-42ef-8f24-1de6e73f85fb', 'colombo', '0786756987', '2025-04-04 16:42:39', '2025-04-04 16:42:39'),
('f6876d0a-c7c9-46cd-ac03-30be9a37c109', 'f6876d0a-c7c9-46cd-ac03-30be9a37c109', 'colombo', '0786756765', '2025-04-04 16:41:50', '2025-04-04 16:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
CREATE TABLE IF NOT EXISTS `drivers` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `car_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `license_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `availability_status` enum('available','on-trip','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'available',
  `rating` decimal(3,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  UNIQUE KEY `license_number` (`license_number`) USING BTREE,
  KEY `drivers_ibfk_2` (`car_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `user_id`, `car_id`, `license_number`, `availability_status`, `rating`, `created_at`, `updated_at`) VALUES
('8b29eea3-c76a-4901-9871-2d639e08b0c1', '1e7d09ae-a125-456f-b009-d10f99ed2909', '1d58c65f-1c85-4532-b966-9a2333cc9c31', '9878783322', 'available', 0.00, '2025-04-04 16:46:44', '2025-04-04 16:51:21'),
('a07c777a-b7cc-40e3-99ef-b4922be336bf', '13b3d62a-908e-4779-8df2-7386f3b59a3c', '5bd16504-ef2d-440d-8117-dc846d5340ee', '987878734', 'available', 0.00, '2025-04-04 16:47:06', '2025-04-04 16:51:26'),
('ac7544ac-e8da-482e-8c09-48da503821df', '75be5e3c-99e4-4358-80b5-58b8982d8993', '8c99a3d0-dcb1-437c-bb74-7ea58932a389', '9878783334', 'available', 0.00, '2025-04-04 16:47:50', '2025-04-04 16:51:31'),
('ff5ad11f-acee-40ab-a995-72713d4e9d5c', '971b20fe-c158-4580-8a47-80f939091a17', 'c6960637-4c1c-494c-b82c-79cbe00df6b1', '987878783', 'available', 0.00, '2025-04-04 16:46:08', '2025-04-04 16:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `booking_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `customer_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('credit_card','cash','online_wallet') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `transaction_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` enum('pending','successful','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `transaction_id` (`transaction_id`) USING BTREE,
  KEY `booking_id` (`booking_id`) USING BTREE,
  KEY `customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `booking_id`, `customer_id`, `amount`, `payment_method`, `transaction_id`, `status`, `payment_date`, `created_at`, `updated_at`) VALUES
('916f690b-a6f7-4cf3-ab25-c29bb776ea8a', 'ab8e2ee9-fb46-42bc-840d-e992b6ce23ed', '021eecf0-ac96-4346-a152-27f159f0e6c6', 2212.63, 'cash', 'TXN-d294ef34', 'successful', '2025-04-04 16:54:47', '2025-04-04 16:54:46', '2025-04-04 16:54:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` enum('admin','customer','driver') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_enabled` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`, `updated_at`, `is_enabled`) VALUES
('021eecf0-ac96-4346-a152-27f159f0e6c6', 'customer shiva', 'customer1@gmail.com', '$2a$10$MYiaPYGCwyBry9BRKGdRFOArcnw6o3ATBLylREvxlnF0X5ZBtKvGy', 'customer', '2025-04-04 16:53:55', '2025-04-04 16:53:55', 1),
('13b3d62a-908e-4779-8df2-7386f3b59a3c', 'driver akila', 'driver3@gmail.com', '$2a$10$D4hxlXpTIHglmBH2wJIGuuViBDadNZzIdYLUMDby6VmS.9FnCRKTS', 'driver', '2025-04-04 16:47:06', '2025-04-04 16:47:06', 1),
('1e7d09ae-a125-456f-b009-d10f99ed2909', 'driver carl', 'driver2@gmail.com', '$2a$10$J9vjr045ONdcYwx0OjWG6epKB3MimH2C14iUK2UUO5sxjCJvGxWm6', 'driver', '2025-04-04 16:46:44', '2025-04-04 16:46:44', 1),
('75be5e3c-99e4-4358-80b5-58b8982d8993', 'driver nuwan', 'driver4@gmail.com', '$2a$10$wm7DNBvTH0h4ymcXtSrjdOyvvFWefEJsqkec8BRAWTWy5l4bqbcc2', 'driver', '2025-04-04 16:47:50', '2025-04-04 16:47:50', 1),
('971b20fe-c158-4580-8a47-80f939091a17', 'driver malith', 'driver1@gmail.com', '$2a$10$GNZcHP07fNq1knvTkwvViOTn61Lf55ALOWtwlc9vkOmn8U62mtFde', 'driver', '2025-04-04 16:46:08', '2025-04-04 16:46:08', 1),
('b6d60a6f-d8d1-42ef-8f24-1de6e73f85fb', 'admin', 'admin@gmailcom', '$2a$10$O5FjlTn2uQKGX40CqTMI4OxwsUIDc6yNZwhBpF6kFTx4bmLcj6LPy', 'admin', '2025-04-04 16:42:39', '2025-04-04 16:42:55', 1),
('f6876d0a-c7c9-46cd-ac03-30be9a37c109', 'user1', 'user1@gmail.com', '$2a$10$plRWBgAXaBr5HOSTB.fg.exV.Jga/3/FW9c2inVKtGu8CwATOFZHq', 'customer', '2025-04-04 16:41:50', '2025-04-04 16:41:50', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `drivers_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
