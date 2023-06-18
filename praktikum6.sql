-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Jun 2023 pada 16.51
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `praktikum6`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--

CREATE TABLE `departemen` (
  `id_dept` varchar(10) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `id_p` varchar(10) NOT NULL,
  `manajer_nik` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `departemen`
--

INSERT INTO `departemen` (`id_dept`, `nama`, `id_p`, `manajer_nik`) VALUES
('D01', 'Produksi', 'P02', 'N01'),
('D02', 'Marketing', 'P01', 'N03'),
('D03', 'RnD', 'P02', NULL),
('D04', 'Logistik', 'P02', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `nik` varchar(10) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `id_dept` varchar(10) NOT NULL,
  `sup_nik` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`nik`, `nama`, `id_dept`, `sup_nik`) VALUES
('N01', 'Ari', 'D01', NULL),
('N02', 'Dina', 'D01', NULL),
('N03', 'Rika', 'D03', NULL),
('N04', 'Ratih', 'D01', 'N01'),
('N05', 'Riko', 'D01', 'N01'),
('N06', 'Dani', 'D02', NULL),
('N07', 'Anis', 'D02', 'N06'),
('N08', 'Dika', 'D02', 'N06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id_p` varchar(10) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `alamat` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `perusahaan`
--

INSERT INTO `perusahaan` (`id_p`, `nama`, `alamat`) VALUES
('P01', 'Kantor Pusat', NULL),
('P02', 'Cabang Bekasi', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `project`
--

CREATE TABLE `project` (
  `id_proj` varchar(10) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `tgl_mulai` datetime DEFAULT NULL,
  `tgl_selesai` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `project`
--

INSERT INTO `project` (`id_proj`, `nama`, `tgl_mulai`, `tgl_selesai`, `status`) VALUES
('PJ01', 'A', '2019-01-10 00:00:00', '2019-03-10 00:00:00', 1),
('PJ02', 'B', '2019-02-15 00:00:00', '2019-04-10 00:00:00', 1),
('PJ03', 'C', '2019-03-21 00:00:00', '2019-05-10 00:00:00', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `project_detail`
--

CREATE TABLE `project_detail` (
  `id_proj` varchar(10) NOT NULL,
  `nik` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `project_detail`
--

INSERT INTO `project_detail` (`id_proj`, `nik`) VALUES
('PJ01', 'N01'),
('PJ01', 'N02'),
('PJ01', 'N03'),
('PJ01', 'N04'),
('PJ01', 'N05'),
('PJ01', 'N07'),
('PJ01', 'N08'),
('PJ02', 'N01'),
('PJ02', 'N03'),
('PJ02', 'N05'),
('PJ03', 'N03'),
('PJ03', 'N07'),
('PJ03', 'N08');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id_dept`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id_p`);

--
-- Indeks untuk tabel `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id_proj`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
