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

  void tambahbarang() {
    print("============================================");
    print("Masukan Nama Barang: ");
    var inputnama = stdin.readLineSync() ?? '';
    print("============================================");
    print("Masukan Jumlah Barang: ");
    var inputjumlah = stdin.readLineSync() ?? '0';

    // Menambahkan barang baru ke daftar
    daftarBarang.add({'nama': inputnama, 'jumlah': int.parse(inputjumlah)});
    print("============================================");
    print("Barang $inputnama berhasil ditambahkan");
  }

  void tambahstok() {
    print("============================================");
    print("Masukan Nama Barang: ");
    var inputnama = stdin.readLineSync() ?? '';
    print("============================================");
    print("Masukan Jumlah Barang: ");
    var inputjumlah = stdin.readLineSync() ?? '0';

    // Mencari barang dalam daftar
    var barang = daftarBarang.firstWhere(
      (item) => item['nama'] == inputnama,
      orElse: () => <String, dynamic>{},
    );

    // Jika barang ditemukan, tambahkan stok
    barang['jumlah'] = (barang['jumlah'] as int) + int.parse(inputjumlah);
    print("============================================");
    print("Stok barang $inputnama berhasil ditambahkan");
  }

  void lihatstok() {
    // kalau daftar barang kosong, tampilkan pesan "Belum ada barang."
    if (daftarBarang.isEmpty) {
      print("============================================");
      print("Belum ada barang.");
      return;
    }
    // menampilkan daftar barang dan jumlahnya
    for (var item in daftarBarang) {
      print("${item['nama']}: ${item['jumlah']}");
    }
  }

  void stokkeluar() {
    print("============================================");
    print("Masukan Nama Barang Keluar: ");
    var inputnama = stdin.readLineSync() ?? '';
    print("============================================");
    print("Masukan Jumlah Barang Keluar: ");
    var inputjumlah = stdin.readLineSync() ?? '0';

    // Mencari barang dalam daftar
    var barang = daftarBarang.firstWhere(
      (item) => item['nama'] == inputnama,
      orElse: () => <String, dynamic>{},
    );

    if (barang.isNotEmpty) {
      // Jika barang ditemukan, kurangi stok
      int jumlahKeluar = int.parse(inputjumlah);
      if (barang['jumlah'] >= jumlahKeluar) {
        barang['jumlah'] = (barang['jumlah'] as int) - jumlahKeluar;
        print("============================================");
        print("Stok barang $inputnama berhasil dikurangi");
      } else {
        print("============================================");
        print("Stok barang $inputnama tidak cukup");
      }
    } else {
      print("============================================");
      print("Barang $inputnama tidak ditemukan");
    }
  }

  void keluar() {
    print("============================================");
    print("Terima kasih telah menggunakan sistem gudang sederhana");
    exit(0);
  }

  while (jalan) {
    if (login) {
      loginn();
    } else {
      print("Menu Sistem Gudang");
      print("============================================");
      print("1. Tambah Barang");
      print("2. Tambah Stok");
      print("3. Lihat Stok");
      print("4. Stok Keluar");
      print("5. Keluar");
      print("Pilih Menu: ");
      var inputmenu = stdin.readLineSync();

      switch (int.tryParse(inputmenu ?? '')) {
        case 1:
          tambahbarang();
          break;
        case 2:
          tambahstok();
          break;
        case 3:
          lihatstok();
          break;
        case 4:
          stokkeluar();
          break;
        case 5:
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
