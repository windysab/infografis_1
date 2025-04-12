<?php
define('DB_HOST', 'localhost:3311');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'infografis_db');

// Koneksi database
$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Fungsi untuk mengambil data
function getData($table, $condition = '') {
    global $conn;
    $sql = "SELECT * FROM $table";
    if (!empty($condition)) {
        $sql .= " WHERE $condition";
    }
    $result = $conn->query($sql);
    return $result->fetch_all(MYSQLI_ASSOC);
}
?>