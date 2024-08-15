import 'package:bank_sampah/utils/color_constant.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget(
      {super.key,
      this.controller,
      this.hintText,
      this.onChanged,
      this.onClear,
      this.padding,
      this.keyboardType,
      this.icon});

  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onChanged;
  final Function()? onClear;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyboardType;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: ColorCollection.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.25),
              offset: const Offset(10, 10),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
        ),
        height: 64,
        child: Center(
          child: TextFormField(
            style: TextStyle(color: ColorPrimary.primary100),
            onChanged: onChanged,
            keyboardType: keyboardType ?? TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: ColorCollection.gray),
              contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
              border: InputBorder.none,
              prefixIcon: IconButton(
                onPressed: () {},
                icon: icon ?? const Icon(Icons.person_search_outlined),
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: onClear,
                    icon: const Icon(Icons.cancel_outlined),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
