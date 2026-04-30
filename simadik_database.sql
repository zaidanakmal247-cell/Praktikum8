-- ============================================================
-- SIMADIK - Sistem Manajemen Pelaporan
-- Database: simadik
-- ============================================================

CREATE DATABASE IF NOT EXISTS `simadik`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `simadik`;

-- Tabel users (untuk login & register)
CREATE TABLE IF NOT EXISTS `users` (
  `id`         INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama`       VARCHAR(100)     NOT NULL,
  `username`   VARCHAR(50)      NOT NULL UNIQUE,
  `password`   VARCHAR(255)     NOT NULL,
  `created_at` DATETIME         NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabel posts (laporan)
CREATE TABLE IF NOT EXISTS `posts` (
  `id`         INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title`      VARCHAR(255)     NOT NULL,
  `author`     VARCHAR(255)     NOT NULL,
  `article`    TEXT             NOT NULL,
  `image`      VARCHAR(255)     DEFAULT NULL,
  `created_at` DATETIME         NOT NULL,
  `updated_at` DATETIME         NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================================
-- CATATAN: Untuk membuat user awal/admin, daftarkan dulu lewat
-- halaman register di aplikasi, ATAU jalankan query INSERT
-- berikut ini setelah Anda generate hash password sendiri
-- dengan PHP: password_hash('passwordAnda', PASSWORD_DEFAULT)
--
-- Contoh user awal (username: admin | password: admin123)
-- Hash di bawah valid untuk PHP password_hash:
-- ============================================================
INSERT INTO `users` (`nama`, `username`, `password`, `created_at`) VALUES
('Administrator', 'admin', '$2y$10$e0NRb7DJu3Y5c5WfAEDP4OkZ8TXaOlGsNP7nzE.Kfe7rNAGXAMXSG', NOW());
