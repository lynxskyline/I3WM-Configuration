<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BarangController;
use App\Http\Controllers\TestController;

Route::get('/', function () {
    return view('welcome');
});
Route::get('/barang', [BarangController::class, 'index']);
Route::get('/testing', [TestController::class,'index']);
