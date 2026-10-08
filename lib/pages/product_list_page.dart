import 'package:flutter/material.dart';
import 'package:pam_w4s2/pages/produk_detail_page.dart';
import 'package:pam_w4s2/pages/tambah_produk_page.dart';
import 'package:pam_w4s2/widget_basic/product_card.dart';

class ProdukListPage extends StatefulWidget {
  const ProdukListPage({super.key});

  @override
  State<ProdukListPage> createState() => _ProdukListPageState();
}

class _ProdukListPageState extends State<ProdukListPage> {
  int _jumlahKeranjang = 0;

  final List<Map<String, dynamic>> _produk = [
    {'nama': 'Kursi Minimalis', 'harga': 350000, 'icon': Icons.chair},
    {'nama': 'Meja Kerja Kayu', 'harga': 750000, 'icon': Icons.table_restaurant},
    {'nama': 'Lampu Meja LED', 'harga': 120000, 'icon': Icons.lightbulb},
    {'nama': 'Rak Buku', 'harga': 500000, 'icon': Icons.menu_book},
    {'nama': 'Sofa Santai', 'harga': 2500000, 'icon': Icons.weekend},
  ];

  // Buka halaman detail, lalu tunggu nilai balik (Bagian 4.2)
  Future<void> _bukaDetail(Map<String, dynamic> item) async {
    final hasilPilihan = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProdukDetailPage(
          namaProduk: item['nama'],
          harga: item['harga'],
          icon: item['icon'] ?? Icons.inventory_2,
        ),
      ),
    );
    if (hasilPilihan != null) {
      // setState: jumlah keranjang bertambah, badge ikut berubah (Bagian 1)
      setState(() {
        _jumlahKeranjang++;
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$hasilPilihan ditambahkan ke keranjang')),
      );
    }
  }

  // Buka form tambah produk, terima data produk baru (Bagian 3)
  Future<void> _bukaFormTambah() async {
    final produkBaru = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TambahProdukPage()),
    );
    if (produkBaru != null) {
      setState(() {
        _produk.add(produkBaru);
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${produkBaru['nama']} berhasil ditambahkan')),
      );
    }
  }

  // Dialog konfirmasi sebelum menghapus (Bagian 5)
  Future<void> _konfirmasiHapus(int index) async {
    final nama = _produk[index]['nama'];
    final yakin = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Hapus Produk?'),
          content: Text('$nama akan dihapus dari daftar.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
    if (yakin == true) {
      setState(() {
        _produk.removeAt(index);
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$nama telah dihapus')),
      );
    }
  }

  // Ikon keranjang + badge angka (Stack + Positioned, W4S2 bagian 2.11)
  Widget _ikonKeranjang() {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          const Icon(Icons.shopping_cart, size: 28),
          if (_jumlahKeranjang > 0)
            Positioned(
              top: -4,
              right: -4,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(
                  '$_jumlahKeranjang',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        actions: [
          IconButton(
            onPressed: _bukaFormTambah,
            icon: const Icon(Icons.add),
          ),
          _ikonKeranjang(),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _produk.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = _produk[index];
          return ProductCard(
            nama: item['nama'],
            harga: item['harga'],
            icon: item['icon'] ?? Icons.inventory_2,
            onTap: () => _bukaDetail(item),
            onDelete: () => _konfirmasiHapus(index),
          );
        },
      ),
    );
  }
}