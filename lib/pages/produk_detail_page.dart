import 'package:flutter/material.dart';

class ProdukDetailPage extends StatelessWidget {
  final String namaProduk;
  final int harga;
  final IconData icon;

  const ProdukDetailPage({
    super.key,
    required this.namaProduk,
    required this.harga,
    this.icon = Icons.inventory_2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[200],
                child: Icon(icon, size: 60, color: Colors.deepPurple),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              namaProduk,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Rp $harga'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, namaProduk);
                },
                child: const Text('Tambah ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}