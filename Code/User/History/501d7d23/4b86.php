<html>
    <body>
        <h1>my first PHP page</h1>

        <?php
            $paketData = compact('namaBarang', 'kategori');

            return view('daftar_barang', compact('daftarBarang'));
        ?>
    </body>
</html>