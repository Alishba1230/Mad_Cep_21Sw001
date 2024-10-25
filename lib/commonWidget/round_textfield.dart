import 'package:bookstore_mad_project/common/color_extension.dart';
import 'package:flutter/material.dart';

class RoundTextfield extends StatelessWidget {
  const RoundTextfield(
      {super.key,
      required this.hintText,
      required this.controller,
      this.keyboardType,
      this.obscureText = false});
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: PColor.textBox, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: hintText,
          labelStyle: const TextStyle(
            fontSize: 15,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter The Specified Value Correctly';
          }
          return null;
        },
      ),
    );
  }
}
