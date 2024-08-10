import 'package:flutter/material.dart';

import '../../../widget/text_form_field_widget.dart';

class InputFormMenabungWidget extends StatelessWidget {
  const InputFormMenabungWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextFormFieldWidget(
            titleForm: 'Nama Lengkap',
            hintText: 'Nama Lengkap',
            isPassword: false,
          ),
          SizedBox(height: 24),
          TextFormFieldWidget(
            titleForm: 'Deskripsi',
            hintText: 'Deskripsikan Sampah yang dikumpul',
            isPassword: false,
          ),
          SizedBox(height: 24),
          TextFormFieldWidget(
            titleForm: 'Point User',
            hintText: 'Masukkan Point User',
            keyboardType: TextInputType.number,
            isPassword: false,
          ),
        ],
      ),
    );
  }
}
