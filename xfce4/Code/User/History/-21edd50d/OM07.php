<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Inventaris Laboratorium RPL</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; color: #1e293b; }
        h1 { color: #0f172a; margin-bottom: 6px; }
        p { color: #64748b; margin-top: 0; }
        table { width: 100%; border-collapse: collapse; margin-top: 16px; background-color: #ffffff; }
        th, td { border: 1px solid #cbd5e1; padding: 10px 14px; text-align: left; }
        th { background-color: #e2e8f0; font-weight: bold; }
        .status-tersedia { color: #15803d; font-weight: bold; }
        .status-dipinjam { color: #b91c1c; font-weight: bold; }
    </style>
</head>
<body>

    <h1>Sistem Inventaris Lab RPL</h1>
    <p>Daftar ketersediaan perangkat keras dan peralatan praktik siswa:</p>

    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Barang</th>
                <th>Kategori</th>
                <th>Status Ketersediaan</th>
            </tr>
        </thead>
        <tbody>
            @forelse($daftarBarang as $index => $item)
                <tr>
                    <td>{{ $index + 1 }}</td>
                    <td>{{ $item['nama'] }}</td>
                    <td>{{ $item['kategori'] }}</td>
                    <td>
                        <span class="{{ $item['status'] === 'Tersedia' ? 'status-tersedia' : 'status-dipinjam' }}">
                            {{ $item['status'] }}
                        </span>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="4" style="text-align: center; color: #64748b;">Data inventaris saat ini masih kosong.</td>
                </tr>
            @endforelse
        </tbody>
    </table>

</body>
</html>
