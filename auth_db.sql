-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2023 at 01:31 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auth_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE `agenda` (
  `id` int(11) NOT NULL,
  `id_agenda` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `waktu` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `aktif` int(1) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agenda`
--

INSERT INTO `agenda` (`id`, `id_agenda`, `judul`, `waktu`, `lokasi`, `aktif`, `gambar`, `createdAt`, `updatedAt`) VALUES
(2, 'f609ebc6-247b-4de3-816b-5ff09e0c3fa7', 'Pemberitahuan Kerja Bakti Bersama Masyarakat', '15 April 2023 Pukul 07.00', 'Lapangan Desa XYZ', 1, NULL, '2023-04-04 21:55:20', '2023-05-08 10:42:31'),
(3, 'efdd6c5d-3948-4d14-bfd6-630be238ded8', 'Pemberitahuan Penyelenggaraan Acara Bakti Sosial', '10 April 2023', 'Halaman Kantor Desa', 1, NULL, '2023-04-04 21:56:18', '2023-05-08 11:53:53'),
(5, '02728bfc-6a6b-41c4-8000-34239c3791f2', 'Bersih bersih member updated', 'Tanggal 20 April 2023 updated', 'Balai Desa Kepuhrubuh updated', 1, NULL, '2023-04-23 20:06:41', '2023-05-08 11:53:53'),
(6, 'b5a1a0bd-9098-4ea5-9386-97e126bf1084', 'Judul Agenda 4', 'Tanggal 23 Maret jam 08:00 - Selesai', 'Balai Desa Kepubrubuh 4', 1, NULL, '2023-05-02 20:31:40', '2023-05-08 11:53:54'),
(7, '07415c44-aa1e-4276-9333-8d009f2bcc34', 'Judul Agenda 5', 'Tanggal 23 Maret jam 08:00 - Selesai', 'Balai Desa Kepubrubuh 5', 1, NULL, '2023-05-02 20:31:49', '2023-05-08 11:53:55'),
(8, 'c8a7ed90-d659-4f00-b5e7-0e546583bf54', 'Judul Agenda 6', 'Tanggal 23 Maret jam 08:00 - Selesai', 'Balai Desa Kepubrubuh 6', 0, NULL, '2023-05-02 20:31:56', '2023-05-02 20:31:56');

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `id_artikel` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `aktif` int(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id`, `id_artikel`, `userId`, `judul`, `isi`, `gambar`, `url`, `aktif`, `createdAt`, `updatedAt`) VALUES
(3, 'cff5c34f-8b1a-4827-bfd6-af3f6810fe3a', 1, 'Alur Pembuatan KTP', 'What is Lorem Ipsum?\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n\r\nWhere does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 'c86229bf39b22981b7b341264d6c36a4.png', 'http://localhost:5000/images/c86229bf39b22981b7b341264d6c36a4.png', 1, '2023-03-31 17:33:24', '2023-05-08 17:11:28'),
(17, 'f8c204b6-b4e5-42b9-96c9-cdcadd80bbdd', 1, 'Mengenal Potensi Desa Kepuhrubuh', '<h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><br>&nbsp;</p><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 'a85bcacd5e39123e7136ee9b26271082-1683114812976.jpg', 'http://localhost:5000/images/a85bcacd5e39123e7136ee9b26271082-1683114812976.jpg', 1, '2023-05-03 18:53:33', '2023-05-08 17:11:29'),
(18, '18425e27-8001-4fd8-9540-a77b12cb1f5f', 1, 'Berita Terbaru dari Desa [Nama Desa]', '<h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><br>&nbsp;</p><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 'da38e51f0fdec99292a137337740d683-1683114881848.jpg', 'http://localhost:5000/images/da38e51f0fdec99292a137337740d683-1683114881848.jpg', 1, '2023-05-03 18:54:41', '2023-05-03 18:54:41'),
(19, 'a8106304-2115-4bfd-910f-d6c82fba3926', 1, 'Program Pemerintah Desa untuk Kesejahteraan Masyarakat', '<h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><br>&nbsp;</p><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', '2a740605c56e1a4a437b8729882bdd89-1683114975339.jpg', 'http://localhost:5000/images/2a740605c56e1a4a437b8729882bdd89-1683114975339.jpg', 1, '2023-05-03 18:56:15', '2023-05-07 20:20:17'),
(20, '5f5e9ca6-7c95-466e-b586-b11715c47aab', 1, 'Profil Kepala Desa dan Anggota Dewan Desa [Nama Desa]', '<h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><br>&nbsp;</p><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', '60eda4e7edff52fef0d875a3c9ba5df1-1683115098165.jpg', 'http://localhost:5000/images/60eda4e7edff52fef0d875a3c9ba5df1-1683115098165.jpg', 1, '2023-05-03 18:58:18', '2023-05-03 18:58:18'),
(21, 'b35fbddf-d286-47ad-96e1-20e867038b9e', 1, 'Inovasi Teknologi di Desa [Nama Desa]', '<h2>What is Lorem Ipsum?</h2><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><br>&nbsp;</p><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', '4658fd7f565dd620e07407fcc1e1620f-1683115296195.jpg', 'http://localhost:5000/images/4658fd7f565dd620e07407fcc1e1620f-1683115296195.jpg', 1, '2023-05-03 19:01:36', '2023-05-08 17:11:33'),
(24, 'cae6fe56-577e-4782-ac13-965a866c8362', 21, 'Lorem Ipsum is simply dummy text of the printing', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><h2>Why do we use it?</h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><p><br>&nbsp;</p><h2>Where does it come from?</h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><h2>Where can I get some?</h2><p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '60eda4e7edff52fef0d875a3c9ba5df1-1684804570131.jpg', 'http://localhost:5000/images/60eda4e7edff52fef0d875a3c9ba5df1-1684804570131.jpg', 0, '2023-05-23 08:16:10', '2023-05-23 08:16:10'),
(25, 'b1585ab3-eb13-4393-9d56-7d77e1af2a4e', 21, 'Galeri 6 updated', '<p>asdadasdasdxaxasxasxsd updated</p>', '9f5568e865731d3f6f632c93fb87c1d9-1685497808382.jpg', 'http://localhost:5000/images/9f5568e865731d3f6f632c93fb87c1d9-1685497808382.jpg', 0, '2023-05-31 08:50:08', '2023-06-03 16:48:32');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `title`, `start`, `end`, `createdAt`, `updatedAt`) VALUES
(54, 'asdasd', '2023-05-09 07:00:00', '2023-05-12 07:00:00', '2023-05-09 09:22:39', '2023-05-09 09:22:39'),
(55, 'Meeting', '2023-05-01 07:00:00', '2023-05-04 07:00:00', '2023-05-19 14:35:14', '2023-05-19 14:35:14'),
(56, 'Meeting 2', '2023-05-19 07:00:00', '2023-05-21 07:00:00', '2023-05-19 14:35:39', '2023-05-19 14:35:39'),
(57, 'Coba1', '2023-06-05 07:00:00', '2023-06-08 07:00:00', '2023-06-03 16:48:06', '2023-06-03 16:48:06');

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id` int(11) NOT NULL,
  `id_fasilitas` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `waktu` varchar(255) NOT NULL,
  `nominal` varchar(255) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `aktif` int(1) NOT NULL,
  `url` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`id`, `id_fasilitas`, `nama`, `waktu`, `nominal`, `gambar`, `alamat`, `aktif`, `url`, `createdAt`, `updatedAt`) VALUES
(5, 'ae0ad8bf-96f7-4a24-bfc3-d25b36ab42cf', 'Lampu Jalan', 'Tanggal 20 April 2023', 'Rp. 20.000.000', '9f5568e865731d3f6f632c93fb87c1d9-1682163758149.jpg', 'Jl. Sunan Gunung Jati', 0, 'http://localhost:5000/images/9f5568e865731d3f6f632c93fb87c1d9-1682163758149.jpg', '2023-04-21 11:33:10', '2023-05-08 09:31:50'),
(6, '16bbad55-77d2-4539-8b98-ac92997054e9', 'Lapangan Bola Desa \"Suka Maju\"', 'Setiap hari (kecuali hari Selasa) pukul 16.00 - 20.00', 'Rp 50.000 per jam', '928d153ec87f4b132e7f4812f23fade7-1683116384028.jpeg', 'Jalan Raya Desa Suka Maju, Kecamatan Maju Jaya, Kabupaten X', 1, 'http://localhost:5000/images/928d153ec87f4b132e7f4812f23fade7-1683116384028.jpeg', '2023-05-03 19:19:44', '2023-05-08 10:14:17'),
(7, 'c7a61ed9-7d74-46e9-85de-80c68a2ed225', 'Warung Kopi \"Kampung Asik\"', 'Setiap hari pukul 07.00 - 22.00', 'Mulai dari Rp 5.000', '2e6550d970a94154f7fb3e66ad048232-1683116485131.jpg', 'Jalan Kampung Asik No. 12, Desa Karya Maju, Kecamatan Maju Jaya, Kabupaten X', 1, 'http://localhost:5000/images/2e6550d970a94154f7fb3e66ad048232-1683116485131.jpg', '2023-05-03 19:21:25', '2023-05-08 10:12:25'),
(8, '16123f12-43a9-4e2a-9656-c4c39f6879a9', 'Taman Bermain \"Ceria\"', 'Setiap hari pukul 08.00 - 18.00', ' Rp 10.000 per anak', '01d926bf7773b2863c5b63ae5a9c84ad-1683116605774.jpg', 'Jalan Raya Desa Makmur, Kecamatan Makmur Jaya, Kabupaten X', 0, 'http://localhost:5000/images/01d926bf7773b2863c5b63ae5a9c84ad-1683116605774.jpg', '2023-05-03 19:23:25', '2023-05-08 17:03:37'),
(9, '8f440149-d8f3-475e-94ec-1a9a86698ac7', 'Pusat Kebugaran \"Sehat Bersama\"', 'Senin - Sabtu pukul 06.00 - 20.00, Minggu pukul 06.00 - 13.00', 'Mulai dari Rp 100.000 per bulan', 'a5c55d8bdbbbf8f710fc518adc5f4755-1683116685969.jpg', 'Jalan Raya Desa Sejahtera No. 10, Kecamatan Sejahtera, Kabupaten X', 0, 'http://localhost:5000/images/a5c55d8bdbbbf8f710fc518adc5f4755-1683116685969.jpg', '2023-05-03 19:24:45', '2023-05-08 17:03:39'),
(10, '1d9fa5f6-bd87-4b72-b58c-35cbff21677e', 'Perpustakaan Desa \"Suka Membaca\"', ' Senin - Sabtu pukul 08.00 - 16.00', 'Gratis', '5167fda6ee620a0ff71dfa96665ae169-1683116755949.jpg', 'Jalan Raya Desa Membaca No. 5, Kecamatan Membaca Jaya, Kabupaten X', 1, 'http://localhost:5000/images/5167fda6ee620a0ff71dfa96665ae169-1683116755949.jpg', '2023-05-03 19:25:55', '2023-05-03 19:25:55');

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id` int(11) NOT NULL,
  `id_galeri` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `galeri`
--

INSERT INTO `galeri` (`id`, `id_galeri`, `userId`, `judul`, `gambar`, `url`, `createdAt`, `updatedAt`) VALUES
(1, 'd1ba454f-c761-420a-b0f1-93c9d8949c34', 1, 'Galeri 1', '87c29e60b3ed621b43e9947ae62ded96-1683552015537.jpg', 'http://localhost:5000/images/87c29e60b3ed621b43e9947ae62ded96-1683552015537.jpg', '2023-05-08 20:20:15', '2023-05-08 20:20:15'),
(2, '7bb80a5a-dda3-4767-b346-e9407f30e094', 1, 'Galeri 2', '97b40132d7274ec6b5a653b5f644f928-1683552076492.jpg', 'http://localhost:5000/images/97b40132d7274ec6b5a653b5f644f928-1683552076492.jpg', '2023-05-08 20:21:16', '2023-05-08 20:21:16'),
(3, 'fb6e3444-cf9e-4219-a748-055c59452b7e', 1, 'Galeri 3', 'ecf01aa6e30b7c23c4333ab70690b525-1683552129933.jpg', 'http://localhost:5000/images/ecf01aa6e30b7c23c4333ab70690b525-1683552129933.jpg', '2023-05-08 20:22:09', '2023-05-08 20:22:09'),
(4, 'cc748093-2333-4377-a27c-7a9a2b7197c1', 1, 'Galeri 4', 'ea0a06017a233936b80f1d77372dbcf7-1683552146774.jpg', 'http://localhost:5000/images/ea0a06017a233936b80f1d77372dbcf7-1683552146774.jpg', '2023-05-08 20:22:26', '2023-05-08 20:22:26'),
(5, 'edc3eff5-f3ed-4a34-915a-3a16f8936e26', 1, 'Galeri 5', '1b13b037348568dd3c0587f86f4fc2e1-1683552166552.jpg', 'http://localhost:5000/images/1b13b037348568dd3c0587f86f4fc2e1-1683552166552.jpg', '2023-05-08 20:22:46', '2023-05-08 20:22:46'),
(6, 'a57612ee-b786-4c21-b549-f83f522b14aa', 1, 'Galeri 6', 'f8db1e36253fbe2ef1d8dcaa5f69ea1c-1683600531939.jpg', 'http://localhost:5000/images/f8db1e36253fbe2ef1d8dcaa5f69ea1c-1683600531939.jpg', '2023-05-09 09:48:52', '2023-05-09 09:48:52'),
(7, 'd7797f07-dd2a-4b49-8014-d07ed434e176', 1, 'Galeri 7', '06e4d2414a57e5d612722f3f765e142c-1683600569985.jpg', 'http://localhost:5000/images/06e4d2414a57e5d612722f3f765e142c-1683600569985.jpg', '2023-05-09 09:49:29', '2023-05-09 09:49:29'),
(8, 'a5d226cf-94ee-409d-9e1e-09675056e06b', 1, 'Galeri 8', '6fd12f51a985ca5cb0014d7bbe698e8e-1683600581116.jpg', 'http://localhost:5000/images/6fd12f51a985ca5cb0014d7bbe698e8e-1683600581116.jpg', '2023-05-09 09:49:41', '2023-05-09 09:49:41'),
(9, 'fdc8948d-c763-4066-acd0-738d57e68519', 1, 'Galeri 9', '611db599171dceecef5b4ad3848fe82e-1683600592869.jpg', 'http://localhost:5000/images/611db599171dceecef5b4ad3848fe82e-1683600592869.jpg', '2023-05-09 09:49:52', '2023-05-09 09:49:52'),
(10, 'b4e42290-40a2-4f0b-a704-da8a96dacf54', 1, 'Galeri 10', '0f0de303a006cc2cc53b0cdbc09d2929-1683600621084.jpg', 'http://localhost:5000/images/0f0de303a006cc2cc53b0cdbc09d2929-1683600621084.jpg', '2023-05-09 09:50:21', '2023-05-09 09:50:21'),
(11, 'e91b1290-a67a-4d91-9de7-3b2350d555a7', 1, 'Galeri 11 updated', '3b6a6290110a957dc3931780c5ce2b44-1683602376427.jpg', 'http://localhost:5000/images/3b6a6290110a957dc3931780c5ce2b44-1683602376427.jpg', '2023-05-09 09:51:03', '2023-05-09 10:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` int(11) NOT NULL,
  `id_pengumuman` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `aktif` int(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `id_pengumuman`, `userId`, `judul`, `isi`, `gambar`, `aktif`, `createdAt`, `updatedAt`) VALUES
(2, '99c6a2b5-5089-46f5-8cc3-8e49f3895191', 1, 'Pemberitahuan Kerja Bakti Bersama Masyarakat', 'Kepada seluruh warga Desa XYZ, dengan ini kami mengundang semua warga untuk mengikuti kerja bakti bersama pada hari Minggu, tanggal 15 April 2023. Acara ini akan dimulai pukul 07.00 pagi di lapangan Desa XYZ.\n\nKerja bakti ini bertujuan untuk membersihkan lingkungan desa dan memperindah taman-taman dan tempat umum di desa kita. Adapun kegiatan yang akan dilakukan antara lain:\n\n1. Membersihkan selokan dan got-got di sepanjang jalan desa\n2. Memotong rumput dan merapikan taman dan tempat umum\n3. Membersihkan sampah di sekitar tempat ibadah dan sekolah\n4. Memperbaiki jalan yang berlubang dan rusak\n\nKami mengajak seluruh warga Desa XYZ untuk turut serta dalam acara ini dan membawa peralatan seperti sapu, cangkul, gergaji, dan sejenisnya. Bagi warga yang tidak dapat hadir di acara ini, kami memohon agar membersihkan lingkungan masing-masing.\n\nKami harap kerja bakti bersama ini dapat menjadi momentum untuk mempererat tali persaudaraan dan kebersamaan antara warga desa. Terima kasih atas perhatian dan partisipasinya.\n\n\n\n\n', NULL, 1, '2023-04-04 19:52:21', '2023-05-08 10:51:18'),
(3, 'fa8d08b0-e470-4a39-baff-f9daa60ddb63', 1, 'Pemberitahuan Buka Puasa Bersama Masyarakat', 'Kepada seluruh warga Desa LMN, dengan ini kami mengundang seluruh warga untuk mengikuti acara Buka Puasa Bersama pada hari Jumat, tanggal 12 April 2023 di lapangan Desa LMN.\n\nAcara ini dimulai pada pukul 17.30 WIB dan diharapkan dapat dihadiri oleh seluruh warga Desa LMN dari berbagai lapisan masyarakat. Acara Buka Puasa Bersama ini bertujuan untuk mempererat tali persaudaraan dan silaturahmi antar warga Desa LMN.\n\nAdapun rangkaian acara yang akan dilaksanakan pada acara Buka Puasa Bersama ini antara lain:\n\n1. Buka puasa bersama dan menyantap hidangan yang telah disediakan oleh panitia\n2. Shalat Maghrib berjamaah di lapangan Desa LMN\n3. Ceramah agama oleh Ustadz ZZZ\n\nKami memohon partisipasi seluruh warga Desa LMN untuk turut serta dalam acara ini dan membawa hidangan untuk berbuka puasa bersama. Bagi warga yang ingin memberikan donasi untuk kegiatan santunan anak yatim/piatu, dapat menghubungi panitia acara.\n\nDemikian pengumuman ini kami sampaikan, semoga acara Buka Puasa Bersama ini dapat berjalan dengan lancar dan membawa keberkahan bagi seluruh warga Desa LMN. Terima kasih atas perhatian dan partisipasinya.', NULL, 1, '2023-04-04 19:54:33', '2023-05-08 11:53:15'),
(7, 'dbfca49e-e3e5-4d4f-a630-70e55a961006', 1, 'Bootstrap 4.6.0', '<h4>About</h4><p>A <strong>card</strong> is a flexible and extensible content container. It includes options for headers and footers, a wide variety of content, contextual background colors, and powerful display options. If you’re familiar with Bootstrap 3, cards replace our old panels, wells, and thumbnails. Similar functionality to those components is available as modifier classes for cards.</p><h4>Example</h4><p>Cards are built with as little markup and styles as possible, but still manage to deliver a ton of control and customization. Built with flexbox, they offer easy alignment and mix well with other Bootstrap components. They have no margin by default, so use <a href=\"https://getbootstrap.com/docs/4.6/utilities/spacing/\">spacing utilities</a> as needed.</p><p>Below is an example of a basic card with mixed content and a fixed width. Cards have no fixed width to start, so they’ll naturally fill the full width of its parent element. This is easily customized with our various <a href=\"https://getbootstrap.com/docs/4.6/components/card/#sizing\">sizing options</a>.</p>', NULL, 1, '2023-04-20 21:24:01', '2023-05-08 11:53:19'),
(8, 'ac7ee09c-e716-48d9-8f67-eb96773a66da', 1, 'Pengumuman tentang Pendaftaran Calon Peserta Pemilihan Kepala Desa (Pilkades)', '<p>Pemerintah Desa [Nama Desa] mengumumkan kepada seluruh warga desa bahwa pendaftaran calon peserta Pemilihan Kepala Desa akan dibuka mulai tanggal [tanggal] sampai dengan [tanggal]. Syarat dan ketentuan untuk menjadi calon peserta Pilkades dapat dilihat di kantor desa pada jam kerja. Terima kasih.</p>', NULL, 1, '2023-05-03 19:12:59', '2023-05-08 11:53:18'),
(9, 'e7bee942-2c95-40a7-8a68-3a34f1324e76', 1, 'Pengumuman tentang Pembangunan Infrastruktur Desa', '<p>Pemerintah Desa [Nama Desa] mengumumkan kepada seluruh warga desa bahwa akan dilaksanakan pembangunan infrastruktur desa berupa pembangunan jalan desa, pembangunan jembatan, dan pembangunan fasilitas umum lainnya. Pelaksanaan pembangunan akan dimulai pada [tanggal]. Mohon kerjasama dari seluruh warga desa untuk menyukseskan pembangunan ini. Terima kasih.</p>', NULL, 1, '2023-05-03 19:13:17', '2023-05-08 11:53:16'),
(10, 'ed98cec8-6f31-4366-981d-2878030fe647', 1, 'Pengumuman tentang Pencairan Dana Bantuan Langsung Tunai (BLT)', '<p>Pemerintah Desa [Nama Desa] mengumumkan kepada seluruh penerima Bantuan Langsung Tunai (BLT) bahwa dana BLT tahap ke-2 telah siap untuk dicairkan. Silakan datang ke kantor desa pada tanggal [tanggal] untuk mengambil dana BLT. Mohon membawa kartu identitas asli dan kartu keluarga. Terima kasih.</p>', NULL, 0, '2023-05-03 19:13:32', '2023-05-03 19:13:32'),
(11, '26befe7c-2db5-4d02-b780-1c549b9a3cf0', 1, 'Pengumuman tentang Pendaftaran Program Kesehatan', '<p>Pemerintah Desa [Nama Desa] mengumumkan kepada seluruh warga desa bahwa program kesehatan akan dilaksanakan pada bulan [bulan]. Warga yang ingin mendaftar dapat datang ke kantor desa pada jam kerja. Program kesehatan meliputi pemeriksaan kesehatan gratis, penyuluhan kesehatan, dan pemberian obat-obatan. Terima kasih.</p>', NULL, 0, '2023-05-03 19:13:50', '2023-05-08 10:51:04'),
(12, '7cfb9695-c19e-4416-a471-3ede4eb39ea7', 1, 'Pengumuman tentang Pembagian Sembako by khoirulaji', '<p>Pemerintah Desa [Nama Desa] mengumumkan kepada seluruh warga desa bahwa akan dilaksanakan pembagian sembako untuk warga yang terdampak pandemi Covid-19. Pembagian sembako akan dilaksanakan pada tanggal [tanggal] di kantor desa. Warga yang ingin menerima sembako harus membawa kartu identitas asli dan kartu keluarga. Terima kasih.</p>', NULL, 1, '2023-05-03 19:14:05', '2023-05-19 14:37:40'),
(13, '3adf9d82-2dca-4817-8f2e-f89f06aac0e7', 21, 'Lorem Ipsum is simply dummy text of the printing', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', NULL, 0, '2023-05-23 08:09:24', '2023-05-23 08:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `permohonan`
--

CREATE TABLE `permohonan` (
  `id` int(11) NOT NULL,
  `id_permohonan` varchar(255) NOT NULL,
  `suratdkId` varchar(255) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `pemohon` varchar(255) NOT NULL,
  `surat` varchar(255) NOT NULL,
  `aktif` int(1) NOT NULL,
  `wa` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permohonan`
--

INSERT INTO `permohonan` (`id`, `id_permohonan`, `suratdkId`, `nik`, `pemohon`, `surat`, `aktif`, `wa`, `createdAt`, `updatedAt`) VALUES
(15, 'c2c4094a-0bc5-43e6-b7d0-5c24a917e283', 'd4e02037-c59a-4a4d-97b7-279fcf4bea9c', '81238192739', 'Aji Khoirul', 'Surat Keterangan Tidak Mampu', 0, '102707310273', '2023-05-22 17:34:57', '2023-05-22 20:39:23'),
(16, '9506ae62-96b7-4559-9ac8-76aaa0fbed9f', '21ffa6fb-7c7d-4e39-8c74-1e09a76143bf', '3502101202820003', 'Imron Riyadi', 'Surat Keterangan Tidak Mampu', 1, 'dasdas', '2023-05-22 17:38:24', '2023-05-22 17:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `id` int(11) NOT NULL,
  `id_pertanyaan` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `jawab` text NOT NULL,
  `aktif` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pertanyaan`
--

INSERT INTO `pertanyaan` (`id`, `id_pertanyaan`, `judul`, `jawab`, `aktif`, `createdAt`, `updatedAt`) VALUES
(4, '87f43efa-5d9a-47cd-b7b1-bd846583fe53', 'Bagaimana cara mengajukan proposal kegiatan di desa?', '<p><strong>Jawaban:</strong> Untuk mengajukan proposal kegiatan di desa, Anda dapat menghubungi sekretariat desa atau ketua RT/RW setempat. Kemudian, lengkapi formulir permohonan proposal kegiatan dan lampirkan dokumen pendukung seperti proposal kegiatan, anggaran biaya, dan lain sebagainya.</p>', NULL, '2023-04-22 20:10:56', '2023-04-22 21:18:50'),
(5, 'b3e17794-5e7e-46ae-a790-8cf50be9de03', 'Apa saja program pemerintah yang sedang berjalan di desa?', '<p><strong>Jawaban: </strong>Program pemerintah yang sedang berjalan di desa antara lain program pembangunan infrastruktur, program pemberdayaan masyarakat, program peningkatan kesehatan dan pendidikan, serta program penanggulangan kemiskinan.</p>', NULL, '2023-04-22 20:11:10', '2023-04-22 21:19:01'),
(6, '8b2d37d2-3204-41d0-b07a-d4d9f299c4c3', 'Bagaimana cara menjadi anggota karang taruna di desa?', '<p><strong>Jawaban:</strong> Untuk menjadi anggota karang taruna di desa, Anda harus mendaftarkan diri ke pengurus karang taruna setempat. Biasanya syaratnya adalah usia minimal 17 tahun dan memiliki keinginan untuk berkontribusi pada kemajuan desa.</p>', NULL, '2023-04-22 20:11:24', '2023-04-22 21:19:22');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `uuid`, `name`, `price`, `userId`, `createdAt`, `updatedAt`) VALUES
(5, 'bbff9dee-3ccf-4c76-8dbb-843318ec59c3', 'Product 4', 972, 1, '2023-03-08 12:10:00', '2023-03-08 12:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `profil_desa`
--

CREATE TABLE `profil_desa` (
  `id` int(11) NOT NULL,
  `id_profil` varchar(255) NOT NULL,
  `nama_desa` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `notelp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profil_desa`
--

INSERT INTO `profil_desa` (`id`, `id_profil`, `nama_desa`, `alamat`, `notelp`, `email`, `createdAt`, `updatedAt`) VALUES
(1, 'f4ccffff-7ac1-4287-afec-e22c2ae4ee6e', 'Desa Kepuhrurubuh', 'Jl. Sunan Muria', '0877281821082', 'kepuhrubuhid@gmail.com', '2023-05-23 10:50:58', '2023-05-25 19:26:09');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('0ccOqQk9cXH-vp2QTltuLS4ZgMbxnI3x', '2023-06-05 11:42:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 10:30:24', '2023-06-04 11:42:59'),
('0DWlyuKu5OFLAvXwi0W05iO-i8H_AbL6', '2023-06-05 11:03:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:03:55', '2023-06-04 11:03:55'),
('0jiE8KD0gFfI5-YV_hoKgNbNWdvj1FAP', '2023-06-05 10:48:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 10:48:30', '2023-06-04 10:48:30'),
('12ylwf51v9cDX9Tkpgilej-DvrZuoStD', '2023-06-05 08:35:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:35:16', '2023-06-04 08:35:16'),
('17oYgnDEr5iz8LQKV0Bod4HpYYHXxjye', '2023-06-04 20:18:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:18:26', '2023-06-03 20:18:26'),
('1BbUonWmJaqKCTTPku7vWq-epZrru3NL', '2023-06-05 10:43:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 10:43:08', '2023-06-04 10:43:08'),
('1ChKtx5ph2twQFGnFi4VfT9NEmTIKkRd', '2023-06-04 16:56:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:23', '2023-06-03 16:56:16'),
('1iVf4eeHRMTDA56hGMYrU-E5GR_242rb', '2023-06-05 11:42:51', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:42:51', '2023-06-04 11:42:51'),
('1Zh4DQsI0i7nkCzr7vu-q5X3ariq1Q9-', '2023-06-05 11:07:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:07:23', '2023-06-04 11:07:23'),
('20kHTAF8OwomBEw0eAz3hsWn7erCRGb7', '2023-06-05 11:04:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:04:07', '2023-06-04 11:04:07'),
('22lzErF5tG9GtUHPDryB1w3RkPLxcwVl', '2023-06-04 20:17:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:17:03', '2023-06-03 20:17:03'),
('2ozkP0IuQO021TqDs74mV_KLZocpjbEU', '2023-06-05 09:00:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 09:00:33', '2023-06-04 09:00:33'),
('2PHCB4CsKfAIekMBFrzSNl7BMRC8Ybc9', '2023-06-04 16:54:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:18', '2023-06-03 16:54:18'),
('39pXUtJmmRYfRXUtMo19Uj8EAKW21tNr', '2023-06-05 07:47:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 07:47:26', '2023-06-04 07:47:26'),
('3BfqFaRaFyb38UoaP4HMXSzqymF21KnK', '2023-06-04 17:19:35', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 17:19:35', '2023-06-03 17:19:35'),
('3f3-B7BHv-0ZZQ0fYk9U9O66grMgrkXn', '2023-06-05 11:30:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:30:03', '2023-06-04 11:30:03'),
('3ft0C-1h4NJ5ZRjbnvxzyo7EgGJSFRQP', '2023-06-04 16:48:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:48:31', '2023-06-03 16:48:31'),
('3ICQGgPGtSjxMlIjhqnhiLwiXD_CCt_e', '2023-06-04 16:54:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:19', '2023-06-03 16:54:19'),
('3j6VrfkPbceujKFebHwr_tBPFQGD48j8', '2023-06-05 09:00:32', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 09:00:32', '2023-06-04 09:00:32'),
('5o3qNlo_aeUtna77dMzmg3D_98wIjEqe', '2023-06-05 11:01:14', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:01:14', '2023-06-04 11:01:14'),
('6bYnE1scD8yEsv3Nd_o6d98_sq_zk0pI', '2023-06-05 08:35:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:35:17', '2023-06-04 08:35:17'),
('6N8N1vMuOPhE43vOdceAVTBL7FyVWIl9', '2023-06-05 08:41:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:41:40', '2023-06-04 08:41:40'),
('6uLECg92sBWLxdG0hvgSFQ01bDuvCo4n', '2023-06-04 20:19:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:19:58', '2023-06-03 20:19:58'),
('6_LKR6ZELOHiLU7qL7J-2ua2LOOYk4Xx', '2023-06-05 11:42:56', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:42:56', '2023-06-04 11:42:56'),
('7hNGykGRckxpjXfBJjrBmwZW2ncFyoPx', '2023-06-05 08:35:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:35:13', '2023-06-04 08:35:13'),
('8Q-E-EkeSFsJrWIb5cREc7ssmHxpXjoJ', '2023-06-05 09:22:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 09:22:36', '2023-06-04 09:22:36'),
('8qD1Ut38CfDHXDS5_KHgZO9WLudBv0AP', '2023-06-05 10:30:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 10:30:19', '2023-06-04 10:30:19'),
('8ZhFWE58_jidQN5u2xD6YH0QpK4p4lpy', '2023-06-05 08:35:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:35:16', '2023-06-04 08:35:16'),
('9eIUDqLIYJJpba-sBuF4U6do1S6bZfod', '2023-06-04 16:48:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:48:46', '2023-06-03 16:48:46'),
('adCM7TDNPSC_csd8FaRyHm8Ky3PEFB2E', '2023-06-05 08:54:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:54:29', '2023-06-04 08:54:29'),
('B4RJGwZTvkdH8pZCY2BX6GPjc8yC_6UY', '2023-06-04 16:48:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:48:05', '2023-06-03 16:48:05'),
('bHDGaDaeoQsqCgSmf6t70L4ylCbNpAJP', '2023-06-04 20:20:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:20:47', '2023-06-03 20:20:47'),
('bJs9LmepEhVxn5r4r6HESY3laTCSsvJ6', '2023-06-05 10:51:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 10:51:57', '2023-06-04 10:51:57'),
('bRydKYrKEhrhK_Ig49Qap7Rd7wHBwYq_', '2023-06-04 17:19:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 17:19:44', '2023-06-03 17:19:44'),
('C2nLfKUtIEy2r5hy7kitck4EBX6W84jj', '2023-06-04 16:54:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:19', '2023-06-03 16:54:19'),
('c8XfiUG4doim9S7u_0BROGfC9dGvh7YG', '2023-06-04 16:54:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:21', '2023-06-03 16:54:21'),
('CBoSDEXVff7oXaoD0h8IICBeLoCJNr9Z', '2023-06-04 16:40:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:40:22', '2023-06-03 16:40:22'),
('cshJ21Eelq2UY1tdtN_J5d3sA96emwBo', '2023-06-04 17:19:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 17:19:44', '2023-06-03 17:19:44'),
('CTl74ufXXzjRyxytvzBugIL9E8oFWwlY', '2023-06-04 20:18:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:18:25', '2023-06-03 20:18:25'),
('cVsRjT1IVO19sRVZ5I5h2hdRWM6jT4ek', '2023-06-04 20:20:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:20:45', '2023-06-03 20:20:45'),
('D40XL5rSqZLu-TJTJvspKB66R_WaJGNV', '2023-06-04 20:19:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:19:58', '2023-06-03 20:19:58'),
('d4y2ZcQSXw_CqWOCMk-jfEYBSZvYhMtp', '2023-06-04 16:40:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:40:17', '2023-06-03 16:40:17'),
('D7zFTwsYYFgc-R2dHaIYMoAvMF6rNY5K', '2023-06-04 20:20:01', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:20:03', '2023-06-03 20:20:03'),
('Di3q9CwrcbOgtkNuP769E7lJMdd9a1LE', '2023-06-05 10:30:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 10:30:22', '2023-06-04 10:30:22'),
('DknWVoy3rMCjPlI1biSokceONhjIRTv7', '2023-06-04 20:17:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:17:06', '2023-06-03 20:17:06'),
('DLdEyvQdJ8Dyxh2oarqTitRqONLbn_Q6', '2023-06-04 16:54:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:19', '2023-06-03 16:54:19'),
('Dt-jepI-nbFjmo-2vFqh54Y4zUMMyk5b', '2023-06-04 16:40:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:40:23', '2023-06-03 16:40:23'),
('E0KFzflb-B0w9j0m8_KGvRf5cjUxyjN3', '2023-06-04 16:54:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:22', '2023-06-03 16:54:22'),
('e4TPYq0rtytDNGgG234-rTirz-MKB50H', '2023-06-05 08:41:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:41:42', '2023-06-04 08:41:42'),
('Ed0gUurN2iEgHmtOswyBlnfW1_u8vpsK', '2023-06-05 07:47:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 07:47:28', '2023-06-04 07:47:28'),
('ekjzVxMiUFjdqR2K1AKVVXgkaD-8Zv7I', '2023-06-04 16:46:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:46:42', '2023-06-03 16:46:42'),
('elsvM4PTvjDkTWuZD3PPcjTs_kp64gvf', '2023-06-04 20:19:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:19:57', '2023-06-03 20:19:57'),
('F0x0bb1JtKIqtMaFRrLy_kx60YKmWT2v', '2023-06-04 20:22:50', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:22:50', '2023-06-03 20:22:50'),
('fAD6C04V978h_h9XhPo0zJFdDljQJrvt', '2023-06-05 08:35:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:35:24', '2023-06-04 08:35:24'),
('fAxW4o_0q_5EEdzPpxmPA8V1UcCVGG7b', '2023-06-04 20:22:49', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:22:50', '2023-06-03 20:22:50'),
('FfOtWUpvontHMTprzbsMVGgYxduc6zwz', '2023-06-05 08:41:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:41:41', '2023-06-04 08:41:41'),
('FhU8ue1sADyp3FSsjIdJZ_zmlQbj62bE', '2023-06-05 08:54:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:54:28', '2023-06-04 08:54:28'),
('fjH1l90rImFKqplFb8tXFVyujBrI-k-q', '2023-06-04 20:20:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:20:46', '2023-06-03 20:20:46'),
('FkIjRoqDCTVHq747CVrY2-ZAgHqamh3R', '2023-06-04 17:19:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 17:19:42', '2023-06-03 17:19:42'),
('F_4yWcs647CJNTK8yE6Ok7tr4-ds9L-C', '2023-06-05 08:35:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:35:26', '2023-06-04 08:35:26'),
('GM_xKdYxYBHSPVsYCYKtHvqVNEwR1Ebg', '2023-06-04 17:19:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 17:19:43', '2023-06-03 17:19:43'),
('GxoEPjnqRJxFaN0wdOV7HUWAT-m4rrge', '2023-06-05 08:51:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:51:45', '2023-06-04 08:51:45'),
('h0l_8WvGufPZ1Zo6jWCus5hCNJ6TR08r', '2023-06-04 20:17:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:17:06', '2023-06-03 20:17:06'),
('H10x3WsRJYbtDoljrpQu_bPh7xRCHKk_', '2023-06-05 07:47:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 07:47:28', '2023-06-04 07:47:28'),
('HFC5_qHuZKy0AAoSxP1OqAS0cYf1iXKx', '2023-06-05 08:51:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:51:45', '2023-06-04 08:51:45'),
('hifBThOnZgQhNnK8FS7SiS4UDo2KkkHt', '2023-06-05 07:47:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 07:47:28', '2023-06-04 07:47:28'),
('HlPt8NvYt1Joo_DljpYHDtfTOzq33mtB', '2023-06-04 20:18:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:18:26', '2023-06-03 20:18:26'),
('hsyLvCyJeV-ssmNEb3PnJ8iH6cMHWsO4', '2023-06-05 09:06:53', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 09:06:53', '2023-06-04 09:06:53'),
('HyRSleBkPZFKL5OmEM12V56zSSG91i1N', '2023-06-04 20:17:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:17:06', '2023-06-03 20:17:06'),
('iD3YTWEJcxbcLs9sxDnAEksU0EbTLqst', '2023-06-04 20:22:48', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:22:48', '2023-06-03 20:22:48'),
('iJdyZtfQHrUDxmhMzzDEHTJbT0wtYlUN', '2023-06-05 08:35:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:35:17', '2023-06-04 08:35:17'),
('iN903_JNUblSHfMQwGuMesGdvn8e6ITs', '2023-06-05 07:47:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 07:47:28', '2023-06-04 07:47:28'),
('JgonAo5xv8e2XAAmINCwma_r6P4J5oIX', '2023-06-05 08:35:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:35:16', '2023-06-04 08:35:16'),
('jlja-JIL2g1vgFvSEe7Kt4sCOXNCvICH', '2023-06-04 17:19:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 17:19:43', '2023-06-03 17:19:43'),
('jo_z1ZDefcIRtQOAgV2c4sH0oZy-Wx-D', '2023-06-05 08:35:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:35:17', '2023-06-04 08:35:17'),
('jTyg3bm5G5kHJFiOm7wQLasd-A0jyxeP', '2023-06-04 16:54:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:18', '2023-06-03 16:54:18'),
('kcKziU-XByS_v4opq4KAAbKXS3MZ4oWh', '2023-06-05 11:07:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:07:29', '2023-06-04 11:07:29'),
('l7mF0roqSfUch_eX3DjU6Q7HhgosUMGx', '2023-06-05 09:00:32', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 09:00:33', '2023-06-04 09:00:33'),
('lDx3MeEbmaVyEU0UTPnybKYJzsU8B5tV', '2023-06-04 16:54:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:18', '2023-06-03 16:54:18'),
('lFhwcZobPkdLmU_mov6T3eaCNii4_UBh', '2023-06-05 09:21:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 09:21:17', '2023-06-04 09:21:17'),
('LimFXHM9DGy5g1zzClEwfTzxMB6k9LMe', '2023-06-04 20:20:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:20:46', '2023-06-03 20:20:46'),
('LoLQt3WCRUNPO1ObI-OaBOui9IgvkZlX', '2023-06-04 20:20:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:20:47', '2023-06-03 20:20:47'),
('Lud14yKzWO7nkBDhc79d0uZAQHxL3Yfg', '2023-06-04 20:19:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:19:58', '2023-06-03 20:19:58'),
('lXENHAgIhcskuVk6McqpSBOt76JQVoSa', '2023-06-04 20:19:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:19:58', '2023-06-03 20:19:58'),
('M3ikY42Bbr8VBDauTpkFJxL22uWphTrX', '2023-06-04 17:20:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 17:20:47', '2023-06-03 17:20:47'),
('M84gxntF90L1C7_-CSO5psfLzfF7Nw8t', '2023-06-05 11:04:14', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:04:14', '2023-06-04 11:04:14'),
('mAAZ8r_BtchoTzPR5IGg519D82uCsHs9', '2023-06-04 16:54:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:19', '2023-06-03 16:54:23'),
('mgnMbTz9wVCbfS9_J7S3GfKlOVvqVCcZ', '2023-06-05 08:03:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:03:27', '2023-06-04 08:03:27'),
('mumdT8fihZJW5k1KeczDCwlJBeF6E_yi', '2023-06-04 20:19:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:20:03', '2023-06-03 20:20:03'),
('naqAQVJ0srn5Tpy5_m7MsDNL1np0-KvV', '2023-06-05 10:45:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 10:45:31', '2023-06-04 10:45:31'),
('Ng8vvQjJbYLzUHBz4YfDQWX5kudaR-9L', '2023-06-04 17:19:42', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 17:19:44', '2023-06-03 17:19:44'),
('nUDE0R4s_Li17l3psKe13zpK1bJMnsmW', '2023-06-05 10:30:21', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 10:30:22', '2023-06-04 10:30:22'),
('o1VmxkSCILiZdxeUpyUkPX0jmyyOdCzo', '2023-06-04 20:20:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:20:46', '2023-06-03 20:20:46'),
('OCdTQHzy6udtuYf1jjAqWklSdjWRu24e', '2023-06-05 08:51:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:51:45', '2023-06-04 08:51:45'),
('oDJGlPqR8rIvO6_NcdjUtqSLbP3zSmzx', '2023-06-04 16:40:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:40:22', '2023-06-03 16:40:22'),
('OGIolbgvDVBHYYmnHygWtnLezglOQgWQ', '2023-06-04 16:48:39', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:48:39', '2023-06-03 16:48:39'),
('ok7XzvJhibNsSF7H5C1Q7b79bQBhRHBh', '2023-06-05 08:54:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:54:29', '2023-06-04 08:54:29'),
('oV6uAMXZAwPnRLV28fhLKBZTZHP5bf3T', '2023-06-04 20:18:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:18:26', '2023-06-03 20:18:26'),
('p5REs-N7GiTgzP4vdCErbe1wldmyQLo5', '2023-06-05 10:49:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 10:49:22', '2023-06-04 10:49:22'),
('pLfYEG1Iqc0jSabkGREfUOvjc0URjkdW', '2023-06-04 16:54:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:18', '2023-06-03 16:54:18'),
('pNM_yYoSY_aXji7Ah6VYzGnIxQNBe-N3', '2023-06-04 16:54:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:18', '2023-06-03 16:54:18'),
('pZmN43HsZOnGj66lp9glTOFy_m2kTi7V', '2023-06-04 16:40:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:40:22', '2023-06-03 16:40:22'),
('QccWa8YUT4kTiNYQJf3XuLgqKZtdiXtl', '2023-06-05 11:04:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:04:20', '2023-06-04 11:04:20'),
('QdwVj3v8oiCr5YPLmhoK8BHVQGD-tLjP', '2023-06-05 11:07:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:07:26', '2023-06-04 11:07:26'),
('Qef-LVy6IhgK39O6zz0M2eeL8fSZE0na', '2023-06-05 08:35:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:35:26', '2023-06-04 08:35:26'),
('qGMl5Adw3nJcJdRybRE1zWAv2zbgvP2c', '2023-06-04 20:18:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:18:25', '2023-06-03 20:18:25'),
('QwuwIl-SWdSJY9KuF5mXMUNRstUJmMcH', '2023-06-04 16:54:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:18', '2023-06-03 16:54:18'),
('rmsNbQJYXhQz2Rw4wKPuuQpNAl9bSIsI', '2023-06-04 20:22:50', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:22:50', '2023-06-03 20:22:50'),
('Rrt4_D5yfPmCgFASm3fbagwMjv8d6GiF', '2023-06-05 09:54:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 09:54:18', '2023-06-04 09:54:18'),
('s9hBfJhgl4rOJ58cy9TAl_mM96A24Srk', '2023-06-04 20:22:50', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:22:50', '2023-06-03 20:22:50'),
('sbxtdK8r1Ui6G0vPpmEsytf4O5le0JeO', '2023-06-05 08:35:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:35:25', '2023-06-04 08:35:25'),
('SINpFZCPq90j0IW1GE6PEKOBNdYYwU9o', '2023-06-04 20:17:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:17:05', '2023-06-03 20:17:05'),
('sK5ihmdfw5RnrelWFJp0hcdsT3xojqEU', '2023-06-05 11:07:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:07:17', '2023-06-04 11:07:17'),
('sWfUpsLrxHmvjKIGxbbU1s5DHAnhuWg7', '2023-06-05 10:18:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 09:00:33', '2023-06-04 10:18:33'),
('TBCKaU6OexBhOWG10DaK_1J_asedaIxi', '2023-06-05 11:27:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:27:25', '2023-06-04 11:27:25'),
('TeFOD7t5VeA8ho0Aql0sKWrv9GxTNTen', '2023-06-04 17:20:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 17:20:57', '2023-06-03 17:20:57'),
('tFzjcjqnz484r374h8aYhYynm5egyQh0', '2023-06-05 07:40:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 07:40:29', '2023-06-04 07:40:43'),
('TtH8mV6yZIqR3sNEVO9qf57CE2EEHlKG', '2023-06-04 16:40:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:40:22', '2023-06-03 16:40:22'),
('TZOJkBVBAbyLlyiwyXUe8UHMd3bd9K0a', '2023-06-05 08:54:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:54:30', '2023-06-04 08:54:30'),
('uDJEgmPh_Orfs7R_dIxrRz8qj4KhThSg', '2023-06-05 07:47:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 07:47:27', '2023-06-04 07:47:27'),
('UO-O3GtB6yJGC-NqdKODjkWazDozf_7u', '2023-06-04 17:08:39', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 17:08:40', '2023-06-03 17:08:40'),
('URNFH6pVSUIrc-9l-G19D4PQIeuWb3lm', '2023-06-04 16:54:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:22', '2023-06-03 16:54:23'),
('uv--Ah4zv0pqtA2cK7sg_RfOyc8N6TDp', '2023-06-05 10:40:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 10:40:22', '2023-06-04 10:40:22'),
('uXiQe8K9SnORGLIg_ZoetA793bRlFgZw', '2023-06-05 10:18:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 10:18:25', '2023-06-04 10:18:25'),
('V-dhRBKIkcAH6CY5q4Pqwxbk58BfQXZw', '2023-06-05 08:54:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:54:29', '2023-06-04 08:54:29'),
('VfAbElcX4dwjh0abpzprYwVSFalFkV9T', '2023-06-05 09:55:09', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 09:55:09', '2023-06-04 09:55:09'),
('vGzjWXoMuIPJ7LTOP8pERfXG9FJaFDXG', '2023-06-04 20:18:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:18:19', '2023-06-03 20:18:19'),
('VhXDddXNvrb6q8kLdVnMe_PU4CogRSEs', '2023-06-05 08:54:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:54:29', '2023-06-04 08:54:29'),
('VjqACmkYsAclwxVsq_p0HkCfzoBl0Fui', '2023-06-05 07:47:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 07:47:27', '2023-06-04 07:47:27'),
('vVL3Vb_QDmtrYlFJqf_QZ3BR1Ub3DcCH', '2023-06-05 08:54:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:54:30', '2023-06-04 08:54:30'),
('w2SS1EnpSDpPEBYu3xaj1vubzQOibvZe', '2023-06-04 20:17:08', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:17:08', '2023-06-03 20:17:08'),
('W8uyf73nQmmIlSrItnCkCJDkuPHWkX9L', '2023-06-04 16:46:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:46:41', '2023-06-03 16:46:41'),
('wcQCaMTdUyrBOYAanKKsmojwmsvOtNsL', '2023-06-04 16:54:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:19', '2023-06-03 16:54:19'),
('WcyjTBfCeiJoQeUFHpD6ZHu4z-aNDfNT', '2023-06-05 10:41:19', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 10:41:19', '2023-06-04 10:41:19'),
('Xbos5QkPNEj76LRuiRaL2x6-iF-wlvEB', '2023-06-04 17:20:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 17:20:41', '2023-06-03 17:20:41'),
('xfsK36jJJ5nrYLpSSsEv1bvnmQNKrhNX', '2023-06-04 20:17:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:17:05', '2023-06-03 20:17:05'),
('xg7pajQ3FQt5WEI1nQlrQWlQpcqDQR4K', '2023-06-05 11:29:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:29:22', '2023-06-04 11:29:22'),
('XUFQ6_I2V0Lt8CY16uq8jrPK14NpNbto', '2023-06-04 16:40:22', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:40:22', '2023-06-03 16:40:22'),
('xZkMoSus6bcX0OzkOcUivVxgnttBBsJA', '2023-06-05 08:41:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:41:42', '2023-06-04 08:41:42'),
('X_YH-viuDz1pn5EjmQNKbL2wFHRXxzyj', '2023-06-04 20:18:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:18:26', '2023-06-03 20:18:26'),
('YCxMdRiZ0UOBEwLQ0O89J2USE2YRmV2G', '2023-06-04 20:22:49', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:22:50', '2023-06-03 20:22:50'),
('yEeokTg4p_rVxBvVMQavlw78M2DPNQUv', '2023-06-04 16:49:34', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:49:34', '2023-06-03 16:49:34'),
('YNAMSuix_vpXIEQIXzS_W4L1QmeBkuqb', '2023-06-05 11:04:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:04:17', '2023-06-04 11:04:17'),
('yU0YEY2z2TWTItLg1Bc_xWXl8w6B23eu', '2023-06-04 17:20:51', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 17:20:51', '2023-06-03 17:20:51'),
('YwO2gbwBjNBZPdbNo9T56phAPAa1jKAD', '2023-06-05 09:24:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 09:24:31', '2023-06-04 09:24:31'),
('zFIA3lXNSjp9jIGISSWpKRkUJIDHpIPJ', '2023-06-04 17:19:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 17:19:20', '2023-06-03 17:19:20'),
('zfwAL8iyYt7OWAeIegniRbbyxYXrTAIc', '2023-06-05 08:51:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 08:51:45', '2023-06-04 08:51:45'),
('ztqjPTWyKbxjG4vc2DKm4VLCwzF21S31', '2023-06-04 20:22:49', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:22:50', '2023-06-03 20:22:50'),
('ZwknVh-I2HLWdYVkMO9zZHS_NCOsT_Fx', '2023-06-05 11:29:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-04 11:29:16', '2023-06-04 11:29:16'),
('_7lRZc7dVPntK-CUuxvPdcMrBBUeiGaS', '2023-06-04 20:20:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 20:20:46', '2023-06-03 20:20:46'),
('_gqK2RdIEkBLEu-68gA_hUdzyDjC90oP', '2023-06-04 16:48:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:48:52', '2023-06-03 16:48:52'),
('_HQKUitCOYj2nec_mRp68u7jZPFKChfY', '2023-06-04 16:54:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-03 16:54:21', '2023-06-03 16:54:21');

-- --------------------------------------------------------

--
-- Table structure for table `struktur_desa`
--

CREATE TABLE `struktur_desa` (
  `id` int(11) NOT NULL,
  `id_struktur` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `struktur_desa`
--

INSERT INTO `struktur_desa` (`id`, `id_struktur`, `text`, `gambar`, `url`, `createdAt`, `updatedAt`) VALUES
(1, 'd8b381dd-8b0b-421f-813c-fd453b5cfd4f', '<p>Updated LOREM IPSUM DOLOR SIT AMET ELIT VITAE PORTA DIAM... Sadipscing labore amet rebum est et justo gubergren. Et eirmod ipsum sit diam ut magna lorem. Nonumy vero labore lorem sanctus rebum et lorem magna kasd, stet amet magna accusam consetetur eirmod. Kasd accusam sit ipsum sadipscing et at at sanctus et. Ipsum sit gubergren dolores et, consetetur justo invidunt at et aliquyam ut et vero clita. Diam sea sea no sed dolores diam nonumy, gubergren sit stet no diam kasd vero. Voluptua est takimata stet invidunt sed rebum nonumy stet, clita aliquyam dolores vero stet consetetur elitr takimata rebum sanctus. Sit sed accusam stet sit nonumy kasd diam dolores, sanctus lorem kasd duo dolor dolor vero sit et. Labore ipsum duo sanctus amet eos et. Consetetur no sed et aliquyam ipsum justo et, clita lorem sit vero amet amet est dolor elitr, stet et no diam sit. Dolor erat justo dolore sit invidunt. updated</p>', '02cca2d8627021343ebe1d779531de43-1685019506806.jpg', 'http://localhost:5000/images/02cca2d8627021343ebe1d779531de43-1685019506806.jpg', '2023-05-23 11:04:24', '2023-05-25 19:58:27');

-- --------------------------------------------------------

--
-- Table structure for table `surat_tidak_mampu`
--

CREATE TABLE `surat_tidak_mampu` (
  `id` int(11) NOT NULL,
  `id_surat_tidak_mampu` varchar(255) NOT NULL,
  `pemohon` varchar(255) NOT NULL,
  `n_bapak` varchar(255) NOT NULL,
  `nik_bapak` varchar(255) NOT NULL,
  `t_bapak` varchar(255) NOT NULL,
  `pekerjaan_bapak` varchar(255) NOT NULL,
  `agama_bapak` varchar(255) NOT NULL,
  `alamat_bapak` varchar(255) NOT NULL,
  `n_ibu` varchar(255) NOT NULL,
  `nik_ibu` varchar(255) NOT NULL,
  `t_ibu` varchar(255) NOT NULL,
  `pekerjaan_ibu` varchar(255) NOT NULL,
  `alamat_ibu` varchar(255) NOT NULL,
  `agama_ibu` varchar(255) NOT NULL,
  `keperluan` varchar(255) NOT NULL,
  `aktif` int(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat_tidak_mampu`
--

INSERT INTO `surat_tidak_mampu` (`id`, `id_surat_tidak_mampu`, `pemohon`, `n_bapak`, `nik_bapak`, `t_bapak`, `pekerjaan_bapak`, `agama_bapak`, `alamat_bapak`, `n_ibu`, `nik_ibu`, `t_ibu`, `pekerjaan_ibu`, `alamat_ibu`, `agama_ibu`, `keperluan`, `aktif`, `createdAt`, `updatedAt`) VALUES
(24, 'd4e02037-c59a-4a4d-97b7-279fcf4bea9c', 'Aji Khoirul', 'Suryono', '0821781812', 'Ponorogo, 20 Mei 1970', 'Wiraswasta', 'Islam', 'Jl. Sunan Gunung Jati', 'Siti Nurul Kholisah', '19286189268', 'Ponorogo, 24 Desember 1972', 'Petani', 'Jl. Sunan Gunung Jati', 'Islam', 'Beasiswa', 0, '2023-05-22 17:34:57', '2023-05-22 20:39:23'),
(25, '21ffa6fb-7c7d-4e39-8c74-1e09a76143bf', 'Imron Riyadi', 'Imron Riyadi', '3502101202820003', 'dasdasd', 'dasdasddas', 'dasda', 'dasdasd', 'Imron Riyadi', '3502101202820003', 'dasdasd', 'dasdasd', 'dasdasd', 'dassdas', 'dasda', 1, '2023-05-22 17:38:24', '2023-05-22 17:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `tentang_desa`
--

CREATE TABLE `tentang_desa` (
  `id` int(11) NOT NULL,
  `id_desa` varchar(255) NOT NULL,
  `tentang` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tentang_desa`
--

INSERT INTO `tentang_desa` (`id`, `id_desa`, `tentang`, `gambar`, `url`, `createdAt`, `updatedAt`) VALUES
(1, '3180b4d2-daac-432b-b662-203fd6b5c2fe', '<p>updated Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo, nesciunt dicta error incidunt voluptatum amet reprehenderit facere voluptatem vero quam vel, ex eveniet iusto molestiae assumenda sint ipsum dolorem. Saepe, ipsa. Temporibus aut error sunt dolores alias quo dignissimos totam esse obcaecati quas, adipisci explicabo eveniet, iusto doloremque facere officia asperiores nemo tempora architecto. Sint commodi atque error labore. Aperiam cumque, eos rem enim earum porro nobis quam distinctio optio quibusdam suscipit quo, explicabo nostrum, officiis unde sunt et ea iusto voluptatem consectetur? A repellat natus fuga officia dolorem, molestias consequatur omnis quibusdam accusamus ea suscipit ipsum quo soluta atque! Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo mollitia fuga sunt magni similique earum totam vero vel, quasi praesentium incidunt? Quos obcaecati eius aliquid facere voluptas eligendi voluptatum rem mollitia amet cum veniam et at quidem quis a quo exercitationem quas possimus ut, eum provident! Reprehenderit, ullam esse dolore minima accusamus dolorem incidunt, nemo debitis enim aperiam fugit voluptatem unde officiis! Dignissimos alias quam modi debitis sed sapiente maiores eligendi eos quia! Inventore modi obcaecati vel sapiente voluptas! Alias similique nam maiores veniam doloremque sunt consequuntur minima sit beatae! Nostrum, quos laboriosam dolore earum id eaque voluptatum expedita di eos quia! Inventore modi obcaecati vel sapiente voluptas! Alias similique nam maiores veniam doloremque sunt consequuntur minima sit beatae! Nostrum, quos laboriosam dolore earum id eaque voluptatum expedita atque.</p>', '02cca2d8627021343ebe1d779531de43-1684812607682.jpg', 'http://localhost:5000/images/02cca2d8627021343ebe1d779531de43-1684812607682.jpg', '2023-05-23 10:23:03', '2023-05-25 18:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `image`, `url`, `createdAt`, `updatedAt`) VALUES
(1, 'Product 1', '76ad9038cb856778247d538eb926de3a.jpg', 'http://localhost:5000/images/76ad9038cb856778247d538eb926de3a.jpg', '2023-03-26 11:45:18', '2023-03-26 11:45:18'),
(2, NULL, '76ad9038cb856778247d538eb926de3a.jpg', 'http://localhost:5000/images/76ad9038cb856778247d538eb926de3a.jpg', '2023-03-26 11:59:23', '2023-03-26 11:59:23');

-- --------------------------------------------------------

--
-- Table structure for table `unduhan`
--

CREATE TABLE `unduhan` (
  `id` int(11) NOT NULL,
  `id_unduhan` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `aktif` int(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unduhan`
--

INSERT INTO `unduhan` (`id`, `id_unduhan`, `nama`, `file`, `url`, `aktif`, `createdAt`, `updatedAt`) VALUES
(2, 'c21dff8a-8011-4dd9-be65-e6e9e33f25b5', 'File 1 updated', 'cef66978b05747e21642875a4f2d6790-1684505058559.pdf', 'http://localhost:5000/files/cef66978b05747e21642875a4f2d6790-1684505058559.pdf', 1, '2023-05-19 18:09:10', '2023-05-19 21:04:18'),
(4, '2ffb23b6-c573-4339-a658-22090b925d4a', 'Test', '778eab281b7be4f7e7a8e43e5bc83ea0-1684503320522.pdf', 'http://localhost:5000/files/778eab281b7be4f7e7a8e43e5bc83ea0-1684503320522.pdf', 0, '2023-05-19 20:35:20', '2023-05-19 20:35:20'),
(5, '24f39dec-2ff1-4f53-988b-cbcfb2dfc1f0', 'asdasdasd', '778eab281b7be4f7e7a8e43e5bc83ea0-1684503764027.pdf', 'http://localhost:5000/files/778eab281b7be4f7e7a8e43e5bc83ea0-1684503764027.pdf', 0, '2023-05-19 20:42:44', '2023-05-19 20:42:44'),
(6, '5c13f529-3238-4dc4-9919-6f7e99f6e21d', 'addasd test', '778eab281b7be4f7e7a8e43e5bc83ea0-1684504137905.pdf', 'http://localhost:5000/files/778eab281b7be4f7e7a8e43e5bc83ea0-1684504137905.pdf', 0, '2023-05-19 20:48:57', '2023-05-19 20:48:57'),
(8, '5b223cc2-e5ee-4b41-a84b-e907ef989e01', 'Test 43', '[object Object]-1684505818780.pdf', 'http://localhost:5000/files/[object Object]-1684505818780.pdf', 0, '2023-05-19 21:16:58', '2023-05-19 21:16:58'),
(9, '6c9608d2-f7c6-4991-a590-18df37a5db0b', 'docx', '[object Object]-1684505862600.docx', 'http://localhost:5000/files/[object Object]-1684505862600.docx', 1, '2023-05-19 21:17:42', '2023-05-19 21:17:42'),
(10, '92d1092e-c541-4db2-99b5-d3ed4e6904ef', 'cfcgh', 'Doc10.docx-1684505941147.docx', 'http://localhost:5000/files/Doc10.docx-1684505941147.docx', 0, '2023-05-19 21:19:01', '2023-05-19 21:19:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(1, '0cdab5fd-6b1f-4e4a-9124-5f2a4b8fd6f0', 'khoirulaji', 'khoirulaji@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$Fg4eKxgjHxL5d9EUao5m5A$7ONBTLt81EGrA6XL0YQb70x3EOMExKpZRbV8t14Ctfc', 'admin', '2023-03-08 02:30:47', '2023-03-08 02:46:38'),
(21, '549e3acf-3421-4d00-adc8-7c9e4a842ec7', 'naruto', 'naruto@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$zjVFxMWQ6EH4KMqBzih3Sg$wPK/Y46sz9sl2tM1JayLcfWE7XdWd5RpdVeR04/R4V0', 'user', '2023-04-17 19:44:40', '2023-04-17 19:44:40'),
(30, 'd69e0db2-376b-4ab0-a0aa-ba4770f87a45', 'khoirul', 'khoirul@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$JykOWggpCuAhfPPHcs5woQ$MEyjJ44lDdEZNKlAlVnMlaoLSwbXbcSqhWMPylrdYpw', 'User', '2023-04-18 19:42:44', '2023-04-18 19:42:44'),
(31, '7a275b33-72f0-4d93-96d6-48cd290d5bee', 'aji', 'aji@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$hxbcNgfqAiV04eRSAeQcyw$FuxHPT2ZuJU1nKMS4qH1SopGd7UN/OIxdzto3thOHek', 'User', '2023-04-18 19:45:53', '2023-04-18 19:45:53'),
(32, 'f3d19ce9-1b9c-49fb-b7fb-fb2efba9a42c', 'asdasd', 'khoirulaji71@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$OooFgtf5g7CAooifQ3Ez8w$TDWEjgwEemTGi7u2673on+7jechmQOqyYBiIbVA9FaE', 'User', '2023-04-18 19:47:00', '2023-04-18 19:47:00'),
(33, '14609b0b-b74b-466e-ad3a-a21141dd30e4', 'dasdasd', 'naruto@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$f3ascv9VePT1zoORa/plbw$+D7KPy6vrXbzItX8HP9BTGwMmg2iJvaqn3QHJO6uXEI', 'User', '2023-04-18 19:50:20', '2023-04-18 19:50:20'),
(34, '32fd8845-e814-494f-aa65-481d195474ad', 'adsad', 'khoirulaji@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$k8Fr7QHdZYCwks8z5DKTPw$o0HA9Ve4df1304usSqTw2XSnZucYEQDAYHv7sIdQdKQ', 'User', '2023-04-18 19:51:49', '2023-04-18 19:51:49'),
(35, '504794d8-9205-41dc-8283-09065847f3d0', 'asdasdsd', 'aji@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$rGFvqu3ll5129af4PlbOOw$HceF8YCgjNVcYDQO2sKVQFegEC/7ASTaVfvqL3eg5vQ', 'User', '2023-04-18 19:52:30', '2023-04-18 19:52:30'),
(36, '7e42b64a-e1ec-4245-a03e-112dd059e7d8', 'vvvvvvv', 'vvvvv@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$u79kEx8XMVTXmZyP66iuzg$QIwRr4hkhHQ16M1NAurj4gbcR5kIiODlkbwfgDIxMeI', 'User', '2023-04-18 19:53:18', '2023-04-18 19:53:18'),
(37, '3b82a1e9-4e50-4c04-80e4-952ba95371d9', 'vvvvvvv1', 'vvvv1v@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$DYTkfJ71gGARrGtKpShcFg$nXe7xo7/m3NT06VKKQmMW5uhnyDOrm8u7eNVvZRfW+Y', 'User', '2023-04-18 19:55:15', '2023-04-18 19:55:15'),
(38, '485d0d56-7b7b-49e6-b6c3-896291c5a0b2', 'adsasdasxcx', 'asdadasd@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$0r7DvxedR6q0MkE/m7OqLw$RFSHhuf5UalZ85L7dE3hP2gOwr6uVGtn6jKWdnZvkRg', 'User', '2023-04-18 19:55:38', '2023-04-19 10:00:11'),
(39, '1f978009-1d8b-4cc0-864e-4a8822a3cdaa', 'Moh Aji Khoirul Mashuri', 'adssdasd@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$WmeWrjI76ORa9Fyqt/ys3w$WdYWxwDjkqROFUIW7y4SelNyHP72tQRHWng6VCSRdi4', 'User', '2023-04-18 19:57:54', '2023-04-18 19:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `id_video` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sumber` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `id_video`, `judul`, `url`, `sumber`, `createdAt`, `updatedAt`) VALUES
(1, '7c1b472e-f7f5-4319-85cb-68e0f1f1111b', 'afadfaffd', 'https://www.youtube.com/embed/qNXb5Cm1V9M', 'Youtube', '2023-05-23 10:40:01', '2023-05-25 19:02:07'),
(2, 'd3ec115c-055f-4189-92ce-cb65437fa259', 'Video 2 updated', 'https://www.youtube.com/embed/qNXb5Cm1V9M', 'Youtube', '2023-05-23 10:40:08', '2023-05-25 19:03:11');

-- --------------------------------------------------------

--
-- Table structure for table `warga`
--

CREATE TABLE `warga` (
  `id` int(11) NOT NULL,
  `id_warga` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `kelamin` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) NOT NULL,
  `aktif` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warga`
--

INSERT INTO `warga` (`id`, `id_warga`, `nama_lengkap`, `nik`, `kelamin`, `alamat`, `aktif`, `createdAt`, `updatedAt`) VALUES
(3, '74609372-e35b-4855-966f-1d29e91dc662', 'Sringatin', '3502104602570001', 'Perempuan', 'Jl. Sunan Gunung Jati', '', '2023-04-04 19:37:53', '2023-04-04 19:37:53'),
(4, 'd8c60710-608f-4507-911e-80cea7f0995e', 'Imron Riyadi', '3502101202820003', 'Laki-laki', 'Jl. Sunan Gunung Jati', '', '2023-04-04 19:38:46', '2023-04-04 19:38:46'),
(8, 'f5307100-c460-40c7-ac99-8349663be62a', 'Moh Aji Khoirul Mashuri', '35205102405010003', 'Laki - laki', 'Jl. Sunan Gunung Jati', '', '2023-05-23 09:25:10', '2023-05-23 09:25:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `permohonan`
--
ALTER TABLE `permohonan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `profil_desa`
--
ALTER TABLE `profil_desa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `struktur_desa`
--
ALTER TABLE `struktur_desa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_tidak_mampu`
--
ALTER TABLE `surat_tidak_mampu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tentang_desa`
--
ALTER TABLE `tentang_desa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unduhan`
--
ALTER TABLE `unduhan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warga`
--
ALTER TABLE `warga`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `permohonan`
--
ALTER TABLE `permohonan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `profil_desa`
--
ALTER TABLE `profil_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `struktur_desa`
--
ALTER TABLE `struktur_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `surat_tidak_mampu`
--
ALTER TABLE `surat_tidak_mampu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tentang_desa`
--
ALTER TABLE `tentang_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `unduhan`
--
ALTER TABLE `unduhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warga`
--
ALTER TABLE `warga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artikel`
--
ALTER TABLE `artikel`
  ADD CONSTRAINT `artikel_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `galeri`
--
ALTER TABLE `galeri`
  ADD CONSTRAINT `galeri_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD CONSTRAINT `pengumuman_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
