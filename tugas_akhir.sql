-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2021 at 04:46 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_akhir`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_anggota`
--

CREATE TABLE `daftar_anggota` (
  `ID_PELAMAR` decimal(11,0) NOT NULL,
  `NAMA_DEPAN` varchar(32) DEFAULT NULL,
  `NAMA_BELAKANG` varchar(32) DEFAULT NULL,
  `TEMPAT_LAHIR` varchar(32) DEFAULT NULL,
  `TANGGAL_LAHIR` date NOT NULL,
  `ALAMAT_EMAIL` varchar(32) NOT NULL,
  `PASSWORD_ANGGOTA` varchar(32) NOT NULL,
  `NOMER_TELEPON` int(32) NOT NULL,
  `ALAMAT_LENGKAP` varchar(32) NOT NULL,
  `ID_FOTO` int(32) NOT NULL,
  `FOTO_DATA_DIRI` varchar(100) NOT NULL,
  `JENIS_KELAMIN` enum('laki-laki','perempuan') NOT NULL,
  `PENDIDIKAN_TERAKHIR` enum('SMA','D3','D4','S1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `daftar_perusahaan`
--

CREATE TABLE `daftar_perusahaan` (
  `ID_PERUSAHAAN_` decimal(11,0) NOT NULL,
  `NAMA_PERUSAHAAN` varchar(32) DEFAULT NULL,
  `EMAIL_PERUSAHAAN` varchar(32) DEFAULT NULL,
  `PASSWORD_PERUSAHAAN` varchar(32) DEFAULT NULL,
  `JENIS_USAHA` varchar(32) DEFAULT NULL,
  `NOMER_TELEPON` int(14) DEFAULT NULL,
  `ALAMAT` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `form_lamaran`
--

CREATE TABLE `form_lamaran` (
  `NAMA_LENGKAP` char(32) NOT NULL,
  `ID_LOWONGAN` decimal(11,0) DEFAULT NULL,
  `ID_PELAMAR` decimal(11,0) DEFAULT NULL,
  `TEMPAT_LAHIR` varchar(32) DEFAULT NULL,
  `TANGGAL_LAHIR` date NOT NULL,
  `EMAIL_PELAMAR` varchar(32) DEFAULT NULL,
  `NO_TELP` int(14) DEFAULT NULL,
  `POSISI_PEKERJAA` varchar(32) DEFAULT NULL,
  `ALAMAT_LENGKAP` varchar(32) DEFAULT NULL,
  `ID_FOTO_CV` int(32) NOT NULL,
  `UPLOAD_CV` varchar(32) DEFAULT NULL,
  `ID_FOTO` int(32) NOT NULL,
  `UPLOAD_PHOTO` varchar(32) DEFAULT NULL,
  `ID_FOTO_IJAZAH` int(32) NOT NULL,
  `UPLOAD_IJAZAH` varchar(32) DEFAULT NULL,
  `JENIS_KELAMIN` enum('laki-laki','perempuan') DEFAULT NULL,
  `PENDIDIKAN_TERAKHIR` enum('SMA','D3','D4','S1','S2','S3') DEFAULT NULL,
  `AGAMA` enum('ISLAM','KRISTEN','KATHOLIK','HINDHU','BUDHA','KONGHUCU') NOT NULL,
  `TANGGAL_LAMAR` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `DITERIMA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lowongan`
--

CREATE TABLE `lowongan` (
  `ID_LOWONGAN` decimal(11,0) NOT NULL,
  `ID_PERUSAHAAN_` decimal(11,0) DEFAULT NULL,
  `POSISI` char(32) DEFAULT NULL,
  `KET_LOWONGAN` char(32) DEFAULT NULL,
  `TGL_PASANG` date DEFAULT NULL,
  `UMUR_MAX` int(11) DEFAULT NULL,
  `UMUR_MIN` int(11) DEFAULT NULL,
  `GAJI` int(11) DEFAULT NULL,
  `SYARAT` varchar(64) DEFAULT NULL,
  `PENDIDIKAN` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_anggota`
--
ALTER TABLE `daftar_anggota`	
  ADD PRIMARY KEY (`ID_PELAMAR`);

--
-- Indexes for table `daftar_perusahaan`
--
ALTER TABLE `daftar_perusahaan`
  ADD PRIMARY KEY (`ID_PERUSAHAAN_`);

--
-- Indexes for table `form_lamaran`
--
ALTER TABLE `form_lamaran`
  ADD PRIMARY KEY (`NAMA_LENGKAP`),
  ADD KEY `FK_MELAMAR` (`ID_LOWONGAN`),
  ADD KEY `FK_MEMBUAT` (`ID_PELAMAR`);

--
-- Indexes for table `lowongan`
--
ALTER TABLE `lowongan`
  ADD PRIMARY KEY (`ID_LOWONGAN`),
  ADD KEY `FK_MEMBUKA` (`ID_PERUSAHAAN_`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `form_lamaran`
--
ALTER TABLE `form_lamaran`
  ADD CONSTRAINT `FK_MELAMAR` FOREIGN KEY (`ID_LOWONGAN`) REFERENCES `lowongan` (`ID_LOWONGAN`),
  ADD CONSTRAINT `FK_MEMBUAT` FOREIGN KEY (`ID_PELAMAR`) REFERENCES `daftar_anggota` (`ID_PELAMAR`);

--
-- Constraints for table `lowongan`
--
ALTER TABLE `lowongan`
  ADD CONSTRAINT `FK_MEMBUKA` FOREIGN KEY (`ID_PERUSAHAAN_`) REFERENCES `daftar_perusahaan` (`ID_PERUSAHAAN_`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
