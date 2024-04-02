import 'package:flutter/material.dart';
import 'package:flutter_connect_agriculture/config/constants/colors.dart';

class LabeledTextFormWidget extends StatelessWidget {
  const LabeledTextFormWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.maxLines,
    required this.controller,
    required this.validator,
  });
  final String label;
  final String hint;
  final IconData icon;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          style: const TextStyle(
            color: tDarkColor,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: tBlackColor,
            ),
            labelText: label,
            labelStyle: const TextStyle(
              color: tDarkColor,
            ),
            floatingLabelStyle: const TextStyle(
              color: tDarkColor,
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              color: tDarkColor,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: tDarkColor),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: tDarkColor),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: tDarkColor),
            ),
          ),
        ),
      ],
    );
  }
}
