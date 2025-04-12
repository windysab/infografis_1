<?php
function generateDefaultInfografis($manager, $infografis, $statistik) {
    $image = $manager->canvas(800, 1200, '#f8f9fa');
    
    // Background header
    $image->rectangle(0, 0, 800, 100, function ($draw) {
        $draw->background('#3498db');
    });
    
    // Judul
    $image->text($infografis['judul'], 400, 50, function($font) {
        $font->file('fonts/Roboto-Bold.ttf');
        $font->size(32);
        $font->color('#ffffff');
        $font->align('center');
    });
    
    // Subjudul
    $image->text('Data dan Statistik', 400, 90, function($font) {
        $font->file('fonts/Roboto-Regular.ttf');
        $font->size(18);
        $font->color('#ffffff');
        $font->align('center');
    });
    
    // Konten
    $y = 150;
    foreach ($statistik as $stat) {
        $image->text($stat['label'] . ': ' . $stat['nilai'], 50, $y, function($font) {
            $font->file('fonts/Roboto-Medium.ttf');
            $font->size(20);
            $font->color('#333333');
        });
        $y += 40;
    }
    
    return $image;
}
?>