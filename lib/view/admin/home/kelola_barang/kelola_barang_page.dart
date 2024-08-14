import 'package:bank_sampah/view/admin/home/kelola_barang/edit_barang/edit_barang_page.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang/tambah_barang_page.dart';
import 'package:bank_sampah/view/admin/home/kelola_barang/tambah_barang_widget.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:bank_sampah/view/admin/widget/item_admin_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KelolaBarangPage extends StatelessWidget {
  const KelolaBarangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const KelolaHeaderWidget(
              title: "Kelola Barang",
            ),
            TambahBarangWidget(
              onTap: () {
                Get.to(() =>  TambahBarangPage());
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 23,
                  childAspectRatio: 0.65,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 152,
                    height: 265,
                    child: ItemAdminWidget(
                      buttonName: 'Edit',
                      onPressed: () {
                        Get.to(() => const EditBarangPage());
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
