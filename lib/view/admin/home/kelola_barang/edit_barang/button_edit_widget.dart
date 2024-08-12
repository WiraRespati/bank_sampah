import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/widget/button_widget.dart';
import 'package:flutter/material.dart';

class ButtonEditWidget extends StatelessWidget {
  const ButtonEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorCollection.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, -8),
                blurRadius: 16,
                spreadRadius: 0,
              ),
            ],
          ),
          height: 80,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ButtonWidget(
                  onPressed: () async {},
                  text: 'Edit',
                  textColor: ColorNeutral.neutral100,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
