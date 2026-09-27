<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BarangController;

Route::get('/z', function () {
    return view('welcome');
});
Route::get('/barang', [BarangController::class, 'index']);