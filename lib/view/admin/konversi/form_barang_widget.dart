import 'package:bank_sampah/view/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class FormBarangWidget extends StatelessWidget {
  const FormBarangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 24),
          TextFormFieldWidget(
              titleForm: 'Nama Barang',
              hintText: 'Nama Barang',
              isPassword: false),
          SizedBox(height: 24),
          TextFormFieldWidget(
              titleForm: 'Harga Barang',
              hintText: 'Harga Barang',
              isPassword: false),
          SizedBox(height: 24),
          TextFormFieldWidget(
              titleForm: 'Stok Barang',
              hintText: 'Jumlah Stok Barang yang tersedia',
              isPassword: false),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
