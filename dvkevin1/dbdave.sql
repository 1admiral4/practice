-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2019 at 04:50 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbdave`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cId` int(11) NOT NULL,
  `cName` varchar(255) NOT NULL,
  `cContact` varchar(20) NOT NULL,
  `cAddress` varchar(255) NOT NULL,
  `cDateAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cId`, `cName`, `cContact`, `cAddress`, `cDateAdded`) VALUES
(1, 'John Doe', '1234', 'Cebu', '2019-09-14 09:42:37'),
(2, 'Mark', '234-4234', 'Lapu-Lapu', '2019-09-14 09:43:16');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `oId` int(11) NOT NULL,
  `oNo` int(11) NOT NULL,
  `oPid` int(11) NOT NULL,
  `oCid` int(11) NOT NULL,
  `oQuantity` int(11) NOT NULL,
  `oDateAdded` datetime NOT NULL,
  `oUid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`oId`, `oNo`, `oPid`, `oCid`, `oQuantity`, `oDateAdded`, `oUid`) VALUES
(1, 1, 2, 1, 2, '0000-00-00 00:00:00', 1),
(2, 1, 1, 1, 3, '0000-00-00 00:00:00', 1),
(5, 2, 2, 2, 5, '2019-09-14 10:16:03', 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pId` int(11) NOT NULL,
  `pName` varchar(200) NOT NULL,
  `pDescription` varchar(200) NOT NULL,
  `pPrice` float NOT NULL,
  `Manufacturer` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pId`, `pName`, `pDescription`, `pPrice`, `Manufacturer`) VALUES
(1, 'GTX1090 GPU', 'Red', 14500, 'Nvida'),
(2, 'TP-LINK Router', 'Black', 12999, 'TPLINK');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uId` int(11) NOT NULL,
  `uUsername` varchar(100) NOT NULL,
  `uPassword` varchar(100) NOT NULL,
  `uDateAdded` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uId`, `uUsername`, `uPassword`, `uDateAdded`) VALUES
(1, 'vince123', '1234', '2019-09-14 09:45:19'),
(2, 'mark123', 'b9e95d78fbb80d3bab9a57c3efba061d', '2019-09-14 09:45:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `oId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
