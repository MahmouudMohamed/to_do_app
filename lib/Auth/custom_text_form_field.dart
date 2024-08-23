import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app_color.dart';

class CustomTextFormField extends StatelessWidget {
  String label;
  bool obscureText;
  IconButton? suff;
  TextInputType keyboardType;
  TextEditingController controller;
  String? Function(String?) validator;

  CustomTextFormField({
    required this.label,
    required this.controller,
    required this.validator,
    this.suff,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Colors.black),
        cursorColor: AppColor.primaryColor,
        decoration: InputDecoration(
          label: Text(label),
          suffixIcon: suff,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.primaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.primaryColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.redColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.redColor)),
        ),
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        obscureText: obscureText,
      ),
    );
  }
}
