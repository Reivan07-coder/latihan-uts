import 'dart:io';

void main() {
  // membuat sistem gudang sederhana
  var login = true;
  var jalan = true;
  var password = 'admin123';

  List<Map<String, dynamic>> daftarBarang = [
    {'nama': 'Barang A', 'jumlah': 10},
    {'nama': 'Barang B', 'jumlah': 20},
  ];

  void loginn() {
    print('Selamat datang di sistem gudang sederhana');
    print("============================================");
    print("Masukan Password: ");
    var inputuser = stdin.readLineSync();
    if (inputuser == password) {
      login = false;
      print("Login Berhasil");
    } else {
      print("Password salah!");
    }
  }

  void tambahstok() {
    print("Masukan Nama Barang: ");
    var inputnama = stdin.readLineSync() ?? '';
    print("Masukan Jumlah Barang: ");
    var inputjumlah = stdin.readLineSync() ?? '0';

    // Mencari barang dalam daftar
    var barang = daftarBarang.firstWhere(
      (item) => item['nama'] == inputnama,
      orElse: () => <String, dynamic>{},
    );

    if (barang.isNotEmpty) {
      // Jika barang ditemukan, tambahkan stok
      barang['jumlah'] = (barang['jumlah'] as int) + int.parse(inputjumlah);
      print("Stok barang $inputnama berhasil ditambahkan");
    } else {
      // Jika barang tidak ditemukan, tambahkan sebagai barang baru
      daftarBarang.add({'nama': inputnama, 'jumlah': int.parse(inputjumlah)});
      print("Barang $inputnama berhasil ditambahkan");
    }
  }

  void lihatstok() {
    if (daftarBarang.isEmpty) {
      print("Belum ada barang.");
      return;
    }

    for (var item in daftarBarang) {
      print("${item['nama']}: ${item['jumlah']}");
    }
  }

  void keluar() {
    print("Terima kasih telah menggunakan sistem gudang sederhana");
    exit(0);
  }

  while (jalan) {
    if (login) {
      loginn();
    } else {
      print("Menu Sistem Gudang");
      print("============================================");
      print("1. Tambah Stok");
      print("2. Lihat Stok");
      print("3. Keluar");
      print("Pilih Menu: ");
      var inputmenu = stdin.readLineSync();

      switch (int.tryParse(inputmenu ?? '')) {
        case 1:
          tambahstok();
          break;
        case 2:
          lihatstok();
          break;
        case 3:
          keluar();
          break;
        default:
          print("Pilihan tidak valid");
          break;
      }
    }
  }
  // batas coding
}
