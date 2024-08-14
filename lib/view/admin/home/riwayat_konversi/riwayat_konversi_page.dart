import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:bank_sampah/view/user/history/item_history_convert_widget.dart';
import 'package:flutter/material.dart';

class RiwayatKonversiPage extends StatelessWidget {
  const RiwayatKonversiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            KelolaHeaderWidget(
              title: "Riwayat konversi",
              leading: Padding(
                padding: const EdgeInsets.only(right: 18),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorPrimary.primary100.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_list_rounded,
                      color: ColorPrimary.primary100,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) {
                return const ItemHistoryConvertWidget();
              },
            ),
          ],
        ),
      ),
    ));
  }
}
