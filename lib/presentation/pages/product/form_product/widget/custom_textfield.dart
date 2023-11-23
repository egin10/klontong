import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final TextInputType? textInputType;
  final int minLines;
  final int maxLines;
  final double height;

  const FormTextField({
    super.key,
    this.hintText,
    this.controller,
    this.readOnly = false,
    this.textInputType,
    this.minLines = 1,
    this.maxLines = 1,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: height,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.redAccent),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        keyboardType: textInputType,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(vertical: 11.h, horizontal: 12.w),
        ),
      ),
    );
  }
}
