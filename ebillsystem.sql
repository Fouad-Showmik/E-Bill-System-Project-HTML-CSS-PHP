-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2023 at 04:51 PM
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
-- Database: `ebillsystem`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `unitstoamount` (IN `units` INT(14), OUT `result` INT(14))   BEGIN
   
    DECLARE a INT(14) DEFAULT 0;
    DECLARE b INT(14) DEFAULT 0;
    DECLARE c INT(14) DEFAULT 0;

    SELECT twohundred FROM unitsRate INTO a ;
    SELECT fivehundred FROM unitsRate INTO b ;
    SELECT thousand FROM unitsRate INTO c  ;

    IF units<200
    then
        SELECT a*units INTO result;
    
    ELSEIF units<500
    then
        SELECT (a*200)+(b*(units-200)) INTO result;
    ELSEIF units > 500
    then
        SELECT (a*200)+(b*(300))+(c*(units-500)) INTO result;
    END IF;

END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `curdate1` () RETURNS INT(11)  BEGIN
    DECLARE x INT;
    SET x = DAYOFMONTH(CURDATE());
    IF (x=1)
    THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(14) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `pass`) VALUES
(1, 'Administrator01 ', 'showmik@gmail.com', '1234'),
(2, 'Administrator02', 'hussain@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(14) NOT NULL,
  `aid` int(14) NOT NULL,
  `bill ID` int(14) NOT NULL,
  `units` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `bdate` date NOT NULL,
  `ddate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `aid`, `bill ID`, `units`, `amount`, `status`, `bdate`, `ddate`) VALUES
(1, 1, 1, 200, '400.00', 'PENDING', '2023-04-05', '2023-05-02'),
(2, 1, 2, 300, '900.00', 'PENDING', '2023-04-05', '2023-05-02'),
(3, 1, 3, 150, '300.00', 'PENDING', '2023-04-05', '2023-05-02'),
(4, 1, 4, 200, '400.00', 'PROCEED', '2023-04-05', '2023-05-02'),
(5, 1, 5, 300, '900.00', 'PENDING', '2023-04-05', '2023-05-02'),
(6, 1, 6, 300, '900.00', 'PROCEED', '2023-04-05', '2023-05-02'),
(7, 1, 7, 300, '900.00', 'PENDING', '2023-04-05', '2023-05-02'),
(8, 1, 8, 200, '400.00', 'PROCEED', '2023-04-05', '2023-05-02'),
(9, 1, 9, 200, '400.00', 'PENDING', '2023-04-05', '2023-05-02'),
(10, 1, 10, 300, '900.00', 'PENDING', '2023-04-05', '2023-05-02'),
(11, 1, 11, 300, '900.00', 'PENDING', '2023-04-05', '2023-05-02'),
(12, 1, 12, 200, '400.00', 'PENDING', '2023-04-05', '2023-05-02'),
(13, 1, 13, 200, '400.00', 'PENDING', '2023-04-05', '2023-05-02'),
(14, 1, 14, 150, '300.00', 'PROCEED', '2023-04-05', '2023-05-02'),
(15, 1, 15, 150, '300.00', 'PENDING', '2023-04-05', '2023-05-02');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int(14) NOT NULL,
  `uid` int(14) NOT NULL,
  `aid` int(14) NOT NULL,
  `complaint` varchar(140) NOT NULL,
  `status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int(14) NOT NULL,
  `bid` int(14) NOT NULL,
  `payable` decimal(10,2) NOT NULL,
  `pdate` date DEFAULT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `bid`, `payable`, `pdate`, `status`) VALUES
(1, 1, '400.00', '2023-05-02', 'PENDING'),
(2, 2, '900.00', '2023-05-02', 'PENDING'),
(3, 3, '300.00', '2023-05-02', 'PENDING'),
(4, 4, '400.00', '2023-05-02', 'PROCEED'),
(5, 5, '900.00', '2023-04-05', 'PENDING'),
(6, 6, '900.00', '2023-05-02', 'PROCEED'),
(7, 7, '900.00', '2023-05-02', 'PENDING'),
(8, 8, '400.00', '2023-05-02', 'PROCEED'),
(9, 9, '400.00', '2023-05-02', 'PENDING'),
(10, 10, '900.00', '2023-05-02', 'PENDING'),
(11, 11, '900.00', '2023-05-02', 'PENDING'),
(12, 12, '900.00', '2023-05-02', 'PENDING'),
(13, 13, '900.00', '2023-05-02', 'PENDING'),
(14, 14, '300.00', '2023-05-02', 'PROCEED'),
(15, 15, '300.00', '2023-05-02', 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `unitsrate`
--

CREATE TABLE `unitsrate` (
  `sno` int(1) DEFAULT NULL,
  `twohundred` int(14) NOT NULL,
  `fivehundred` int(14) NOT NULL,
  `thousand` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `unitsrate`
--

INSERT INTO `unitsrate` (`sno`, `twohundred`, `fivehundred`, `thousand`) VALUES
(1, 2, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(14) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `phone`, `pass`, `address`) VALUES
(1, 'Fahad', 'fahad@gmail.com', '01814473471', '123', 'Dhaka'),
(2, 'Faiyaz', 'faiyaz@gmail.com', '01711789076', '123', 'Khulna'),
(3, 'Sabbir Rahma', 'sabbir@gmail.com', '01899124312', '123', 'Dhaka'),
(4, 'Sadi Ashraf', 'sadi@gmail.com', '018776523412', '789', 'Barisal'),
(5, 'Mohammad Ruhan', 'ruhan@gmail.com', '01892341123', '789', 'Dhaka'),
(6, 'Arnob Kabir', 'kabir@gmail.com', '01922125673', '123', 'Cumilla'),
(7, 'Udoy Saha', 'saha@gmail.com', '01712321786', '789', 'Barisal'),
(8, 'Md. Karim', 'karim@gmail.com', '01912343278', '123', 'Feni'),
(9, 'Md. Abul', 'abul@gmail.com', '01913432781', '789', 'Khulna'),
(10, 'Md. Salam', 'salam@gmail.com', '01315643218', '123', 'Dhaka'),
(11, 'Md. Arman', 'arman@gmail.com', '01913432191', '789', 'Cumilla'),
(12, 'Md. Jamal', 'jamal@gmail.com', '01712321897', '789', 'Chittagong'),
(13, 'Md. Kamal', 'kamal@gmail.com', '01812321786', '789', 'Dhaka'),
(14, 'Zabed Sohel', 'sohel@gmail.com', '01712343217', '789', 'Cumilla'),
(15, 'Kamal Khan', 'kamal@gmail.com', '01917654578', '123', 'Dhaka');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aid` (`aid`),
  ADD KEY `uid` (`bill ID`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aid` (`aid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`bill ID`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `bill` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
