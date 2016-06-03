-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 02 Jun 2016 pada 00.42
-- Versi Server: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bioskop88`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bangku`
--

CREATE TABLE IF NOT EXISTS `bangku` (
  `id_bangku` int(5) NOT NULL,
  `bangku` varchar(15) NOT NULL,
  `Id_studio` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `film`
--

CREATE TABLE IF NOT EXISTS `film` (
  `id_Film` varchar(15) NOT NULL,
  `Nama_Film` varchar(30) NOT NULL,
  `Status_film` varchar(15) NOT NULL,
  `description` text NOT NULL,
  `durasi` int(5) NOT NULL,
  `Bintang film` varchar(50) NOT NULL,
  `Aliran_film` varchar(30) NOT NULL,
  `Producer` varchar(35) NOT NULL,
  `Produksi` varchar(40) NOT NULL,
  `Sutradara` varchar(40) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `list_id_jam` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `film`
--

INSERT INTO `film` (`id_Film`, `Nama_Film`, `Status_film`, `description`, `durasi`, `Bintang film`, `Aliran_film`, `Producer`, `Produksi`, `Sutradara`, `Location`, `list_id_jam`) VALUES
('fm001', 'Angry Birds the Movie', 'PLAY', 'Lorem ipsum dolor sit amet bla bla bla. Lorem bla dolor bla ipsum. Ipsum, bla, dolor, amet. Sit amet lorem lorem bla dolor. ', 102, '', '', '', '', '', '', '1,4,7'),
('fm002', 'My Stupid Boss', 'COMSOON', 'Lorem ipsum dolor sit amet bla bla bla. Lorem bla dolor bla ipsum. Ipsum, bla, dolor, amet. Sit amet lorem lorem bla dolor. ', 113, '', '', '', '', '', '', '2,5,8');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam`
--

CREATE TABLE IF NOT EXISTS `jam` (
  `Id_jam` int(10) NOT NULL,
  `Jam` varchar(15) NOT NULL,
  `Id_studio` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `jam`
--

INSERT INTO `jam` (`Id_jam`, `Jam`, `Id_studio`) VALUES
(1, '12.05', 'std1'),
(2, '12.30', 'std2'),
(3, '12.15', 'std3'),
(4, '14.30', 'std1'),
(5, '15.00', 'std2'),
(6, '14.15', 'std3'),
(7, '16.30', 'std1'),
(8, '17.05', 'std2'),
(9, '17.30', 'std3'),
(10, '19.30', 'std1'),
(11, '19.45', 'std2'),
(12, '20.15', 'std3'),
(13, '22.15', 'std1'),
(14, '22.30', 'std2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel pembayaran`
--

CREATE TABLE IF NOT EXISTS `tabel pembayaran` (
  `id_pembayaran` int(5) NOT NULL,
  `Pembayaran` varchar(15) NOT NULL,
  `id_Booking` varchar(15) NOT NULL,
  `Id_film` varchar(15) NOT NULL,
  `Id_Bangku` varchar(20) NOT NULL,
  `Id_studio` varchar(10) NOT NULL,
  `Jam_pesan` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `table admin`
--

CREATE TABLE IF NOT EXISTS `table admin` (
  `Id` int(10) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `table booking`
--

CREATE TABLE IF NOT EXISTS `table booking` (
  `id_booking` varchar(15) NOT NULL,
  `Id_film` varchar(15) NOT NULL,
  `Id_user` int(5) NOT NULL,
  `Id_bangku` int(5) NOT NULL,
  `Id_pembayaran` int(5) NOT NULL,
  `Jam_pesan` varchar(10) NOT NULL,
  `Jam_konfirm` varchar(10) NOT NULL,
  `Status_konfirm` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `table studio`
--

CREATE TABLE IF NOT EXISTS `table studio` (
  `Id_Studio` varchar(5) NOT NULL,
  `Studio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `table studio`
--

INSERT INTO `table studio` (`Id_Studio`, `Studio`) VALUES
('std1', 'Studio 1'),
('std2', 'Studio 2'),
('std3', 'Studio 3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `table user`
--

CREATE TABLE IF NOT EXISTS `table user` (
  `id_User` int(5) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `No_hp` varchar(0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bangku`
--
ALTER TABLE `bangku`
  ADD PRIMARY KEY (`id_bangku`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_Film`);

--
-- Indexes for table `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`Id_jam`);

--
-- Indexes for table `tabel pembayaran`
--
ALTER TABLE `tabel pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`,`id_Booking`,`Id_film`,`Id_Bangku`,`Id_studio`);

--
-- Indexes for table `table admin`
--
ALTER TABLE `table admin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `table booking`
--
ALTER TABLE `table booking`
  ADD PRIMARY KEY (`id_booking`), ADD KEY `Id_user` (`Id_user`,`Id_bangku`,`Id_pembayaran`,`Jam_pesan`), ADD KEY `Id_film` (`Id_film`), ADD KEY `Jam_pesan` (`Jam_pesan`), ADD KEY `Jam_pesan_2` (`Jam_pesan`);

--
-- Indexes for table `table studio`
--
ALTER TABLE `table studio`
  ADD PRIMARY KEY (`Id_Studio`);

--
-- Indexes for table `table user`
--
ALTER TABLE `table user`
  ADD PRIMARY KEY (`id_User`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bangku`
--
ALTER TABLE `bangku`
  MODIFY `id_bangku` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jam`
--
ALTER TABLE `jam`
  MODIFY `Id_jam` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tabel pembayaran`
--
ALTER TABLE `tabel pembayaran`
  MODIFY `id_pembayaran` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `table admin`
--
ALTER TABLE `table admin`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `table user`
--
ALTER TABLE `table user`
  MODIFY `id_User` int(5) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
