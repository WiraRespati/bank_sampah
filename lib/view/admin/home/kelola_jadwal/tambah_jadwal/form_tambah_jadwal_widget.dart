import 'package:bank_sampah/view/admin/home/kelola_jadwal/tambah_jadwal/closed_time_picker_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_jadwal/tambah_jadwal/day_picker_widget.dart';
import 'package:bank_sampah/view/admin/home/kelola_jadwal/tambah_jadwal/open_time_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormTambahJadwalWidget extends StatelessWidget {
  const FormTambahJadwalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DayPickerWidget(),
          OpenTimePickerWidget(),
          ClosedTimePickerWidget(),
        ],
      ),
    );
  }
}
