<html>
    <body>
        <h1>my first PHP page</h1>

        <?php
            $namaSekolah = "smkn 2 bandung";
            $barang = [
                'nama' => 'laptop lab RPL',
                'status' => 'tersedia',
                $paketData = compact('namaBarang', 'kategori')
                return view('daftar_barang', compact('daftarBarang'))
            ];
            echo $barang['nama'];
            echo "<br>";
            echo $barang['status'];
        ?>
    </body>
</html>