import 'package:bank_sampah/controller/admin/riwayat_menabung_controller.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:bank_sampah/view/admin/home/upload_menabung_sampah/kelola_header_widget.dart';
import 'package:bank_sampah/view/user/history/item_history_convert_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bank_sampah/utils/color_constant.dart';

class RiwayatMenabungPage extends StatelessWidget {
  const RiwayatMenabungPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RiwayatMenabungController riwayatMenabungController =
        Get.put(RiwayatMenabungController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            KelolaHeaderWidget(
              title: "Riwayat Menabung",
              leading: Padding(
                padding: const EdgeInsets.only(right: 18),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorPrimary.primary100.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Pilih Periode',
                              style: TextStyleCollection.bodyMedium.copyWith(
                                color: ColorCollection.black,
                                fontSize: 20,
                              ),
                            ),
                            content: Obx(() {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <String>[
                                  '1 hari',
                                  '1 minggu',
                                  '1 bulan',
                                  '1 tahun'
                                ].map((String value) {
                                  return RadioListTile<String>(
                                    title: Text(
                                      value,
                                      style: TextStyleCollection.captionMedium
                                          .copyWith(
                                        color: ColorCollection.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    value: value,
                                    groupValue: riwayatMenabungController
                                        .selectedPeriod.value,
                                        activeColor: ColorPrimary.primary100,
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        riwayatMenabungController
                                            .updatePeriod(newValue);
                                        Navigator.of(context).pop();
                                      }
                                    },
                                  );
                                }).toList(),
                              );
                            }),
                          );
                        },
                      );
                    },
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
    );
  }
}
