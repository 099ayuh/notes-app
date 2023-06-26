-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2023 at 02:15 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `note_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `note_id` int(11) NOT NULL,
  `uid` varchar(100) NOT NULL,
  `note` text DEFAULT NULL,
  `c_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`note_id`, `uid`, `note`, `c_date`) VALUES
(4, 'U02', '<div><b>Warm-up:</b></div><div><br></div><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><div><ol><li>Stretch for 10 minutes</li><li>Jog on the treadmill for 5 minutes</li><li>3 sets of 10 reps</li><li>Bench Press: 3 sets of 8 reps</li><li>Deadlifts: 3 sets of 6 reps</li><li>Shoulder Press: 3 sets of 8 reps</li><li>Lat Pulldowns: 3 sets of 10 reps</li></ol></div></blockquote><div><br></div>', '2023-06-25'),
(5, 'U01', '<div><b><font color=\"#0b6ad0\">Strength Training:</font></b></div><div><br></div><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><div><ul><li>Squats: 3 sets of 10 reps</li><li>Bench Press: 3 sets of 8 reps</li><li>Deadlifts: 3 sets of 6 reps</li><li>Shoulder Press: 3 sets of 8 reps</li><li>Lat Pulldowns: 3 sets of 10 reps</li></ul><div><br></div></div></blockquote>', '2023-06-25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
