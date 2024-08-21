import 'package:bank_sampah/controller/admin/jadwal_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayPickerWidget extends StatelessWidget {
  const DayPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final JadwalController controller = Get.put(JadwalController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          "Pilih Hari",
          style: TextStyleCollection.bodyMedium.copyWith(
            color: ColorCollection.black,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Obx(() {
          return Container(
            height: 48,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorCollection.black),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: controller.selectedDay.value,
                onChanged: (String? newValue) {
                  controller.selectedDay.value = newValue!;
                },
                items: controller.days.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyleCollection.caption.copyWith(
                          color: ColorCollection.black,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          );
        }),
        const SizedBox(height: 24),
      ],
    );
  }
}
