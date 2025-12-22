-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2025 at 07:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_noproverty`
--

-- --------------------------------------------------------

--
-- Table structure for table `bantuan_sosial`
--

CREATE TABLE `bantuan_sosial` (
  `id_bantuan_sosial` int(11) NOT NULL,
  `nama_program` varchar(45) DEFAULT NULL,
  `kriteria_penerima` varchar(50) DEFAULT NULL,
  `kategori_bansos` varchar(45) DEFAULT NULL,
  `alokasi_dana` varchar(50) DEFAULT NULL,
  `pemerintah_id_pemerintah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lembaga_pelatihan`
--

CREATE TABLE `lembaga_pelatihan` (
  `id_lembaga_pelatihan` int(11) NOT NULL,
  `nama_lembaga` varchar(45) DEFAULT NULL,
  `jenis_lembaga` varchar(45) DEFAULT NULL,
  `kontak_email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lowongan_kerja`
--

CREATE TABLE `lowongan_kerja` (
  `id_lowongan_kerja` int(11) NOT NULL,
  `judul_lowongan` varchar(45) DEFAULT NULL,
  `deskripsi_pekerjaan` varchar(50) DEFAULT NULL,
  `kategori_pekerjaan` varchar(45) DEFAULT NULL,
  `estimasi_gaji` varchar(45) DEFAULT NULL,
  `lokasi` tinytext DEFAULT NULL,
  `tanggal_tutup` datetime(6) DEFAULT NULL,
  `perusahaan_umkm_id_umkm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notifikasi` int(11) NOT NULL,
  `judul` varchar(45) DEFAULT NULL,
  `isi` varchar(45) DEFAULT NULL,
  `tanggal` datetime(6) DEFAULT NULL,
  `jenis` varchar(45) DEFAULT NULL,
  `status_baca` varchar(45) DEFAULT NULL,
  `user_id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelatihan`
--

CREATE TABLE `pelatihan` (
  `id_pelatihan` int(11) NOT NULL,
  `judul_pelatihan` varchar(45) DEFAULT NULL,
  `materi` varchar(200) DEFAULT NULL,
  `durasi` time DEFAULT NULL,
  `jadwal` datetime(6) DEFAULT NULL,
  `link_akses` varchar(100) DEFAULT NULL,
  `kategori_pelatihan` varchar(45) DEFAULT NULL,
  `laporan_hasil_pelatihan` varchar(45) DEFAULT NULL,
  `user_id_user` int(11) NOT NULL,
  `lembaga_pelatihan_id_lembaga_pelatihan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemerintah`
--

CREATE TABLE `pemerintah` (
  `id_pemerintah` int(11) NOT NULL,
  `nama_instansi` varchar(45) DEFAULT NULL,
  `alamat_instansi` text DEFAULT NULL,
  `kontak_telepon` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id_pendaftaran` int(11) NOT NULL,
  `user_id_user` int(11) NOT NULL,
  `lowongan_kerja_id_lowongan_kerja` int(11) NOT NULL,
  `hasil_seleksi` varchar(45) DEFAULT NULL,
  `status_lamaran` varchar(45) DEFAULT NULL,
  `tanggal_melamar` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penerimaan`
--

CREATE TABLE `penerimaan` (
  `user_id_user` int(11) NOT NULL,
  `bantuan_sosial_id_bantuan_sosial` int(11) NOT NULL,
  `tanggal_mulai` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan_umkm`
--

CREATE TABLE `perusahaan_umkm` (
  `id_umkm` int(11) NOT NULL,
  `bidang_usaha` varchar(45) DEFAULT NULL,
  `kontak` varchar(45) DEFAULT NULL,
  `nama_usaha` varchar(45) DEFAULT NULL,
  `alamat_usaha` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `kategori` varchar(45) DEFAULT NULL,
  `stok` varchar(45) DEFAULT NULL,
  `deskripsi` varchar(50) DEFAULT NULL,
  `harga` varchar(45) DEFAULT NULL,
  `nama_produk` varchar(45) DEFAULT NULL,
  `foto_produk` varchar(200) DEFAULT NULL,
  `perusahaan_umkm_id_umkm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `nama_lengkap` varchar(50) DEFAULT NULL,
  `pendidikan_terakhir` varchar(45) DEFAULT NULL,
  `nik` varchar(45) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('p','l') DEFAULT NULL,
  `file_ktp` varchar(200) DEFAULT NULL,
  `file_sktm` varchar(200) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `file_kk` varchar(200) DEFAULT NULL,
  `role` enum('admin','masyarakat') DEFAULT NULL,
  `penghasilan` varchar(45) DEFAULT NULL,
  `status_kemiskinan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bantuan_sosial`
--
ALTER TABLE `bantuan_sosial`
  ADD PRIMARY KEY (`id_bantuan_sosial`,`pemerintah_id_pemerintah`),
  ADD KEY `fk_bantuan_sosial_pemerintah1_idx` (`pemerintah_id_pemerintah`);

--
-- Indexes for table `lembaga_pelatihan`
--
ALTER TABLE `lembaga_pelatihan`
  ADD PRIMARY KEY (`id_lembaga_pelatihan`);

--
-- Indexes for table `lowongan_kerja`
--
ALTER TABLE `lowongan_kerja`
  ADD PRIMARY KEY (`id_lowongan_kerja`,`perusahaan_umkm_id_umkm`),
  ADD KEY `fk_lowongan_kerja_perusahaan_umkm1_idx` (`perusahaan_umkm_id_umkm`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`,`user_id_user`),
  ADD KEY `fk_notifikasi_user1_idx` (`user_id_user`);

--
-- Indexes for table `pelatihan`
--
ALTER TABLE `pelatihan`
  ADD PRIMARY KEY (`id_pelatihan`,`user_id_user`,`lembaga_pelatihan_id_lembaga_pelatihan`),
  ADD KEY `fk_pelatihan_user1_idx` (`user_id_user`),
  ADD KEY `fk_pelatihan_lembaga_pelatihan1_idx` (`lembaga_pelatihan_id_lembaga_pelatihan`);

--
-- Indexes for table `pemerintah`
--
ALTER TABLE `pemerintah`
  ADD PRIMARY KEY (`id_pemerintah`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id_pendaftaran`,`user_id_user`,`lowongan_kerja_id_lowongan_kerja`),
  ADD KEY `fk_user_has_lowongan_kerja_lowongan_kerja1_idx` (`lowongan_kerja_id_lowongan_kerja`),
  ADD KEY `fk_user_has_lowongan_kerja_user1_idx` (`user_id_user`);

--
-- Indexes for table `penerimaan`
--
ALTER TABLE `penerimaan`
  ADD PRIMARY KEY (`user_id_user`,`bantuan_sosial_id_bantuan_sosial`),
  ADD KEY `fk_user_has_bantuan_sosial_bantuan_sosial1_idx` (`bantuan_sosial_id_bantuan_sosial`),
  ADD KEY `fk_user_has_bantuan_sosial_user1_idx` (`user_id_user`);

--
-- Indexes for table `perusahaan_umkm`
--
ALTER TABLE `perusahaan_umkm`
  ADD PRIMARY KEY (`id_umkm`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`,`perusahaan_umkm_id_umkm`),
  ADD KEY `fk_produk_perusahaan_umkm1_idx` (`perusahaan_umkm_id_umkm`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bantuan_sosial`
--
ALTER TABLE `bantuan_sosial`
  ADD CONSTRAINT `fk_bantuan_sosial_pemerintah1` FOREIGN KEY (`pemerintah_id_pemerintah`) REFERENCES `pemerintah` (`id_pemerintah`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lowongan_kerja`
--
ALTER TABLE `lowongan_kerja`
  ADD CONSTRAINT `fk_lowongan_kerja_perusahaan_umkm1` FOREIGN KEY (`perusahaan_umkm_id_umkm`) REFERENCES `perusahaan_umkm` (`id_umkm`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `fk_notifikasi_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pelatihan`
--
ALTER TABLE `pelatihan`
  ADD CONSTRAINT `fk_pelatihan_lembaga_pelatihan1` FOREIGN KEY (`lembaga_pelatihan_id_lembaga_pelatihan`) REFERENCES `lembaga_pelatihan` (`id_lembaga_pelatihan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pelatihan_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `fk_user_has_lowongan_kerja_lowongan_kerja1` FOREIGN KEY (`lowongan_kerja_id_lowongan_kerja`) REFERENCES `lowongan_kerja` (`id_lowongan_kerja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_lowongan_kerja_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `penerimaan`
--
ALTER TABLE `penerimaan`
  ADD CONSTRAINT `fk_user_has_bantuan_sosial_bantuan_sosial1` FOREIGN KEY (`bantuan_sosial_id_bantuan_sosial`) REFERENCES `bantuan_sosial` (`id_bantuan_sosial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_bantuan_sosial_user1` FOREIGN KEY (`user_id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `fk_produk_perusahaan_umkm1` FOREIGN KEY (`perusahaan_umkm_id_umkm`) REFERENCES `perusahaan_umkm` (`id_umkm`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
