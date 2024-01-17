-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 09:07 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaand`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `BukuID` int(11) NOT NULL,
  `Judul` varchar(255) NOT NULL,
  `Pengarang` varchar(255) DEFAULT NULL,
  `TahunTerbit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`BukuID`, `Judul`, `Pengarang`, `TahunTerbit`) VALUES
(1, 'IMK', 'Rudi Hartono', 2023),
(2, 'Jaringan Komputer', 'Jajang Nurwahid', 2020),
(3, 'Bahasa C', 'Deden Komarudin', 2021),
(4, 'Pemograman Internet', 'Teguh Ashoy', 2001),
(5, 'Basis Data', 'Manan Joki', 2022),
(6, 'ABC', 'Deni', 2018);

-- --------------------------------------------------------

--
-- Table structure for table `detailpeminjaman`
--

CREATE TABLE `detailpeminjaman` (
  `DetailID` int(11) NOT NULL,
  `peminjamanID` int(11) DEFAULT NULL,
  `BukuID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailpeminjaman`
--

INSERT INTO `detailpeminjaman` (`DetailID`, `peminjamanID`, `BukuID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 4),
(5, 4, 5),
(7, 9, 6),
(8, 9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `peminjam`
--

CREATE TABLE `peminjam` (
  `PeminjamID` int(11) NOT NULL,
  `NamaPeminjam` varchar(255) NOT NULL,
  `Alamat` varchar(255) DEFAULT NULL,
  `NoTelepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjam`
--

INSERT INTO `peminjam` (`PeminjamID`, `NamaPeminjam`, `Alamat`, `NoTelepon`) VALUES
(1, 'Harley', 'Jl. Contoh No. 123', '08123456789'),
(2, 'Alucrad', 'Jl. Samping No. 456', '08234567890'),
(3, 'Zilong', 'Jl. Belakang No. 789', '08345678901'),
(4, 'Estes', 'Jl. Depan No. 012', '08456789012'),
(5, 'Eudora', 'Jl. Tengah No. 345', '08567890123'),
(6, 'nur', 'ciamis', '089123123123');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `PeminjamanID` int(11) NOT NULL,
  `PeminjamID` int(11) DEFAULT NULL,
  `TanggalPinjam` date DEFAULT NULL,
  `TanggalKembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`PeminjamanID`, `PeminjamID`, `TanggalPinjam`, `TanggalKembali`) VALUES
(1, 1, '2023-01-01', '2023-01-10'),
(2, 2, '2023-02-05', '2023-02-15'),
(3, 3, '2023-03-10', '2023-03-20'),
(4, 4, '2023-04-15', '2023-04-25'),
(5, 5, '2023-05-20', '2023-05-30'),
(9, 6, '2024-01-01', '2024-01-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`BukuID`);

--
-- Indexes for table `detailpeminjaman`
--
ALTER TABLE `detailpeminjaman`
  ADD PRIMARY KEY (`DetailID`),
  ADD KEY `peminjamanID` (`peminjamanID`),
  ADD KEY `BukuID` (`BukuID`);

--
-- Indexes for table `peminjam`
--
ALTER TABLE `peminjam`
  ADD PRIMARY KEY (`PeminjamID`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`PeminjamanID`),
  ADD KEY `PeminjamID` (`PeminjamID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `BukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `detailpeminjaman`
--
ALTER TABLE `detailpeminjaman`
  MODIFY `DetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `peminjam`
--
ALTER TABLE `peminjam`
  MODIFY `PeminjamID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `PeminjamanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailpeminjaman`
--
ALTER TABLE `detailpeminjaman`
  ADD CONSTRAINT `detailpeminjaman_ibfk_1` FOREIGN KEY (`peminjamanID`) REFERENCES `peminjaman` (`PeminjamanID`),
  ADD CONSTRAINT `detailpeminjaman_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`PeminjamID`) REFERENCES `peminjam` (`PeminjamID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
