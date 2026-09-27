<?php

use App\Http\Controllers\BarangController;

Route::get('/barang', [BarangController::class, 'index']);
