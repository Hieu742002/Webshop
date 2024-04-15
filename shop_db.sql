-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2022 at 12:51 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--


-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `available` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `category` varchar(100) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `products` (`id`, `name` ,`details` ,`price` ,`category` ,`image_01` ,`image_02` ,`image_03` ) VALUES
(1,'Balo Coach Nam C6081','Balo Coach Nam Hudson Backpack In Blocked Signature Canvas C6081',120,'backpack','balo1.jpg','balo2.jpg','balo3.jpg'),
(2,'COACH Balo nam ','COACH Balo nam phom chữ nhật Charter',100,'backpack','balo4.jpg','balo5.jpg', 'balo6.webp'),
(3 ,'Balo MCM Stark ','Balo MCM Stark Side Studs in Visetos',99,'backpack','balo7.jpg','balo8.jpg', 'balo9.jpg'),
(4,'Balo MLB Monogram','MLB Monogram New York Yankees 3ABKM012N-50NYL',150,'backpack','balo10.jpg','balo11.jpg', 'balo12.jpg'),
(5 ,'BENTLEY Bl1784','BENTLEY Bl1784-252WNN-S2',300,'watch','watch1.webp','watch2.jpg', 'watch3.jpg'),
(6 ,'Hublot Classic','Hublot Classic Fusion Orlinski Titanium 550.NS.1800.RX.ORL19',250,'watch','watch4.jpeg','watch5.webp', 'watch6.webp'),
(7 ,'PEDRO-Ví nam','PEDRO-Ví nam dáng ngắn gập đôi thanh lịch',50,'wallet','wallet1.jpg','wallet2.jpg', 'wallet3.jpg'),
(8 ,'PEDRO Embossed Leather Bi Fold','PEDRO-Ví nam dáng ngắn Embossed Leather Bi Fold',40,'wallet','wallet4.jpg','wallet5.jpg', 'wallet6.jpg'),
(9 ,'PEDRO-Ví nam dáng ngắn','PEDRO-Ví nam dáng ngắn gập đôi thanh lịch',50,'wallet','wallet7.jpg','wallet8.jpg', 'wallet9.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `users` (`id` ,`name` ,`email` ,`password`,`user_type`) VALUES
(1, 'long','long@gmail.com','f9d423b786a390eeab032e009fbc834ab0760b9a','admin'),
(2, 'bao','bao@gmail.com','a8eb5205061f45157fd7fc15b1e68cad4009136c','admin'),
(3, 'a','a@gmail.com','f9d423b786a390eeab032e009fbc834ab0760b9a','user'),
(4, 'admin','admin@gmail.com','7af2d10b73ab7cd8f603937f7697cb5fe432c7ff','admin');
-- Email: long@gmail.com 
-- Password: Long1234
-- Email: bao@gmail.com 
-- Password: Bao12345
-- Email: admin@gmail.com 
-- Password: Admin123
-- Email: a@gmail.com 
-- Password: Long1234
-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `available` int(10) NOT NULL,
  `image` varchar(100) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--


--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
