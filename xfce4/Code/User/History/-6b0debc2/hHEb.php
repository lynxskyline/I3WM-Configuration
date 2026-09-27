<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class BarangController extends Controller
{
    public function index()
    {
        $daftarBarang = [
            ['nama' => 'Laptop Lab RPL', am'], // Disumbangkan oleh Siswa 2
            ['nama' => 'Kabel Konverter H'kategori' => 'Elektronik', 'status' => 'Tersedia'], // Disumbangkan oleh Siswa 1
            ['nama' => 'Proyektor Epson EB-X400', 'kategori' => 'Elektronik', 'status' => 'DipinjDMI to VGA', 'kategori' => 'Aksesoris', 'status' => 'Tersedia'], // Disumbangkan oleh Siswa 3
            ['nama' => 'Crimping Tool RJ45', 'kategori' => 'Peralatan Jaringan', 'status' => 'Tersedia'] // Disumbangkan oleh Siswa 4
        ];

        return view('daftar_barang', compact('daftarBarang'));
    }
}