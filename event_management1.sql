-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2026 at 09:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_management1`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(80) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `description`) VALUES
(1, 'Music', 'Concerts and music festivals'),
(2, 'Tech', 'Tech events and hackathons'),
(3, 'Sports', 'Sports competitions'),
(4, 'Education', 'Workshops and seminars'),
(5, 'Art', 'Art exhibitions'),
(6, 'Business', 'Corporate events'),
(7, 'Health', 'Fitness and wellness events'),
(8, 'Gaming', 'Gaming tournaments'),
(9, 'Fashion', 'Fashion shows'),
(10, 'Food', 'Food festivals');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(150) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `organizer_id` int(11) DEFAULT NULL,
  `venue_id` int(11) DEFAULT NULL,
  `event_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `description` text DEFAULT NULL,
  `ticket_price` decimal(10,2) DEFAULT 0.00,
  `max_capacity` int(11) DEFAULT NULL,
  `status` enum('Upcoming','Ongoing','Completed','Cancelled') DEFAULT 'Upcoming'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_name`, `category_id`, `organizer_id`, `venue_id`, `event_date`, `start_time`, `end_time`, `description`, `ticket_price`, `max_capacity`, `status`) VALUES
(1, 'Rock Concert', 1, 1, 1, '2026-04-01', '18:00:00', '22:00:00', NULL, 999.00, 500, 'Upcoming'),
(2, 'Hackathon', 2, 2, 2, '2026-04-05', '09:00:00', '18:00:00', NULL, 0.00, 300, 'Upcoming'),
(3, 'Football Match', 3, 3, 3, '2026-04-10', '16:00:00', '19:00:00', NULL, 500.00, 1000, 'Upcoming'),
(4, 'Workshop AI', 4, 4, 4, '2026-04-12', '10:00:00', '14:00:00', NULL, 200.00, 400, 'Upcoming'),
(5, 'Art Expo', 5, 5, 5, '2026-04-15', '11:00:00', '17:00:00', NULL, 150.00, 200, 'Upcoming'),
(6, 'Startup Meet', 6, 6, 6, '2026-04-18', '10:00:00', '15:00:00', NULL, 300.00, 350, 'Upcoming'),
(7, 'Yoga Camp', 7, 7, 7, '2026-04-20', '06:00:00', '09:00:00', NULL, 100.00, 250, 'Upcoming'),
(8, 'Gaming Tournament', 8, 8, 8, '2026-04-22', '12:00:00', '20:00:00', NULL, 250.00, 150, 'Upcoming'),
(9, 'Fashion Show', 9, 9, 9, '2026-04-25', '17:00:00', '21:00:00', NULL, 800.00, 300, 'Upcoming'),
(10, 'Food Festival', 10, 10, 10, '2026-04-28', '12:00:00', '22:00:00', NULL, 100.00, 600, 'Upcoming');

-- --------------------------------------------------------

--
-- Table structure for table `organizers`
--

CREATE TABLE `organizers` (
  `organizer_id` int(11) NOT NULL,
  `org_name` varchar(120) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizers`
--

INSERT INTO `organizers` (`organizer_id`, `org_name`, `contact_person`, `email`, `phone`, `website`) VALUES
(1, 'EventCorp', 'Rahul Sharma', 'rahul@eventcorp.com', '9876543210', 'www.eventcorp.com'),
(2, 'TechWorld', 'Ankit Verma', 'ankit@techworld.com', '9876501234', 'www.techworld.com'),
(3, 'SportsHub', 'Neha Singh', 'neha@sportshub.com', '9876512345', 'www.sportshub.com'),
(4, 'EduPro', 'Amit Jain', 'amit@edupro.com', '9876523456', 'www.edupro.com'),
(5, 'Artify', 'Riya Kapoor', 'riya@artify.com', '9876534567', 'www.artify.com'),
(6, 'BizMeet', 'Karan Mehta', 'karan@bizmeet.com', '9876545678', 'www.bizmeet.com'),
(7, 'HealthFirst', 'Pooja Arora', 'pooja@health.com', '9876556789', 'www.health.com'),
(8, 'GameZone', 'Sahil Khan', 'sahil@gamezone.com', '9876567890', 'www.gamezone.com'),
(9, 'FashionFiesta', 'Simran Kaur', 'simran@fashion.com', '9876578901', 'www.fashion.com'),
(10, 'Foodies', 'Vikas Gupta', 'vikas@foodies.com', '9876589012', 'www.foodies.com');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `reg_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` datetime DEFAULT current_timestamp(),
  `payment_mode` enum('Cash','Card','UPI','Net Banking') DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `status` enum('Success','Failed','Refunded') DEFAULT 'Success'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `reg_id`, `amount`, `payment_date`, `payment_mode`, `transaction_id`, `status`) VALUES
(1, 1, 1998.00, '2026-03-26 18:21:09', 'UPI', 'TXN001', 'Success'),
(2, 2, 0.00, '2026-03-26 18:21:09', 'Cash', 'TXN002', 'Success'),
(3, 3, 1500.00, '2026-03-26 18:21:09', 'Card', 'TXN003', 'Failed'),
(4, 4, 200.00, '2026-03-26 18:21:09', 'UPI', 'TXN004', 'Success'),
(5, 5, 300.00, '2026-03-26 18:21:09', 'Net Banking', 'TXN005', 'Refunded'),
(6, 6, 300.00, '2026-03-26 18:21:09', 'UPI', 'TXN006', 'Success'),
(7, 7, 200.00, '2026-03-26 18:21:09', 'Cash', 'TXN007', 'Success'),
(8, 8, 250.00, '2026-03-26 18:21:09', 'Card', 'TXN008', 'Failed'),
(9, 9, 1600.00, '2026-03-26 18:21:09', 'UPI', 'TXN009', 'Success'),
(10, 10, 400.00, '2026-03-26 18:21:09', 'Cash', 'TXN010', 'Success');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `reg_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `reg_date` datetime DEFAULT current_timestamp(),
  `ticket_count` int(11) DEFAULT 1,
  `status` enum('Confirmed','Pending','Cancelled') DEFAULT 'Confirmed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`reg_id`, `user_id`, `event_id`, `reg_date`, `ticket_count`, `status`) VALUES
(1, 1, 1, '2026-03-26 18:20:59', 2, 'Confirmed'),
(2, 2, 2, '2026-03-26 18:20:59', 1, 'Confirmed'),
(3, 3, 3, '2026-03-26 18:20:59', 3, 'Pending'),
(4, 4, 4, '2026-03-26 18:20:59', 1, 'Confirmed'),
(5, 5, 5, '2026-03-26 18:20:59', 2, 'Cancelled'),
(6, 6, 6, '2026-03-26 18:20:59', 1, 'Confirmed'),
(7, 7, 7, '2026-03-26 18:20:59', 2, 'Confirmed'),
(8, 8, 8, '2026-03-26 18:20:59', 1, 'Pending'),
(9, 9, 9, '2026-03-26 18:20:59', 2, 'Confirmed'),
(10, 10, 10, '2026-03-26 18:20:59', 4, 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `full_name`, `email`, `phone`, `city`, `created_at`) VALUES
(1, 'Kushagra Goyal', 'kush@gmail.com', '9991110001', 'Noida', '2026-03-26 18:20:38'),
(2, 'Aman Gupta', 'aman@gmail.com', '9991110002', 'Delhi', '2026-03-26 18:20:38'),
(3, 'Priya Sharma', 'priya@gmail.com', '9991110003', 'Delhi', '2026-03-26 18:20:38'),
(4, 'Rohit Verma', 'rohit@gmail.com', '9991110004', 'Gurgaon', '2026-03-26 18:20:38'),
(5, 'Sneha Kapoor', 'sneha@gmail.com', '9991110005', 'Delhi', '2026-03-26 18:20:38'),
(6, 'Aditya Singh', 'aditya@gmail.com', '9991110006', 'Noida', '2026-03-26 18:20:38'),
(7, 'Neha Arora', 'neha@gmail.com', '9991110007', 'Delhi', '2026-03-26 18:20:38'),
(8, 'Vikas Jain', 'vikas@gmail.com', '9991110008', 'Delhi', '2026-03-26 18:20:38'),
(9, 'Simran Kaur', 'simran@gmail.com', '9991110009', 'Punjab', '2026-03-26 18:20:38'),
(10, 'Rahul Mehta', 'rahul@gmail.com', '9991110010', 'Delhi', '2026-03-26 18:20:38');

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `venue_id` int(11) NOT NULL,
  `venue_name` varchar(120) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `contact_phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `venues`
--

INSERT INTO `venues` (`venue_id`, `venue_name`, `address`, `city`, `capacity`, `contact_phone`) VALUES
(1, 'City Hall', 'MG Road', 'Delhi', 500, '9000000001'),
(2, 'Tech Park', 'Sector 62', 'Noida', 300, '9000000002'),
(3, 'Stadium A', 'Sports Complex', 'Delhi', 1000, '9000000003'),
(4, 'Auditorium X', 'Central Delhi', 'Delhi', 400, '9000000004'),
(5, 'Art Gallery', 'Connaught Place', 'Delhi', 200, '9000000005'),
(6, 'Biz Center', 'Gurgaon', 'Gurgaon', 350, '9000000006'),
(7, 'Fitness Arena', 'Dwarka', 'Delhi', 250, '9000000007'),
(8, 'Gaming Hub', 'Saket', 'Delhi', 150, '9000000008'),
(9, 'Fashion Arena', 'South Ex', 'Delhi', 300, '9000000009'),
(10, 'Food Court', 'Karol Bagh', 'Delhi', 600, '9000000010');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `organizer_id` (`organizer_id`),
  ADD KEY `venue_id` (`venue_id`);

--
-- Indexes for table `organizers`
--
ALTER TABLE `organizers`
  ADD PRIMARY KEY (`organizer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `reg_id` (`reg_id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`reg_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`venue_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `organizers`
--
ALTER TABLE `organizers`
  MODIFY `organizer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `reg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `venue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`organizer_id`) REFERENCES `organizers` (`organizer_id`),
  ADD CONSTRAINT `events_ibfk_3` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`venue_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`reg_id`) REFERENCES `registrations` (`reg_id`);

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
