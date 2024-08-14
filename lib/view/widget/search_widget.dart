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
      this.filterButton,
      this.keyboardType,
      this.icon});

  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onChanged;
  final Function()? onClear;
  final EdgeInsetsGeometry? padding;
  final Widget? filterButton;
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
            onChanged: onChanged,
            keyboardType: keyboardType ?? TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
              border: InputBorder.none,
              prefixIcon: IconButton(
                onPressed: () {},
                icon: icon ?? const Icon(Icons.person_search_outlined),
              ),
              suffixIcon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: onClear,
                    icon: const Icon(Icons.cancel_outlined),
                  ),
                  filterButton ?? Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
