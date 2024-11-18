import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.label,
      required this.icon,
      this.title,
      this.keyboardType,
        this.focusedBorderColors,
      });

  final String label;
  final IconData icon;
  final String? title;
  TextInputType? keyboardType;
  Color ? focusedBorderColors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.h),
            child: Text(
              title!,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ),
        TextField(
          style:  TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.sp,
            ),
            suffixIcon: Icon(icon, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:   BorderSide(color: focusedBorderColors ?? Colors.blue),
            ),
          ),
          keyboardType: keyboardType ?? TextInputType.text,
        ),
      ],
    );
  }
}
