import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loading extends StatelessWidget {
  final Color? backgroundColor;

  const Loading({super.key, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: backgroundColor ?? Colors.black.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: Colors.red,
          ),
          SizedBox(height: 8.h),
          Text(
            "Please wait...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          )
        ],
      ),
    );
  }
}
