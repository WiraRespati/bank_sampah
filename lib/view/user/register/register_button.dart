import 'package:bank_sampah/utils/color_constant.dart';
import 'package:bank_sampah/view/widget/button_widget.dart';
import 'package:flutter/widgets.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.onPressed,
    this.isEnabled = true,
  });

  final VoidCallback onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ButtonWidget(
          onPressed: onPressed,
          text: 'Daftar',
          textColor: ColorNeutral.neutral100,
        ),
      ),
    );
  }
}
