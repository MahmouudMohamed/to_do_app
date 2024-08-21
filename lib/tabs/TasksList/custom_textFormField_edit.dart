import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/model/task_model.dart';

import '../../../app_color.dart';

class CustomTextFormFieldEdit extends StatelessWidget {
  int? length;
  int lines;
  Function(String) onChanged;
  String errorText;
  String hint;
  TextEditingController? controller;
  late TaskModel model;

  CustomTextFormFieldEdit({
    super.key,
    this.lines = 1,
    this.length,
    required this.errorText,
     this.controller,
    required this.hint,
     required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        initialValue: hint,
        onChanged:onChanged,
        controller: controller,
        style: Theme.of(context).textTheme.displayLarge,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return errorText;
          }
        },
        decoration: InputDecoration(
          // hintText: hintTxt.trim(),
          labelStyle: Theme.of(context).textTheme.displayLarge,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.blackLightColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColor.blackLightColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black)),
        ),
        maxLength: length,
        maxLines: lines,
      ),
    );
  }
}
