<?php
require_once 'config/database.php';
require_once 'vendor/autoload.php';  // Changed from libs/intervention/vendor/autoload.php

use Intervention\Image\ImageManager;

// Ambil data dari database
$infografisData = getData('infografis');
$statistik = getData('statistik', 'infografis_id = 1');
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Infografis Generator</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Infografis Generator</h1>
        
        <div class="controls">
            <form action="generate.php" method="post">
                <select name="template">
                    <option value="default">Template Default</option>
                    <option value="modern">Template Modern</option>
                </select>
                
                <select name="infografis_id">
                    <?php foreach ($infografisData as $item): ?>
                    <option value="<?= $item['id'] ?>"><?= $item['judul'] ?></option>
                    <?php endforeach; ?>
                </select>
                
                <button type="submit">Generate Infografis</button>
            </form>
        </div>
        
        <div class="preview">
            <h2>Preview Data</h2>
            <table>
                <tr>
                    <th>Judul</th>
                    <th>Deskripsi</th>
                    <th>Data Statistik</th>
                </tr>
                <?php foreach ($infografisData as $item): ?>
                <tr>
                    <td><?= $item['judul'] ?></td>
                    <td><?= $item['deskripsi'] ?></td>
                    <td>
                        <ul>
                            <?php 
                            $stats = getData('statistik', 'infografis_id = ' . $item['id']);
                            foreach ($stats as $stat): 
                            ?>
                            <li><?= $stat['label'] ?>: <?= $stat['nilai'] ?></li>
                            <?php endforeach; ?>
                        </ul>
                    </td>
                </tr>
                <?php endforeach; ?>
            </table>
        </div>
    </div>
</body>
</html>