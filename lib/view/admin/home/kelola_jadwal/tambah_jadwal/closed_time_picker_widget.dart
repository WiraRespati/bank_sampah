import 'package:bank_sampah/controller/admin/jadwal_controller.dart';
import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/utils/text_style_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

class ClosedTimePickerWidget extends StatelessWidget {
  const ClosedTimePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final JadwalController controller = Get.put(JadwalController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pilih Jam Tutup",
          style: TextStyleCollection.bodyMedium.copyWith(
            color: ColorCollection.black,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorCollection.black),
          ),
          child: TimePickerSpinnerPopUp(
            mode: CupertinoDatePickerMode.time,
            initTime: DateTime.now(),
            controller: controller.closedTimePickerController,
            textStyle: TextStyleCollection.caption.copyWith(
              color: ColorCollection.black,
              fontSize: 14,
            ),
            onChange: (dateTime) {
              controller.setCloseTime(
                "${dateTime.hour}:${dateTime.minute}",
              );
            },
          ),
        ),
      ],
    );
  }
}
