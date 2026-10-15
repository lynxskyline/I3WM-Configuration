<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BarangController;

Route::get('/halo', function () {
    return 'halo selamat datang di modul pengembangan web XI RPL2';
});
Route::get('/barang', [BarangController::class, 'index']);