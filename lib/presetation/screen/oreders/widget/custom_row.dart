import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRow extends StatelessWidget {
  final String text1;
  final String text2;
  final double leftPadding;
  final double gapWidth;

  const CustomRow({
    Key? key,
    required this.text1,
    required this.text2,
    this.leftPadding = 20.0,
    this.gapWidth = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: leftPadding),
          child: Text(
            text1,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: gapWidth,
        ),
        Text(
          text2,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
