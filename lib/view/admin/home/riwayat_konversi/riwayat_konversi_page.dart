import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:flutter/material.dart';

class RiwayatKonversiPage extends StatelessWidget {
  const RiwayatKonversiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            KelolaHeaderWidget(
              title: "Riwayat Konversi",
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
