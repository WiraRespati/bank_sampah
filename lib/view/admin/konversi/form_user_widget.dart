import 'package:bank_sampah/view/widget/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class FormUserWidget extends StatelessWidget {
  const FormUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 24),
          TextFormFieldWidget(
            titleForm: 'Nama Lengkap',
            hintText: 'Nama Lengkap',
            isPassword: false,
            isEnabled: false,
          ),
          SizedBox(height: 24),
          TextFormFieldWidget(
            titleForm: 'Jumlah Point',
            hintText: 'Jumlah Point yang dimiliki',
            isEnabled: false,
            isPassword: false,
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
