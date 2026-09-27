<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BarangController;

Route::get('/halo', function () {
    return vview('welcome');
});
Route::get('/barang', [BarangController::class, 'index']);