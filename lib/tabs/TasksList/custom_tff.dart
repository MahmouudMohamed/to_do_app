import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_color.dart';

class CustomTff extends StatelessWidget {
  int? length;
  int lines;

  CustomTff(
      {super.key,
      this.lines = 1,
      this.length,
      required this.hintTxt,
      required this.errorText,
      required this.controller,
      // required this.Text,
  });

  String hintTxt;
  String errorText;
  // String Text;
  var controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        style: Theme.of(context).textTheme.displayLarge,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return errorText;
          }
        },cursorColor: AppColor.primaryColor,

        decoration: InputDecoration(
          label: Text(hintTxt.trim()),
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
