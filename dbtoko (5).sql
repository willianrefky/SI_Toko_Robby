-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2019 at 02:18 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtoko`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barang_keluar` varchar(16) NOT NULL,
  `barcode` varchar(11) NOT NULL,
  `tanggal_keluar` datetime NOT NULL,
  `jumlah_keluar` int(4) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_barang_keluar`, `barcode`, `tanggal_keluar`, `jumlah_keluar`, `harga`) VALUES
('T-BK-19112600001', 'A003', '2019-11-26 00:00:00', 2, 14500),
('T-BK-19112600002', 'A001', '2019-11-26 00:00:00', 1, 45000),
('T-BK-19112600003', 'A005', '2019-11-26 00:00:00', 4, 75000),
('T-BK-19112700001', 'A002', '2019-11-27 00:00:00', 1, 4500),
('T-BK-19112700002', 'A005', '2019-11-27 00:00:00', 4, 145000),
('T-BK-19112800001', 'A001', '2019-11-28 00:00:00', 1, 45000),
('T-BK-19112800002', 'A001', '2019-11-28 00:00:00', 1, 45000),
('T-BK-19112800003', 'A005', '2019-11-28 00:00:00', 3, 59500),
('T-BK-19112800004', 'A001', '2019-11-28 00:00:00', 1, 45000),
('T-BK-19112800005', 'A001', '2019-11-28 08:12:44', 1, 45000),
('T-BK-19112800006', 'A001', '2019-11-28 14:15:35', 1, 45000),
('T-BK-19112900001', 'A005', '2019-11-29 10:25:11', 3, 65000),
('T-BK-19120400001', 'A001', '2019-12-04 13:34:18', 4, 180000),
('T-BK-19120400002', 'A003', '2019-12-04 15:20:42', 3, 100000),
('T-BK-19120400003', 'B005', '2019-12-04 21:57:33', 4, 70000),
('T-BK-19120400004', 'A003', '2019-12-04 22:33:12', 1, 10000),
('T-BK-19120400005', 'A003', '2019-12-04 22:56:27', 1, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` char(16) NOT NULL,
  `barcode` varchar(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `total_masuk` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barang_masuk`, `barcode`, `supplier_id`, `jumlah_masuk`, `total_masuk`, `tanggal_masuk`) VALUES
('T-BM-19102100001', 'A001', 1, 11, 440000, '2019-10-23'),
('T-BM-19102100002', 'A001', 1, 2, 80000, '2019-10-21'),
('T-BM-19102200004', 'A002', 1, 2, 8000, '2019-10-22'),
('T-BM-19102400002', 'A005', 1, 16, 144000, '2019-10-24'),
('T-BM-19102400003', 'A003', 2, 3, 27000, '2019-10-24'),
('T-BM-19102400004', 'A002', 1, 3, 12000, '2019-10-24'),
('T-BM-19112600001', 'A002', 2, 1, 4000, '2019-11-26'),
('T-BM-19112800001', 'A001', 1, 5, 200000, '2019-11-28'),
('T-BM-19120300001', 'A001', 1, 2, 80000, '2019-12-03'),
('T-BM-19120300002', 'A001', 2, 2, 80000, '2019-12-03'),
('T-BM-19120300003', 'A001', 2, 5, 200000, '2019-12-03'),
('T-BM-19120400001', 'A003', 1, 5000, 45000000, '2019-12-04'),
('T-BM-19120400002', 'B005', 1, 10, 40000, '2019-12-04');

-- --------------------------------------------------------

--
-- Table structure for table `detail_barang_keluar`
--

CREATE TABLE `detail_barang_keluar` (
  `id_barang_keluar_detail` int(11) NOT NULL,
  `id_barang_keluar` varchar(16) NOT NULL,
  `barcode` varchar(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_keluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_barang_keluar`
--

INSERT INTO `detail_barang_keluar` (`id_barang_keluar_detail`, `id_barang_keluar`, `barcode`, `harga`, `jumlah`, `tanggal_keluar`) VALUES
(5, 'T-BK-19112600001', 'A002', 4500, 1, '2019-11-26'),
(6, 'T-BK-19112600001', 'A003', 10000, 1, '2019-11-26'),
(7, 'T-BK-19112600002', 'A001', 45000, 1, '2019-11-26'),
(8, 'T-BK-19112600003', 'A001', 45000, 1, '2019-11-26'),
(9, 'T-BK-19112600003', 'A005', 30000, 3, '2019-11-26'),
(10, 'T-BK-19112700001', 'A002', 4500, 1, '2019-11-27'),
(15, 'T-BK-19112700002', 'A001', 135000, 3, '2019-11-27'),
(17, 'T-BK-19112700002', 'A001', 135000, 3, '2019-11-27'),
(18, 'T-BK-19112700002', 'A005', 10000, 1, '2019-11-27'),
(19, 'T-BK-19112700002', 'A001', 135000, 3, '2019-11-27'),
(21, 'T-BK-19112700003', 'A001', 45000, 1, '2019-11-27'),
(22, 'T-BK-19112800001', 'A001', 45000, 1, '2019-11-28'),
(26, 'T-BK-19112800002', 'A001', 45000, 1, '2019-11-28'),
(27, 'T-BK-19112800003', 'A001', 45000, 1, '2019-11-28'),
(28, 'T-BK-19112800003', 'A002', 4500, 1, '2019-11-28'),
(29, 'T-BK-19112800003', 'A005', 10000, 1, '2019-11-28'),
(30, 'T-BK-19112800004', 'A001', 45000, 1, '2019-11-28'),
(31, 'T-BK-19112800005', 'A001', 45000, 1, '2019-11-28'),
(32, 'T-BK-19112800006', 'A001', 45000, 1, '2019-11-28'),
(33, 'T-BK-19112900001', 'A001', 45000, 1, '2019-11-29'),
(34, 'T-BK-19112900001', 'A005', 20000, 2, '2019-11-29'),
(35, 'T-BK-19120400001', 'A001', 180000, 4, '2019-12-04'),
(36, 'T-BK-19120400002', 'A001', 90000, 2, '2019-12-04'),
(37, 'T-BK-19120400002', 'A003', 10000, 1, '2019-12-04'),
(38, 'T-BK-19120400003', 'A003', 10000, 1, '2019-12-04'),
(39, 'T-BK-19120400003', 'A005', 10000, 1, '2019-12-04'),
(40, 'T-BK-19120400003', 'A001', 45000, 1, '2019-12-04'),
(41, 'T-BK-19120400003', 'B005', 5000, 1, '2019-12-04'),
(42, 'T-BK-19120400004', 'A003', 10000, 1, '2019-12-04'),
(43, 'T-BK-19120400005', 'A003', 10000, 1, '2019-12-04');

-- --------------------------------------------------------

--
-- Table structure for table `p_category`
--

CREATE TABLE `p_category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1 = aktif, 0 = nonaktif'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `p_category`
--

INSERT INTO `p_category` (`category_id`, `name`, `created`, `updated`, `status`) VALUES
(1, 'makanan', '2019-06-11 08:11:34', '2019-06-12 10:19:14', 0),
(2, 'Minuman', '2019-06-12 15:39:01', NULL, 1),
(3, 'press', '2019-10-24 09:41:45', NULL, 1),
(6, 'makanan', '2019-12-04 14:22:09', NULL, 0),
(7, 'makanan', '2019-12-04 14:23:03', NULL, 0),
(8, 'robot', '2019-12-04 14:25:40', NULL, 1),
(9, 'makanan', '2019-12-04 14:26:47', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `p_item`
--

CREATE TABLE `p_item` (
  `item_id` int(11) NOT NULL,
  `barcode` varchar(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `price_in` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `stock` int(10) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `p_item`
--

INSERT INTO `p_item` (`item_id`, `barcode`, `name`, `category_id`, `unit_id`, `price_in`, `price`, `stock`, `created`, `updated`) VALUES
(4, 'A001', 'Fanta Strawbery', 2, 3, 40000, 45000, 11, '2019-06-19 10:42:44', '2019-07-02 01:21:56'),
(3, 'A002', 'Sprite Lemon', 2, 3, 4000, 4500, 4, '2019-06-12 15:39:28', '2019-10-09 16:29:50'),
(5, 'A003', 'Plastik', 1, 2, 9000, 10000, 4999, '2019-10-09 21:28:52', '2019-10-18 09:07:51'),
(6, 'A005', 'Mangga', 1, 2, 9000, 10000, 4, '2019-10-24 09:06:28', NULL),
(7, 'B005', 'plastik', 3, 5, 4000, 5000, 9, '2019-12-03 19:45:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `p_unit`
--

CREATE TABLE `p_unit` (
  `unit_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `p_unit`
--

INSERT INTO `p_unit` (`unit_id`, `name`, `created`, `updated`) VALUES
(1, 'Buah', '2019-06-11 08:11:34', '2019-10-13 11:02:48'),
(2, 'Kilogram', '2019-06-11 13:50:04', NULL),
(3, 'Liter', '2019-06-12 15:38:26', NULL),
(5, 'pack', '2019-10-13 16:24:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `phone`, `address`, `description`, `created`, `updated`) VALUES
(1, 'Toko A', '0897654321', 'Situbondo', 'Toko ', '2019-06-10 10:33:45', '2019-12-03 14:40:05'),
(2, 'Toko B', '0899887766', 'Probolinggo', 'Toko Dari Surabaya', '2019-06-10 10:33:45', '2019-12-04 08:51:35'),
(4, 'Toko C', '07454523', 'Malang Batu', 'Toko Kualitas Bagus', '2019-06-10 12:04:03', '2019-06-10 07:48:19'),
(6, 'Toko D', '089685620284', 'Jalan mastrip 4 kecamatan sumber sari, kabupaten jember', 'eqrqt', '2019-12-04 15:11:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `level` int(1) NOT NULL COMMENT '1:admin, 2:kasir'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `name`, `address`, `level`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Willian Refky', 'Situbondo', 1),
(2, 'kasir1', '874c0ac75f323057fe3b7fb3f5a8a41df2b94b1d', 'steven1', 'surabaya', 2),
(4, 'admin1', '8cb2237d0679ca88db6464eac60da96345513964', 'alvian', 'situbondo', 1),
(5, 'kasir2', '08dfc5f04f9704943a423ea5732b98d3567cbd49', 'rosi', 'jombang', 2),
(6, 'wafff', '8cb2237d0679ca88db6464eac60da96345513964', 'waff yess', 'jember', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_barang_keluar`),
  ADD KEY `barcode` (`barcode`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`),
  ADD KEY `barcode` (`barcode`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `detail_barang_keluar`
--
ALTER TABLE `detail_barang_keluar`
  ADD PRIMARY KEY (`id_barang_keluar_detail`);

--
-- Indexes for table `p_category`
--
ALTER TABLE `p_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `p_item`
--
ALTER TABLE `p_item`
  ADD PRIMARY KEY (`barcode`) USING BTREE,
  ADD UNIQUE KEY `item_id` (`item_id`) USING BTREE,
  ADD KEY `category_id` (`category_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `item_id_2` (`item_id`) USING BTREE,
  ADD KEY `item_id_3` (`item_id`);

--
-- Indexes for table `p_unit`
--
ALTER TABLE `p_unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_barang_keluar`
--
ALTER TABLE `detail_barang_keluar`
  MODIFY `id_barang_keluar_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `p_category`
--
ALTER TABLE `p_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `p_item`
--
ALTER TABLE `p_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `p_unit`
--
ALTER TABLE `p_unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`barcode`) REFERENCES `p_item` (`barcode`);

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`barcode`) REFERENCES `p_item` (`barcode`);

--
-- Constraints for table `p_item`
--
ALTER TABLE `p_item`
  ADD CONSTRAINT `p_item_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `p_category` (`category_id`),
  ADD CONSTRAINT `p_item_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `p_unit` (`unit_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
