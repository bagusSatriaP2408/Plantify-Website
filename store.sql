-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2023 at 04:12 PM
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
-- Database: `store`
--
CREATE DATABASE IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `store`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('jony1234', 'aa28566c61142bb9856d6c967ef6d80ecc490cabd95d1015be9b04e07591acd0'),
('jony12345', 'aa28566c61142bb9856d6c967ef6d80ecc490cabd95d1015be9b04e07591acd0');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id_bank` int(11) NOT NULL,
  `nama_bank` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `username` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telepon` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`username`, `password`, `nama`, `no_telepon`, `alamat`) VALUES
('jony1234', 'aa28566c61142bb9856d6c967ef6d80ecc490cabd95d1015be9b04e07591acd0', 'bagus', '123456789101', 'benjeng');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `keranjang_detail`
--

CREATE TABLE `keranjang_detail` (
  `id_keranjang_detail` int(11) NOT NULL,
  `id_keranjang` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `manajer`
--

CREATE TABLE `manajer` (
  `username` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `manajer`
--

INSERT INTO `manajer` (`username`, `password`) VALUES
('jony1234', 'aa28566c61142bb9856d6c967ef6d80ecc490cabd95d1015be9b04e07591acd0');

-- --------------------------------------------------------

--
-- Table structure for table `metode_pembayaran`
--

CREATE TABLE `metode_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_bank` int(11) NOT NULL,
  `no_rekening` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `metode_pengiriman`
--

CREATE TABLE `metode_pengiriman` (
  `id_pengiriman` int(11) NOT NULL,
  `nama_ekspedisi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id_order` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `total_order` int(11) NOT NULL,
  `id_pembayaran` int(11) NOT NULL,
  `id_pengiriman` int(11) NOT NULL,
  `tanggal_order` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_order_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id_order_detail` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah_produk` int(11) NOT NULL,
  `harga_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id_order_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `stok_produk` int(11) NOT NULL,
  `gambar_produk` varchar(100) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id_bank`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `FK_Menambahkan` (`username`);

--
-- Indexes for table `keranjang_detail`
--
ALTER TABLE `keranjang_detail`
  ADD PRIMARY KEY (`id_keranjang_detail`),
  ADD KEY `FK_keranjang_memiliki` (`id_keranjang`),
  ADD KEY `FK_menambahkan_produk` (`id_produk`);

--
-- Indexes for table `manajer`
--
ALTER TABLE `manajer`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `FK_bank` (`id_bank`);

--
-- Indexes for table `metode_pengiriman`
--
ALTER TABLE `metode_pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `FK_bayar` (`id_pembayaran`),
  ADD KEY `FK_pengiriman` (`id_pengiriman`),
  ADD KEY `FK_status` (`id_order_status`),
  ADD KEY `FK_pesan` (`username`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id_order_detail`),
  ADD KEY `FK_memiliki_order` (`id_order`),
  ADD KEY `FK_pesan_produk` (`id_produk`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id_order_status`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `FK_supply` (`id_supplier`),
  ADD KEY `FK_memiliki_kategori` (`id_kategori`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id_bank` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keranjang_detail`
--
ALTER TABLE `keranjang_detail`
  MODIFY `id_keranjang_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metode_pengiriman`
--
ALTER TABLE `metode_pengiriman`
  MODIFY `id_pengiriman` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id_order_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id_order_status` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `FK_Menambahkan` FOREIGN KEY (`username`) REFERENCES `customer` (`username`);

--
-- Constraints for table `keranjang_detail`
--
ALTER TABLE `keranjang_detail`
  ADD CONSTRAINT `FK_keranjang_memiliki` FOREIGN KEY (`id_keranjang`) REFERENCES `keranjang` (`id_keranjang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_menambahkan_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  ADD CONSTRAINT `FK_bank` FOREIGN KEY (`id_bank`) REFERENCES `bank` (`id_bank`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_bayar` FOREIGN KEY (`id_pembayaran`) REFERENCES `metode_pembayaran` (`id_pembayaran`),
  ADD CONSTRAINT `FK_pengiriman` FOREIGN KEY (`id_pengiriman`) REFERENCES `metode_pengiriman` (`id_pengiriman`),
  ADD CONSTRAINT `FK_pesan` FOREIGN KEY (`username`) REFERENCES `customer` (`username`),
  ADD CONSTRAINT `FK_status` FOREIGN KEY (`id_order_status`) REFERENCES `order_status` (`id_order_status`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK_memiliki_order` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`),
  ADD CONSTRAINT `FK_pesan_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `FK_memiliki_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  ADD CONSTRAINT `FK_supply` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
