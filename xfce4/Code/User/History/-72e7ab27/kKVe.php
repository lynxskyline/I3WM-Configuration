<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BarangController;

Route::get('/halo', function () {
    return view('');
});
Route::get('/barang', [BarangController::class, 'index']);