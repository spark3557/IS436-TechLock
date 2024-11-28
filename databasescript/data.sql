-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Sep 09, 2022 at 08:49 PM
-- Server version: 8.0.30
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `php_docker`
-- --------------------------------------------------------


CREATE TABLE `Account` (
  `acc_id` int NOT NULL,
  `email_add` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `job_position` text NOT NULL,
  `date_started` date NOT NULL,
  `salary` int NOT NULL,
  `department` varchar(255) NOT NULL,
  `acc_password` varchar(255) NOT NULL,
  PRIMARY KEY (`acc_id`)
);

INSERT INTO `Account` (`acc_id`,`email_add`, `full_name`, `job_position`, `date_started`,`salary`,`department`,`acc_password`) VALUES
(1, 'spark20@umbc.edu','Savannah Park', 'Program scheduler', '2022-09-01',70000,'Finance','blue12!'),
(2, 'moonstar@gmail.com','Luna Moon', 'Project manager', '2022-09-03',65000,'Engineering', 'engine20@'),
(3, 'devdev12@gmail.com','Deven Roe', 'Financial Analyst', '2022-09-07',70000,'Finance','icemoney100!'),
(4, 'randomstuff12@gmail.com','Bob Rodger', 'Receptionist', '2022-09-07',60000,'Finance', 'blahblah09@');

CREATE TABLE `Tasks` (
  `task_id` int NOT NULL,
  `acc_id` int NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `task_describe` varchar(255) NOT NULL,
  `task_percentage` int NOT NULL,
  `task_deadline` date NOT NULL,
  PRIMARY KEY (`task_id`),
  FOREIGN KEY (`acc_id`) REFERENCES `Account`(`acc_id`)
);

INSERT INTO `Tasks` (`task_id`,`acc_id`, `task_name`,`task_describe`, `task_percentage`, `task_deadline`) VALUES
(1, 1,'Monthly Reports','Production of reports about the projects status each month' 50, '2025-02-01'),
(2, 2,'Baseline Execution Index','Calculates the efficiency with which tasks have been accomplished when measured against the baseline tasks at a Status Date over a span of time', 65, '2024-05-02'),
(3, 3,'WBS Creation', 'Produce a Work breakdown structure that breaks down the project into smaller components according to schedule',90, '2025-09-07'),
(4, 4,'Host Media Forum', 'Host a media forum that discusses the importance of media training for the company and learning to communicate effectively.',75, '2025-04-07');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
