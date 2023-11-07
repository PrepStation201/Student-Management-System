-- [Friday 4:03 PM] Dev Vilas Wankhede
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2023 at 11:30 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0
 
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
 
 
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
 
--
-- Database: `mydatabase`
--
 
-- --------------------------------------------------------
 
--
-- Table structure for table `courses`
--
 
CREATE TABLE `courses` (
  `cid` varchar(10) NOT NULL,
  `cname` varchar(10) NOT NULL,
  `durations` int(10) NOT NULL,
  `cprof` varchar(10) NOT NULL,
  `prof_id` varchar(100) NOT NULL,
  `deptID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
 
--
-- Dumping data for table `courses`
--
 
INSERT INTO `courses` (`cid`, `cname`, `durations`, `cprof`, `prof_id`, `deptID`) VALUES
('CS512', 'CSE', 4, 'DebangaSir', '125', 1005),
('MA5003', 'CSE', 2, 'Neeraj Sir', '123', 1005),
('MA501', 'Deep Learn', 4, 'Sur Sir', '127', 1005),
('MA589', 'Mathematic', 2, 'Bora Mam', '121', 1001);
 
-- --------------------------------------------------------
 
--
-- Table structure for table `department`
--
 
CREATE TABLE `department` (
  `dept_ID` int(11) NOT NULL,
  `dept_Name` varchar(255) NOT NULL,
  `since` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
 
--
-- Dumping data for table `department`
--
 
INSERT INTO `department` (`dept_ID`, `dept_Name`, `since`) VALUES
(1001, 'Mathematics', '1994'),
(1005, 'CSE', '1996'),
(1009, 'EEE', '1991');
 
-- --------------------------------------------------------
 
--
-- Table structure for table `instructor`
--
 
CREATE TABLE `instructor` (
  `inst_id` varchar(100) NOT NULL,
  `inst_name` varchar(50) NOT NULL,
  `inst_age` int(10) NOT NULL,
  `inst_dpt` varchar(100) NOT NULL,
  `deptID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
 
--
-- Dumping data for table `instructor`
--
 
INSERT INTO `instructor` (`inst_id`, `inst_name`, `inst_age`, `inst_dpt`, `deptID`) VALUES
('121', 'Bora Mam', 47, 'Maths', 1001),
('123', 'Neeraj Sir', 32, 'DSAI', 1005),
('125', 'Debanga Sir', 29, 'DSAI', 1005),
('127', 'Arvind Sur', 37, 'EEE', 1009);
 
-- --------------------------------------------------------
 
--
-- Table structure for table `student`
--
 
CREATE TABLE `student` (
  `roll_no` char(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int(2) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
 
--
-- Dumping data for table `student`
--
 
INSERT INTO `student` (`roll_no`, `name`, `age`, `sex`, `email`) VALUES
('03', 'Dev', 23, 'M', 'dev@gmail'),
('05', 'Mani', 25, 'M', 'manikantha@gmail'),
('07', 'Tarun', 24, 'M', 'tarun@gmail'),
('13', 'Pragati', 26, 'F', 'pragati@gmail');
 
-- --------------------------------------------------------
 
--
-- Table structure for table `takes`
--
 
CREATE TABLE `takes` (
  `stu_ID` char(100) NOT NULL,
  `course_ID` varchar(100) NOT NULL,
  `since` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
 
--
-- Indexes for dumped tables
--
 
--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `prof_id` (`prof_id`),
  ADD KEY `deptID` (`deptID`);
 
--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_ID`);
 
--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`inst_id`),
  ADD KEY `deptID` (`deptID`);
 
--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`roll_no`);
 
--
-- Indexes for table `takes`
--
ALTER TABLE `takes`
  ADD PRIMARY KEY (`stu_ID`,`course_ID`),
  ADD KEY `course_ID` (`course_ID`);
 
--
-- Constraints for dumped tables
--
 
--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`prof_id`) REFERENCES `instructor` (`inst_id`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`deptID`) REFERENCES `department` (`dept_ID`);
 
--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`deptID`) REFERENCES `department` (`dept_ID`);
 
--
-- Constraints for table `takes`
--
ALTER TABLE `takes`
  ADD CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`stu_ID`) REFERENCES `student` (`roll_no`),
  ADD CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`course_ID`) REFERENCES `courses` (`cid`),
  ADD CONSTRAINT `takes_ibfk_3` FOREIGN KEY (`stu_ID`) REFERENCES `student` (`roll_no`),
  ADD CONSTRAINT `takes_ibfk_4` FOREIGN KEY (`stu_ID`) REFERENCES `student` (`roll_no`);
COMMIT;
 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
 
