-- Buat database
CREATE DATABASE IF NOT EXISTS infografis_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Gunakan database
USE infografis_db;

-- Tabel untuk menyimpan informasi dasar infografis
CREATE TABLE IF NOT EXISTS infografis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(255) NOT NULL,
    deskripsi TEXT,
    tanggal_pembuatan DATETIME DEFAULT CURRENT_TIMESTAMP,
    warna_latar VARCHAR(20) DEFAULT '#ffffff',
    warna_teks VARCHAR(20) DEFAULT '#000000',
    template VARCHAR(50) DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabel untuk menyimpan data statistik yang akan ditampilkan di infografis
CREATE TABLE IF NOT EXISTS statistik (
    id INT AUTO_INCREMENT PRIMARY KEY,
    infografis_id INT NOT NULL,
    label VARCHAR(100) NOT NULL,
    nilai DECIMAL(10,2) NOT NULL,
    warna VARCHAR(20),
    urutan INT DEFAULT 0,
    FOREIGN KEY (infografis_id) REFERENCES infografis(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabel untuk menyimpan template infografis
CREATE TABLE IF NOT EXISTS template_infografis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    deskripsi TEXT,
    lebar INT DEFAULT 800,
    tinggi INT DEFAULT 1200,
    file_template VARCHAR(255),
    tanggal_dibuat DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabel untuk menyimpan hasil generate infografis
CREATE TABLE IF NOT EXISTS hasil_infografis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    infografis_id INT NOT NULL,
    nama_file VARCHAR(255) NOT NULL,
    path_file VARCHAR(255) NOT NULL,
    tanggal_generate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (infografis_id) REFERENCES infografis(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data contoh untuk tabel infografis
INSERT INTO infografis (judul, deskripsi, warna_latar, warna_teks, template) VALUES
('Statistik Pengunjung Website 2023', 'Data pengunjung website bulanan selama tahun 2023', '#f8f9fa', '#333333', 'default'),
('Pertumbuhan Penduduk Kota X', 'Laporan pertumbuhan penduduk Kota X dari tahun 2010-2023', '#ffffff', '#000000', 'modern'),
('Penjualan Produk Triwulan IV', 'Data penjualan produk utama perusahaan pada triwulan IV 2023', '#2c3e50', '#ecf0f1', 'corporate');

-- Data contoh untuk tabel statistik
INSERT INTO statistik (infografis_id, label, nilai, warna, urutan) VALUES
-- Data untuk infografis 1 (Statistik Pengunjung Website)
(1, 'Januari', 12500, '#3498db', 1),
(1, 'Februari', 14320, '#3498db', 2),
(1, 'Maret', 16800, '#3498db', 3),
(1, 'April', 19250, '#2ecc71', 4),
(1, 'Mei', 21000, '#2ecc71', 5),
(1, 'Juni', 18750, '#2ecc71', 6),
(1, 'Juli', 16500, '#e74c3c', 7),
(1, 'Agustus', 17800, '#e74c3c', 8),
(1, 'September', 20300, '#f1c40f', 9),
(1, 'Oktober', 22500, '#f1c40f', 10),
(1, 'November', 24100, '#9b59b6', 11),
(1, 'Desember', 26500, '#9b59b6', 12),

-- Data untuk infografis 2 (Pertumbuhan Penduduk)
(2, '2010', 1250000, '#3498db', 1),
(2, '2012', 1320000, '#3498db', 2),
(2, '2014', 1415000, '#3498db', 3),
(2, '2016', 1520000, '#2ecc71', 4),
(2, '2018', 1635000, '#2ecc71', 5),
(2, '2020', 1720000, '#2ecc71', 6),
(2, '2022', 1810000, '#e74c3c', 7),
(2, '2023', 1850000, '#e74c3c', 8),

-- Data untuk infografis 3 (Penjualan Produk)
(3, 'Produk A', 45000000, '#3498db', 1),
(3, 'Produk B', 38000000, '#2ecc71', 2),
(3, 'Produk C', 52000000, '#e74c3c', 3),
(3, 'Produk D', 29000000, '#f1c40f', 4),
(3, 'Produk E', 41000000, '#9b59b6', 5);

-- Data contoh untuk tabel template
INSERT INTO template_infografis (nama, deskripsi, lebar, tinggi) VALUES
('default', 'Template infografis standar dengan grafik batang', 800, 1200),
('modern', 'Template infografis modern dengan desain minimalis', 800, 1200),
('corporate', 'Template profesional untuk laporan perusahaan', 800, 1200);