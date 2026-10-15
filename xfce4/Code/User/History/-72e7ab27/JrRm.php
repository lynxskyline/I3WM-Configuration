<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BarangController;

Route::get('/hal', function () {
    return view('welcome');
});
Route::get('/barang', [BarangController::class, 'index']);