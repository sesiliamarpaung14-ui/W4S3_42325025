import 'package:flutter/material.dart';
import 'package:pam_w4s2/widget_basic/avatar1.dart';
import 'package:pam_w4s2/widget_basic/button1.dart';
import 'package:pam_w4s2/widget_basic/column1.dart';
import 'package:pam_w4s2/widget_basic/container1.dart';
import 'package:pam_w4s2/widget_basic/expanded_widget.dart';
import 'package:pam_w4s2/widget_basic/gridview_widget.dart';
import 'package:pam_w4s2/widget_basic/icon1.dart';
import 'package:pam_w4s2/widget_basic/image1.dart';
import 'package:pam_w4s2/widget_basic/list_view_widget.dart';
import 'package:pam_w4s2/widget_basic/padding_widget.dart';
import 'package:pam_w4s2/widget_basic/row1.dart';
import 'package:pam_w4s2/widget_basic/sizedbox_widget.dart';
import 'package:pam_w4s2/widget_basic/stack_widget.dart';
import 'package:pam_w4s2/widget_basic/text1.dart';
import 'package:pam_w4s2/widget_basic/wrap_widget.dart';
import 'package:pam_w4s2/widget_basic/counter_widget.dart';
import 'package:pam_w4s2/widget_basic/textfield_widget.dart';
import 'package:pam_w4s2/widget_basic/form_widget.dart';
import 'package:pam_w4s2/widget_basic/dialog_widget.dart';
import 'package:pam_w4s2/pages/product_list_page.dart';
import 'package:pam_w4s2/pages/main_navigation_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Judul menu dan halaman tujuan. Sesuaikan judul/nomor dengan modul.
    final List<MapEntry<String, Widget>> menus = [
    MapEntry('2.1 Container', const Container1()),
    MapEntry('2.2 Text', const Text1()),
    MapEntry('2.3 Button', const Button1()),
    MapEntry('2.4 Icon', const Icon1()),
    MapEntry('2.5 Image', const Image1()),
    MapEntry('2.6 CircleAvatar', const Avatar1()),
    MapEntry('2.7 Column', const Column1()),
    MapEntry('2.8 Row', const Row1()),
    MapEntry('2.9 ListView', ListViewWidget()),
    MapEntry('2.10 GridView', const GridViewWidget()),
    MapEntry('2.11 Stack', const StackWidget()),
    MapEntry('2.12 Padding', const PaddingWidget()),
    MapEntry('2.12 Expanded', const ExpandedWidget()),
    MapEntry('2.13 SizedBox', const SizedBoxWidget()),
    MapEntry('2.14 Wrap', WrapWidget()),
        MapEntry('3.1 Counter (setState)', const CounterWidget()),
    MapEntry('3.2 TextField', const TextFieldWidget()),
    MapEntry('3.3 Form dan Validasi', const FormWidget()),
    MapEntry('3.4 Navigasi (Daftar Produk)', ProdukListPage()),
    MapEntry('3.5 Dialog', const DialogWidget()),
    MapEntry('3.6 BottomNavigationBar', const MainNavigationPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAM Minggu 4'),
      ),
      body: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          final menu = menus[index];
          return ListTile(
            title: Text(menu.key),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => menu.value),
            ),
          );
        },
      ),
    );
  }
}